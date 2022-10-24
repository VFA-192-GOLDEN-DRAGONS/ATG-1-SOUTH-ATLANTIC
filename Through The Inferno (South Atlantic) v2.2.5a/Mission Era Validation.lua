---------- check mission era valid ----------

if mission_era == "modern" or 
	mission_era == "ww2" or 
	mission_era == "korean_war" or 
	mission_era == "cold_war" then
	env.info("TTI - Mission Era... VALID")
end

if mission_era == "korean war" or mission_era == "KOREAN_WAR" or mission_era == "KOREAN WAR"  or mission_era == "KOREANWAR" or mission_era == "koreanwar" then
	mission_era = "korean_war"
	env.info("TTI - Mission Era typo detected; setting to korean_war")
end

if mission_era == "WW2" then
	mission_era = "ww2"
	env.info("TTI - Mission Era typo detected; setting to ww2")
end

if mission_era == "MODERN" then
	mission_era = "modern"
	env.info("TTI - Mission Era typo detected; setting to modern")
end

if mission_era == "cold war" or mission_era == "COLD_WAR" or mission_era == "COLD WAR"  or mission_era == "COLDWAR" or mission_era == "coldwar" then
	mission_era = "cold_war"
	env.info("TTI - Mission Era typo detected; setting to cold_war")
end


--era activate
if mission_era == "modern" then
	trigger.action.outText("Mission Era is set to: " .. string.upper(mission_era), 30)
	elseif mission_era == "korean_war" and ww2_asset_pack_enable == true then
		trigger.action.outText("Mission Era is set to: " .. string.upper(mission_era) .. " - WW2 Asset Pack ENABLED", 30)
	elseif mission_era == "korean_war" and ww2_asset_pack_enable == false then
		trigger.action.outText("Mission Era is set to: " .. string.upper(mission_era) .. " - WW2 Asset Pack DISABLED", 30)
	elseif mission_era == "ww2" and ww2_asset_pack_enable == true then
		trigger.action.outText("Mission Era is set to: " .. string.upper(mission_era) .. " - WW2 Asset Pack ENABLED", 30)
	elseif mission_era == "ww2" and ww2_asset_pack_enable == false then
		trigger.action.outText("Mission Era is set to: " .. string.upper(mission_era) .. " - WW2 Asset Pack DISABLED", 30)
	elseif mission_era == "cold_war" and ww2_asset_pack_enable == true then
		trigger.action.outText("Mission Era is set to: " .. string.upper(mission_era) .. " - WW2 Asset Pack ENABLED", 30)
	elseif mission_era == "cold_war" and ww2_asset_pack_enable == false then
		trigger.action.outText("Mission Era is set to: " .. string.upper(mission_era) .. " - WW2 Asset Pack DISABLED", 30)
end