if enable_ctld == true and tti_ctld_script_loaded == true then
	tti_ctld_script_validated = true
end

if enable_csar == true and tti_csar_script_loaded == true then
	tti_csar_script_validated = true
end

if 	tti_global_functions_script_loaded == true and
	tti_blue_ground_database_loaded == true and
	tti_red_ground_database_loaded == true and
	tti_red_air_database_loaded == true and
	tti_blue_air_database_loaded == true and
	tti_ground_missions_script_loaded == true and
	tti_air_missions_script_loaded == true and
	tti_zeus_script_loaded == true and
	tti_mission_name_gen_script_loaded == true and
	tti_jtac_autolase_script_loaded == true and
	--tti_ctld_script_validated == true and
	--tti_csar_script_validated == true and
	tti_ewrs_script_loaded == true and
	tti_jtac_list_script_loaded == true and
	--tti_airboss_script_loaded == true and
	tti_intel_gen_script_loaded == true and
	tti_trigger_list_script_loaded == true and
	tti_random_air_traffic_script_loaded == true and
	tti_wpt_markers_script_loaded == true and
	tti_helo_transport_script_loaded == true and
	tti_random_air_traffic_script_loaded == true then
	trigger.action.outText("CHECKING SCRIPT FILES ... TTI mission scripts successfully loaded!", 30)
	else
	trigger.action.outText("CHECKING SCRIPT FILES ... TTI mission scripts LOAD ERROR! See dcs.log for details.", 30)
end



if 	tti_global_functions_script_loaded ~= true then
tti.debug("tti_global_functions_script - error, check script!", true)
end

if tti_blue_ground_database_loaded ~= true then
tti.debug("tti_blue_ground_database - error, check script!", true)
end

if tti_red_ground_database_loaded ~= true then
tti.debug("tti_red_ground_database - error, check script!", true)
end

if tti_red_air_database_loaded ~= true then
tti.debug("tti_red_air_database - error, check script!", true)
end

if tti_blue_air_database_loaded ~= true then
tti.debug("tti_blue_air_database - error, check script!", true)
end

if tti_ground_missions_script_loaded ~= true then
tti.debug("tti_ground_missions_script - error, check script!", true)
end

if tti_air_missions_script_loaded ~= true then
tti.debug("tti_air_missions_script - error, check script!", true)
end

if tti_zeus_script_loaded ~= true then
tti.debug("tti_zeus_script - error, check script!", true)
end

if tti_mission_name_gen_script_loaded ~= true then
tti.debug("tti_mission_name_gen_script - error, check script!", true)
end

if tti_jtac_autolase_script_loaded ~= true then
tti.debug("tti_jtac_autolase_script - error, check script!", true)
end

if tti_ctld_script_validated ~= true and enable_ctld == true then
tti.debug("tti_ctld_script_validated - error, check script!", true)
end

if tti_csar_script_validated ~= true and  enable_csar == true then
tti.debug("tti_csar_script_validated - error, check script!", true)
end

if tti_ewrs_script_loaded ~= true then
tti.debug("tti_ewrs_script - error, check script!", true)
end

if tti_jtac_list_script_loaded ~= true then
tti.debug("tti_jtac_list_script - error, check script!", true)
end

if tti_airboss_script_loaded ~= true and env.mission.theatre ~= "Nevada" and airboss_enable == true then
tti.debug("tti_airboss_script - error, check script!", true)
end

if tti_intel_gen_script_loaded ~= true then
tti.debug("tti_intel_gen_script - error, check script!", true)
end

if tti_trigger_list_script_loaded ~= true then
tti.debug("tti_trigger_list_script - error, check script!", true)
end

if tti_random_air_traffic_script_loaded ~= true then
tti.debug("tti_random_air_traffic_script - error, check script!", true)
end

if tti_wpt_markers_script_loaded ~= true then
tti.debug("tti_wpt_markers_script - error, check script!", true)
end

if tti_helo_transport_script_loaded ~= true then
tti.debug("tti_helo_transport_script - error, check script!", true)
end

if tti_random_air_traffic_script_loaded ~= true then
tti.debug("tti_random_air_traffic_script - error, check script!", true)
end
