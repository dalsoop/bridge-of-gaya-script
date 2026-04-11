# Recovered Gaya Connection Story

백업에서 복구한 `가야의 연결점` 관련 스토리/설정 메모.

## Source

- WordPress backup CT: `202006`
- Backup name: `wordpress-blog-presser`
- Backup file: `/mnt/truenas/templates/dump/vzdump-lxc-202006-2026_02_26-05_33_30.tar.zst`
- SQL dump inside backup: `./var/www/html/database/wordpress.sql.gz`
- Service metadata inside backup:
  - `name = blog-presser`
  - `service_type = wordpress`
  - `ip = 10.50.202.6`

Related backups found during recovery:

- `/mnt/truenas/templates/dump/vzdump-lxc-201030-2026_02_26-05_13_26.tar.zst`
  - `CT Name: laravel-gaya-dialogue`
- `/mnt/truenas/templates/dump/vzdump-lxc-100156-2026_02_26-04_29_09.tar.zst`
  - `CT Name: bridge-of-gaya-unity`

## Recovered Entries

### 4695

- Title: `소비마 | 전체 줄거리`
- Type: `novel`
- Status: `draft`
- Date: `2023-01-22`

Recovered opening:

> 일류 과학자 소비마는 연구를 하던 도중 영혼을 발견하게 된다.

### 9599

- Title: `가야의 연결점 세세한 설정 (240630) 완성도 있`
- Type: `draft` / story setting document
- Date: `2024-07-31`

Recovered points:

- 라토, 이든, 테이, 가야, 미조리, 소비마를 중심으로 한 세계관/루프 구조
- 1일차~5일차 진행 구조
- 영혼의 결정, 신전, 가상 세계, AI 가야, 테라포밍, 엔딩 구조
- `엘 드 가야`, `블랑쉬 테이` 같은 설정명이 명시적으로 등장

Representative excerpt:

> 영혼의 결정에 스며들어 있는 가야의 기억을 AI 에게 이식

> 테이라는 왕가 기사단원에 연결 후 시뮬레이션 진행

> 미조리의 노트북을 통해 가야가 좋아하는 것을 전송 가능

### 9607

- Title: `가야의 연결점 1화`
- Type: `novel`
- Date: `2024-07-23`
- GUID: `https://rading.kr/?post_type=novel&p=9607`

Important note:

- 이 엔트리 안에 단순 `1화`만 있는 것이 아니라 다음 챕터 헤더도 같이 들어 있다.
  - `시간의 잔해`
  - `시간의 잔해: 2화 - 시뮬레이션의 시작`
  - `시간의 잔해: 3화 - 과거의 그림자`

Representative excerpt:

> "테이, 가야." 이든은 그의 가장 신뢰하는 기사들을 불렀다.

> "영혼의 결정에서 추출한 가야의 기억을 AI에 성공적으로 이식했어."

> "안녕하세요, 가야. 저는 소비마 박사입니다. 당신은 지금 가상 세계에 있어요."

> "테이는 어디 있나요?" 가야가 물었다.

> "미조리… 흥미롭군. 가야, 그녀의 가방을 확인해보세요."

## Relationship Summary

현재 확인 기준으로 `가야의 연결점`은 WordPress 쪽에 실제 스토리 텍스트가 남아 있었고,
별도 개발/게임 자산은 다른 백업 CT에 분산되어 있었다.

- Story text source:
  - `wordpress-blog-presser`
- Related app/service source:
  - `laravel-gaya-dialogue`
- Related Unity/game source:
  - `bridge-of-gaya-unity`

## Recovery Notes

- 라이브 WordPress DB host `10.50.0.112`는 현재 죽어 있어서 라이브 조회는 실패했다.
- 대신 `wordpress-blog-presser` 백업의 SQL 덤프에서 직접 스토리 제목과 본문을 확인했다.
- 현재 파일은 1차 적재본이다. 필요하면 다음 단계에서:
  - `9607` 본문 정제본 분리
  - `9599` 설정 문서 정제본 분리
  - `gaya-dialogue` / `bridge-of-gaya-unity` 백업 파일 구조 매핑
  로 확장한다.

추가 정리본:

- [gaya-connection/index.md](/root/workspace/landing-ai-gaya/recovered/gaya-connection/index.md:1)
