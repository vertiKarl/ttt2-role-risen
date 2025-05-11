L = LANG.GetLanguageTableReference("de")

-- GENERAL ROLE LANGUAGE STRINGS
L[RISEN.name] = "Risen"
L["info_popup_" .. RISEN.name] = [[Lass dich confirmen um wiederbelebt zu werden!]]
L["body_found_" .. RISEN.abbr] = "War ein Risen!"
L["search_role_" .. RISEN.abbr] = "War ein Risen!"
L["target_" .. RISEN.name] = "Risen"
L["ttt2_desc_" .. RISEN.name] =
	[[Der Risen ist ein Traitor, der wiederbelebt wird wenn er von einer Person confirmed wird die nicht in seinem Team ist!]]

--SETTINGS STRINGS
L["label_ttt2_ris_conf_team"] = "Wähle die Spieler aus die eine Wiederbelebung auslösen"
L["label_ttt2_ris_conf_team_innocent"] = "Spieler im Team Unschuldige"
L["label_ttt2_ris_conf_team_notsame"] = "Spieler die nicht im selben Team sind"
L["label_ttt2_ris_conf_team_anyone"] = "Jeder"
L["label_ttt2_ris_needs_corpse"] = "Risen braucht eine Leiche um wiederbelebt zu werden"
L["label_ttt2_ris_revive_time"] = "Zeit in Sekunden bis Risen wiederbelebt wird"
L["label_ttt2_ris_max_revives"] = "Maximale Anzahl der Wiederbelebungen (0=unendlich)"
L["label_ttt2_ris_covert"] = "Wiederbeleben wenn Leiche heimlich durchsucht"
