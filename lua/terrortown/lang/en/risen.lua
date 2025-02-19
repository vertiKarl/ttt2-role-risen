L = LANG.GetLanguageTableReference("en")

-- GENERAL ROLE LANGUAGE STRINGS
L[RISEN.name] = "Risen"
L["info_popup_" .. RISEN.name] = [[Let yourself get confirmed to revive!]]
L["body_found_" .. RISEN.abbr] = "They were a Risen!"
L["search_role_" .. RISEN.abbr] = "This person was a Risen!"
L["target_" .. RISEN.name] = "Risen"
L["ttt2_desc_" .. RISEN.name] = [[The Risen is a traitor who is revived once they are confirmed by someone not on their team!]]

--SETTINGS STRINGS
L["label_ttt2_ris_conf_team"] = "Select which confirming players cause a revive"
L["label_ttt2_ris_conf_team_innocent"] = "Players in team Innocent"
L["label_ttt2_ris_conf_team_notsame"] = "Players not in the same team"
L["label_ttt2_ris_conf_team_anyone"] = "Anyone"
L["label_ttt2_ris_needs_corpse"] = "Risen needs a corpse to revive"
L["label_ttt2_ris_revive_time"] = "The time in seconds it takes the Risen to revive"