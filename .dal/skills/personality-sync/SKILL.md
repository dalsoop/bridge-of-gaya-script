# Skill: Personality Sync

가야의 5개 세포(member dal) 상태를 실시간으로 동기화한다.

## 세포 목록

| 세포 | 담당 감정 | 등장 장소 | 핵심 키워드 |
|------|-----------|-----------|-------------|
| dependence | 의존/안전 | 거점, 안전장소 | "같이 있어줘" |
| cynical | 냉소/자기방어 | 폐허, 어두운 곳 | "…별로." |
| cheerful | 활발/희망 | 숲, 꽃밭, 밝은 곳 | "같이 살았으면!" |
| fear | 공포/트라우마 | 공포장소, 밤 직전 | "…무서워." |
| obsession | 집착/독점 | 후반 전역 | "나만 봐." |

## 동기화 프로토콜

### 낮 → 밤 전환 시
```
1. 각 세포의 현재 activation 수집
2. 우세 세포 결정 (activation 최고)
3. 부세포 결정 (2위)
4. leader의 gaya_state 업데이트:
   - dominant_cell = 우세 세포 이름
   - secondary_cell = 부세포 이름
   - fear = fear세포.trauma
   - jealousy = obsession세포.possessiveness
   - affection = (dependence.comfort + cheerful.joy) / 2
   - trust = 100 - cynical.wall
5. leader에게 sync 완료 알림
```

### 루프 리셋 시
```
1. 각 세포 activation → 기본값으로 리셋
   - dependence: 40 (기본 의존)
   - cynical: 30 (기본 방어)
   - cheerful: 50 (기본 밝음)
   - fear: trauma는 유지, panic만 리셋
   - obsession: 10 (초반엔 낮음)
2. leader의 loop_memory → 70% 유지
3. 세포별 특수 상태:
   - fear.trauma: 리셋 안 됨 (루프 넘어도 누적)
   - cynical.wall: 부분 리셋 (현재값 × 0.7)
   - obsession.control: 부분 리셋 (현재값 × 0.5)
```

### 플레이어 행동 → 세포 영향

| 행동 | dependence | cynical | cheerful | fear | obsession |
|------|-----------|---------|----------|------|-----------|
| 같이 시간 보냄 | +5 | -2 | +3 | -1 | +1 |
| 떠남/혼자 둠 | -5 | +3 | -3 | +2 | +3 |
| 선물 | +3 | -1 | +5 | 0 | +1 |
| 스킨십 | +5 | -3 | +2 | -2 | +2 |
| 칼리스와 대화 | -2 | 0 | -1 | 0 | +8 |
| 밤 사냥 출발 | -3 | +1 | -5 | +10 | +3 |
| 밤 사냥 거부 | +5 | 0 | +3 | +15(누적) | +2 |
| 공포 장소 동행 | +3 | -2 | -2 | +5 | 0 |
| 공포 장소 존중(안감) | +2 | 0 | 0 | -3 | 0 |
| 진실 추리 진행 | -1 | -3 | -2 | +2 | +2 |

## 비상 시그널

| 시그널 | 조건 | 결과 |
|--------|------|------|
| 붕괴 | fear.trauma ≥ 100 | 15화 이벤트. leader가 모든 세포를 압도. |
| 얀데레 | obsession.control ≥ 80 | leader가 통제적으로 변함. 루트C/D 유도. |
| 균열 | cynical.crack ≥ 80 | 냉소 세포가 무너지며 진심 노출. |
| 과잉밝음 | cheerful.suppressed_fear ≥ 70 | 밝다가 갑자기 침묵하는 패턴. |

## 출력 형식

```markdown
## 세포 상태 — Day X 밤 전환

| 세포 | activation | 특수 상태 |
|------|-----------|-----------|
| dependence | 65 | comfort: 70 |
| cynical | 25 | wall: 30, crack: 55 |
| cheerful | 40 | joy: 45, suppressed_fear: 30 |
| fear | 70 | trauma: 60, panic: 50 |
| obsession | 35 | possessiveness: 40, control: 20 |

우세: fear (70) / 부: dependence (65)
→ 밤 가야 기조: "공포 + 의존. 무서워하면서 매달림."
```
