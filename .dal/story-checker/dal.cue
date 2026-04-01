dalroot: "@dalroot-1-0-4"
uuid:    "gaya-story-checker-20260325"
name:    "story-checker"
version: "1.1.0"
player:  "claude"
role:    "member"
skills:  ["skills/original-intent", "skills/plot-review", "skills/continuity-checker"]
hooks:   []
git: {
    user:         "dal-${name}"
    email:        "dal-${name}@dalcenter.local"
    github_token: "env:GITHUB_TOKEN"
}
