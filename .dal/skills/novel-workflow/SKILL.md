# Skill: Novel Workflow

> 출처: novel-writer-workflow-guide (MCP Market) 기반, 프로젝트 맞춤 변환

7단계 창작 워크플로우. 새 에피소드나 루트를 작업할 때 이 순서를 따른다.

## 7단계

### 1. /constitution — 창작 원칙 확인
- SYNOPSIS.md의 테마, 톤, 핵심 반전 재확인
- 17금 로맨틱 어드벤처 톤 가이드 확인
- "이든 과거사는 뒷배경" 원칙 확인

### 2. /specify — 작업 범위 정의
- 어떤 에피소드/루트를 작업하는가
- 해당 화의 outline.md 뼈대 확인
- 필요한 캐릭터, 장소, 게임 메커닉 목록
- 마커:
  - `[핵심]` — 이 화의 반드시 들어가야 할 비트
  - `[선택]` — 있으면 좋지만 필수 아님
  - `[확인필요]` — 다른 화와 정합성 체크 필요

### 3. /clarify — 모호점 해소
- 이전 화와 떡밥 연결이 맞는가?
- 캐릭터 상태(호감도, 공포도, 루프 회차)가 정확한가?
- 해당 화에서 열리는/닫히는 질문(mystery-cascade)이 명확한가?
- **최대 5개 질문을 정리 → leader 또는 원작자에게 확인**

### 4. /plan — 씬 구성
- 해당 화를 씬 단위로 분리
- 각 씬: 장소, 시간대, 등장인물, 핵심 이벤트
- tension-curve 태깅 (긴장도 + 감정)
- romance-beat 체크 (push/pull 리듬)
- 떡밥 Plant/Payoff 배치

### 5. /tasks — 세부 작업 분리
- 씬별 작업 우선순위
  - `[P]` 병렬 가능
  - `[의존:SX]` 이전 씬에 의존
  - `[핵심]` 이 화의 핵심 비트
- 에셋 목록 (스프라이트, 배경, BGM, SFX, CG)

### 6. /write — 집필
- vn-script 포맷으로 대사 + 선택지 + 연출 작성
- character-voice 프로필 참조
- 대사 2~3문장/박스 제한
- 글리치/메타 연출은 [연출] 태그로 명시
- **3씬마다 자체 리뷰**: 톤 일관성, 떡밥 누락, 긴장도 흐름

### 7. /analyze — 검증
- plot-review 체크리스트 실행
- foreshadow-check 실행
- mystery-cascade 질문 스택 업데이트
- tension-curve 그래프 확인
- **이상 없으면 → 커밋 → PR → report**

## 작업 규모별 조정

| 규모 | 적용 |
|------|------|
| 에피소드 1개 | specify → clarify → write → analyze |
| Phase 1개 (7화) | 전체 7단계 |
| 엔딩 루트 1개 | specify → plan → write → analyze |
| 떡밥 레이어 추가 | specify → clarify → plan → analyze |
