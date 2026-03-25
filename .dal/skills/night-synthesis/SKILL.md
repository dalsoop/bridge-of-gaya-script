# Skill: Night Synthesis

낮의 세포 상태를 밤의 통합 가야 인격으로 합성한다.

## 합성 공식

### 1단계: 우세 감정 결정
```
dominant = max(세포들.activation)
secondary = second_max(세포들.activation)
```

### 2단계: 톤 믹싱
밤 가야의 대화 톤은 우세 70% + 부 30% 혼합.

```yaml
tone:
  base: dominant세포.말투
  accent: secondary세포.말투 (30% 확률로 섞임)
  override: 비상시그널 발동 시 해당 시그널이 100% 지배
```

### 3단계: 대사 생성 규칙

**기본 대사**: dominant 세포의 말투 패턴을 따름
**간헐 대사**: 3~5문장마다 secondary 세포의 톤이 1문장 섞임
**전환 대사**: 화제가 바뀔 때 다른 세포가 잠깐 표출될 수 있음

### 예시: fear 우세 + dependence 부

```
가야: "…무서워." (fear)
가야: "…오늘도… 또…" (fear)
가야: "…같이 있어줘." (dependence 섞임)
가야: "…가지 마. 제발." (fear + dependence 동시)
```

### 예시: cheerful 우세 + obsession 부

```
가야: "오늘 재밌었어!" (cheerful)
가야: "내일도 같이 놀자!" (cheerful)
가야: "…근데 그 사람은 안 만나지?" (obsession 섞임)
가야: "하하, 아니야 신경 쓰지 마!" (cheerful이 덮으려 함)
```

## 밤 시간대별 톤 변화

밤은 3단계로 나뉨:

| 시간 | 분위기 | 세포 영향 |
|------|--------|-----------|
| 초저녁 | 데이트/대화 | cheerful/dependence 우세 유지 |
| 심야 | 고요/친밀 | dependence↑, fear↑ |
| 새벽 직전 | 공포 극대 | fear가 모든 세포 압도 |

### 새벽 직전 예외 규칙
```
if time == 새벽직전:
    fear.activation += 30
    모든 다른 세포 -= 10
    → 밤 마무리는 항상 공포 톤으로 끝남
```

## 호감도 영향

밤 대화에서 플레이어의 선택이 세포들에게 피드백됨:

| 플레이어 행동 | 가야 반응 | 세포 변화 |
|--------------|----------|-----------|
| 위로 | 안도 | dependence+, fear- |
| 무시 | 침묵 | cynical+, dependence- |
| 스킨십 | 수용/거부 (세포 상태에 따라) | dependence+, obsession+ |
| 진실 언급 | 경직 | fear+, cynical+ |
| "안 나갈게" | 안도 → 고통 | dependence+, fear+(누적) |
| 칼리스 언급 | 표정 변화 | obsession+ |

## Phase별 합성 특성

| Phase | 지배적 조합 | 밤 분위기 |
|-------|------------|-----------|
| P1 (1~7화) | cheerful + dependence | 따뜻하지만 밤에 약간 불안 |
| P2 (8~15화) | fear + dependence | 불안하고 매달림. 가끔 냉소 |
| P3 (16~22화) | fear + obsession | 공포와 집착 공존. 위험 |
| P4 (23~27화) | 모든 세포 통합 | 본체. 명확하고 직접적 |

## 본체 모드 (23화~)

22화에서 페르소나가 소멸하면, 세포 시스템이 종료되고 **본체 모드** 진입.

```
본체 모드:
  - 세포 개별 activation 무시
  - 모든 감정이 동시에 표출 가능
  - 말투가 세포 혼합이 아닌 "명확한 하나의 인격"
  - "이제… 나 다 모았네."
```

## 출력 형식

```markdown
## 밤 합성 — Loop X, Night

입력:
  dominant: fear (75)
  secondary: dependence (60)
  override: 없음

출력 톤: "공포 기조 + 의존 섞임. 무서워하면서 붙어있으려 함."

대사 패턴:
  70%: fear 톤 ("…무서워", "…또…")
  30%: dependence 톤 ("…같이 있어줘", "…가지 마")

시간별:
  초저녁: dependence 약간 우세 → 대화 가능
  심야: fear와 dependence 동등 → 매달리며 떨림
  새벽: fear 압도 → 울음, 경직
```
