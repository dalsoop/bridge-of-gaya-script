# veilkey-selfhosted #459 리뷰

> heartbeat 기반 mask-map 캐싱으로 veil 진입 속도 개선

---

## 1. Phase 1→2→3 의존성 분석

**결론: 의존성 방향은 올바름. 단, 실패 전파 경로에 주의 필요.**

```
Phase 1 (LocalVault)          Phase 2 (VaultCenter)         Phase 3 (handleMaskMap)
content_version++ ──heartbeat──► dirty 감지 ──debounce 2s──► cache rebuild ──► cache hit 반환
                                                                              cache miss → sync fallback
```

- Phase 1→2: heartbeat 채널이 유일한 연결점. heartbeat 유실/지연 시 Phase 2가 dirty를 감지하지 못함.
  - **권고**: heartbeat 유실 대비 Phase 2에서 주기적 polling fallback 추가 (예: 60초마다 version 비교). 이벤트 드리븐 + 폴링 하이브리드가 안전함.
- Phase 2→3: 캐시 빌드 완료 전 요청이 들어오면 sync fallback이 동작하므로 정합성은 보장됨. 다만 동시에 여러 요청이 sync fallback을 트리거하면 thundering herd 발생 가능.
  - **권고**: sync fallback에 singleflight 패턴 적용 (`golang.org/x/sync/singleflight`). 동일 빌드를 중복 실행하지 않도록.

## 2. Debounce 2초 적절성

**결론: 합리적이나, max-wait 상한이 필요함.**

- 배치 변경(시크릿 여러 개 동시 수정) 시 2초 debounce는 불필요한 중간 리빌드를 방지하므로 적절함.
- **문제**: 변경이 연속으로 들어오면 debounce가 계속 리셋되어 캐시가 영원히 갱신되지 않을 수 있음.
  - **권고**: max-wait 상한 설정 (예: 10초). 마지막 debounce 리셋 시점과 무관하게 최대 10초 후에는 강제 리빌드.
- 단일 변경의 경우 2초 지연은 사용자 체감에 무의미한 수준. 문제없음.

## 3. 전체 리빌드 vs 부분 갱신

**결론: 전체 리빌드가 올바른 선택. 현 단계에서 부분 갱신은 시기상조.**

- mask-map은 여러 시크릿의 조합으로 파생되는 구조체. 부분 갱신 시 시크릿 간 의존성으로 인한 정합성 버그 위험이 높음.
- 전체 리빌드의 비용이 문제가 되려면 vault 당 시크릿 수가 수천 개 이상이어야 함. 일반적 self-hosted 환경에서는 해당 없음.
- **권고**: 리빌드 소요시간 메트릭을 수집하고, p99가 debounce 윈도우(2초)를 초과하는 경우에만 부분 갱신을 고려. 조기 최적화 불필요.

## 4. 보안 분석 — 누락된 위협

### 4-1. 타이밍 사이드채널

캐시 hit(즉시 반환)과 miss(sync 빌드 후 반환)의 응답 시간 차이로 공격자가 시크릿 변경 시점을 추론할 수 있음.

- **위험도**: Low-Medium. 네트워크 노이즈가 있지만, 반복 측정으로 통계적 추론 가능.
- **완화**: cache miss 시에도 인위적 지연(jitter)을 추가하거나, 응답 시간을 일정 하한 이상으로 패딩.

### 4-2. Heartbeat 스푸핑 / 리플레이

heartbeat에 인증이 없으면 공격자가 위조 heartbeat를 전송하여 content_version을 조작할 수 있음.

- 강제로 dirty 상태를 유발 → 불필요한 리빌드 → DoS
- version을 낮춰서 캐시 무효화를 방지 → stale 캐시 유지
- **권고**: heartbeat에 HMAC 서명 + monotonic version 검증 (version은 단조 증가만 허용).

### 4-3. 크래시 덤프 / 코어 덤프 노출

캐시에 plaintext가 최대 10분간 메모리에 존재. 프로세스 크래시 시 코어 덤프에 포함될 수 있음.

- **권고**: 프로덕션 환경에서 `GOTRACEBACK=crash` 대신 `none` 또는 `single` 설정 권고. 코어 덤프 비활성화 또는 암호화된 코어 덤프 사용.

### 4-4. 캐시 크기 상한과 메모리 압력

10MB 상한은 합리적이나, 상한 도달 시 동작이 명시되지 않음.

- **권고**: 상한 도달 시 LRU 퇴거인지, 캐시 전체 무효화인지, 에러 반환인지 명확히 정의. LRU는 mask-map 특성상 부적합 (전체가 하나의 단위이므로), 전체 무효화 + sync fallback이 적절.

### 4-5. Go GC와 mlock 관련 보충

이슈의 분석(Go GC 힙 이동으로 mlock/zeroize 실효 낮음)은 정확함. 추가로:

- `runtime.KeepAlive`로 GC 회수 방지는 가능하나, 복사 방지는 불가.
- 정말 민감한 경우 cgo를 통해 C 힙에 할당하고 mlock을 거는 방법이 있으나, 복잡도 대비 실익이 낮음. 현재 판단이 적절함.

## 5. 체크리스트 누락 항목

| 항목 | 설명 |
|------|------|
| **Observability** | cache hit/miss rate, 리빌드 소요시간, heartbeat 지연 메트릭 추가 |
| **Singleflight** | sync fallback 동시 진입 방지 |
| **Max-wait 상한** | debounce 무한 리셋 방지 |
| **Heartbeat 실패 시 graceful degradation** | heartbeat 채널 단절 시 polling fallback 또는 알림 |
| **Feature flag** | 캐싱을 비활성화할 수 있는 런타임 플래그 (롤백 용이성) |
| **Integration test** | Phase 1→2→3 전체 흐름 E2E 테스트 |
| **Lock 경합 테스트** | 캐시 읽기(Phase 3)와 쓰기(Phase 2)의 RWMutex 경합 부하 테스트 |
| **Version overflow** | content_version이 uint64라면 사실상 문제없으나, 타입과 overflow 동작 명시 |

---

## 종합 의견

**설계는 건전하며, veil 진입 시 0-네트워크 반환이라는 목표에 적합한 구조.**

핵심 강점:
- 3-phase 분리가 명확하고, 각 phase의 책임이 잘 정의됨
- 전체 리빌드 선택은 정합성 우선 설계로 올바름
- 보안 분석에서 mlock/zeroize의 Go 한계를 정직하게 인정한 점이 좋음

보완이 필요한 부분 (우선순위순):
1. **[Must]** Heartbeat 유실 대비 polling fallback — 이벤트 유실은 반드시 발생함
2. **[Must]** Sync fallback에 singleflight — thundering herd는 캐시 시스템의 기본 방어
3. **[Must]** Debounce max-wait 상한 — 연속 변경 시 캐시 영구 stale 방지
4. **[Should]** Heartbeat 인증 (HMAC + monotonic version)
5. **[Should]** Observability 메트릭 추가
6. **[Nice]** Feature flag로 캐싱 비활성화 가능하게
7. **[Nice]** 타이밍 사이드채널 완화

1~3번은 구현 전에 설계에 반영하는 것을 권고. 4~7번은 후속 이슈로 추적해도 무방.
