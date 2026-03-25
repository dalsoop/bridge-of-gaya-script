# Skill: Tension Curve

씬별 긴장도를 추적하고 감정 곡선을 검증한다.

## 긴장도 스케일

| 레벨 | 정의 | 예시 |
|------|------|------|
| 1~2 | 평온 / 일상 | 데이트, 식사, 잡담 |
| 3~4 | 미묘한 불안 | 가야 데자뷔, NPC 이상 발언 |
| 5~6 | 의심 / 긴장 | 상처 발견, 칼리스 암시 |
| 7~8 | 충격 / 공포 | 리본 드랍, 비명 겹침 |
| 9~10 | 절정 / 붕괴 | 진실 공개, 분기점 |

## 씬 태깅

모든 씬에 아래를 태깅한다:

```yaml
scene_id: "ep01_s3"
tension: 3
pacing_type: setup | escalation | climax | breather | resolution
primary_emotion: curiosity
secondary_emotion: warmth
entry_emotion: neutral      # 플레이어가 이 씬에 들어올 때 감정
exit_emotion: unease         # 씬이 끝날 때 감정
```

## 검증 규칙

### 1. 평탄 구간 경고
같은 긴장도가 **3개 씬 이상** 연속되면 경고.
→ 사이에 escalation 또는 breather 삽입 필요.

### 2. 급락 경고
긴장도가 한 번에 **5 이상 하락**하면 경고.
→ 전환 씬(emotional bridge) 필요.

### 3. 감정 대비 원칙
큰 충격 씬 직전에 **반드시 평온 씬**이 있어야 함.
행복 후 슬픔이 더 아프고, 평화 후 공포가 더 무섭다.

### 4. Phase별 긴장 상한

| Phase | 평균 긴장도 | 최대 허용 |
|-------|------------|-----------|
| Phase 1 (1~7화) | 2~4 | 7 (7화만) |
| Phase 2 (8~15화) | 4~6 | 8 |
| Phase 3 (16~22화) | 5~7 | 9 |
| Phase 4 (23~27화) | 7~9 | 10 |
| Phase 5 (엔딩) | 루트별 상이 | 10 |

### 5. 핵심 화 긴장도 최소치
- 7화: 최소 7
- 12화: 최소 7
- 19화: 최소 8
- 24화: 최소 9
- 27화: 최소 9

### 6. 감정 예금/인출 모델
따뜻한 씬 = 예금. 고통 씬 = 인출.
인출하려면 최근 2개 이상의 예금이 있어야 함.
→ 연속 인출 3회 이상이면 **감정 피로 경고**.

## 출력 형식

```markdown
## EP.XX 긴장도 맵

| 씬 | 긴장도 | 유형 | 감정 입→출 |
|----|--------|------|------------|
| S1 | 3 | setup | neutral→warmth |
| S2 | 5 | escalation | warmth→unease |
| S3 | 8 | climax | unease→shock |
| S4 | 4 | breather | shock→sad_relief |

평균: 5.0 | 최대: 8 | 판정: ✅ Phase 2 기준 적합
```
