# Skill: Prompt Craft

이미지 생성 프롬프트를 조립하고 최적화한다.

## 프롬프트 조립 공식

```
[Who] + [Physical Features] + [Outfit] + [Pose/Expression] + [Art Style] + [Background] + [Quality Tags]
```

### 각 요소 상세

| 요소 | 설명 | 예시 |
|------|------|------|
| Who | 성별, 나이대, 이름 | `1girl, young woman, Gaya` |
| Physical | 머리, 눈, 체형, 피부 | `long black hair, purple eyes, slim build, fair skin` |
| Outfit | 상의, 하의, 신발, 소품 | `white blouse, black pleated skirt, ankle boots, red hair ribbon` |
| Pose/Expression | 자세, 표정, 동작 | `standing, gentle smile, slightly worried eyes, hands clasped` |
| Art Style | 스타일, 참조 | `anime style, clean lineart, soft shading, visual novel aesthetic` |
| Background | 배경 | `white background` (시트) 또는 `forest clearing, afternoon light` (씬) |
| Quality | 품질 태그 | `masterpiece, best quality, highly detailed, sharp focus` |

## 프롬프트 유형별 템플릿

### 캐릭터 레퍼런스 (앵커 이미지)
```
masterpiece, best quality, character reference sheet,
[full character description from visual profile],
front view, full body, standing, arms slightly apart,
white background, clean lines, anime style, consistent design,
highly detailed, sharp focus
```

**이것이 모든 이미지의 기준점. 이 프롬프트의 캐릭터 설명을 모든 후속 프롬프트에 복사.**

### 표정 시트
```
masterpiece, best quality, expression sheet,
[character name], [face-only description from visual profile],
6 expressions in grid: (default smile) (happy) (sad) (fear) (angry) (special),
same face same angle, white background, anime style, clean lineart
```

### 씬 일러스트 (CG)
```
masterpiece, best quality, visual novel CG,
[full character description],
[pose/expression for this scene],
[background description from episode yaml],
[lighting/atmosphere],
anime style, cinematic composition, dramatic lighting
```

### 배경 (캐릭터 없음)
```
masterpiece, best quality, visual novel background,
[location description],
[time of day], [weather/atmosphere],
anime style, no characters, detailed environment, wide angle
```

## 네거티브 프롬프트 (공통)

```
low quality, worst quality, blurry, deformed, extra limbs, extra fingers,
bad anatomy, bad hands, cropped, watermark, text, signature,
multiple characters (단일 캐릭터 시), chibi, super deformed
```

## 플랫폼별 파라미터

### Midjourney
```
--ar 16:9 (시트) | --ar 2:3 (세로 CG) | --ar 16:9 (가로 CG)
--cref [URL] (캐릭터 레퍼런스 이미지)
--sref [URL] (스타일 레퍼런스)
--style raw (프롬프트에 충실한 생성)
--v 7
```

### Stable Diffusion / Flux
```
steps: 30~50
cfg_scale: 7~9
sampler: DPM++ 2M Karras
model: Illustrious XL (애니메이션)
LoRA: character-specific (훈련 시)
IP-Adapter: FaceID Plus V2 (참조 이미지 기반)
```

### GPT-4o / DALL-E
```
참조 이미지 업로드 + 텍스트 설명
"Generate in the exact same style and character design as the reference image"
```

## 프로젝트 스타일 가이드

### 기본 스타일 태그
```
anime style, visual novel aesthetic, soft cel shading, clean lineart,
muted color palette with occasional vivid accents (red ribbon, purple eyes),
slight film grain, atmospheric lighting
```

### 색감 팔레트
- **기본 톤**: 따뜻한 자연광 (낮), 차가운 푸른빛 (밤), 붉은 노을 (저녁)
- **가야 관련**: 검정(머리) + 붉은색(리본) + 보라(눈) = 코어 컬러
- **공포/글리치**: 채도 빠짐 + 붉은 노이즈 + VHS 느낌
- **프롤로그/회상**: 모노크롬 + 붉은색만 살림 (피, 리본)

### 분위기별 스타일 변형

| 분위기 | 스타일 추가 태그 |
|--------|-----------------|
| 일상/데이트 | warm lighting, soft focus, pastel tones |
| 미스터리/추리 | low key lighting, shadows, cool tones |
| 공포/글리치 | desaturated, chromatic aberration, VHS noise, red tint |
| 전투/밤 사냥 | dramatic lighting, motion blur, dark background, rim light |
| 프롤로그/회상 | monochrome except red, film grain, shallow depth of field |
| 엔딩 | 루트별 상이 (해방=밝음, 역전=붉음, 권한=차가움, 에이전트=디지털) |

## 에피소드별 CG 프롬프트 생성 규칙

1. `episodes/epXX.md`의 **시각적 이정표** 확인
2. 해당 씬의 yaml에서 location, time, bgm, characters 확인
3. character-sheet의 비주얼 프로필에서 외형 설명 복사
4. 해당 씬의 표정/포즈 결정
5. 프롬프트 조립 공식 적용
6. 네거티브 프롬프트 추가
7. 플랫폼 파라미터 추가

## 출력 형식

```markdown
## CG: EP.07 — 피 묻은 리본

### 프롬프트
masterpiece, best quality, visual novel CG,
1boy, young man, brown short hair, focused expression, holding a blood-stained red ribbon,
dark forest background, moonlight, dramatic rim lighting,
anime style, cinematic composition, shallow depth of field

### 네거티브
low quality, worst quality, blurry, deformed, extra limbs

### 파라미터
--ar 16:9 --style raw --v 7

### 메모
- 리본에 피가 묻어있어야 함 (붉은색 강조)
- 테이의 표정: 충격 + 공포
- 배경: 어두운 사냥터, 달빛만
```
