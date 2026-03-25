# Skill: Character Voice

캐릭터 말투 일관성을 검증하고 유지한다.

## 캐릭터 음성 프로필

각 캐릭터에 대해 아래 항목을 정의하고, 대사 작성/검증 시 참조한다.

### 프로필 항목
```yaml
name: "캐릭터명"
formality: 1~5         # 1=반말 5=극존칭
sentence_length: short | medium | long
speech_tics: ["…", "거든", etc.]  # 말버릇
banned_words: []       # 이 캐릭터가 절대 안 쓰는 단어
preferred_expressions: []
emotional_vocabulary:
  happy: ["좋아", "괜찮아"]
  sad: ["…무서워", "…싫어"]
  angry: ["왜 그래"]
honorific_pattern: "존댓말 | 반말 | 혼용(조건)"
```

## 검증 방법

### 1. 이름 가리기 테스트
대사에서 캐릭터 이름을 가리고 읽는다.
누가 말하는지 구분이 안 되면 → **말투 차별화 부족**.

### 2. 대사 격리 테스트
한 캐릭터의 대사만 순서대로 뽑아서 읽는다.
중간에 갑자기 톤이 바뀌면 → **일관성 깨짐**.

### 3. Phase별 변화 검증
가야처럼 성격이 변하는 캐릭터는 Phase별로 프로필이 달라야 한다.
변화가 급격하면 → **전환 씬 필요**.

### 4. 존댓말/반말 추적
한국어 대사에서 존댓말↔반말 전환은 관계 변화의 핵심 지표.
전환 시점이 서사와 맞는지 확인.

## 현재 프로젝트 프로필

### 가야 (검은 머리 페르소나)
- formality: 2 (반말 기조, 가끔 존댓말)
- sentence_length: short
- speech_tics: ["…", 문장 앞 침묵]
- preferred: 짧은 감정 표현, 미완성 문장
- phase 변화: 순함(P1) → 불안(P2) → 집착(P3) → 본체(P4)

### 가야 (백발 본체)
- formality: 2
- sentence_length: short~medium
- speech_tics: ["…" 적음, 명확한 종결]
- preferred: 직접적 인지 표현 ("알아", "봤잖아", "기억해")
- 차이점: 페르소나보다 주어가 명확, 감정+인지 공존

### 테이
- 선택지로만 발화. 내면 독백은 짧게.
- formality: 상황 따라 변동
- 과묵. 행동이 말을 대신함.

### 칼리스
- formality: 3 (중립~약간 높음)
- sentence_length: short
- speech_tics: 없음 (깔끔한 문장)
- preferred: 도발, 질문형, 단정형
- banned: 감정적 표현, 감탄사

### 기사단 NPC
- 발터: formality 3, 무뚝뚝, 명령형/경고형
- 세라: formality 2, 밝음, 감탄/의문형
- 카이: formality 3, 극도 간결, 보고형
- 마그누스: formality 1, 호탕, 감탄사 많음
- 엘리시아: formality 4, 온화, 비유적 표현

## 경고 조건
- 한 씬에서 캐릭터 formality가 2단계 이상 변동 → **톤 깨짐**
- 캐릭터 A의 preferred_expression을 캐릭터 B가 사용 → **음성 오염**
- Phase 전환 없이 가야의 말투가 급변 → **전환 씬 누락**
