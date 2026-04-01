dalroot: "@dalroot-1-0-0"
uuid:    "gaya-leader-20260325"
name:    "leader"
version: "1.1.0"
player:  "claude"
role:    "leader"
skills:  ["skills/plot-review", "skills/foreshadow-check", "skills/tension-curve", "skills/mystery-cascade", "skills/novel-workflow", "skills/continuity-checker"]
hooks:   []
git: {
    user:         "dal-${name}"
    email:        "dal-${name}@dalcenter.local"
    github_token: "env:GITHUB_TOKEN"
}
