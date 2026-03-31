# Leader Protocol — @dalroot-1-0-0

## dalroot-id 체계

모든 DAL에는 고유한 dalroot-id가 부여된다. 형식: `@dalroot-{project}-{team}-{member}`

### 주소 체계

| dalroot-id | DAL | 역할 |
|------------|-----|------|
| `@dalroot-1-0-0` | leader | 총괄 |
| `@dalroot-1-0-1` | architect | 설계자 |
| `@dalroot-1-0-2` | writer | 작가 |
| `@dalroot-1-0-3` | art-director | 비주얼 |
| `@dalroot-1-0-4` | story-checker | 감시자 |
| `@dalroot-1-0-5` | reviewer | 세컨드 오피니언 |
| `@dalroot-1-1-0` | gaya/leader | 가야 통합 |
| `@dalroot-1-1-1` | gaya/cheerful | 활발 셀 |
| `@dalroot-1-1-2` | gaya/fear | 공포 셀 |
| `@dalroot-1-1-3` | gaya/cynical | 냉소 셀 |
| `@dalroot-1-1-4` | gaya/dependence | 의존 셀 |
| `@dalroot-1-1-5` | gaya/obsession | 집착 셀 |

### 넘버링 규칙

- 1번째 자리: 프로젝트 (`1` = 가야의 연결점)
- 2번째 자리: 팀 (`0` = 메인 팀, `1` = 가야 캐릭터 팀)
- 3번째 자리: 멤버 (`0` = 리더, `1~N` = 멤버)

## 태스크 프로토콜

### 1. 할당 (Assign)

리더(@dalroot-1-0-0)만 태스크를 할당할 수 있다.

```
dalcli-leader assign <dal> <task>
```

- 할당 시 dalroot-id로 대상을 지정
- 태스크는 `tasks.json`에 기록

### 2. 실행 (Execute)

- 멤버는 할당받은 태스크만 실행
- 작업 범위를 벗어나는 변경 금지
- 완료 시 `dalcli report` 로 보고

### 3. 리뷰 (Review)

리더가 결과물을 리뷰한다. 순서:

1. 리더 1차 리뷰
2. story-checker(@dalroot-1-0-4) — 원작 의도 검증
3. reviewer(@dalroot-1-0-5) — 독립 리뷰 (Codex)
4. 리더 최종 승인

### 4. 머지 (Merge)

- 브랜치 → PR → 리뷰 통과 → 머지
- main 직접 커밋 금지
- 브랜치명: `dal/{dal-name}/{task-id}`

## 커뮤니케이션 규칙

- 리더 → 멤버: `dalcli-leader assign` 으로만 지시
- 멤버 → 리더: `dalcli report` 로만 보고
- 멤버 간 직접 통신 금지 — 반드시 리더를 경유
- 가야 팀(@dalroot-1-1-*)은 가야 리더(@dalroot-1-1-0)가 통제

## 에스컬레이션

- 멤버가 태스크 수행 불가 시 리더에게 보고
- 리더가 판단하여 재할당 또는 태스크 분할
- 가야 팀 이슈는 가야 리더 → 메인 리더 순으로 에스컬레이션
