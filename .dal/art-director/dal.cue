dalroot: "@dalroot-1-0-3"
uuid:    "gaya-art-director-20260325"
name:    "art-director"
version: "1.1.0"
player:  "claude"
role:    "member"
skills:  ["skills/character-sheet", "skills/prompt-craft", "skills/visual-consistency", "skills/vn-script"]
hooks:   []
git: {
    user:         "dal-${name}"
    email:        "dal-${name}@dalcenter.local"
    github_token: "env:GITHUB_TOKEN"
}
