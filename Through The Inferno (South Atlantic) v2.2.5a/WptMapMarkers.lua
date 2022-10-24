env.info("TTI: WAYPOINT MAPMARKERS initializing...")

--[[
----------TTI Color Database for drawing lines/arrows/circles.
tti.color = {
	red = {1,0,0},
	green = {0,1,0},
	blue = {0,0,1},
	white = {1,1,1},
	black = {0, 0, 0},
	yellow = {1,1,0},
	turquoise = {0,1,1},
	magenta = {1,0,1}
}
--]]

--Mission type strings
agMissionTypeStr = "Air to Ground Hard "
mrMissionTypeStr = "Air to Ground Easy "
mraMissionTypeStr = "Air to Ground Easy-A "
mrbMissionTypeStr = "Air to Ground Easy-B "
agnMissionTypeStr = "Air to Ground Normal "
agnaMissionTypeStr = "Air to Ground Normal-A "
agnbMissionTypeStr = "Air to Ground Normal-B "
aghMissionTypeStr = "Air to Ground Helo "
infasMissionTypeStr = "Infantry Assault "
asMissionTypeStr = "Anti-Ship "
dsMissionTypeStr = "Deep Strike "

-- abrv. Mission type strings
abv_agMissionTypeStr = "A2G Hard "
abv_mrMissionTypeStr = "A2G Easy "
abv_mraMissionTypeStr = "A2G Easy-A "
abv_mrbMissionTypeStr = "A2G Easy-B "
abv_agnMissionTypeStr = "A2G Normal "
abv_agnaMissionTypeStr = "A2G Normal-A "
abv_agnbMissionTypeStr = "A2G Normal-B "
abv_aghMissionTypeStr = "A2G Helo "
abv_infasMissionTypeStr = "Infantry Assault "
abv_asMissionTypeStr = "Anti-Ship "
abv_dsMissionTypeStr = "Deep Strike "

--AG Map marker Text1
ag_id = {}
ag_circle_id = {}
ag_text_id = {}

AGMM = {
[1] = 	agMissionTypeStr .. "1 [WPT 11]",
[2] = 	agMissionTypeStr .. "2 [WPT 12]",
[3] = 	agMissionTypeStr .. "3 [WPT 13]",
[4] = 	agMissionTypeStr .. "4 [WPT 14]",
[5] = 	agMissionTypeStr .. "5 [WPT 15]",
[6] = 	agMissionTypeStr .. "6 [WPT 16]",
[7] = 	agMissionTypeStr .. "7 [WPT 17]",
[8] = 	agMissionTypeStr .. "8 [WPT 18]",
[9] = 	agMissionTypeStr .. "9 [WPT 19]",
[10] =	agMissionTypeStr .. "10 [WPT 20]",
}

--MR
mr_id = {}
mr_circle_id = {}
mr_text_id = {}

MRMM = {
[1] = mrMissionTypeStr .. "1 [WPT 1]",
[2] = mrMissionTypeStr .. "2 [WPT 2]",
[3] = mrMissionTypeStr .. "3 [WPT 3]",
[4] = mrMissionTypeStr .. "4 [WPT 4]",
[5] = mrMissionTypeStr .. "5 [WPT 5]",
[6] = mrMissionTypeStr .. "6 [WPT 6]",
[7] = mrMissionTypeStr .. "7 [WPT 7]",
[8] = mrMissionTypeStr .. "8 [WPT 8]",
[9] = mrMissionTypeStr .. "9 [WPT 9]",
[10] = mrMissionTypeStr .. "10 [WPT 10]",
}

--ASS
as_id = {}
as_circle_id = {}
as_text_id = {}

ASSMM = {
[1] = asMissionTypeStr .. "1",
[2] = asMissionTypeStr .. "2",
[3] = asMissionTypeStr .. "3",
[4] = asMissionTypeStr .. "4",
[5] = asMissionTypeStr .. "5",
}

--AGH
agh_id = {}
agh_circle_id = {}
agh_text_id = {}

