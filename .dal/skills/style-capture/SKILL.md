# Skill: Style Capture

> 출처: crucible-writer style-capture 기반

작가의 문체를 포착하고 유지한다. 에피소드 간 톤/문체 일관성 보장.

## 스타일 프로필 구성

에피소드 작성 전, 기존 에피소드에서 스타일을 분석하여 프로필을 만든다.

```yaml
style_profile:
  sentence_structure:
    average_length: short       # short / medium / long
    complexity: simple          # simple / compound / complex
    fragments_allowed: true     # 미완성 문장 허용 여부

  vocabulary:
    level: casual               # casual / literary / mixed
    korean_style: 구어체        # 구어체 / 문어체 / 혼용

  dialogue:
    ratio: 70%                  # 전체 텍스트 대비 대사 비율
    subtext_frequency: high     # 말하지 않는 것의 비중
    silence_usage: frequent     # "……" 사용 빈도

  description:
    sensory_focus: visual+tactile  # 어떤 감각에 집중하는가
    metaphor_frequency: low     # 비유 사용 빈도

  pacing:
    scene_transition: hard_cut  # 주 사용 전환 기법
    time_skip_style: fade       # 시간 스킵 방식

  tone:
    base: bittersweet           # 기본 톤
    humor: rare                 # 유머 빈도
    horror: atmospheric         # 공포 유형 (점프스케어 X, 위화감 O)
```

## 현재 프로젝트 스타일

```yaml
style_profile:
  sentence_structure:
    average_length: short
    complexity: simple
    fragments_allowed: true     # "…괜찮아." "…또야."

  vocabulary:
    level: casual
    korean_style: 구어체

  dialogue:
    ratio: 75%
    subtext_frequency: very_high  # 가야는 거의 항상 진짜 뜻을 숨김
    silence_usage: very_frequent

  description:
    sensory_focus: visual
    metaphor_frequency: low

  pacing:
    scene_transition: hard_cut + emotional_bridge
    time_skip_style: 화면_암전

  tone:
    base: bittersweet_romance
    humor: almost_none
    horror: creeping_unease      # 서서히 이상해지는 위화감
```

## 검증 방법

### 1. 문장 길이 체크
한 씬의 대사들을 추출하여 평균 길이 측정.
프로필과 2단계 이상 차이나면 경고.

### 2. 서브텍스트 체크
대사마다 `{말한 것}` vs `{진짜 뜻}` 태깅.
서브텍스트 없는 대사가 50% 넘으면 경고.

### 3. 침묵 체크
"……" 또는 "…" 사용 빈도 측정.
프로필 대비 급격히 줄거나 늘면 경고.

### 4. 톤 체크
씬의 전체 분위기가 base tone에서 이탈하면 경고.
의도적 이탈(13화 폭주 등)은 서사적 근거 필요.

## 출력 형식

```markdown
## 스타일 검증: EP.XX

| 항목 | 프로필 | 실제 | 판정 |
|------|--------|------|------|
| 문장 길이 | short | short | ✅ |
| 서브텍스트 | very_high | high | ⚠ 약간 부족 |
| 침묵 빈도 | very_frequent | frequent | ✅ |
| 톤 | bittersweet | dark | ⚠ 의도적 이탈? 확인 필요 |
```
