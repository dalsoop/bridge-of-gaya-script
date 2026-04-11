# 100156 `bridge-of-gaya-unity`

메타:

- Backup CT: `100156`
- CT Name: `bridge-of-gaya-unity`
- Backup log: `/mnt/truenas/templates/dump/vzdump-lxc-100156-2026_02_26-04_29_09.log`
- Backup file: `/mnt/truenas/templates/dump/vzdump-lxc-100156-2026_02_26-04_29_09.tar.zst`

확인된 구조 단서:

- `./root/Desktop/BridgeOfGaya/ProjectSettings/`
- `./root/Desktop/BridgeOfGaya/Packages/packages-lock.json`
- `./root/Desktop/BridgeOfGaya/Packages/manifest.json`
- `./root/Desktop/BridgeOfGaya-remote-unity-batch.log`
- `./root/Desktop/_gaya_local_untracked_backup_20260217-140630/Assets/`
- `./root/Desktop/_gaya_local_untracked_backup_20260217-140630/Assets/Editor/BridgeOfGayaBootstrap.cs`
- `./root/Desktop/_gaya_local_untracked_backup_20260217-140630/Assets/Scenes/SampleScene.unity`
- `./root/Desktop/_gaya_local_untracked_backup_20260217-140630/Assets/Resources/PerformanceTestRunSettings.json`

복구 의미:

- 이 백업은 `가야` 세계관의 Unity 프로젝트/프로토타입 축으로 보인다.
- `BridgeOfGayaBootstrap.cs`와 `SampleScene.unity`가 남아 있어 실제 런타임 또는 테스트 씬이 있었던 흔적이 강하다.
- `remote-unity-batch.log`가 존재하므로 원격 배치/자동화 빌드 흐름도 있었을 가능성이 높다.

현재 상태:

- tar가 크고 내부 파일 추출은 시간이 걸리므로, 이번 단계에서는 구조/핵심 파일명만 우선 기록했다.
- 필요하면 다음 단계에서 이 백업만 따로 풀어 `Assets/`, `Scripts/`, `Scene`, `manifest.json`을 상세 추출하면 된다.
