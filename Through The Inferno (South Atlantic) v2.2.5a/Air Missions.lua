CPS 		= 	ZONE:New("CPS")
CPS1		=	ZONE:New("CPS-1")
CPS2		=	ZONE:New("CPS-2")
CPS3		=	ZONE:New("CPS-3")
CPS4		=	ZONE:New("CPS-4")
CPS5		=	ZONE:New("CPS-5")
CPS6		=	ZONE:New("CPS-6")
CPS7		=	ZONE:New("CPS-7")
CPS8		=	ZONE:New("CPS-8")
CPS9		=	ZONE:New("CPS-9")
CPS10		=	ZONE:New("CPS-10")

CPS_bomb1	=	ZONE:New("CPS_bomb1")
CPS_bomb2	=	ZONE:New("CPS_bomb2")
CPS_bomb3	=	ZONE:New("CPS_bomb3")
CPS_HELO	=	ZONE:New("CPS_HELO")

if mission_era == "modern" or mission_era == "cold_war" then
	a2a_min_alt = 5000
	a2a_max_alt = 10000
	else
	a2a_min_alt = 1000
	a2a_max_alt = 4000
end

CPS_vec		= CPS:GetVec3()
CPS1_vec	= CPS1:GetVec3()
CPS2_vec	= CPS2:GetVec3()
CPS3_vec	= CPS3:GetVec3()
CPS4_vec	= CPS4:GetVec3()
CPS5_vec	= CPS5:GetVec3()
CPS6_vec	= CPS6:GetVec3()
CPS7_vec	= CPS7:GetVec3()
CPS8_vec	= CPS8:GetVec3()
CPS9_vec	= CPS9:GetVec3()
CPS10_vec	= CPS10:GetVec3()


cps_id = {}
function create_cps_markers()
	cps_id[1] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[1],"CPS",CPS_vec,true)
	
	cps_id[2] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[2],"CPS1",CPS1_vec,true)
	
	cps_id[3] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[3],"CPS2",CPS2_vec,true)
	
	cps_id[4] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[4],"CPS3",CPS3_vec,true)
	
	cps_id[5] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[5],"CPS4",CPS4_vec,true)
	
	cps_id[6] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[6],"CPS5",CPS5_vec,true)
	
	cps_id[7] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[7],"CPS6",CPS6_vec,true)
	
	cps_id[8] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[8],"CPS7",CPS7_vec,true)
	
	cps_id[9] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[9],"CPS8",CPS8_vec,true)
	
	cps_id[10] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[10],"CPS9",CPS9_vec,true)
	
	cps_id[11] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[11],"CPS10",CPS10_vec,true)
end
--create_cps_markers()

--[[
--ADJUST ENEMY A2A SETTINGS HERE

--READ THE MISSION SETTINGS --README FILE FOR MORE DETAILS

-- Simply add two dashes -- before the name of the unit you want to remove from the spawning pool.
-- You can alternatively REMOVE two dashes before a unit to add it to the spawning pool.

--EXAMPLE, to ensure the SA-10 doesn't spawn the line with "sam_s10" will look like this
 --"sam_s10"

-- DO NOT DO ANYTHING HERE EXCEPT ADD/REMOVE DASHES TO THE UNITS YOU WANT ADDED/REMOVED FROM THE SPAWNING POOL.

TemplateTable_EASY = { 
----USA
--"red_cap_f18",
--"red_cap_f4",
--"red_cap_f14a",
--"red_cap_f15",
--"red_cap_f16",
--"red_cap_f14b",
"red_cap_f5",

--trainer
"red_cap_l39",
"red_cap_c101",

--Multinational Modern
--"red_cap_su27",
--"red_cap_su30",
--"red_cap_su33",
--"red_cap_j11",
--"red_cap_jf17",
--"red_cap_mig25",
--"red_cap_mig29s",
--"red_cap_mig23",
--"red_cap_m2000",
--"red_cap_m20005",
--"red_cap_mig29a",
--"red_cap_mig31",
--"red_cap_mig21",

----Korean War
--"red_cap_mig15",
--"red_cap_mig19",
--"red_cap_f86",

----WW2
--"red_cap_spitfire",
--"red_cap_p51",
--"red_cap_p47",
--"red_cap_bf109",
--"red_cap_fw190",
--"red_cap_i16",
--"red_cap_mosquito",
}

TemplateTable_NORMAL = { 
----USA
--"red_cap_f18",
"red_cap_f4",
--"red_cap_f14a",
--"red_cap_f15",
--"red_cap_f16",
--"red_cap_f14b",
"red_cap_f5",

----trainer
"red_cap_l39",
"red_cap_c101",

----Multinational Modern
--"red_cap_su27",
--"red_cap_su30",
--"red_cap_su33",
--"red_cap_j11",
--"red_cap_jf17",
"red_cap_mig25",
--"red_cap_mig29s",
"red_cap_mig23",
--"red_cap_m2000",
"red_cap_m20005",
--"red_cap_mig29a",
"red_cap_mig31",
"red_cap_mig21",

----Korean War
--"red_cap_mig15",
--"red_cap_mig19",
--"red_cap_f86",

----WW2
--"red_cap_spitfire",
--"red_cap_p51",
--"red_cap_p47",
--"red_cap_bf109",
--"red_cap_fw190",
--"red_cap_i16",
--"red_cap_mosquito",
}

TemplateTable_HARD = { 
----USA
"red_cap_f18",
--"red_cap_f4",
"red_cap_f14a",
"red_cap_f15",
"red_cap_f16",
"red_cap_f14b",
--"red_cap_f5",

----trainer
--"red_cap_l39",
--"red_cap_c101",

----Multinational Modern
"red_cap_su27",
"red_cap_su30",
"red_cap_su33",
"red_cap_j11",
"red_cap_jf17",
--"red_cap_mig25",
"red_cap_mig29s",
"red_cap_mig23",
"red_cap_m2000",
--"red_cap_m20005",
"red_cap_mig29a",
--"red_cap_mig31",
--"red_cap_mig21",

----Korean War
--"red_cap_mig15",
--"red_cap_mig19",
--"red_cap_f86",

----WW2
--"red_cap_spitfire",
--"red_cap_p51",
--"red_cap_p47",
--"red_cap_bf109",
--"red_cap_fw190",
--"red_cap_i16",
--"red_cap_mosquito",
} 

TemplateTable_ALL = { 
----USA
"red_cap_f18",
"red_cap_f4",
"red_cap_f14a",
"red_cap_f15",
"red_cap_f16",
"red_cap_f14b",
"red_cap_f5",

----trainer
"red_cap_l39",
"red_cap_c101",

----Multinational Modern
"red_cap_su27",
"red_cap_su30",
"red_cap_su33",
"red_cap_j11",
"red_cap_jf17",
"red_cap_mig25",
"red_cap_mig29s",
"red_cap_mig23",
"red_cap_m2000",
"red_cap_m20005",
"red_cap_mig29a",
"red_cap_mig31",
"red_cap_mig21",

----Korean War
--"red_cap_mig15",
--"red_cap_mig19",
--"red_cap_f86",

----WW2
--"red_cap_spitfire",
--"red_cap_p51",
--"red_cap_p47",
--"red_cap_bf109",
--"red_cap_fw190",
--"red_cap_i16",
--"red_cap_mosquito",
} 


TemplateTable_Bombing_Escort = { 
----USA
"red_cap_f18",
"red_cap_f4",
"red_cap_f14a",
"red_cap_f15",
"red_cap_f16",
"red_cap_f14b",
"red_cap_f5",

----trainer
"red_cap_l39",
"red_cap_c101",

----Multinational Modern
"red_cap_su27",
"red_cap_su30",
"red_cap_su33",
"red_cap_j11",
"red_cap_jf17",
"red_cap_mig25",
"red_cap_mig29s",
"red_cap_mig23",
"red_cap_m2000",
"red_cap_m20005",
"red_cap_mig29a",
"red_cap_mig31",
"red_cap_mig21",

----Korean War
--"red_cap_mig15",
--"red_cap_mig19",
--"red_cap_f86",

----WW2
--"red_cap_spitfire",
--"red_cap_p51",
--"red_cap_p47",
--"red_cap_bf109",
--"red_cap_fw190",
--"red_cap_i16",
--"red_cap_mosquito",
} 

TemplateTable_Antiship_Escort = { 
----USA
"red_cap_f18",
"red_cap_f4",
"red_cap_f14a",
"red_cap_f15",
"red_cap_f16",
"red_cap_f14b",

----Multinational/trainer
"red_cap_f5",
"red_cap_l39",
"red_cap_c101",

----Multinational Modern
"red_cap_su27",
"red_cap_su30",
"red_cap_su33",
"red_cap_j11",
"red_cap_jf17",
"red_cap_mig25",
"red_cap_mig29s",
"red_cap_mig23",
"red_cap_m2000",
"red_cap_m20005",
"red_cap_mig29a",
"red_cap_mig31",
"red_cap_mig21",

----Korean War
--"red_cap_mig15",
--"red_cap_mig19",
--"red_cap_f86",

----WW2
--"red_cap_spitfire",
--"red_cap_p51",
--"red_cap_p47",
--"red_cap_bf109",
--"red_cap_fw190",
--"red_cap_i16",
--"red_cap_mosquito",
}
 
TemplateTable_Bombing = { 
"red_bombing_tu22m3",
"red_bombing_b1b",
"red_bombing_b52",
"red_bombing_tornado",
"red_bombing_h6j",
--"red_bombing_a20g",
--"red_bombing_mosquito",
} 

TemplateTable_Antiship = { 
"red_antiship_tu22m3",
"red_antiship_tu42",
"red_antiship_b52",
}


TemplateTable_Helo = { 
"red_helo_ah1w",
"red_helo_ah64a",
"red_helo_ah64d",
"red_helo_ch74d",
"red_helo_ch53e",
"red_helo_ka27",
"red_helo_ka50",
"red_helo_mi24v",
"red_helo_mi26",
"red_helo_mi28n",
"red_helo_mi8",
"red_helo_oh58d",
"red_helo_sa342m",
"red_helo_sa342l",
"red_helo_sa342mis",
"red_helo_sh60b",
"red_helo_uh1h",
"red_helo_uh60",
} 

end
]]