AGHMM = {
[1] = aghMissionTypeStr .. "1 [WPT-21]",
[2] = aghMissionTypeStr .. "2 [WPT-22]",
[3] = aghMissionTypeStr .. "3 [WPT-23]",
[4] = aghMissionTypeStr .. "4 [WPT-24]",
[5] = aghMissionTypeStr .. "5 [WPT-25]",
[6] = aghMissionTypeStr .. "6 [WPT-26]",
[7] = aghMissionTypeStr .. "7 [WPT-27]",
[8] = aghMissionTypeStr .. "8 [WPT-28]",
[9] = aghMissionTypeStr .. "9 [WPT-29]",
[10] =	aghMissionTypeStr .. "10 [WPT-30]",
}
--INFAS
infas_id = {}
infas_circle_id = {}
infas_text_id = {}

INFASMM = {
[1] = infasMissionTypeStr .. "1 [WPT-31]",
[2] = infasMissionTypeStr .. "2 [WPT-32]",
[3] = infasMissionTypeStr .. "3 [WPT-33]",
[4] = infasMissionTypeStr .. "4 [WPT-34]",
[5] = infasMissionTypeStr .. "5 [WPT-35]",
[6] = infasMissionTypeStr .. "6 [WPT-36]",
[7] = infasMissionTypeStr .. "7 [WPT-37]",
[8] = infasMissionTypeStr .. "8 [WPT-38]",
[9] = infasMissionTypeStr .. "9 [WPT-39]",
[10] = infasMissionTypeStr .. "10 [WPT-40]",
}

------------- EDIT SHAPES AND TEXT --------------
---Circle Radius
tti.marker.a2g.circleSize = 4000 
tti.marker.a2g.circleSizeSmall = 2100 
--Circle Fill Color
tti.marker.a2g.circleFillColor = tti.color.red
--Circle Fill Alpha
tti.marker.a2g.circleFillAlpha = 0.18

--Circle Outline Color
tti.marker.a2g.circleOutlineColor = tti.color.white

--Text box offset from circle outline
tti.marker.a2g.textBoxOffset = 1500 + tti.marker.a2g.circleSize
tti.marker.a2g.textBoxOffsetSmall = 1500 + tti.marker.a2g.circleSizeSmall
--Text box position 360
tti.marker.a2g.textBoxAnglePosition = 45

tti.marker.a2g.textBoxFontSize = 9

tti.marker.a2g.textBoxTextColor = tti.color.white
tti.marker.a2g.textBoxTextAlpha = 0.8

tti.marker.a2g.textBoxFillColor = tti.color.red
tti.marker.a2g.textBoxFillAlpha = 0.5

--enable_drawn_markers = true
--AG MAP MARKER TEXT
function create_ag_marker(missionNumber)
	if enable_map_markers == true then
		ag_id[missionNumber] = UTILS.GetMarkID()
		ag_id[missionNumber] = AG_zone_list[missionNumber]:GetCoordinate():MarkToAll( AGMM[missionNumber] .. "\n\"" .. HardMissionName .. "\"", true)
	end
	
	if enable_drawn_markers == true then
		ag_circle_id[missionNumber] = UTILS.GetMarkID()
		ag_circle_id[missionNumber] = AG_zone_list[missionNumber]:GetCoordinate():CircleToAll(tti.marker.a2g.circleSize, -1, tti.marker.a2g.circleOutlineColor, 0.5, tti.marker.a2g.circleFillColor, tti.marker.a2g.circleFillAlpha, 3, false)
		ag_text_id[missionNumber] = UTILS.GetMarkID()
		ag_text_id[missionNumber] = AG_zone_list[missionNumber]:GetCoordinate():Translate(tti.marker.a2g.textBoxOffset, tti.marker.a2g.textBoxAnglePosition):TextToAll(AGMM[missionNumber] .. "\n\"" .. HardMissionName .. "\"", -1, tti.marker.a2g.textBoxTextColor, tti.marker.a2g.textBoxTextAlpha, tti.marker.a2g.textBoxFillColor, tti.marker.a2g.textBoxFillAlpha, tti.marker.a2g.textBoxFontSize, false)
	end
