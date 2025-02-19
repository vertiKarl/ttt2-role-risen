-- ROLE.Base = "ttt_role_base"
--
-- ROLE.index = ROLE_TRAITOR

if SERVER then
  AddCSLuaFile()

  resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_ris.vmt")
end

function ROLE:PreInitialize()
  self.color = Color(255, 94, 13)

  self.abbr = "ris" -- abbreviation
  self.surviveBonus = 0.5 -- bonus multiplier for every survive while another player was killed
  self.scoreKillsMultiplier = 5 -- multiplier for kill of player of another team
  self.scoreTeamKillsMultiplier = -16 -- multiplier for teamkill
  self.preventFindCredits = false
  self.preventKillCredits = false
  self.preventTraitorAloneCredits = false

  self.isOmniscientRole = true

  self.defaultTeam = TEAM_TRAITOR

  self.conVarData = {
    pct = 0.17, -- necessary: percentage of getting this role selected (per player)
    maximum = 1, -- maximum amount of roles in a round
    minPlayers = 6, -- minimum amount of players until this role is able to get selected
    credits = 0, -- the starting credits of a specific role
    togglable = true, -- option to toggle a role for a client if possible (F1 menu)
    random = 50,
    traitorButton = 1, -- can use traitor buttons
    shopFallback = SHOP_FALLBACK_TRAITOR
  }
end

-- now link this subrole with its baserole
function ROLE:Initialize()
  roles.SetBaseRole(self, ROLE_TRAITOR)
end

if SERVER then

  hook.Add("TTTBodyFound", "RisenConfirm", function (confirmingPlayer, deadPlayer)
    if (
      -- Only handle if body is of a player with the risen role
      deadPlayer:GetSubRole() ~= ROLE_RISEN or
      -- ignore invalid objects
      not IsValid(deadPlayer) or
      not IsValid(confirmingPlayer)
    ) then return end

    confTeam = GetConVar("ttt2_ris_conf_team"):GetInt()

    -- Ignore revive if the player who confirms the body is in the same team
    if confTeam == 0 then -- Only revive if confirming player is in TEAM_INNOCENT
      if confirmingPlayer:GetTeam() ~= TEAM_INNOCENT then return end
    elseif confTeam == 1 then -- Only revive if confirming player is not in the same team
      if confirmingPlayer:GetTeam() == deadPlayer:GetTeam() then return end
    end -- otherwise, always revive

    print("[risen] Reviving player", deadPlayer)

    spawnpoint = plyspawn.GetRandomSafePlayerSpawnPoint(deadPlayer)
    local reviveTime = GetConVar("ttt2_ris_revive_time"):GetInt()
    local needsCorpse = GetConVar("ttt2_ris_needs_corpse"):GetBool()

    deadPlayer:Revive(
      reviveTime,
      nil,
      nil,
      needsCorpse,
      REVIVAL_BLOCK_AS_ALIVE,
      nil,
      spawnpoint.pos,
      spawnpoint.ang
    )
  end)
end

if CLIENT then

  function ROLE:AddToSettingsMenu(parent)
    local form = vgui.CreateTTT2Form(parent, "header_roles_additional")
    local translate = LANG.TryTranslation

    local choices = {
      translate("label_ttt2_ris_conf_team_innocent"),
      translate("label_ttt2_ris_conf_team_notsame"),
      translate("label_ttt2_ris_conf_team_anyone")
    }

    form:MakeCheckBox({
      serverConvar = "ttt2_ris_needs_corpse",
      label = "label_ttt2_ris_needs_corpse"
    })

    form:MakeSlider({
      serverConvar = "ttt2_ris_revive_time",
      label = "label_ttt2_ris_revive_time",
      min = GetConVar("ttt2_ris_revive_time"):GetMin(),
      max = GetConVar("ttt2_ris_revive_time"):GetMax(),
      decimal = 0
    })

    form:MakeComboBox({
      label = "label_ttt2_ris_conf_team",
      choices = choices,
      selectName = choices[GetConVar("ttt2_ris_conf_team"):GetInt() + 1],
      OnChange = function(value)
        local index = -1
        for i,choice in pairs(choices) do
          if choice == value then index = i end
        end

        if (index == -1) then return end

        index = index - 1 -- switch from lua 1-based indexing to cvar range 
        cvars.ChangeServerConVar("ttt2_ris_conf_team", index)
      end
    })
  end
end