# Related Backups

`가야의 연결점`과 연결되는 주변 백업들.

## WordPress Story Source

- Backup CT: `202006`
- Name: `wordpress-blog-presser`
- File: `/mnt/truenas/templates/dump/vzdump-lxc-202006-2026_02_26-05_33_30.tar.zst`

확인된 내부 경로:

- `./var/www/html/database/wordpress.sql.gz`
- `./var/www/html/service.json`
- `./var/lib/mysql/wordpress/`

`service.json` 확인값:

- `vmid = 202006`
- `name = blog-presser`
- `service_type = wordpress`
- `ip = 10.50.202.6`

## Related App Backup

- Backup CT: `201030`
- Name: `laravel-gaya-dialogue`
- File: `/mnt/truenas/templates/dump/vzdump-lxc-201030-2026_02_26-05_13_26.tar.zst`

확인된 구조:

- Laravel app at `./var/www/html/`
- `package.json`
- `bootstrap/`
- `vendor/`
- `vite.config.js`

판단:

- 스토리 텍스트 저장소라기보다, `gaya-dialogue` 실행/서비스 코드 백업으로 보인다.
- 상세 메모: [201030-laravel-gaya-dialogue.md](/root/workspace/landing-ai-gaya/recovered/gaya-connection/201030-laravel-gaya-dialogue.md:1)

## Related Unity Backup

- Backup CT: `100156`
- Name: `bridge-of-gaya-unity`
- File: `/mnt/truenas/templates/dump/vzdump-lxc-100156-2026_02_26-04_29_09.tar.zst`

확인된 구조:

- `./root/Desktop/BridgeOfGaya/ProjectSettings/`
- `./root/Desktop/BridgeOfGaya/Packages/manifest.json`
- `./root/Desktop/_gaya_local_untracked_backup_20260217-140630/Assets/`
- `BridgeOfGayaBootstrap.cs`

판단:

- `bridge-of-gaya-unity`는 게임/Unity 프로젝트 백업이다.
- WordPress 스토리와 별개로, 같은 IP/세계관의 플레이어 인터페이스 또는 프로토타입 자산일 가능성이 높다.
- 상세 메모: [100156-bridge-of-gaya-unity.md](/root/workspace/landing-ai-gaya/recovered/gaya-connection/100156-bridge-of-gaya-unity.md:1)

## Current Live Clues

현재 라이브 vhost 쪽에는 다음 워드프레스 설치가 남아 있다.

- `/var/www/services/baby-eat-blog/main`
- `/var/www/services/blog-presser/dev-fix-ssl-proxy`
- `/var/www/services/novel-eunha/dev-fix-ssl-proxy`
- `/var/www/services/photo-dalsoop/dev-fix-ssl-proxy`

하지만 라이브 DB host `10.50.0.112`는 현재 응답하지 않아, 실제 본문 확인은 백업 SQL 기준으로 진행했다.