end

function remove_ag_markers(markId)
	if enable_map_markers == true then
		trigger.action.removeMark(ag_id[markId])
	end	
	
	if enable_drawn_markers == true then
			trigger.action.removeMark(ag_circle_id[markId])
			trigger.action.removeMark(ag_text_id[markId])
	end	
end

--AGH MAP MARKER TEXT
function create_agh_marker(missionNumber)
	if enable_map_markers == true then
		agh_id[missionNumber] = UTILS.GetMarkID()
		agh_id[missionNumber] = AGH_zone_list[missionNumber]:GetCoordinate():MarkToAll( AGHMM[missionNumber] .. "\n\"" .. HeloMissionName .. "\"", true)
	end
	
	if enable_drawn_markers == true then
		agh_circle_id[missionNumber] = UTILS.GetMarkID()
		agh_circle_id[missionNumber] = AGH_zone_list[missionNumber]:GetCoordinate():CircleToAll(tti.marker.a2g.circleSizeSmall, -1, tti.marker.a2g.circleOutlineColor, 0.5, tti.marker.a2g.circleFillColor, tti.marker.a2g.circleFillAlpha, 3, false)
		agh_text_id[missionNumber] = UTILS.GetMarkID()
		agh_text_id[missionNumber] = AGH_zone_list[missionNumber]:GetCoordinate():Translate(tti.marker.a2g.textBoxOffsetSmall, tti.marker.a2g.textBoxAnglePosition):TextToAll(AGHMM[missionNumber] .. "\n\"" .. HeloMissionName .. "\"", -1, tti.marker.a2g.textBoxTextColor, tti.marker.a2g.textBoxTextAlpha, tti.marker.a2g.textBoxFillColor, tti.marker.a2g.textBoxFillAlpha, tti.marker.a2g.textBoxFontSize, false)
	end
end

function remove_agh_markers(markId)
	if enable_map_markers == true then
		trigger.action.removeMark(agh_id[markId])
	end	
	
	if enable_drawn_markers == true then
		trigger.action.removeMark(agh_circle_id[markId])
		trigger.action.removeMark(agh_text_id[markId])
	end	
end
----INFAS MAP MARKER TEXT
--AGH MAP MARKER TEXT
function create_infas_marker(missionNumber)
	if enable_map_markers == true then
		infas_id[missionNumber] = UTILS.GetMarkID()
		infas_id[missionNumber] = INF_zone_list[missionNumber]:GetCoordinate():MarkToAll( INFASMM[missionNumber] .. "\n\"" .. InfMissionName .. "\"", true)
	end
	
	if enable_drawn_markers == true then
		infas_circle_id[missionNumber] = UTILS.GetMarkID()
		infas_circle_id[missionNumber] = INF_zone_list[missionNumber]:GetCoordinate():CircleToAll(tti.marker.a2g.circleSizeSmall, -1, tti.marker.a2g.circleOutlineColor, 0.5, tti.marker.a2g.circleFillColor, tti.marker.a2g.circleFillAlpha, 3, false)
		infas_text_id[missionNumber] = UTILS.GetMarkID()
		infas_text_id[missionNumber] = INF_zone_list[missionNumber]:GetCoordinate():Translate(tti.marker.a2g.textBoxOffsetSmall, tti.marker.a2g.textBoxAnglePosition):TextToAll(INFASMM[missionNumber] .. "\n\"" .. InfMissionName .. "\"", -1, tti.marker.a2g.textBoxTextColor, tti.marker.a2g.textBoxTextAlpha, tti.marker.a2g.textBoxFillColor, tti.marker.a2g.textBoxFillAlpha, tti.marker.a2g.textBoxFontSize, false)
	end
end

function remove_inf_markers(markId)
	if enable_map_markers == true then
		trigger.action.removeMark(infas_id[markId])
	end	
	
	if enable_drawn_markers == true then
		trigger.action.removeMark(infas_circle_id[markId])
		trigger.action.removeMark(infas_text_id[markId])
	end	
