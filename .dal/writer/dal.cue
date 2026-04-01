dalroot: "@dalroot-1-0-2"
uuid:    "gaya-writer-20260325"
name:    "writer"
version: "1.1.0"
player:  "claude"
role:    "member"
skills:  ["skills/foreshadow-check", "skills/character-voice", "skills/romance-beat", "skills/vn-script", "skills/novel-workflow", "skills/script-structure", "skills/style-capture", "skills/continuity-checker", "skills/aot-narrative"]
hooks:   []
git: {
    user:         "dal-${name}"
    email:        "dal-${name}@dalcenter.local"
    github_token: "env:GITHUB_TOKEN"
}
