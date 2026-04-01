#Player: "claude" | "codex" | "gemini"
#Role:   "leader" | "member"
#DalrootID: =~"^@dalroot-\\d+-\\d+-\\d+$"
#DalProfile: {
	dalroot!: #DalrootID
	uuid!:    string & != ""
	name!:    string & != ""
	version!: string
	player!:  #Player
	role!:    #Role
	skills?:  [...string]
	hooks?:   [...string]
}
