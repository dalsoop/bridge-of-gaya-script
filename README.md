# 가야의 연결점 (Bridge of Gaya)

**PROJECT: MASKING**

한 소녀를 이해하려는 이야기처럼 보이지만,
실제로는 그녀를 반복적으로 죽여온 이유를 깨닫는 이야기.

## 장르

판타지 / 추리 / 미연시 / 루프 / 메타

## 핵심 질문

> "테이는 왜 가야를 죽였는가"

## 한 줄 정의

여러 페르소나 가야와 상호작용하며 "마스킹된 본체 가야"를 추론하고,
그 과정에서 플레이어 자신이 가야를 반복적으로 죽여온 존재임을 깨닫는
5일 루프형 추리/연애/메타 게임.

## 프로젝트 구조

```
bridge-of-gaya-script/
├── README.md                # 프로젝트 개요
├── SYNOPSIS.md              # 전체 시놉시스 + 엔딩 구조
├── outline.md               # 30화 서사 전개 로드맵
├── worldbuilding/           # 세계관 설정
│   ├── timeline.md          # 연표 / 계승 구조
│   ├── geography.md         # 장소 = 기억 공간
│   ├── politics.md          # 세력 관계 / 세계선 구조
│   └── loop-system.md       # 루프 / 밤 / 죽음 구조
├── characters/              # 등장인물
│   └── main-cast.md         # 가야 / 테이 / 왕 / 경쟁캐릭 / 소비마
├── themes/                  # 게임 시스템 / 소재별 리서치
│   ├── affinity-system.md   # 호감도 / 감정 구조
│   ├── ai-architecture.md   # AI 구조 / 마스킹 / task
│   ├── dopamine-model.md    # 도파민 / 항상성 / 쾌락 모델
│   └── gameplay.md          # 선택지 / 도구 / 도파민 설계
├── references/              # AI 대화 요약, 참고자료
│   ├── gemini-chatgpt-20260324.md
│   └── recovered-wordpress/ # WordPress/백업에서 복구한 원천 스토리 자료
└── episodes/                # 회차별 스크립트
    ├── ep01.md ~ ep30.md
    └── ...
```

## Canon Note

- 판타지 본편 세계관에서 왕 이름 표기는 `이든`으로 고정한다.
- 영문 병기는 필요할 때만 보조적으로 `Eden`을 붙이고, 기본 표기는 항상 `이든`을 우선한다.

## Recovered Sources

- 복구된 WordPress 스토리/설정 문서는 `references/recovered-wordpress/` 아래에 둔다.
- 여기에는 `가야의 연결점`, `시간의 잔해`, `소비마` 축 복구 메모와 관련 백업 정리가 들어간다.

## 회차 파일 컨벤션

각 에피소드 파일(`episodes/epXX.md`)은 아래 템플릿을 따른다:

```markdown
# EP.XX — 부제

## 개요
한두 줄 요약

## 등장인물
이 화에 등장하는 인물 목록

## 씬 구성

### S1. 장소 — 시간대
지문, 대사, 연출 노트

### S2. ...
```

## 작업 방식

- AI 대화(ChatGPT, Gemini 등)에서 나온 아이디어를 이 레포에 정리
- 회차 단위로 커밋, PR 리뷰 후 main 머지
