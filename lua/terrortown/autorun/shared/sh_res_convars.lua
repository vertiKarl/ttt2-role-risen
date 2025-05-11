CreateConVar(
	"ttt2_ris_conf_team",
	1,
	{ FCVAR_ARCHIVE, FCVAR_NOTIFY },
	"Risen revives on confirm from: 0: Team Innocent, 1: Player not in the same team, 2: anyone",
	0,
	2
)

CreateConVar(
	"ttt2_ris_needs_corpse",
	0,
	{ FCVAR_ARCHIVE, FCVAR_NOTIFY },
	"Risen needs a corpse to revive 0: no, 1: yes",
	0,
	1
)
CreateConVar(
	"ttt2_ris_revive_time",
	0,
	{ FCVAR_ARCHIVE, FCVAR_NOTIFY },
	"Time in seconds it takes for the Risen to revive",
	0,
	99
)
CreateConVar("ttt2_ris_max_revives", 0, { FCVAR_ARCHIVE, FCVAR_NOTIFY }, "Maximum number of revives 0=infinite", 0, 5)
CreateConVar("ttt2_ris_covert", 0, { FCVAR_ARCHIVE, FCVAR_NOTIFY }, "Revive risen on covert search", 0, 1)
