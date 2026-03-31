dalroot: "@dalroot-1-0-1"
uuid:    "gaya-architect-20260325"
name:    "architect"
version: "1.1.0"
player:  "claude"
role:    "member"
skills:  ["skills/plot-review", "skills/foreshadow-check", "skills/tension-curve", "skills/mystery-cascade", "skills/script-structure", "skills/continuity-checker", "skills/aot-narrative"]
hooks:   []
git: {
    user:         "dal-${name}"
    email:        "dal-${name}@dalcenter.local"
    github_token: "env:GITHUB_TOKEN"
}