end
--ASS MAP MARKER TEXT
function create_as_marker(missionNumber)
	if enable_map_markers == true then
		as_id[missionNumber] = UTILS.GetMarkID()
		as_id[missionNumber] = ASS_zone_list[missionNumber]:GetCoordinate():MarkToAll( ASSMM[missionNumber] .. "\n\"" .. ShipMissionName .. "\"", true)
	end
	
	if enable_drawn_markers == true then
		as_circle_id[missionNumber] = UTILS.GetMarkID()
		as_circle_id[missionNumber] = ASS_zone_list[missionNumber]:GetCoordinate():CircleToAll(tti.marker.a2g.circleSize, -1, tti.marker.a2g.circleOutlineColor, 0.5, tti.marker.a2g.circleFillColor, tti.marker.a2g.circleFillAlpha, 3, false)
		as_text_id[missionNumber] = UTILS.GetMarkID()
		as_text_id[missionNumber] = ASS_zone_list[missionNumber]:GetCoordinate():Translate(tti.marker.a2g.textBoxOffset, tti.marker.a2g.textBoxAnglePosition):TextToAll(ASSMM[missionNumber] .. "\n\"" .. ShipMissionName .. "\"", -1, tti.marker.a2g.textBoxTextColor, tti.marker.a2g.textBoxTextAlpha, tti.marker.a2g.textBoxFillColor, tti.marker.a2g.textBoxFillAlpha, tti.marker.a2g.textBoxFontSize, false)
	end
end

function remove_as_markers(markId)
	if enable_map_markers == true then
		trigger.action.removeMark(as_id[markId])
	end	
	
	if enable_drawn_markers == true then
			trigger.action.removeMark(as_circle_id[markId])
			trigger.action.removeMark(as_text_id[markId])
	end	
end

function create_mr_marker(missionNumber)
	if enable_map_markers == true then
	--local markerCoord = MR_zone_list[missionNumber]:GetCoordinate()
		mr_id[missionNumber] = UTILS.GetMarkID()
		--trigger.action.markToAll(mr_id[missionNumber],MRMM[missionNumber] .. "\n\"" .. EasyMissionName .. "\"",MR_vec3_list[missionNumber],true)
		mr_id[missionNumber] = MR_zone_list[missionNumber]:GetCoordinate():MarkToAll( MRMM[missionNumber] .. "\n\"" .. EasyMissionName .. "\"", true)
	end
	
	if enable_drawn_markers == true then
		mr_circle_id[missionNumber] = UTILS.GetMarkID()
		mr_circle_id[missionNumber] = MR_zone_list[missionNumber]:GetCoordinate():CircleToAll(tti.marker.a2g.circleSize, -1, tti.marker.a2g.circleOutlineColor, 0.5, tti.marker.a2g.circleFillColor, tti.marker.a2g.circleFillAlpha, 3, false)
		mr_text_id[missionNumber] = UTILS.GetMarkID()
		mr_text_id[missionNumber] = MR_zone_list[missionNumber]:GetCoordinate():Translate(tti.marker.a2g.textBoxOffset, tti.marker.a2g.textBoxAnglePosition):TextToAll(MRMM[missionNumber] .. "\n\"" .. EasyMissionName .. "\"", -1, tti.marker.a2g.textBoxTextColor, tti.marker.a2g.textBoxTextAlpha, tti.marker.a2g.textBoxFillColor, tti.marker.a2g.textBoxFillAlpha, tti.marker.a2g.textBoxFontSize, false)
	end
end

function remove_mr_markers(markId)
	if enable_map_markers == true then
		trigger.action.removeMark(mr_id[markId])
	end	
	
	if enable_drawn_markers == true then
			trigger.action.removeMark(mr_circle_id[markId])
			trigger.action.removeMark(mr_text_id[markId])
	end	
end

env.info("TTI: WAYPOINT MAPMARKERS initialized!")
tti_wpt_markers_script_loaded = true