# Skill: Character Sheet

캐릭터 비주얼 프로필을 정의하고, 레퍼런스 시트용 프롬프트를 생성한다.

## 비주얼 프로필 템플릿

모든 캐릭터에 대해 아래 항목을 채운다. **한 번 확정하면 불변.**

```yaml
character_visual:
  name: "가야"
  name_en: "Gaya"

  # 기본 외형
  gender: female
  age_appearance: 18~20
  height: 163cm
  body_type: 슬림, 약간 마른 편
  skin_tone: 밝은 살구색

  # 머리
  hair_color: 검정 (기본) | 은색 끝 (15화~) | 완전 백발 (23화~)
  hair_length: 허리까지
  hair_style: 자연스러운 스트레이트, 약간 웨이브
  hair_accessories: 붉은 리본 (3화에서 선물받은 후)

  # 얼굴
  eye_color: 보라색 (깊은 자주)
  eye_shape: 크고 둥근, 약간 처진 눈꼬리
  face_shape: 타원형, 작은 턱
  distinguishing_features: 눈 밑에 피로한 그림자 (루프 후반), 목 뒤 희미한 칼자국 (1화에서 순간 보임)

  # 의상
  default_outfit:
    top: 흰색 블라우스, 칼라 있음
    bottom: 검정 플리츠 스커트, 무릎 위
    outer: 없음 (기본) | 짧은 케이프 (전투 시)
    shoes: 검정 부츠, 발목 높이
    accessories: 붉은 리본 (머리), 은색 귀걸이 (작은 방울 모양)

  # 전투 장비
  weapon: 룬 블레이드 — 은색 세검, 날에 희미한 룬 문자
  armor: 경갑 — 왼팔에만 완갑, 가슴보호대

  # 표정 패턴
  expressions:
    default: 조용한 미소, 약간 불안한 눈
    happy: 입이 작게 웃음, 눈 초승달
    sad: 눈 내리깔음, 입 꾹 다문
    fear: 눈 크게 뜸, 동공 축소, 입 벌림
    anger: 눈매 날카로움 (거의 안 나옴)
    yandere: 미소인데 눈이 안 웃음, 동공 확대
    crying_smile: 눈물 + 미소 (27화 전용)

  # 변형 프로필 (스토리 진행)
  variants:
    - id: "gaya_wounded"
      trigger: "5화~"
      changes: "팔/어깨에 멍, 옆구리 자상 (위치는 에피소드별 다름)"
    - id: "gaya_silver_tips"
      trigger: "15화~"
      changes: "머리카락 끝 5cm가 은색"
    - id: "gaya_white"
      trigger: "23화~"
      changes: "완전 백발. 눈빛이 더 명확. 표정이 단호."
    - id: "gaya_prologue"
      trigger: "0화, 25화, 27화(루트A)"
      changes: "백발 + 가슴에 검이 꽂힌 상태 + 피 + 미소"
```

## 레퍼런스 시트 프롬프트 유형

### 1. 캐릭터 시트 (전신 3면도)
```
character reference sheet, [character description], front view, side view, back view,
full body, white background, consistent design, anime style, clean lines --ar 16:9
```

### 2. 표정 시트
```
character expression sheet, [character name], [face description],
6 expressions: default, happy, sad, fear, yandere, crying smile,
anime style, white background, consistent face --ar 4:3
```

### 3. 의상 변형 시트
```
outfit variations sheet, [character name], [base description],
3 outfits: casual, combat, wounded,
full body, white background, anime style --ar 16:9
```

### 4. 스토리 변형 시트 (머리색 변화)
```
character transformation sheet, [character name],
4 stages: black hair, silver tips, white hair, white hair + wound,
same outfit same pose, anime style, white background --ar 16:9
```

## 캐릭터별 필수 시트 목록

| 캐릭터 | 3면도 | 표정 | 의상 | 변형 | 전투 포즈 |
|--------|-------|------|------|------|-----------|
| 가야 | ✅ | ✅ (7종) | ✅ | ✅ (4단계) | ✅ |
| 테이 | ✅ | ✅ (4종) | ✅ | ✅ (갈색→흰색) | ✅ |
| 칼리스 | ✅ | ✅ (3종) | ✅ | — | ✅ |
| 발터 | ✅ | ✅ (2종) | — | — | ✅ |
| 세라 | ✅ | ✅ (3종) | — | — | ✅ |
| 카이 | ✅ | ✅ (2종) | — | — | ✅ |
| 마그누스 | ✅ | ✅ (3종) | — | — | ✅ |
| 엘리시아 | ✅ | ✅ (3종) | — | — | — |
| 라토 왕(이든) | ✅ | ✅ (2종) | — | — | — |
| 소비마 박사 | ✅ | ✅ (2종) | — | — | — |
| 루나 | ✅ | ✅ (2종) | — | — | — |

## 프롬프트 내 외형 설명 규칙

- **항상 전체 설명을 포함한다.** 축약 금지.
- **양수 표현만 사용.** ("수염 없음" ❌ → "깨끗한 턱선" ✅)
- **한 프롬프트에 한 캐릭터.** 복수 캐릭터는 별도 생성 후 합성.
- **변형은 기본 프로필 + 변경사항 추가.** 기본을 빼지 않는다.
