env.info('JTAC Custom List initializing ...')

--[[
:OnSpawnGroup(function(JTAC)
				OrbitTask=JTAC:TaskOrbitCircle(tti_config_jtac_altitude,80)
				JTAC:SetTask(OrbitTask,1)
				JTAC:SetCommand(tti_config_SetInvisible)
				JTAC:SetCommand(tti_config_SetImmortal)
				JTAC:OptionRTBBingoFuel(false)
				JTAC:OptionROTNoReaction()
				JTAC:SetOption(AI.Option.Air.id.SILENCE, true)
			end)
]]
-------

JTAC_DRONE = SPAWN:New( "JTAC-MQ" )

JTAC_DRONE_A2GE = SPAWN:New( "JTAC-MQ-A2GEASY" )

JTAC_DRONE_HELO = SPAWN:New( "JTAC-MQ-A2GHELO" )

JTAC_DRONE_HARD = SPAWN:New( "JTAC-MQ-A2GHARD" )

JTAC_DRONE_SAM = SPAWN:New( "JTAC-MQ-A2GSAM" ) 

-- DONT FORGET THIS IS IN ZEUS MARKERS "JTAC-MQ-ZEUS"

jtac_laser_code = jtac_default_laser_code

------------------SAM JTACS--------------------------
sam_spawned = false
--SAM---
function activate_SAM_jtac(missionNumber)
if enable_jtac_drones == true then
	if sam_site_jtacs_enable == true then
		if sam_spawned == false then
		JTAC_DRONE_SAM = JTAC_DRONE_SAM:OnSpawnGroup(
			function(SpawnGroup)
				OrbitTask=SpawnGroup:TaskOrbitCircle(tti_config_jtac_altitude,80)
				SpawnGroup:SetTask(OrbitTask,1)
				SpawnGroup:SetCommand(tti_config_SetInvisible)
				SpawnGroup:SetCommand(tti_config_SetImmortal)
				SpawnGroup:CommandEPLRS(true)
				SpawnGroup:OptionRTBBingoFuel(false)
				SpawnGroup:OptionROTNoReaction()
				SpawnGroup:SetOption(AI.Option.Air.id.SILENCE, true)
				end):SpawnFromCoordinate( SAM_zone_list[missionNumber]:GetCoordinate():SetAltitude(tti_config_jtac_altitude, true))
		JTAC_DRONE_SAM_NAME = JTAC_DRONE_SAM:GetName()
		JTACAutoLase(JTAC_DRONE_SAM_NAME, jtac_laser_code, jtac_smoke_targets, "all")
		end
		env.info("JTAC:  ".. JTAC_DRONE_SAM_NAME .."  spawned!")
	end
	sam_spawned = true
	end
end

function destroy_SAM_jtac()
	if sam_site_jtacs_enable == true then
		if JTAC_DRONE_SAM:IsAlive() == true then
			Group.getByName(JTAC_DRONE_SAM_NAME):destroy()
			env.info("JTAC: " .. JTAC_DRONE_SAM_NAME .. " destroyed!")
		end
	end
end

------------------A2G JTACS---------------------------]
--A2G---
function activate_AG_jtac(missionNumber)
    JTAC_DRONE_AG = JTAC_DRONE_HARD:OnSpawnGroup(
    function(SpawnGroup)
        OrbitTask=SpawnGroup:TaskOrbitCircle(tti_config_jtac_altitude,80)
		SpawnGroup:SetTask(OrbitTask,1)
        SpawnGroup:SetCommand(tti_config_SetInvisible)
        SpawnGroup:SetCommand(tti_config_SetImmortal)
		SpawnGroup:CommandEPLRS(true)
		SpawnGroup:OptionRTBBingoFuel(false)
		SpawnGroup:OptionROTNoReaction()
		SpawnGroup:SetOption(AI.Option.Air.id.SILENCE, true)
        end):SpawnFromCoordinate( AG_zone_list[missionNumber]:GetCoordinate():SetAltitude(tti_config_jtac_altitude, true))
JTAC_DRONE_AG_NAME = JTAC_DRONE_AG:GetName()
JTACAutoLase(JTAC_DRONE_AG_NAME, jtac_laser_code, jtac_smoke_targets, "all")
env.info("JTAC:  ".. JTAC_DRONE_AG_NAME .."  spawned!")
end

function destroy_AG_jtacs()
    if enable_jtac_drones == true then
		if JTAC_DRONE_AG:IsAlive() == true then
			Group.getByName(JTAC_DRONE_AG_NAME):destroy()
			env.info("JTAC: " .. JTAC_DRONE_AG_NAME .. " destroyed!")
		end
	end
end