TemplateTable_Blue_Backup_Airfield_1 = {
"blue_cap_f18",
"blue_cap_f4",
--"blue_cap_f14a",
"blue_cap_f15",
"blue_cap_f16",
--"blue_cap_f14b",
"blue_cap_f5",

--"blue_cap_l39",
--"blue_cap_c101",

"blue_cap_su27",
"blue_cap_su30",
"blue_cap_su33",
"blue_cap_su34",
"blue_cap_j11",
"blue_cap_jf17",
--"blue_cap_mig25",
"blue_cap_mig29s",
--"blue_cap_mig23",
"blue_cap_m2000",
"blue_cap_m20005",
"blue_cap_mf1",
--"blue_cap_mig29a",
--"blue_cap_mig31",
--"blue_cap_mig21",
--"blue_cap_su24mr",
--"blue_cap_su24m",
--"blue_cap_su17m4",
--"blue_cap_mig27k",
"blue_cap_ajs37",

--"blue_cap_mig15",
--"blue_cap_mig19",
--"blue_cap_f86",

--"blue_cap_spitfire",
--"blue_cap_p51",
--"blue_cap_p47",
--"blue_cap_bf109",
--"blue_cap_fw190",
--"blue_cap_i16",
}

TemplateTable_Blue_Backup_Airfield_2 = {
"Blue_CAP_Backup_Airfield_2",
}

TemplateTable_Blue_Backup_Airfield_3 = {
"Blue_CAP_Backup_Airfield_3",
}

if mission_era == "cold_war" then
TemplateTable_Blue_Backup_CV_1 = {
--"blue_cap_f18",
"blue_cap_f4",
--"blue_cap_f14a",
--"blue_cap_f14b",
}
elseif mission_era == "modern" then
TemplateTable_Blue_Backup_CV_1 = {
"blue_cap_f18",
--"blue_cap_f4",
"blue_cap_f14a",
"blue_cap_f14b",
}
end

TemplateTable_Blue_Backup_CV_KUZ_1 = {
"blue_cap_su33",
}

TemplateTable_Blue_Backup_CV_2 = {
"Blue_CAP_Backup_CV_2",
}

---- DEBUG SETTINGS ----

enable_carrier_bombers = false
ship_bomber_amount = 1

a2a_hard_autospawn_enable = false
a2a_hard_respawn_time_min = 2400
a2a_hard_respawn_time_max = 2400

----------------

function randomizeAirZone()
	if mission_era == "modern" then
		 switchAirZone = math.random (1,10)
	else
		 switchAirZone = math.random (11,11)
	end
	
	if switchAirZone == 1 then
		currentAirZone = CPS1
	elseif switchAirZone ==2 then
		currentAirZone = CPS2
	elseif switchAirZone ==3 then
		currentAirZone = CPS3
	elseif switchAirZone ==4 then
		currentAirZone = CPS4
	elseif switchAirZone ==5 then
		currentAirZone = CPS5
	elseif switchAirZone ==6 then
		currentAirZone = CPS6
	elseif switchAirZone ==7 then
		currentAirZone = CPS7
	elseif switchAirZone ==8 then
		currentAirZone = CPS8
	elseif switchAirZone ==9 then
		currentAirZone = CPS9
	elseif switchAirZone ==10 then
		currentAirZone = CPS10
	elseif switchAirZone == 11 then
		currentAirZone = CPS_HELO
	end
end

function randomizeBombAirZone()
	local switchBombAirZone = math.random (1,3)
	if switchBombAirZone == 1 then
		currentBombAirZone = CPS_bomb1
	elseif switchBombAirZone ==2 then
		currentBombAirZone = CPS_bomb2
	elseif switchBombAirZone ==3 then
		currentBombAirZone = CPS_bomb3
	end
end

A2A_Easy = SPAWN:NewWithAlias( "A2A_Spawn_Init_Modern", "A2A_Spawn_Init_EASY" )
	:InitRandomizeTemplate( TemplateTable_EASY )
	:InitRandomizeRoute( 1, 1, 20000 ) 				

A2A_Norm = SPAWN:NewWithAlias( "A2A_Spawn_Init_Modern", "A2A_Spawn_Init_NORM" )
	:InitRandomizeTemplate( TemplateTable_NORMAL )
	:InitRandomizeRoute( 1, 1, 20000 ) 

A2A_Hard = SPAWN:NewWithAlias( "A2A_Spawn_Init_Modern", "A2A_Spawn_Init_HARD" )
	:InitRandomizeTemplate( TemplateTable_HARD )
	:InitRandomizeRoute( 1, 1, 20000 ) 		

A2A_ALL = SPAWN:NewWithAlias( "A2A_Spawn_Init_Modern", "A2A_Spawn_Init_ALL" )
	:InitRandomizeTemplate( TemplateTable_ALL )
	:InitRandomizeRoute( 1, 1, 20000 ) 
	
A2A_WW2 = SPAWN:NewWithAlias( "A2A_Spawn_Init_15k", "A2A_Spawn_Init_WW2" )
	:InitRandomizeTemplate( TemplateTable_ALL )
	:InitRandomizeRoute( 1, 1, 20000 ) 
--helo add
A2A_Helo = SPAWN:New( "A2A_Spawn_Init_HELO" )
	:InitRandomizeTemplate( TemplateTable_Helo )
	:InitRandomizeRoute( 1, 1, 20000 ) 
--bombing add
A2A_BOMBING = SPAWN:New( "A2A_Spawn_Init_Bombing" )
	:InitRandomizeTemplate( TemplateTable_Bombing )
	:InitRandomizeRoute( 1, 1, 20000 )
	
A2A_BOMBING_ESCORT = SPAWN:New( "A2A_Spawn_Init_Bombing_Escort" ) -- templated
	:InitRandomizeTemplate( TemplateTable_Bombing_Escort )
	--:InitRandomizeRoute( 1, 1, 20000 )
	
A2A_ANTISHIP_ESCORT = SPAWN:New( "A2A_Spawn_Init_ANTISHIP_Escort" ) -- templated
	:InitRandomizeTemplate( TemplateTable_Antiship_Escort )
	--:InitRandomizeRoute( 1, 1, 20000 ) 
	
A2A_ANTISHIP = SPAWN:New( "A2A_Spawn_Init_ANTISHIP" )
	:InitRandomizeTemplate( TemplateTable_Antiship )
	--:InitRandomizeRoute( 1, 1, 20000 ) 


--[[
A2A_BLUE_BACKUP_AIRFIELD_1 = SPAWN:NewWithAlias( "Blue_CAP_A2A_Backup_Airfield_INIT","A2A_Blue_CAP_Backup_1" )
--A2A_BLUE_BACKUP_AIRFIELD_1 = SPAWN:New( "CV Backup Test" )
	:InitRandomizeTemplate( TemplateTable_Blue_Backup_Airfield_1 )
	:InitRandomizeRoute( 1, 1, 20000 )

A2A_BLUE_BACKUP_AIRFIELD_2 = SPAWN:NewWithAlias( "Blue_CAP_A2A_Backup_Airfield_INIT", "A2A_Blue_CAP_Backup_2" )
--A2A_BLUE_BACKUP_AIRFIELD_1 = SPAWN:New( "CV Backup Test" )
	:InitRandomizeTemplate( TemplateTable_Blue_Backup_Airfield_2 )
	:InitRandomizeRoute( 1, 1, 20000 )
	
A2A_BLUE_BACKUP_AIRFIELD_3 = SPAWN:NewWithAlias( "Blue_CAP_A2A_Backup_Airfield_INIT", "A2A_Blue_CAP_Backup_3" )
--A2A_BLUE_BACKUP_AIRFIELD_1 = SPAWN:New( "CV Backup Test" )
	:InitRandomizeTemplate( TemplateTable_Blue_Backup_Airfield_3 )
	:InitRandomizeRoute( 1, 1, 20000 )
	
A2A_BLUE_BACKUP_CV_1 = SPAWN:NewWithAlias( "Blue_CAP_A2A_Backup_CV_INIT", "A2A_Blue_CAP_CV_Backup_1" )
--A2A_BLUE_BACKUP_AIRFIELD_1 = SPAWN:New( "CV Backup Test" )
	:InitRandomizeTemplate( TemplateTable_Blue_Backup_CV_1 )
	:InitRandomizeRoute( 1, 1, 20000 )
	
A2A_BLUE_BACKUP_CV_KUZ_1 = SPAWN:NewWithAlias( "Blue_CAP_A2A_Backup_CV_KUZ_INIT", "A2A_Blue_CAP_CV_KUZ_Backup_1" )
--A2A_BLUE_BACKUP_AIRFIELD_1 = SPAWN:New( "CV Backup Test" )
	:InitRandomizeTemplate( TemplateTable_Blue_Backup_CV_KUZ_1 )
	:InitRandomizeRoute( 1, 1, 20000 )

--]]
	
