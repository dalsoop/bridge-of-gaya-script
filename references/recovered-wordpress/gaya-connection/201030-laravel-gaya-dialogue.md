# 201030 `laravel-gaya-dialogue`

메타:

- Backup CT: `201030`
- CT Name: `laravel-gaya-dialogue`
- Backup log: `/mnt/truenas/templates/dump/vzdump-lxc-201030-2026_02_26-05_13_26.log`
- Backup file: `/mnt/truenas/templates/dump/vzdump-lxc-201030-2026_02_26-05_13_26.tar.zst`

확인된 구조:

- Laravel app root: `./var/www/html/`
- Frontend toolchain:
  - `package.json`
  - `vite.config.js`
- Backend:
  - `app/Models/DialogueLine.php`
  - `app/Models/UnityModelFile.php`
  - `app/Http/Controllers/DialogueLineController.php`
  - `app/Livewire/Writer/DialoguesPage.php`
- Routes:
  - `routes/web.php`
  - `routes/api.php`
- DB:
  - `database/database.sqlite`
  - `database/migrations/2026_02_15_155415_create_dialogue_lines_table.php`
- Views:
  - `resources/views/game3d/`
  - `resources/views/game3d-rig-lab/`
  - `resources/views/studio-next/`
  - `resources/views/livewire/writer/dialogues-page.blade.php`
- Public assets:
  - `public/assets/gaya/`
  - `public/assets/game3d/`
  - `public/assets/game3d-rig-lab/`
  - `public/assets/studio-next/`
  - `public/assets/external/avatars/`
  - `public/assets/external/animations/`

복구 의미:

- 이 백업은 단순 문서 저장소가 아니라, `가야` 관련 대사/모델/편집기/리그랩/스튜디오 UI를 가진 실제 앱 서비스였다.
- `DialogueLine`, `UnityModelFile`, `DialoguesPage`라는 이름으로 보아 스토리/대사 데이터 편집을 담당했을 가능성이 높다.

프런트엔드 메타:

```json
{
  "private": true,
  "type": "module",
  "scripts": {
    "build": "vite build",
    "dev": "vite"
  }
}
```