------------------MR JTACS---------------------------]
--MR1---
function activate_MR_jtac(missionNumber)
	if enable_jtac_drones == true then
		JTAC_DRONE_MR = JTAC_DRONE_A2GE:OnSpawnGroup(
			function(SpawnGroup)
				OrbitTask=SpawnGroup:TaskOrbitCircle(tti_config_jtac_altitude,80)
				SpawnGroup:SetTask(OrbitTask,1)
				SpawnGroup:SetCommand(tti_config_SetInvisible)
				SpawnGroup:SetCommand(tti_config_SetImmortal)
				SpawnGroup:CommandEPLRS(true)
				SpawnGroup:OptionRTBBingoFuel(false)
				SpawnGroup:OptionROTNoReaction()
				SpawnGroup:SetOption(AI.Option.Air.id.SILENCE, true)
				end):SpawnFromCoordinate( MR_zone_list[missionNumber]:GetCoordinate():SetAltitude(tti_config_jtac_altitude, true))
		JTAC_DRONE_MR_NAME = JTAC_DRONE_MR:GetName()
		JTACAutoLase(JTAC_DRONE_MR_NAME, jtac_laser_code, jtac_smoke_targets, "all")
		--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_MR1_NAME .."  spawned!", 100)
		env.info("JTAC:  ".. JTAC_DRONE_MR_NAME .."  spawned!")
	end
end

function destroy_MR_jtacs()
if enable_jtac_drones == true then
    if JTAC_DRONE_MR:IsAlive() == true then
        Group.getByName(JTAC_DRONE_MR_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_MR_NAME .. " destroyed!")
	else
		tti.debug("JTAC: Issue with deleting MR JTAC, group error!")
	end
end
end

------------------AGH JTACS---------------------------]
--AGH1---
function activate_AGH_jtac(missionNumber)
    JTAC_DRONE_AGH = JTAC_DRONE_HELO:OnSpawnGroup(
    function(SpawnGroup)
        OrbitTask=SpawnGroup:TaskOrbitCircle(tti_config_jtac_altitude,80)
		SpawnGroup:SetTask(OrbitTask,1)
        SpawnGroup:SetCommand(tti_config_SetInvisible)
        SpawnGroup:SetCommand(tti_config_SetImmortal)
		SpawnGroup:CommandEPLRS(true)
		SpawnGroup:OptionRTBBingoFuel(false)
		SpawnGroup:OptionROTNoReaction()
		SpawnGroup:SetOption(AI.Option.Air.id.SILENCE, true)
        end):SpawnFromCoordinate( AGH_zone_list[missionNumber]:GetCoordinate():SetAltitude(tti_config_jtac_altitude, true))
JTAC_DRONE_AGH_NAME = JTAC_DRONE_AGH:GetName()
JTACAutoLase(JTAC_DRONE_AGH_NAME, jtac_laser_code, jtac_smoke_targets, "all")
env.info("JTAC:  ".. JTAC_DRONE_AGH_NAME .."  spawned!")
end

function destroy_AGH_jtacs()
if enable_jtac_drones == true then
    if JTAC_DRONE_AGH:IsAlive() == true then
        Group.getByName(JTAC_DRONE_AGH_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_AGH_NAME .. " destroyed!")
	else
		tti.debug("JTAC: Issue with deleting MR JTAC, group error!")
	end
end
end

--INF JTACS
--AGH6---
function activate_INF_jtac(missionNumber)
    JTAC_DRONE_INF = JTAC_DRONE_HELO:OnSpawnGroup(
    function(SpawnGroup)
        OrbitTask=SpawnGroup:TaskOrbitCircle(tti_config_jtac_altitude,80)
		SpawnGroup:SetTask(OrbitTask,1)
        SpawnGroup:SetCommand(tti_config_SetInvisible)
        SpawnGroup:SetCommand(tti_config_SetImmortal)
		SpawnGroup:CommandEPLRS(true)
		SpawnGroup:OptionRTBBingoFuel(false)
		SpawnGroup:OptionROTNoReaction()
		SpawnGroup:SetOption(AI.Option.Air.id.SILENCE, true)
        end):SpawnFromCoordinate( INF_zone_list[missionNumber]:GetCoordinate():SetAltitude(tti_config_jtac_altitude, true))
JTAC_DRONE_INF_NAME = JTAC_DRONE_INF:GetName()
JTACAutoLase(JTAC_DRONE_INF_NAME, jtac_laser_code, jtac_smoke_targets, "all")
env.info("JTAC:  ".. JTAC_DRONE_INF_NAME .."  spawned!")
end

function destroy_INF_jtacs()
if enable_jtac_drones == true then
    if JTAC_DRONE_INF:IsAlive() == true then
        Group.getByName(JTAC_DRONE_INF_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_INF_NAME .. " destroyed!")
	else
		tti.debug("JTAC: Issue with deleting MR JTAC, group error!")
	end
end
end

if enable_jtac_drones == true then

if jtac_smoke_targets == true then
trigger.action.outText("JTAC Drones are set to deploy RED SMOKE on LASED TARGETS. (LASER CODE: ".. jtac_default_laser_code ..")\nThese settings are configurable in the MISSION EDITOR. Check out the settings config tutorial text file that came with the mission for more details!", 10)
end

if jtac_smoke_targets == false then
trigger.action.outText("JTAC Drones are set to NOT DEPLOY RED SMOKE on LASED TARGETS. (LASER CODE: ".. jtac_default_laser_code ..")\nThese settings are configurable in the MISSION EDITOR. Check out the settings config tutorial text file that came with the mission for more details!", 10)
end
else
trigger.action.outText("JTAC Drones are DISABLED and will NOT spawn at ground missions!", 10)
end

tti_jtac_list_script_loaded = true
-- ctld.activatePickupZone("pickzone1")