--[[
backup_cap_airfield_1_unit = Group.getByName("Blue_CAP_Backup_Airfield_1"):getUnit(1)
backup_cap_airfield_2_unit = Group.getByName("Blue_CAP_Backup_Airfield_2"):getUnit(1)
backup_cap_airfield_3_unit = Group.getByName("Blue_CAP_Backup_Airfield_3"):getUnit(1)
backup_cap_cv_1_unit = Group.getByName("Blue_CAP_Backup_CV_1"):getUnit(1)
backup_cap_cv_2_unit = Group.getByName("Blue_CAP_Backup_CV_2"):getUnit(1)

backup_cap_airfield_1_name = backup_cap_airfield_1_unit:getTypeName()
backup_cap_airfield_2_name = backup_cap_airfield_2_unit:getTypeName()
backup_cap_airfield_3_name = backup_cap_airfield_3_unit:getTypeName()
backup_cap_cv_1_name = backup_cap_cv_1_unit:getTypeName()
backup_cap_cv_2_name = backup_cap_cv_2_unit:getTypeName()
--]]



-- string.upper(friendlySquadronCallsign[math.random(1,#friendlySquadronCallsign)]) .." ".. tostring(math.random (1,9)) .. "-1 ["
-- function a2a_backup_1_start()
	-- A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN = A2A_BLUE_BACKUP_AIRFIELD_1:SpawnInZone( currentAirZone, true, a2a_min_alt, a2a_max_alt )
	-- A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_UNIT = A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN:GetUnit(1)
	-- A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_TYPE_NAME = A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_UNIT:GetTypeName()
	-- --trigger.action.outText( A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_TYPE_NAME, 7)
	-- randomFriendlyCAPLaunchRequest()
	-- timer.scheduleFunction(function()
	-- randomFriendlyLaunchNotification(A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_TYPE_NAME, "main airbase")
	-- end, nil, timer.getTime() + 4  )
-- end


showBackupSpawnDebugText = false

-- BACKUPS ARE DELETED WITH cleanupLandedBlue local function

function a2a_backup_1_start()
	local strFriendlySquadronCallsign = string.upper(friendlySquadronCallsign[math.random(1,#friendlySquadronCallsign)]) .." ".. tostring(math.random (1,9)) .. "-1"
	_G[strFriendlySquadronCallsign] = SPAWN:NewWithAlias( "Blue_CAP_A2A_Backup_Airfield_INIT", strFriendlySquadronCallsign )
	tti.debug("CAP Airfield Backup Callsign is: " .. strFriendlySquadronCallsign, showBackupSpawnDebugText)
	
	local A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN = _G[strFriendlySquadronCallsign]:OnSpawnGroup(
		function ( SpawnGroup )
		end)
		:InitRandomizeTemplate( TemplateTable_Blue_Backup_Airfield_1 )
		:InitRandomizeRoute( 1, 1, 20000 )
		--:SpawnInZone( currentAirZone, true, a2a_min_alt, a2a_max_alt )
		:Spawn()
	local A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_UNIT = A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN:GetUnit(1)
	local A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_TYPE_NAME = A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_UNIT:GetTypeName()
	local A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_GROUP_NAME = A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN:GetName()
	tti.debug("Backup from ground name is: " .. A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_GROUP_NAME)
	randomFriendlyCAPLaunchRequest()
	randomFriendlyLaunchNotification(A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_TYPE_NAME, "main airbase", strFriendlySquadronCallsign, 4)
end

function a2a_backup_cv_1_start()
	local strFriendlySquadronCallsign = string.upper(friendlySquadronCallsign[math.random(1,#friendlySquadronCallsign)]) .." ".. tostring(math.random (1,9)) .. "-1"
	_G[strFriendlySquadronCallsign] = SPAWN:NewWithAlias( "Blue_CAP_A2A_Backup_CV_INIT", strFriendlySquadronCallsign )
	tti.debug("CAP US Carrier Backup Callsign is: " .. strFriendlySquadronCallsign, showBackupSpawnDebugText)
	
	local A2A_BLUE_BACKUP_CV_1_SPAWN = _G[strFriendlySquadronCallsign]:OnSpawnGroup(
		function ( SpawnGroup )
		end)
		:InitRandomizeTemplate( TemplateTable_Blue_Backup_CV_1 )
		:InitRandomizeRoute( 1, 1, 20000 )
		--:SpawnInZone( currentAirZone, true, a2a_min_alt, a2a_max_alt )
		:Spawn()
	local A2A_BLUE_BACKUP_CV_1_SPAWN_UNIT = A2A_BLUE_BACKUP_CV_1_SPAWN:GetUnit(1)
	local A2A_BLUE_BACKUP_CV_1_SPAWN_TYPE_NAME = A2A_BLUE_BACKUP_CV_1_SPAWN_UNIT:GetTypeName()
	randomFriendlyCAPLaunchRequest()
	randomFriendlyLaunchNotification(A2A_BLUE_BACKUP_CV_1_SPAWN_TYPE_NAME, Unit.getByName("CVN-7X"):getTypeName(), strFriendlySquadronCallsign, 4)
end

function a2a_backup_cv_kuz_1_start()
	local strFriendlySquadronCallsign = string.upper(friendlySquadronCallsign[math.random(1,#friendlySquadronCallsign)]) .." ".. tostring(math.random (1,9)) .. "-1"
	_G[strFriendlySquadronCallsign] = SPAWN:NewWithAlias( "Blue_CAP_A2A_Backup_CV_KUZ_INIT", strFriendlySquadronCallsign, 4 )
	tti.debug("CAP RU Carrier Backup Callsign is: " .. strFriendlySquadronCallsign, showBackupSpawnDebugText)
	
	local A2A_BLUE_BACKUP_CV_KUZ_1_SPAWN = _G[strFriendlySquadronCallsign]:OnSpawnGroup(
		function ( SpawnGroup )
		end)
		:InitRandomizeTemplate( TemplateTable_Blue_Backup_CV_KUZ_1 )
		:InitRandomizeRoute( 1, 1, 20000 )
		--:SpawnInZone( currentAirZone, true, a2a_min_alt, a2a_max_alt )
		:Spawn()
	local A2A_BLUE_BACKUP_CV_KUZ_1_SPAWN_UNIT = A2A_BLUE_BACKUP_CV_KUZ_1_SPAWN:GetUnit(1)
	local A2A_BLUE_BACKUP_CV_KUZ_1_SPAWN_TYPE_NAME = A2A_BLUE_BACKUP_CV_KUZ_1_SPAWN_UNIT:GetTypeName()
	randomFriendlyCAPLaunchRequest()
	randomFriendlyLaunchNotification(A2A_BLUE_BACKUP_CV_KUZ_1_SPAWN_TYPE_NAME, Unit.getByName("CV Kuznetsov"):getTypeName(), strFriendlySquadronCallsign, 4)
end

if mission_era == "ww2" and ww2_asset_pack_enable == true then
table.insert(TemplateTable_EASY, "red_cap_b17g")
table.insert(TemplateTable_EASY, "red_cap_ju88a4")

table.insert(TemplateTable_NORMAL, "red_cap_b17g")
table.insert(TemplateTable_NORMAL, "red_cap_ju88a4")

table.insert(TemplateTable_HARD, "red_cap_b17g")
table.insert(TemplateTable_HARD, "red_cap_ju88a4")

table.insert(TemplateTable_ALL, "red_cap_b17g")
table.insert(TemplateTable_ALL, "red_cap_ju88a4")

table.insert(TemplateTable_Bombing, "red_bombing_ju88a4")
table.insert(TemplateTable_Bombing, "red_bombing_b17g")
end

if mission_era == "korean_war" and ww2_asset_pack_enable == true then
table.insert(TemplateTable_EASY, "red_cap_b17g")
table.insert(TemplateTable_EASY, "red_cap_ju88a4")

table.insert(TemplateTable_NORMAL, "red_cap_b17g")
table.insert(TemplateTable_NORMAL, "red_cap_ju88a4")

table.insert(TemplateTable_HARD, "red_cap_b17g")
table.insert(TemplateTable_HARD, "red_cap_ju88a4")

table.insert(TemplateTable_ALL, "red_cap_b17g")
table.insert(TemplateTable_ALL, "red_cap_ju88a4")

table.insert(TemplateTable_Bombing, "red_bombing_ju88a4")
table.insert(TemplateTable_Bombing, "red_bombing_b17g")
end
	
function a2a_easy_start()  --1 per group
	randomizeAirZone()
	if mission_era == "modern" or mission_era == "cold_war" then
	A2A_Easy_Spawn = A2A_Easy:SpawnInZone( currentAirZone, true, a2a_min_alt, a2a_max_alt )
	else
	A2A_Easy_Spawn = A2A_WW2:SpawnInZone( currentAirZone, true, a2a_min_alt, a2a_max_alt )
	end
end

function a2a_norm_start()  --2 per group
	randomizeAirZone()
		if mission_era == "modern" or mission_era == "cold_war" then
	A2A_Norm_Spawn = A2A_Norm:SpawnInZone( currentAirZone, true, a2a_min_alt, a2a_max_alt )
	else
	A2A_Norm_Spawn = A2A_WW2:SpawnInZone( currentAirZone, true, a2a_min_alt, a2a_max_alt )
	end
end

--[[
spawn_a2a_hard_on_kill_count = true
a2aHardKillCountThreshold = 6

backup_cap_autospawn_enable = true
backup_respawn_time_min = 1200
backup_respawn_time_max = 2400
--]]

function a2a_hard_start_kill_count()

if a2a_hard_started ~= true then

playerAircraftKillCount = 0

	timer.scheduleFunction(function()
		trigger.action.outText("<< Status Report - Air Superiority Update >>\n\nGreat work out there! Our fighters are really putting a lot of pressure on the enemy's airspace! However, we have intel that they will be sending out their elite squadron soon!\n", 17) 
		trigger.action.outSound("TTI Soundfiles/Ace Combat 5 Mission Update Sound Effect.ogg" )
	end, nil, timer.getTime() + 6  )

	timer.scheduleFunction(function()
		a2a_hard_menu_start()
	end, nil, timer.getTime() + 23  )
	
end
end

function a2a_hard_start() --2 per group
	a2a_hard_started = true
	randomizeAirZone()
	currentEnemyAceSquadronCallsign = string.upper(enemySquadronCallsign[math.random(1,#enemySquadronCallsign)])
	strEnemySquadronCallsign = currentEnemyAceSquadronCallsign .." ".. tostring(math.random (1,9)) .. "-1"
	tti.debug("A2A Hard Callsign is: " .. strEnemySquadronCallsign, showBackupSpawnDebugText)
	
if mission_era == "modern" or mission_era == "cold_war" then
	_G[strEnemySquadronCallsign] = SPAWN:NewWithAlias( "A2A_Spawn_Init_Modern", strEnemySquadronCallsign )


	A2A_Hard_Spawn = _G[strEnemySquadronCallsign]:OnSpawnGroup(
	function( SpawnGroup )
		--A2A_Hard_Spawn_Group_Name = SpawnGroup:GetName()
	end)
	:InitRandomizeTemplate( TemplateTable_HARD )
	:InitRandomizeRoute( 1, 1, 20000 ) 		
	:SpawnInZone( currentAirZone, true, a2a_min_alt, a2a_max_alt )
	
	
	
--[[	
else
	A2A_Hard_Spawn = A2A_WW2:OnSpawnGroup(
	function( SpawnGroup )
		A2A_Hard_Spawn_Group_Name = A2A_Hard_Spawn:GetName()
	end)
	:SpawnInZone( currentAirZone, true, a2a_min_alt, a2a_max_alt )
--]]
end

	A2A_Hard_Spawn_Unit = A2A_Hard_Spawn:GetUnit(1)
	A2A_Hard_Spawn_Group_Name = A2A_Hard_Spawn:GetName()
	A2A_Hard_Spawn_Type_Name = A2A_Hard_Spawn_Unit:GetTypeName()
	a2aHardLaunchNotification(A2A_Hard_Spawn_Type_Name, A2A_Hard_Spawn_Group_Name)
	
	
	timer.scheduleFunction(function() 
	a2a_hard_alive_check()
	end, nil, timer.getTime() + 2 )

end


function a2a_hard_alive_check()
local aliveCheckFunction = timer.scheduleFunction(a2a_hard_alive_check, {}, timer.getTime() + 5) 
	Current_A2A_Hard_Group_Name = A2A_Hard_Spawn_Group_Name
	Current_A2A_Hard_Type_Name = A2A_Hard_Spawn_Type_Name
	
	--timer.scheduleFunction(function()
		if a2a_hard_started == true then
			env.info("TTI: A2A Hard Group: " .. Current_A2A_Hard_Group_Name .." status:")
			if A2A_Hard_Spawn:IsAlive() == true then
				env.info("TTI: A2A Hard Group: " .. Current_A2A_Hard_Group_Name .." is alive!")
			else
				env.info("TTI: A2A Hard Group: " .. Current_A2A_Hard_Group_Name .." is destroyed!")
				a2aHardDefeatedNotification(currentEnemyAceSquadronCallsign, Current_A2A_Hard_Type_Name)
				a2a_hard_started = false
				timer.removeFunction(aliveCheckFunction)
			end
		end
	--end, nil, timer.getTime() + 5 )

end

function a2a_all_start() --2 per group
	randomizeAirZone()
	if mission_era == "modern" or mission_era == "cold_war" then
	A2A_All_Spawn = A2A_ALL:SpawnInZone( currentAirZone, true, a2a_min_alt, a2a_max_alt )
	--A2A_All_Spawn = A2A_ALL:SpawnFromVec2( currentAirZone:GetVec2() )
	else
	A2A_All_Spawn = A2A_WW2:SpawnInZone( currentAirZone, true, a2a_min_alt, a2a_max_alt )
	end
end

function a2a_helo_start() --2 per group
	A2A_Helo_Spawn = A2A_Helo:SpawnInZone( CPS_HELO, true, 2100, 2200 )
end

-- X - direction in parallel to object heading
-- Y - altitude/elevation/height above ground
-- Z - direction perpenidcular to object heading.

 -- So -1000,200,500 should be 1000m behind, 200m above, and 500m to one side. 
--bombing add
function a2a_bombing_start()
	randomizeBombAirZone()
	--trigger.action.outText(tostring(currentBombAirZone), 60)
	if enable_airbase_bombers == true then
		for i=1, ground_bomber_amount do
		A2A_BOMBING_1 = A2A_BOMBING:SpawnInZone( currentBombAirZone, true, 8000, 8000 )
		A2A_BOMBING_1_VEC = A2A_BOMBING_1:GetPointVec3()
		A2A_BOMBING_1_ESCORT_VEC = A2A_BOMBING_1_VEC:AddX( 1000 ):AddY(200):AddZ( 400 ):GetVec3()
		end
	end
	
	if enable_carrier_bombers == true and env.mission.theatre ~= "Nevada" then
		for i=1, ship_bomber_amount do
		A2A_ANTISHIP_1 = A2A_ANTISHIP:SpawnInZone( currentBombAirZone, true, 8000, 8000 )
		A2A_ANTISHIP_1_VEC = A2A_ANTISHIP_1:GetPointVec3()
		A2A_ANTISHIP_1_ESCORT_VEC = A2A_ANTISHIP_1_VEC:AddX( 1000 ):AddY(200):AddZ( 400 ):GetVec3()
		end
	end
	
	if enable_airbase_bombers == true and enable_bomber_escorts == true then
		env.info("A2A_Bombing_Escort: " .. UTILS.OneLineSerialize(A2A_BOMBING_ESCORT))
		A2A_BOMBING_ESCORT_1 = A2A_BOMBING_ESCORT:SpawnFromVec3(A2A_BOMBING_1_ESCORT_VEC)
		A2A_BOMBING_ESCORT_1_PV3 = POINT_VEC3:New(-1000, 200, 500)
		A2A_BOMBING_ESCORT_1_TASK = A2A_BOMBING_ESCORT_1:TaskFollow(A2A_BOMBING_1, A2A_BOMBING_ESCORT_1_PV3:GetVec3())
		A2A_BOMBING_ESCORT_1:SetTask(A2A_BOMBING_ESCORT_1_TASK, 1)
	end
	
	if enable_carrier_bombers == true and enable_bomber_escorts == true and env.mission.theatre ~= "Nevada" then
		A2A_ANTISHIP_ESCORT_1 = A2A_ANTISHIP_ESCORT:SpawnFromVec3(A2A_ANTISHIP_1_ESCORT_VEC)
		A2A_ANTISHIP_ESCORT_1_PV3 = POINT_VEC3:New(-1000, 200, 500)
		A2A_ANTISHIP_ESCORT_1_TASK = A2A_ANTISHIP_ESCORT_1:TaskFollow(A2A_ANTISHIP_1, A2A_ANTISHIP_ESCORT_1_PV3:GetVec3())
		A2A_ANTISHIP_ESCORT_1:SetTask(A2A_ANTISHIP_ESCORT_1_TASK, 1)
	end
end

--bombing add
if a2a_autospawn_enable == true then
trigger.action.outText("A2A CAP auto-spawn is ENABLED to spawn every few minutes.\nThese settings are configurable in the MISSION SETTINGS VIA THE TRIGGER LIST. - Check tutorial text file for details.", 10)
end

if a2a_autospawn_enable == false then
trigger.action.outText("A2A CAP auto-spawn is DISABLED \nThese settings are configurable in the MISSION SETTINGS VIA THE TRIGGER LIST. - Check tutorial text file for details.", 10)
end

if a2a_intercept_autospawn_enable == true then
trigger.action.outText("Enemy Bombers auto-spawn is ENABLED to spawn every few minutes.\nThese settings are configurable in the MISSION SETTINGS VIA THE TRIGGER LIST. - Check tutorial text file for details.", 10)
end

if a2a_intercept_autospawn_enable == false then
trigger.action.outText("Enemy Bombers auto-spawn is DISABLED. to spawn every few minutes.\nThese settings are configurable in the MISSION SETTINGS VIA THE TRIGGER LIST. - Check tutorial text file for details.", 10)
end
--helo add
if a2a_helo_autospawn_enable == true then
trigger.action.outText("A2A Helo auto-spawn is ENABLED to spawn every few minutes.\nThese settings are configurable in the MISSION SETTINGS VIA THE TRIGGER LIST. - Check tutorial text file for details.", 10)
end

if a2a_helo_autospawn_enable == false then
trigger.action.outText("A2A Helo auto-spawn is DISABLED\nThese settings are configurable in the MISSION SETTINGS VIA THE TRIGGER LIST. - Check tutorial text file for details.", 10)
end

--[[
if allow_air_mission_stacking == true then
trigger.action.outText("Forced A2A Missions \"stacking\" is ENABLED.", 10)
else
trigger.action.outText("Forced A2A Missions \"stacking\" is DISABLED.", 10)
end
]]
--enable_a2a_kill_messages = true
--TTI MP RZ A2A Kill OutSounds

friendlySquadronCallsign = {
"Shark",
"Jackal",
"Pandion",
"Demon",
"Condor",
"Kestrel",
"Ghost",
"Bear",
"Ember",
"Inferno",
"Defender",
"Slayer",
"Dragon",
"Spiker",
"Blackwing",
"Darkwing",
"Shadow",
"Chaos",
"Nebula",
"Crimson",
"Vampire",
"Killer",
"Mobius",
"Scarface",
"Crow",
"Shield",
"Spectre",
"Hokage",
--IRL
"Royal",
"Stinger",
"Screaming Eagle",
"Trail Blazer",
"Red Devil",
"Gambler",
"Headhunter",
"Lobo",
"Vulture",
"Panther",
"Warhawk",
"Grim Reaper",
"Reaper",
"Valkyrie",
"Bull Dog",
"Skull",
"Ghost Rider",
"Star Warrior",
"Gray Wolf",
"Cougar",
"Yellowjacket",
"Rook",
"Gauntlet",
"Black Raven",
"Wizard",
"Viking",
"Scorpion",
--AC
"Spare",
"Strider",
"Razgriz",
--"Grabacr",
"Warwolf",
"Wardog",
"Garuda",
"Galm",
"Gault",
"Grun",
"Grendel",
--"Sol",
--"Strigon",
"Lancer",
--"Yellow",
"Gryphus",
"Varona",
"Lion",
"Avalanche",
}

enemySquadronCallsign = {
--"Shark",
--"Jackal",
--"Pandion",
--"Demon",
--"Condor",
--"Kestrel",
--"Ghost",
--"Bear",
--"Ember",
--"Inferno",
--"Defender",
--"Slayer",
--"Dragon",
--"Spiker",
--"Blackwing",
--"Darkwing",
--"Shadow",
--"Chaos",
--"Nebula",
--"Crimson",
--"Vampire",
--"Killer",
"Wrath",
"Wraith",
"Siren",
"Kraken",
"Megalith Defense",
"Heartless",
"Organization XII",
"Star Wolf",
"G.U.N.",
"Talon",
"Blackwatch",
"Edgelord",
"Cerberus",
"Hydra",
--"Incel",
"Uruk-Hai",
"Akatsuki",
--"Generic Evil",
"Principality of Zeon",
"Republic of Zeon",
"Zeon",
"OPA",
"Shinra",
"Syndicate",
"Umbrella Corp",
"Cobra Command",
"Decepticon",

--AC
--"Spare",
--"Strider",
--"Razgriz",
"Grabacr",
"Schnee",
--"Warwolf",
--"Wardog",
--"Garuda",
--"Galm",
--"Gault",
--"Grun",
--"Grendel",
"Sol",
"SOLG",
"Strigon",
--"Lancer",
"Yellow",
--"Gryphus",
--"Varona",
--"Lion",
}

playerAircraftKillCount = 0

function a2aHardLaunchNotification(planeType, currentEnemyAceSquadronCallsign)

--currentEnemyAceSquadronCallsign = enemySquadronCallsign[math.random(1,#enemySquadronCallsign)]
--currentEnemyAceSquadronCallsign = enemySquadronCallsign[math.random(1,#enemySquadronCallsign)]

local switch = math.random (1,8)
	if switch == 1 then
		trigger.action.outText( 
			"<< ++ Enemy Ace [" .. planeType .. "] Squadron Approaching ++ >>" ..
			"\n" ..
			"\n" .. string.upper(currentEnemyAceSquadronCallsign) .." SQUADRON PILOT:\n\"Eject while you can still talk!\"\n", 14)
		if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC04-EjectWhileYouCanStillTalk.ogg")
		elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	elseif switch == 2 then
		trigger.action.outText( 
			"<< ++ Enemy Ace [" .. planeType .. "] Squadron Approaching ++ >>" ..
			"\n" ..
			"\n" .. string.upper(currentEnemyAceSquadronCallsign) .." SQUADRON PILOT:\n\"Sweep them from our skies!\"\n", 14)
		if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC04-SweepThemFromOurSkies.ogg")
		elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	elseif switch == 3 then
		trigger.action.outText( 
			"<< ++ Enemy Ace [" .. planeType .. "] Squadron Approaching ++ >>" ..
			"\n" ..
			"\n" .. string.upper(currentEnemyAceSquadronCallsign) .." SQUADRON PILOT:\n\"Engage as a formation. No single-ship attacks.\"\n", 14)
			if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/AC04-EngageAsAFormationNoSingleShipAttacks.ogg")
				elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	elseif switch == 4 then
		trigger.action.outText( 
			"<< ++ Enemy Ace [" .. planeType .. "] Squadron Approaching ++ >>" ..
			"\n" ..
			"\n" .. string.upper(currentEnemyAceSquadronCallsign) .." SQUADRON PILOT:\n\"It's time for you to die!\"\n", 14)
			if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/AC5-ItsTimeForYouToDie.ogg")
						elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	elseif switch == 5 then
		trigger.action.outText( 
			"<< ++ Enemy Ace [" .. planeType .. "] Squadron Approaching ++ >>" ..
			"\n" ..
			"\n" .. string.upper(currentEnemyAceSquadronCallsign) .." SQUADRON PILOT:\n\"We will decide once and for all who is superior!\"\n", 14)
			if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/AC5-WeWillDecideOnceAndForAllWhoIsSuperior.ogg")
				elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	elseif switch == 6 then
		trigger.action.outText( 
			"<< ++ Enemy Ace [" .. planeType .. "] Squadron Approaching ++ >>" ..
			"\n" ..
			"\n" .. string.upper(currentEnemyAceSquadronCallsign) .." SQUADRON PILOT:\n\"It's over! Say your prayers!\"\n", 14)
			if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/AC5-ItsOverSayYourPrayers.ogg")
				elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	elseif switch == 7 then
		trigger.action.outText( 
			"<< ++ Enemy Ace [" .. planeType .. "] Squadron Approaching ++ >>" ..
			"\n" ..
			"\n" .. string.upper(currentEnemyAceSquadronCallsign) .." SQUADRON PILOT:\n\"I'm going to finish this now, once and for all!\"\n", 14)
			if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/AC5-ImGoingToFinishThisNowOnceAndForAll.ogg")
				elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	elseif switch == 8 then
		trigger.action.outText( 
			"<< ++ Enemy Ace [" .. planeType .. "] Squadron Approaching ++ >>" ..
			"\n" ..
			"\n" .. string.upper(currentEnemyAceSquadronCallsign) .." SQUADRON PILOT:\n\"Proceed as planned.\"\n", 14)
			if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/AC5-ProceedAsPlanned.ogg")
				elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	end
end

function a2aHardDefeatedNotification(groupCallsign, typeName)
	local switch = math.random (1,4)
	if switch == 1 then
		trigger.action.outText( "<< Enemy Ace [" .. typeName .. "] Squadron Status: >>\n++ \"" .. string.upper(groupCallsign) .. " SQUADRON\" destroyed! ++\n" ..
		"\n[MISSION ACCOMPLISHED]\n" ..
		"\n" .. string.upper(groupCallsign) .. " SQUADRON PILOT:\n\"We'll be back. You can count on it.\"\n", 14)
		if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/AC5-WellBeBackYouCanCountOnIt.ogg" )
						elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	elseif switch == 2 then
		trigger.action.outText( "<< Enemy Ace [" .. typeName .. "] Squadron Status: >>\n++ \"" .. string.upper(groupCallsign) .. " SQUADRON\" destroyed! ++\n" ..
		"\n[MISSION ACCOMPLISHED]\n" ..
		"\n" .. string.upper(groupCallsign) .. " SQUADRON PILOT:\n\"Our fate is sealed...\"\n", 14)
		if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/AC5-OurFateIsSealed.ogg" )
						elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	elseif switch == 3 then
		trigger.action.outText( "<< Enemy Ace [" .. typeName .. "] Squadron Status: >>\n++ \"" .. string.upper(groupCallsign) .. " SQUADRON\" destroyed! ++\n" ..
		"\n[MISSION ACCOMPLISHED]\n" ..
		"\n" .. string.upper(groupCallsign) .. " SQUADRON PILOT:\n\"Let them celebrate for now...\"\n", 14)
		if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/AC5-LetThemCelebrateForNow.ogg" )
						elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	elseif switch == 4 then
		trigger.action.outText( "<< Enemy Ace [" .. typeName .. "] Squadron Status: >>\n++ \"" .. string.upper(groupCallsign) .. " SQUADRON\" destroyed! ++\n" ..
		"\n[MISSION ACCOMPLISHED]\n" ..
		"\n" .. string.upper(groupCallsign) .. " SQUADRON PILOT:\n\"These guys are even better than I imagined!\"\n", 14)
		if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/AC5-TheseGuysAreEvenBetterThanIImagined.ogg" )
						elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	end
	
	timer.scheduleFunction(function()
		trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg" )
	end, nil, timer.getTime() + 3  )
	--playerAircraftKillCount = 0
end

function randomFriendlyCAPLaunchRequest()
local switch = math.random (1,3)
	if switch == 1 then
	trigger.action.outText("<< Requesting friendly CAP Reinforcements >>\nScramble additional fighters to the AO!",5)
	if voice_lines_audio == "enabled" then
	trigger.action.outSound("TTI Soundfiles/ScrambleAdditionalFightersToTheAO.ogg")
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
	elseif voice_lines_audio == "silent" then
	end
	elseif switch == 2 then
	trigger.action.outText("<< Requesting friendly CAP Reinforcements >>\nLaunch additional fighter aircraft!",5)
	if voice_lines_audio == "enabled" then
	trigger.action.outSound("TTI Soundfiles/LaunchAdditionalFighterAircraft.ogg")
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end
	elseif switch == 3 then
	trigger.action.outText("< Requesting friendly CAP Reinforcements >>\nWe need to reclaim air superiority!",5)
	if voice_lines_audio == "enabled" then
	trigger.action.outSound("TTI Soundfiles/WeNeedToReclaimAirSuperiority.ogg")
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end
end
end

function randomFriendlyLaunchNotification(planeType, location, strCallsign, delay)
timer.scheduleFunction(function()

	local switch = math.random (1,5)
		if switch == 1 then
			trigger.action.outText( 
				"<< Friendly CAP reinforcements inbound from ".. location .." >>" ..
				--"\n" ..
				"\n" .. strCallsign .. " [" .. planeType .. "]: Commencing attack.", 10)
					if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC0-CommencingAttack.ogg")
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end
		elseif switch == 2 then
			trigger.action.outText( 
				"<< Friendly CAP reinforcements inbound from ".. location .." >>" ..
				--"\n" ..
				"\n" .. strCallsign .. " [" .. planeType .. "]: Roger.", 10)
					if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC0-Roger.ogg")
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end
		elseif switch == 3 then
			trigger.action.outText( 
				"<< Friendly CAP reinforcements inbound from ".. location .." >>" ..
				--"\n" ..
				"\n" .. strCallsign .. " [" .. planeType .. "]: Roger. Commencing attack.", 10)
					if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC0-RogerCommencingAttack.ogg")
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end
		elseif switch == 4 then
			trigger.action.outText( 
				"<< Friendly CAP reinforcements inbound from ".. location .." >>" ..
				--"\n" ..
				"\n" .. strCallsign .. " [" .. planeType .. "]: Roger. We'll do our best!", 10)
					if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC0-RogerWellDoOurBest.ogg")
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end
		elseif switch == 5 then
			trigger.action.outText( 
				"<< Friendly CAP reinforcements inbound from ".. location .." >>" ..
				--"\n" ..
				"\n" .. strCallsign .. " [" .. planeType .. "]: Roger.", 10)
					if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC05-Roger.ogg")
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end
		end
		
		
end, nil, timer.getTime() + delay  )
end

--[[
function randomFriendlyLaunchNotification(planeType, location)

local switch = math.random (1,5)
	if switch == 1 then
		trigger.action.outText( 
			"<< Friendly CAP reinforcements inbound from ".. location .." >>" ..
			--"\n" ..
			"\n" .. string.upper(friendlySquadronCallsign[math.random(1,#friendlySquadronCallsign)]) .." ".. tostring(math.random (1,9)) .. "-1 [" .. planeType .. "]: Commencing attack.", 10)
		trigger.action.outSound("TTI Soundfiles/AC0-CommencingAttack.ogg")
	elseif switch == 2 then
		trigger.action.outText( 
			"<< Friendly CAP reinforcements inbound from ".. location .." >>" ..
			--"\n" ..
			"\n" .. string.upper(friendlySquadronCallsign[math.random(1,#friendlySquadronCallsign)]) .." ".. tostring(math.random (1,9)) .. "-1 [" .. planeType .. "]: Roger.", 10)
		trigger.action.outSound("TTI Soundfiles/AC0-Roger.ogg")
	elseif switch == 3 then
		trigger.action.outText( 
			"<< Friendly CAP reinforcements inbound from ".. location .." >>" ..
			--"\n" ..
			"\n" .. string.upper(friendlySquadronCallsign[math.random(1,#friendlySquadronCallsign)]) .." ".. tostring(math.random (1,9)) .. "-1 [" .. planeType .. "]: Roger. Commencing attack.", 10)
		trigger.action.outSound("TTI Soundfiles/AC0-RogerCommencingAttack.ogg")
	elseif switch == 4 then
		trigger.action.outText( 
			"<< Friendly CAP reinforcements inbound from ".. location .." >>" ..
			--"\n" ..
			"\n" .. string.upper(friendlySquadronCallsign[math.random(1,#friendlySquadronCallsign)]) .." ".. tostring(math.random (1,9)) .. "-1 [" .. planeType .. "]: Roger. We'll do our best!", 10)
		trigger.action.outSound("TTI Soundfiles/AC0-RogerWellDoOurBest.ogg")
	elseif switch == 5 then
		trigger.action.outText( 
			"<< Friendly CAP reinforcements inbound from ".. location .." >>" ..
			--"\n" ..
			"\n" .. string.upper(friendlySquadronCallsign[math.random(1,#friendlySquadronCallsign)]) .." ".. tostring(math.random (1,9)) .. "-1 [" .. planeType .. "]: Roger.", 10)
		trigger.action.outSound("TTI Soundfiles/AC05-Roger.ogg")
	end
end
--]]

tti.a2a = {}

tti.a2a.friendlyBackupLaunchSound = {
"TTI Soundfiles/AC0-CommencingAttack.ogg", 
"TTI Soundfiles/AC0-Roger.ogg", 
"TTI Soundfiles/AC0-RogerCommencingAttack.ogg", 
"TTI Soundfiles/AC0-RogerWellDoOurBest.ogg", 
"TTI Soundfiles/AC05-Roger.ogg", 
}

tti.a2a.killMSG = {
"Hostile is going down. Good kill, ",
"Good Kill! Good kill, ",
"Target hit. Nice shot, ",
"Contact vanished. Good kill, ",
"Kill confirmed! Nice work, "
}

tti.a2a.killSound = { 
"TTI Soundfiles/Kill 1.ogg",
"TTI Soundfiles/Kill 3.ogg",
"TTI Soundfiles/Kill 4.ogg", 
"TTI Soundfiles/Kill 5.ogg",
"TTI Soundfiles/Kill 6.ogg",
"TTI Soundfiles/Kill 7.ogg",
"TTI Soundfiles/Good hit.ogg",
"TTI Soundfiles/One splash one splash.ogg",
"TTI Soundfiles/That's a confirmed kill!.ogg", 
"TTI Soundfiles/BF3-Direct Hit He's Going Down.ogg", 
"TTI Soundfiles/BF3-Good Kill 1.ogg", 
"TTI Soundfiles/BF3-Good Kill 2.ogg", 
"TTI Soundfiles/BF3-Good Kill He's Going Down.ogg", 
"TTI Soundfiles/BF3-Good Kill Splash One.ogg", 
"TTI Soundfiles/BF3-Splash One.ogg", 
"TTI Soundfiles/AC0-Bandit is down.ogg", 
"TTI Soundfiles/AC0-We've got a kill.ogg", 
"TTI Soundfiles/AC0-Splash One.ogg", 
"TTI Soundfiles/AC04-EnemyCraftTotalled.ogg", 
"TTI Soundfiles/AC0-NiceKill.ogg", 
"TTI Soundfiles/JFA-EatHotLead.ogg", 
"TTI Soundfiles/JFA-GoodKill.ogg", 
"TTI Soundfiles/JFA-HesBreakingUp.ogg", 
"TTI Soundfiles/JFA-SplashOne.ogg", 
"TTI Soundfiles/JFA-SplashOneBandit1.ogg", 
"TTI Soundfiles/JFA-SplashOneBandit2.ogg", 
}

tti.a2a.killFriendlySound  = {
"TTI Soundfiles/AC0-Hold your Fire were your allies.ogg",
"TTI Soundfiles/AC4-Friendly Fire.ogg",
"TTI Soundfiles/AC4-Hold your Fire Friendly.ogg",
"TTI Soundfiles/AC4-Cease Fire Friendly.ogg",
"TTI Soundfiles/AC05-WhatAreYouDoingNuggets.ogg",
}

tti.a2a.friendlyKilledSound = {
"TTI Soundfiles/AC04-ImHitEjecting.ogg",
"TTI Soundfiles/AC04-Eject.ogg",
"TTI Soundfiles/AC04-OneOfOursWentDown.ogg",
"TTI Soundfiles/AC04-DamnThatWasOneOfOurs.ogg",
"TTI Soundfiles/AC05-ImHitEject.ogg",
"TTI Soundfiles/AC5-DamnItsNoUseImHit.ogg",
}

function delayedFriendlyAircraftKilledMessageToAll(iniGroup, tgtUnit, weapon, msgDisplayTime, delayedTime)
	a2aKillFeedMessageIsPlaying = true
	local switch = math.random (1,6)
	
	timer.scheduleFunction(function()
	
		if switch == 1 then
			trigger.action.outText( 
			"<< Friendly AI was shot down by an enemy [" .. iniGroup .."] with [".. weapon .."] >>" ..
			"\n" ..
			"\n [BLUE " .. tgtUnit .. " pilot]: I'm hit! Ejecting!", msgDisplayTime)	
				if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC04-ImHitEjecting.ogg")	
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end			
		elseif switch == 2 then
			trigger.action.outText( 
			"<< Friendly AI was shot down by an enemy [" .. iniGroup .."] with [".. weapon .."] >>" ..
			"\n" ..
			"\n [BLUE " .. tgtUnit .. " pilot]: Eject!", msgDisplayTime)
	if voice_lines_audio == "enabled" then			
			trigger.action.outSound("TTI Soundfiles/AC04-Eject.ogg")	
										elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end
		elseif switch == 3 then
			trigger.action.outText( 
			"<< Friendly AI was shot down by an enemy [" .. iniGroup .."] with [".. weapon .."] >>" ..
			"\n" ..
			"\n [BLUE] " .. tgtUnit .. " destroyed! - One of ours went down!", msgDisplayTime)	
				if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC04-OneOfOursWentDown.ogg")
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end			
		elseif switch == 4 then		
			trigger.action.outText( 
			"<< Friendly AI was shot down by an enemy [" .. iniGroup .."] with [".. weapon .."] >>" ..
			"\n" ..
			"\n [BLUE] " .. tgtUnit .. " destroyed! - Damn! That was one of ours!", msgDisplayTime)	
				if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC04-DamnThatWasOneOfOurs.ogg")	
										elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end
		elseif switch == 5 then		
			trigger.action.outText( 
			"<< Friendly AI was shot down by an enemy [" .. iniGroup .."] with [".. weapon .."] >>" ..
			"\n" ..
			"\n [BLUE " .. tgtUnit .. " pilot]: I'm hit! Eject!", msgDisplayTime)	
				if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC05-ImHitEject.ogg")	
										elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end
		elseif switch == 6 then		
			trigger.action.outText( 
			"<< Friendly AI was shot down by an enemy [" .. iniGroup .."] with [".. weapon .."] >>" ..
			"\n" ..
			"\n [BLUE " .. tgtUnit .. " pilot]: Damn! It's no use, I'm hit!", msgDisplayTime)	
				if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC5-DamnItsNoUseImHit.ogg")			
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end			
		end
	
	end, nil, timer.getTime() + delayedTime  )
end




--enable_player_global_killfeed = true
--enable_global_killfeed_sound = true

a2aKillFeedMessageCooldownTime = 10
a2aKillFeedKillMessageDelay = 2
killFeedCoolDownTime = 10
killFeedDisplayDelayTime = 10

function delayedA2aKillMessageToGroup(iniGroup, tgtUnit, msg, msgDisplayTime, snd, delayedTime)
a2aMessageIsPlaying = true
	timer.scheduleFunction(function()
		trigger.action.outTextForGroup(iniGroup, msg, msgDisplayTime)
		if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, snd)
		elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSoundForGroup(iniGroup, tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
		tti.debug("A2A message is cooled down and will play a sound/message.")
		--trigger.action.outText("A2G message is cooled down and will play a sound/message.", 5)
	end, nil, timer.getTime() + delayedTime  )
end

a2aMessageCooldownTime = 10
a2aKillMessageDelay = 2

function delayedA2aKillMessageToAll(killFeedA2aMsg, killFeedA2aMsgDisplayTime, delayedTime, killFeedA2aSoundName)
a2aKillFeedMessageIsPlaying = true
	timer.scheduleFunction(function()
		trigger.action.outText(killFeedA2aMsg, killFeedA2aMsgDisplayTime)
		if enable_global_killfeed_sound == true then
			trigger.action.outSound(killFeedA2aSoundName)
		elseif enable_global_killfeed_sound == true and killFeedA2aSoundName == nil then
			trigger.action.outSound("TTI Soundfiles/AC6-AWACS Alert 1.ogg")
		end
		tti.debug("A2A killfeed message is cooled down and will play a sound/message.")

	end, nil, timer.getTime() + delayedTime  )
end

tti.a2a.eventHandlerKill = EVENTHANDLER:New() --Create Global EventHandler
world.addEventHandler(tti.a2a.eventHandlerKill) -- Subscribe to World Events.

tti.a2a.eventHandlerHit = EVENTHANDLER:New() --Create Global EventHandler
world.addEventHandler(tti.a2a.eventHandlerHit) -- Subscribe to World Events.

function tti.a2a.eventHandlerKill:onEvent(EventData) -- Parse World Events function.
	if EventData.id == world.event.S_EVENT_KILL then
		--a2a_hard_alive_check()
		--tti.serialize(EventData, "EventDataForKill")
		local tgtUnit = EventData.target or EventData.TgtDCSUnit
		local tgtUnitTypeName = tgtUnit:getTypeName()
		local tgtUnitGroup = tgtUnit:getGroup()
		local tgtUnitGroupName = tgtUnit:getName()
		local tgtUnitDesc = tgtUnit:getDesc()
		
		local iniUnit = EventData.initiator or EventData.IniDCSUnit
		local iniUnitTypeName = iniUnit:getTypeName()
		local iniUnitGroup = iniUnit:getGroup()
		local iniUnitGroupName = iniUnitGroup:getName()
		local iniUnitDesc = iniUnit:getDesc()
		
		local weapon = EventData.weapon_name or EventData.WeaponName
		
		--if tgtUnitDesc.attributes then
		if tgtUnitDesc ~= nil then
			--if tgtUnitDesc.attributes.Air == true then -- for air units
			if tgtUnit:hasAttribute("Planes") == true or tgtUnit:hasAttribute("Helicopters") == true then
				if iniUnit:getCoalition() == 2 and tgtUnit:getCoalition() == 1 then -- if shooter is blue, target is red, and if option enabled.
				success, err  = pcall( 
					function()
						tti.debug("**************** A2A Kill Event Handling: " .. iniUnitGroupName .. "(" .. iniUnitTypeName .. ")" .. " killed " .. tgtUnitTypeName .. "(" ..  tgtUnitGroupName .. ")" .. " with " .. weapon .. " ****************")
						if iniUnit:getPlayerName() then
								playerAircraftKillCount = playerAircraftKillCount + 1
								tti.debug("Current Player A2A Kill Count is: " .. playerAircraftKillCount)
								if playerAircraftKillCount == a2aHardKillCountThreshold and spawn_a2a_hard_on_kill_count == true then
									a2a_hard_start_kill_count()
								end
							local killerID = iniUnit:getGroup():getID()
							tti.debug(iniUnit:getPlayerName() .. " killed " .. tgtUnitTypeName)
									if a2aKillFeedMessageIsPlaying ~= true then
										if enable_player_global_killfeed == true and enable_a2a_kill_messages == true then
											delayedA2aKillMessageToAll("[BLUE] " .. iniUnitTypeName .. " (" .. iniUnit:getPlayerName() ..") ► ["..  weapon .."] ► [RED] " .. tgtUnitTypeName, 8, killFeedDisplayDelayTime, "TTI Soundfiles/AC6-AWACS Alert 1.ogg")
										end
									end
									timer.scheduleFunction(function()
										if a2aKillFeedMessageIsPlaying == true then
											a2aKillFeedMessageIsPlaying = false
											tti.debug("A2A kill field message cool down finished...")
											--trigger.action.outText("A2A message cool down finished...",5)
										end
									end, nil, timer.getTime() + killFeedCoolDownTime  )
									
									if a2aMessageIsPlaying ~= true and enable_a2a_kill_messages == true then
										 delayedA2aKillMessageToGroup(killerID, tgtUnitTypeName, "Enemy [" .. tgtUnitTypeName.. "] destroyed! - " .. tti.a2a.killMSG[math.random(1,#tti.a2a.killMSG)] .. iniUnit:getPlayerName() .. "!", 10, tti.a2a.killSound[math.random(1,#tti.a2a.killSound)], a2aKillMessageDelay)

										else
										tti.debug("A2A message is NOT cooled down and will NOT play a sound/message.")
										--trigger.action.outText("A2A message is NOT cooled down and will NOT play a sound/message.", 5)
									end
								timer.scheduleFunction(function()
									if a2aMessageIsPlaying == true then
										a2aMessageIsPlaying = false
										tti.debug("A2A message cool down finished...")
										--trigger.action.outText("A2A message cool down finished...",5)
									end
								end, nil, timer.getTime() + a2aMessageCooldownTime  )
						end	
					end
				)
				elseif iniUnit:getCoalition() == 1 and tgtUnit:getCoalition() == 2 and enable_a2a_kill_messages == true then -- friendly AI aircraft dying.
				success, err  = pcall( 
					function()
						tti.debug("**************** A2A Kill Event Handling: " .. iniUnitGroupName .. "(" .. iniUnitTypeName .. ")" .. " killed " .. tgtUnitTypeName .. "(" ..  tgtUnitGroupName .. ")" .. " with " .. weapon .. " ****************")
						if not tgtUnit:getPlayerName() then
							local killerID = iniUnit:getGroup():getID()
							tti.debug(iniUnitTypeName .. " killed " .. tgtUnitTypeName)
									if a2aKillFeedMessageIsPlaying ~= true then
										if enable_ai_global_killfeed == true then
											--delayedA2aKillMessageToAll("Friendly AI Aircraft Shot down!\n\n[RED] " .. iniUnitTypeName .. " ► ["..  weapon .."] ► [BLUE AI] " .. tgtUnitTypeName, 3, killFeedDisplayDelayTime, tti.a2a.friendlyKilledSound[math.random(1,#tti.a2a.friendlyKilledSound)])
											delayedFriendlyAircraftKilledMessageToAll(iniUnitTypeName, tgtUnitTypeName, weapon, killFeedDisplayDelayTime, 3)
										end
									end
									timer.scheduleFunction(function()
										if a2aKillFeedMessageIsPlaying == true then
											a2aKillFeedMessageIsPlaying = false
											tti.debug("A2A kill field message cool down finished...")
											--trigger.action.outText("A2A message cool down finished...",5)
										end
									end, nil, timer.getTime() + killFeedCoolDownTime  )
									
									if a2aMessageIsPlaying ~= true then
										 --delayedA2aKillMessageToGroup(killerID, tgtUnitTypeName, "Enemy [" .. tgtUnitTypeName.. "] destroyed! - " .. tti.a2a.killMSG[math.random(1,#tti.a2a.killMSG)] .. iniUnit:getPlayerName() .. "!", 10, tti.a2a.killSound[math.random(1,#tti.a2a.killSound)], a2aKillMessageDelay)

										else
										tti.debug("A2A message is NOT cooled down and will NOT play a sound/message.")
										--trigger.action.outText("A2A message is NOT cooled down and will NOT play a sound/message.", 5)
									end
								timer.scheduleFunction(function()
									if a2aMessageIsPlaying == true then
										a2aMessageIsPlaying = false
										tti.debug("A2A message cool down finished...")
										--trigger.action.outText("A2A message cool down finished...",5)
									end
								end, nil, timer.getTime() + a2aMessageCooldownTime  )
						end	
					end
				)
			elseif iniUnit:getCoalition() == 2 and tgtUnit:getCoalition() == 2 and enable_a2a_kill_messages == true then -- friendly AI aircraft dying.
				success, err  = pcall( 
					function()
						tti.debug("**************** A2A Kill Event Handling: " .. iniUnitGroupName .. "(" .. iniUnitTypeName .. ")" .. " killed " .. tgtUnitTypeName .. "(" ..  tgtUnitGroupName .. ")" .. " with " .. weapon .. " ****************")
							if iniUnit:getPlayerName() then
						local killerID = iniUnit:getGroup():getID()
						tti.debug(iniUnit:getPlayerName() .. " killed " .. tgtUnitTypeName)
								if a2aMessageIsPlaying ~= true then
									delayedA2aKillMessageToGroup(killerID, tgtUnitTypeName, "Cease fire " .. iniUnit:getPlayerName() .. "! Friendly fire on [BLUE " .. tgtUnitTypeName.. "] with [".. weapon .."]", 10, tti.a2a.killFriendlySound[math.random(1,#tti.a2a.killFriendlySound)], 1)
									else
									tti.debug("A2A message is NOT cooled down and will NOT play a sound/message.")
									--trigger.action.outText("A2A message is NOT cooled down and will NOT play a sound/message.", 5)
								end
							timer.scheduleFunction(function()
								if a2aMessageIsPlaying == true then
									a2aMessageIsPlaying = false
									tti.debug("A2A message cool down finished...")
									--trigger.action.outText("A2A message cool down finished...",5)
								end
							end, nil, timer.getTime() + a2aMessageCooldownTime  )
					end	
					end
				)
				end
			end
						
			if err then 
				tti.debug("Problem with getting the group!" .. err)
			end
		end
	end
		
end

--[[
-- FOR S_EVENT_HIT
function tti.a2a.eventHandlerHit:onEvent(EventData)
if EventData.id == world.event.S_EVENT_HIT then
	success, err  = pcall( 
		function()
	--tti.serialize(EventData, "EventDataForKill")
		local tgtUnit = EventData.target or EventData.TgtDCSUnit
		local tgtUnitTypeName = tgtUnit:getTypeName()
		local tgtUnitGroup = tgtUnit:getGroup()
		local tgtUnitGroupName = tgtUnit:getName()
		local tgtUnitDesc = tgtUnit:getDesc()
		
		local iniUnit = EventData.initiator or EventData.IniDCSUnit
		local iniUnitTypeName = iniUnit:getTypeName()
		local iniUnitGroup = iniUnit:getGroup()
		local iniUnitGroupName = iniUnitGroup:getName()
		local iniUnitDesc = iniUnit:getDesc()
		
		local weapon = EventData.weapon_name or EventData.WeaponName
		end
	)
	
	--if tgtUnitDesc.attributes then
	if tgtUnitDesc ~= nil then
		--if tgtUnitDesc.attributes.Air == true then -- for air units
		--if tgtUnit:hasAttribute("Planes") == true or tgtUnit:hasAttribute("Helicopters") == true then
			if iniUnit:getCoalition() == 2 and tgtUnit:getCoalition() == 2 and enable_a2a_kill_messages == true then -- if shooter is blue, target is red, and if option enabled.
			success, err  = pcall( 
				function()
					tti.debug("**************** A2A Hit Event Handling: " .. iniUnitGroupName .. "(" .. iniUnitTypeName .. ")" .. " hit " .. tgtUnitTypeName .. "(" ..  tgtUnitGroupName .. ")" .. " with " .. weapon .. " ****************")
					if iniUnit:getPlayerName() then
						local killerID = iniUnit:getGroup():getID()
						tti.debug(iniUnit:getPlayerName() .. " hit " .. tgtUnitTypeName)
								if a2aMessageIsPlaying ~= true then
									delayedA2aKillMessageToGroup(killerID, tgtUnitTypeName, "Cease fire " .. iniUnit:getPlayerName() .. "! Friendly fire on [BLUE " .. tgtUnitTypeName.. "] with [".. weapon .."]", 10, tti.a2a.killFriendlySound[math.random(1,#tti.a2a.killFriendlySound)], 1)
									else
									tti.debug("A2A message is NOT cooled down and will NOT play a sound/message.")
									--trigger.action.outText("A2A message is NOT cooled down and will NOT play a sound/message.", 5)
								end
							timer.scheduleFunction(function()
								if a2aMessageIsPlaying == true then
									a2aMessageIsPlaying = false
									tti.debug("A2A message cool down finished...")
									--trigger.action.outText("A2A message cool down finished...",5)
								end
							end, nil, timer.getTime() + a2aMessageCooldownTime  )
					end	
				end
							)
			end
		--end
	end
end
end--]]

local function getGroupCategory(unit)
	local unitDB = mist.DBs.unitsById[tonumber(unit:getID())]
	 if unitDB ~= nil and unitDB.category then
        return unitDB.category
    end

    return nil
end

--------------------- AIR CLEAN UP SCRIPTS

--Cleanup landed RED AIR
local function cleanupLandedRed(event)
	if( event.id == world.event.S_EVENT_LAND and event.initiator) then
		local landedUnit = event.initiator
		local landedGroup = Unit.getGroup(landedUnit)
			if(Unit.getPlayerName(landedUnit) == nil) and landedUnit:getCoalition() == 1 then
				landedGroup:destroy()
				env.info("TTI: Cleaned up landed RED AIR")
			end
	end
end
mist.addEventHandler(cleanupLandedRed)

-- Cleanup landed BLUE AI AIR FIXED WING, NON RAT
local function cleanupLandedBlueFixedWing(event) -- this has a specific function to clean up landed blue PLANES that are NOT RAT (named group) planes. 
--:hasAttribute("Helicopters") == true --- Use this another time
	if( event.id == world.event.S_EVENT_LAND and event.initiator) then
		local timeToDeleteLandedGroup = 180
		local landedUnit = event.initiator
		local landedUnitCategory = getGroupCategory(landedUnit)
		local landedGroup = Unit.getGroup(landedUnit)
		local landedGroupName = landedGroup:getName()
			if(Unit.getPlayerName(landedUnit) == nil) and landedUnit:getCoalition() == 2 and landedUnitCategory == "plane" then
				if landedGroupName:find("RAT") then
					tti.debug("Landed ["..landedUnitCategory .."] group name contained \"RAT\": " .. landedGroupName .. " - Group will NOT be removed since RAT script handles deletion of RAT planes.")
				else
					tti.debug("Will clean up landed AI BLUE AIR FIXED WING GROUP: " .. landedGroupName .. " in " .. timeToDeleteLandedGroup .. " seconds.")
					timer.scheduleFunction(function()
						landedGroup:destroy()
						tti.debug("Cleaned up landed AI BLUE AIR FIXED WING GROUP: " .. landedGroupName .. " \nCategory: " .. landedUnitCategory)
					end, nil, timer.getTime() + timeToDeleteLandedGroup  )
				end
			end
	end
end
mist.addEventHandler(cleanupLandedBlueFixedWing)
	
env.info('Deadly AIR scripting complete')
tti_air_missions_script_loaded = true