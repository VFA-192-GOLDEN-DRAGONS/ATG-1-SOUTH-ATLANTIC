--[[
	Early Warning Radar Script - 1.5.3 - 07/11/2016
	
	Allows use of units with radars to provide Bearing Range and Altitude information via text display to player aircraft
	
	Features:
		- Uses in-game radar information to detect targets so terrain masking, beaming, low altitude flying, etc is effective for avoiding detection
		- Dynamic. If valid units with radar are created during a mission (eg. via chopper with CTLD), they will be added to the EWRS radar network
		- Can allow / disable BRA messages to fighters or sides
		- Uses player aircraft or mission bullseye for BRA reference, can be changed via F10 radio menu or restricted to one reference in the script settings
		- Can switch between imperial (feet, knots, NM) or metric (meters, km/h, km) measurements using F10 radio menu
		- Ability to change the message display time and automated update interval
		- Can choose to disable automated messages and allow players to request BRA from F10 menu
		- Can allow players to request Bogey Dope at any time through F10 radio menu

	Built and Tested in DCS 1.5 - See https://github.com/Bob7heBuilder/EWRS for the latest version

	This script uses MIST 4.0.57 or later - https://github.com/mrSkortch/MissionScriptingTools
		
	At the moment, because of limitations within DCS to not show messages to individual units, the reference, measurements, and messages
	are done per group. So a group of 4 fighters will each receive 4 BRA messages. Each message however, will have the player's name
	in it, that its refering to. Its unfortunate, but nothing I can do about it.

	Changes:
	- 1.3 - Added Option to allow picture report to be requested thru F10 menu instead of an automated display
			- Fixed bug where a known unit type would sometimes still display as ???
	- 1.4 - Added setting to be able to limit the amount of threats displayed in a picture report
			- Added option to enable Bogey Dopes
				* Mission designer can turn on / off in script settings
				* Pilots can request thru the F10 menu and it will show the BRA to the nearest hostile aircraft that has
				been detected. It will always reference the requesting pilot's own aircraft.
			- Finally implemented a cleaner workaround for some ground units being detected and listed in picture report
	- 1.4.1 - Added some ships to search radar list, you will need to remove the comment markers (--) at the start of the line to activate
	- 1.5 - Added ability to request picture of friendly aircraft positions referencing your own aircraft - Mission designer chooses if this feature is active or not
	- 1.5.1 - Added Gazelle to acCategories
	- 1.5.2 - Added F5E to acCategories
	- 1.5.3 - Fixed bug with maxThreatDisplay set at 0 not displaying any threats
			- Added Mistral Gazelle
			- Added C-101CC
]]

ewrs = {} --DO NOT REMOVE
ewrs.HELO = 1
ewrs.ATTACK = 2
ewrs.FIGHTER = 3

----SCRIPT OPTIONS----

ewrs.messageUpdateInterval = 50 --How often EWRS will update automated BRA messages (seconds)
ewrs.messageDisplayTime = 28 --How long EWRS BRA messages will show for (seconds)
ewrs.restrictToOneReference = false -- Disables the ability to change the BRA calls from pilot's own aircraft or bullseye. If this is true, set ewrs.defaultReference to the option you want to restrict to.
ewrs.defaultReference = "self" --The default reference for BRA calls - can be changed via f10 radio menu if ewrs.restrictToOneReference is false (self or bulls)
ewrs.defaultMeasurements = "imperial" --Default measurement units - can be changed via f10 radio menu (imperial or metric)
ewrs.disableFightersBRA = false -- disables BRA messages to fighters when true
ewrs.enableRedTeam = true -- enables / disables EWRS for the red team
ewrs.enableBlueTeam = true -- enables / disables EWRS for the blue team
ewrs.disableMessageWhenNoThreats = true -- disables message when no threats are detected - Thanks Rivvern - NOTE: If using ewrs.onDemand = true, this has no effect
ewrs.useImprovedDetectionLogic = false --this makes the messages more realistic. If the radar doesn't know the type or distance to the detected threat, it will be reflected in the picture report / BRA message
ewrs.onDemand = false --Setting to true will disable the automated messages to everyone and will add an F10 menu to get picture / BRA message.
ewrs.maxThreatDisplay = 4 -- Max amounts of threats to display on picture report (0 will display all)
ewrs.allowBogeyDope = true -- Allows pilots to request a bogey dope even with the automated messages running. It will display only the cloest threat, and will always reference the players own aircraft.
ewrs.allowFriendlyPicture = true -- Allows pilots to request picture of friendly aircraft
ewrs.maxFriendlyDisplay = 2-- Limits the amount of friendly aircraft shown on friendly picture

--[[
Units with radar to use as part of the EWRS radar network
If you want to shorten the range of SAM radar detection, use their track radars instead of their search radars
NOTE that track radars require a search radar to detect targets (but the search radars do not need to be included in the list)
I haven't tested detection with ships (that have radar), but should work.
]]
ewrs.validSearchRadars = {
-- "p-10 s125 sr",				--SA-3 Search Radar
-- "Kub 1S91 str",				--SA-6 Search and Track Radar
-- "S-300PS 64H6E sr",			--SA-10 Search Radar
-- "S-300 PS 40B6MD sr",		--SA-10 Search Radar
-- "SA-11 Buk SR 9518M1",	--SA-11 Search Radar
-- "55G6 EWR",					--Early Warning Radar
-- "1L13 EWR",					--Early Warning Radar
-- "A-50",							--AWACS
"E-2D",							--AWACS
"E-2C",							--AWACS
"E-3A",							--AWACS
-- "Roland Radar",				--Roland Search Radar
-- "Hawk sr",						--Hawk SAM Search Radar
"Patriot str",					--Patriot SAM Search and Track Radar
"FPS-117",
"FPS-117 Dome",
--Ships - I've left these commented out because I don't know which ones have radar
--and which ones don't. Just remove the comment to activate them (the '--' at the start of the line)

--"MOSCOW",				-- CG 1164 Moskva
--"TICONDEROG",			-- CG-60 Normandy
--"PIOTR",				-- CGN 1144.2 Pyotr Velikiy
--"KUZNECOW",			-- CV 1143.5 Admiral Kuzentsov
--"VINSON",				-- CVN-70 Carl Vinson
--"REZKY",				-- FF 1135M Rezky
--"NEUSTRASH",			-- FFG 11540 Neustrashimy
--"PERRY",				-- FFG-7CL Oliver Hazzard Perry
--"ALBATROS",			-- FFL 1124.4 Grisha
--"MOLNIYA",			-- FSG 1241.1MP Molniya
}

--[[
Aircraft Type ENUMs
This is used to restrict BRA messages to fighters
Change the ewrs.TYPE for each aircraft (in ewrs.acCategories) to suit your needs
For now, BRA will be displayed to everyone unless ewrs.disableFightersBRA is true.
When this is true, anything in the list below that == ewrs.FIGHTER will NOT receive BRA messages
]]
ewrs.acCategories = { --Have I left anything out? Please let me know if I have
[ "A-10A"          ] = ewrs.ATTACK  ,
[ "A-10C"          ] = ewrs.ATTACK  ,
[ "Bf-109K-4"      ] = ewrs.ATTACK  ,
[ "C-101EB"        ] = ewrs.ATTACK  ,
[ "C-101CC"		   ] = ewrs.ATTACK  ,
[ "F-15C"          ] = ewrs.FIGHTER ,
[ "F-5E-3"		   ] = ewrs.ATTACK	,
[ "FW-190D9"       ] = ewrs.ATTACK  ,
[ "F-86F Sabre"	   ] = ewrs.FIGHTER ,
[ "Hawk"           ] = ewrs.ATTACK  ,
[ "Ka-50"          ] = ewrs.HELO    ,
[ "L-39C"		   ] = ewrs.ATTACK	,
[ "L-39ZA"         ] = ewrs.ATTACK  ,
[ "Mi-8MT"         ] = ewrs.HELO    ,
[ "Mi-24P"         ] = ewrs.HELO    ,
[ "MiG-15bis"      ] = ewrs.ATTACK  ,
[ "MiG-21Bis"      ] = ewrs.ATTACK  ,
[ "MiG-29A"		   ] = ewrs.FIGHTER	,
[ "MiG-29S"		   ] = ewrs.FIGHTER	,
[ "M-2000C"		   ] = ewrs.FIGHTER	,
[ "P-51D"          ] = ewrs.ATTACK	,
[ "SA342M"		   ] = ewrs.HELO	,
[ "SA342L"		   ] = ewrs.HELO	,
[ "SA342Mistral"   ] = ewrs.HELO	,
[ "SA342Minigun"   ] = ewrs.HELO	,
[ "Su-25"          ] = ewrs.ATTACK	,
[ "Su-25T"         ] = ewrs.ATTACK	,
[ "Su-27"          ] = ewrs.FIGHTER	,
[ "Su-33"		   ] = ewrs.FIGHTER ,
[ "TF-51D"         ] = ewrs.ATTACK	,
[ "UH-1H"          ] = ewrs.HELO	,
}

----END OF SCRIPT OPTIONS----


----INTERNAL FUNCTIONS ***** Be Careful changing things below here ***** ----


function ewrs.getDistance(obj1PosX, obj1PosZ, obj2PosX, obj2PosZ)
	local xDiff = obj1PosX - obj2PosX
	local yDiff = obj1PosZ - obj2PosZ
	return math.sqrt(xDiff * xDiff + yDiff * yDiff) -- meters
end

function ewrs.getBearing(obj1PosX, obj1PosZ, obj2PosX, obj2PosZ)
    local bearing = math.atan2(obj2PosZ - obj1PosZ, obj2PosX - obj1PosX)
    if bearing < 0 then
        bearing = bearing + 2 * math.pi
    end
    bearing = bearing * 180 / math.pi
    return bearing    -- degrees
end

function ewrs.getHeading(vec)
    local heading = math.atan2(vec.z,vec.x)
    if heading < 0 then
        heading = heading + 2 * math.pi
    end
    heading = heading * 180 / math.pi
    return heading -- degrees
end

function ewrs.getSpeed(velocity)
	local speed = math.sqrt(velocity.x^2 + velocity.y^2 + velocity.z^2) --m/s
	return speed -- m/s
end

function ewrs.update()
	timer.scheduleFunction(ewrs.update, nil, timer.getTime() + 5)
	ewrs.buildActivePlayers()
	ewrs.buildF10Menu()
	ewrs.buildmissionmenu()
	--if supercarrier_enabled == true then
	--ewrs.supercarriermissionmenu()
	--end
end

function ewrs.buildThreatTable(activePlayer, bogeyDope)
	local function sortRanges(v1,v2)
		return v1.range < v2.range
	end

	local targets = {}
	if activePlayer.side == 2 then
		targets = ewrs.currentlyDetectedRedUnits
	else
		targets = ewrs.currentlyDetectedBlueUnits
	end
	
	local bogeyDope = bogeyDope or false
	local referenceX
	local referenceZ
	if ewrs.groupSettings[tostring(activePlayer.groupID)].reference == "self" or bogeyDope then
		local _self = Unit.getByName(activePlayer.unitname)
		local selfpos = _self:getPosition()
		referenceX = selfpos.p.x
		referenceZ = selfpos.p.z
	else
		local bullseye = coalition.getMainRefPoint(activePlayer.side)
		referenceX = bullseye.x
		referenceZ = bullseye.z
	end
	
	local threatTable = {}
	
	for k,v in pairs(targets) do
		local velocity = v["object"]:getVelocity()
		local bogeypos = v["object"]:getPosition()
		local bogeyType = nil
		if ewrs.useImprovedDetectionLogic then
			if v["type"] then
				bogeyType = v["object"]:getTypeName()
			else
				bogeyType = "  ???  "
			end
		else
			bogeyType = v["object"]:getTypeName()
		end

		local bearing = ewrs.getBearing(referenceX,referenceZ,bogeypos.p.x,bogeypos.p.z)
		local heading = ewrs.getHeading(velocity)
		local range = ewrs.getDistance(referenceX,referenceZ,bogeypos.p.x,bogeypos.p.z) -- meters
		local altitude = bogeypos.p.y --meters
		local speed = ewrs.getSpeed(velocity) --m/s

		if ewrs.groupSettings[tostring(activePlayer.groupID)].measurements == "metric" then
			range = range / 1000 --change to KM
			speed = mist.utils.mpsToKmph(speed)
			--altitude already in meters
		else
			range = mist.utils.metersToNM(range)
			speed = mist.utils.mpsToKnots(speed)
			altitude = mist.utils.metersToFeet(altitude)
		end

		if ewrs.useImprovedDetectionLogic then
			if not v["distance"] then
				range = ewrs.notAvailable
			end
		end
		
		local j = #threatTable + 1
		threatTable[j] = {}
		threatTable[j].unitType = bogeyType
		threatTable[j].bearing = bearing
		threatTable[j].range = range
		threatTable[j].altitude = altitude
		threatTable[j].speed = speed
		threatTable[j].heading = heading
	end

	table.sort(threatTable,sortRanges)
	
	return threatTable
end

function ewrs.outText(activePlayer, threatTable, bogeyDope, greeting)
	local status, result = pcall(function()
		
		local message = {}
		local altUnits
		local speedUnits
		local rangeUnits
		local bogeyDope = bogeyDope or false
		if ewrs.groupSettings[tostring(activePlayer.groupID)].measurements == "metric" then
			altUnits = "m"
			speedUnits = "Km/h"
			rangeUnits = "Km"
		else
			altUnits = "ft"
			speedUnits = "Knts"
			rangeUnits = "NM"
		end
		
		if #threatTable >= 1 then
			local maxThreats = nil
			local messageGreeting = nil
			if greeting == nil then
				if bogeyDope then
					maxThreats = 1
					messageGreeting = "EWRS Bogey Dope for: " .. activePlayer.player
				else
					if ewrs.maxThreatDisplay == 0 then
						maxThreats = 999
					else
						maxThreats = ewrs.groupSettings[tostring(activePlayer.groupID)].maxThreatsSetting
					end
					messageGreeting = "EWRS Picture Report for: " .. activePlayer.player .. " -- Reference: " .. ewrs.groupSettings[tostring(activePlayer.groupID)].reference
				end
			else
				messageGreeting = greeting
				maxThreats = ewrs.maxFriendlyDisplay
			end
			
			--Display table
			table.insert(message, "\n")
			if ewrs.groupSettings[tostring(activePlayer.groupID)].headerText == true then
				table.insert(message, messageGreeting)
				table.insert(message, "\nConfigure auto-reports and other threat display options via F10-Other>EWRS")
				table.insert(message, "\n\n")
			end
			table.insert(message, string.format( "%-16s", "TYPE"))
			table.insert(message, string.format( "%-12s", "BRG"))
			table.insert(message, string.format( "%-12s", "RNG"))
			table.insert(message, string.format( "%-21s", "ALT"))
			if ewrs.groupSettings[tostring(activePlayer.groupID)].banditSpdHdgText == true then
				table.insert(message, string.format( "%-15s", "SPD"))
				table.insert(message, string.format( "%-3s", "HDG"))
			end
			table.insert(message, "\n")
				
			for k = 1, maxThreats do
				if threatTable[k] == nil then break end
				table.insert(message, "\n")
				if ewrs.groupSettings[tostring(activePlayer.groupID)].banditType == true then
					table.insert(message, string.format( "%-16s", threatTable[k].unitType))
					else
					table.insert(message, string.format( "%-16s", "  ???  "))
				end
				if threatTable[k].range == ewrs.notAvailable then
					table.insert(message, string.format( "%-12s", " "))
					table.insert(message, string.format( "%-12s", "POSITION"))
					table.insert(message, string.format( "%-21s", " "))
					if ewrs.groupSettings[tostring(activePlayer.groupID)].banditSpdHdgText == true then
						table.insert(message, string.format( "%-15s", "UNKNOWN"))
						table.insert(message, string.format( "%-3s", " "))
					end
				else
					table.insert(message, string.format( "%03d", threatTable[k].bearing))
					table.insert(message, string.format( "%8.1f %s", threatTable[k].range, rangeUnits))
					table.insert(message, string.format( "%9d %s", threatTable[k].altitude, altUnits))
					if ewrs.groupSettings[tostring(activePlayer.groupID)].banditSpdHdgText == true then
						table.insert(message, string.format( "%9d %s", threatTable[k].speed, speedUnits))
						table.insert(message, string.format( "         %03d", threatTable[k].heading))
					end
				end
				table.insert(message, "\n")
			end
			trigger.action.outTextForGroup(activePlayer.groupID, table.concat(message), ewrs.messageDisplayTime)
		else
			if (not ewrs.disableMessageWhenNoThreats) or (ewrs.onDemand) and greeting == nil then
				trigger.action.outTextForGroup(activePlayer.groupID, "\nEWRS Picture Report for: " .. activePlayer.player .. "\n\nNo targets detected", ewrs.messageDisplayTime)
			end
			if greeting ~= nil then
				trigger.action.outTextForGroup(activePlayer.groupID, "\nEWRS Friendly Picture for: " .. activePlayer.player .. "\n\nNo friendlies detected", ewrs.messageDisplayTime)
			end
		end
	end)
	if not status then
		env.error(string.format("EWRS outText Error: %s", result))
	end
end

function ewrs.displayMessageToAll()
	
	if messageUpdateIntervalDisplay <= 30 then
		ewrs.messageDisplayTime = (messageUpdateIntervalDisplay - 2)
		else
		ewrs.messageDisplayTime = 28
	end
	
	local status, result = pcall(function()
		--timer.scheduleFunction(ewrs.displayMessageToAll, nil, timer.getTime() + ewrs.messageUpdateInterval)
		--timer.scheduleFunction(ewrs.displayMessageToAll, nil, timer.getTime() + ewrs.groupSettings[groupID].messageIntervalSetting)
		
		if messageUpdateIntervalDisplay ~= nil then
			timer.scheduleFunction(ewrs.displayMessageToAll, nil, timer.getTime() + messageUpdateIntervalDisplay)
		else
			timer.scheduleFunction(ewrs.displayMessageToAll, nil, timer.getTime() + ewrs.messageUpdateInterval)
		end
		
		ewrs.findRadarUnits()
		ewrs.getDetectedTargets()
		for i = 1, #ewrs.activePlayers do
			if ewrs.groupSettings[tostring(ewrs.activePlayers[i].groupID)].messages then
				if ewrs.activePlayers[i].side == 1 and #ewrs.redEwrUnits > 0 or ewrs.activePlayers[i].side == 2 and #ewrs.blueEwrUnits > 0 then
					ewrs.outText(ewrs.activePlayers[i], ewrs.buildThreatTable(ewrs.activePlayers[i]))
				end -- if ewrs.activePlayers[i].side == 1 and #ewrs.redEwrUnits > 0 or ewrs.activePlayers[i].side == 2 and #ewrs.blueEwrUnits > 0 then
			end -- if ewrs.groupSettings[tostring(ewrs.activePlayers[i].groupID)].messages then
		end -- for i = 1, #ewrs.activePlayers do
	end)
	if not status then
		env.error(string.format("EWRS displayMessageToAll Error: %s", result))
	end
end

function ewrs.onDemandMessage(args)
	local status, result = pcall(function()
		ewrs.findRadarUnits()
		ewrs.getDetectedTargets()
		for i = 1, #ewrs.activePlayers do
			if ewrs.activePlayers[i].groupID == args[1] then
				ewrs.outText(ewrs.activePlayers[i], ewrs.buildThreatTable(ewrs.activePlayers[i],args[2]),args[2])
			end
		end
	end)
	if not status then
		env.error(string.format("EWRS onDemandMessage Error: %s", result))
	end
end

function ewrs.buildFriendlyTable(friendlyNames,activePlayer)
	local function sortRanges(v1,v2)
		return v1.range < v2.range
	end

	local units = {}
	for i =1, #friendlyNames do
		local unit = Unit.getByName(friendlyNames[i])
		if unit ~= nil and unit:isActive() then
		
			table.insert(units,unit)
		else
			--env.error("Friendly Picture - Unit not found: "..friendlyNames[i]) -- Client Planes that are not active will fall into here.
		end
	end
	
	local _self = Unit.getByName(activePlayer.unitname)
	local selfpos = _self:getPosition()
	local referenceX = selfpos.p.x
	local referenceZ = selfpos.p.z
	
	local friendlyTable = {}
	
	for k,v in pairs(units) do
		local velocity = v:getVelocity()
		local pos = v:getPosition()
		local bogeyType = v:getTypeName()
		if pos.p.x ~= selfpos.p.x and pos.p.z ~= selfpos.p.z then --same position as self, means its you!

			local bearing = ewrs.getBearing(referenceX,referenceZ,pos.p.x,pos.p.z)
			local heading = ewrs.getHeading(velocity)
			local range = ewrs.getDistance(referenceX,referenceZ,pos.p.x,pos.p.z) -- meters
			local altitude = pos.p.y --meters
			local speed = ewrs.getSpeed(velocity) --m/s

			if ewrs.groupSettings[tostring(activePlayer.groupID)].measurements == "metric" then
				range = range / 1000 --change to KM
				speed = mist.utils.mpsToKmph(speed)
				--altitude already in meters
			else
				range = mist.utils.metersToNM(range)
				speed = mist.utils.mpsToKnots(speed)
				altitude = mist.utils.metersToFeet(altitude)
			end
		
			local j = #friendlyTable + 1
			friendlyTable[j] = {}
			friendlyTable[j].unitType = bogeyType
			friendlyTable[j].bearing = bearing
			friendlyTable[j].range = range
			friendlyTable[j].altitude = altitude
			friendlyTable[j].speed = speed
			friendlyTable[j].heading = heading
		else
			--env.info("Friendly Picture - Found Self") 
		end
	end

	table.sort(friendlyTable,sortRanges)
	
	return friendlyTable
end

function ewrs.friendlyPicture(args)
	local status, result = pcall(function()
		for i = 1, #ewrs.activePlayers do
			if ewrs.activePlayers[i].groupID == args[1] then
				local sideString = nil
				if  ewrs.activePlayers[i].side == 1 then
					sideString = "[red]"
				else
					sideString = "[blue]"
				end
				local filter = {sideString.."[helicopter]", sideString.."[plane]"}
				local friendlies = mist.makeUnitTable(filter) --find a way to do this only once if there is more then 1 person in a group
				local friendlyTable = ewrs.buildFriendlyTable(friendlies,ewrs.activePlayers[i])
				local greeting = "EWRS Friendly Picture for: " .. ewrs.activePlayers[i].player
				ewrs.outText(ewrs.activePlayers[i],friendlyTable,false,greeting)
			end
		end
	end)
	if not status then
		env.error(string.format("EWRS friendlyPicture Error: %s", result))
	end
end

function ewrs.buildActivePlayers()
	local status, result = pcall(function()
		local filter = { "[all][plane]","[all][helicopter]"}
		local all_vecs = mist.makeUnitTable(filter)
		ewrs.activePlayers = {}
		for i = 1, #all_vecs do
			local vec = Unit.getByName(all_vecs[i])
			if vec ~= nil and Unit.isActive(vec) then
				playerName = Unit.getPlayerName(vec)
				local groupID = ewrs.getGroupId(vec)
				if playerName ~= nil then
					unitCategory = ewrs.acCategories[Unit.getTypeName(vec)]
					if ewrs.disableFightersBRA and unitCategory == ewrs.FIGHTER then
						--DONT DO ANYTHING
					else
						local group = Unit.getGroup(vec)
						if ewrs.enableBlueTeam and Unit.getCoalition(vec) == 2 then
							ewrs.addPlayer(playerName, groupID, vec)
						elseif ewrs.enableRedTeam and Unit.getCoalition(vec) == 1 then
							ewrs.addPlayer(playerName, groupID, vec)
						end
					end
				end
			end
		end
	end) -- pcall
	
	if not status then
		env.error(string.format("EWRS buildActivePlayers Error: %s", result))
	end
end

--THANK YOU ciribob http://forums.eagle.ru/showpost.php?p=2499638&postcount=5
--And Stonehouse for pointing me there
function ewrs.getGroupId(_unit) --Temp fix for client groups not being accessable

    local _unitDB =  mist.DBs.unitsById[tonumber(_unit:getID())]
    if _unitDB ~= nil and _unitDB.groupId then
        return _unitDB.groupId
    end

    return nil
end

function ewrs.getGroupCategory(unit)
	local unitDB = mist.DBs.unitsById[tonumber(unit:getID())]
	 if unitDB ~= nil and unitDB.category then
        return unitDB.category
    end

    return nil
end

function ewrs.addPlayer(playerName, groupID, unit )
	local status, result = pcall(function()
		local i = #ewrs.activePlayers + 1
		ewrs.activePlayers[i] = {}
		ewrs.activePlayers[i].player = playerName
		ewrs.activePlayers[i].groupID = groupID
		ewrs.activePlayers[i].unitname = unit:getName()
		ewrs.activePlayers[i].side = unit:getCoalition() 
		ewrs.activePlayers[i].group = unit:getGroup()
		ewrs.activePlayers[i].unit = unit
		-- add default settings to settings table if it hasn't been done yet
		if ewrs.groupSettings[tostring(groupID)] == nil then
			ewrs.addGroupSettings(tostring(groupID))
				--trigger.action.outText("Active Players:" .. UTILS.OneLineSerialize(ewrs.activePlayers))

		end	
	end)
	if not status then
		env.error(string.format("EWRS addPlayer Error: %s", result))
	end
end

-- filters units so ones detected by multiple radar sites still only get listed once
-- Filters out anything that isn't a plane or helicopter
function ewrs.filterUnits(units)
	local newUnits = {}
	for k,v in pairs(units) do
		local valid = true
		if v["object"]:getCategory() ~= Object.Category.UNIT then --rare but i've had it detect missiles
			valid = false
		end
		if valid then --another check cause it seems AI radar can detected some ground units
			local category = ewrs.getGroupCategory(v["object"])
			if category ~= "plane" and category ~= "helicopter" then valid = false end
		end

		if valid then
			for nk,nv in pairs (newUnits) do --recursive loop, can't see a way around this
				if v["object"]:getName() == nv["object"]:getName() then 
					valid = false
					--update already found unit incase the first detection(s) didn't know type or distance
					if v["type"] then
						nv["type"] = true
					end
					if v["distance"] then
						nv["distance"] = true
					end
				end
			end
		end
		
		if valid then
			table.insert(newUnits, v)
		end
	end
	return newUnits
end

function ewrs.getDetectedTargets()
	if #ewrs.blueEwrUnits > 0 then
		ewrs.currentlyDetectedRedUnits = ewrs.findDetectedTargets("red")
	end
	if #ewrs.redEwrUnits > 0 then
		ewrs.currentlyDetectedBlueUnits = ewrs.findDetectedTargets("blue")
	end
end

function ewrs.findDetectedTargets(side)
	local units = {}
	local ewrUnits = {}

	if side == "red" then
		ewrUnits = ewrs.blueEwrUnits
	elseif side == "blue" then
		ewrUnits = ewrs.redEwrUnits
	end

	for n = 1, #ewrUnits do
		local ewrUnit = Unit.getByName(ewrUnits[n])
		if ewrUnit ~= nil then
			local ewrControl = ewrUnit:getGroup():getController()
			local detectedTargets = ewrControl:getDetectedTargets(Controller.Detection.RADAR)
			for k,v in pairs (detectedTargets) do
				table.insert(units, v)
			end
		end
	end
	return ewrs.filterUnits(units)
end

function ewrs.findRadarUnits()
	local filter = {}
	if ewrs.enableBlueTeam and ewrs.enableRedTeam then
		filter = { "[all][plane]", "[all][vehicle]", "[all][ship]"}
	elseif ewrs.enableBlueTeam then
		filter = { "[blue][plane]", "[blue][vehicle]", "[blue][ship]"}
	elseif ewrs.enableRedTeam then
		filter = { "[red][plane]", "[red][vehicle]", "[red][ship]"}
	end
	local all_vecs = mist.makeUnitTable(filter)
	local redUnits = {}
	local blueUnits = {}
	
	for i = 1, #all_vecs do
		local vec = Unit.getByName(all_vecs[i])
	
		if vec ~= nil then
			if Unit.isActive(vec) then
				local vec_type = Unit.getTypeName(vec)
				for n = 1, #ewrs.validSearchRadars do
					if ewrs.validSearchRadars[n] == vec_type and Unit.getCoalition(vec) == 2 then
						table.insert(blueUnits, Unit.getName(vec))
						break
					end
					if ewrs.validSearchRadars[n] == vec_type and Unit.getCoalition(vec) == 1 then
						table.insert(redUnits, Unit.getName(vec))
						break
					end
				end --for n = 1, #ewrs.validSearchRadars do
			end --if Unit.isActive(vec) then
		end --if vec ~= nil then
	end --for i = 1, #all_vecs do
	ewrs.blueEwrUnits = blueUnits
	ewrs.redEwrUnits = redUnits
end

messageUpdateIntervalDisplay = ewrs.messageDisplayTime	

function metricCheck(typeName)
	local temp = {
		
		["I-16"] = true,
		["J-11A"] = true,
		["Su-33"] = true,
		["Su-25"] = true,
		["MiG-29S"] = true,
		["MiG-29A"] = true,
		["MiG-29G"] = true,
		["MiG-21Bis"] = true,
		["MiG-19P"] = true,
		["MiG-15bis"] = true,
		["Su-27"] = true,
		["Su-25T"] = true,
		["Su-25"] = true,
		["L-39ZA"] = true,
		["L-39C"] = true,
		["Yak-52"] = true,
		["Mi-24P"] = true,
		["Mi-8MT"] = true,
		["Ka-50"] = true,
		["SA342M"] = true,
		["SA342L"] = true,
		["SA342Mistral"] = true,
		["SA342Minigun"] = true,
	

	}
	for _typeName, bool in pairs(temp) do

		if _typeName == typeName then 

			return bool
		end
	end

	return false

end

function ewrs.addGroupSettings(groupID)
	ewrs.groupSettings[groupID] = {}
	ewrs.groupSettings[groupID].reference = ewrs.defaultReference
	ewrs.groupSettings[groupID].measurements = ewrs.defaultMeasurements
	ewrs.groupSettings[groupID].messages = true
	ewrs.groupSettings[groupID].headerText = true
	ewrs.groupSettings[groupID].banditSpdHdgText = true
	ewrs.groupSettings[groupID].banditType = true
	ewrs.groupSettings[groupID].maxThreatsSetting = ewrs.maxThreatDisplay
	ewrs.groupSettings[groupID].messageIntervalSetting = ewrs.messageUpdateInterval

	local function playerMetricCheck(_groupID)
		local unitName, playerName, groupName, typeName, isMetric, unit
		ewrs.groupSettings[groupID].isMetric = false 
		for i = 1, #ewrs.activePlayers, 1 do
			if tonumber(groupID) == tonumber(ewrs.activePlayers[i].groupID) then
				unit = ewrs.activePlayers[i].unit
				unitName = ewrs.activePlayers[i].unitName
				playerName = ewrs.activePlayers[i].player
				groupName = ewrs.activePlayers[i].group:getName()
				unitTypeName = unit:getTypeName()
				ewrs.groupSettings[groupID].isMetric = metricCheck(unitTypeName)
				isMetric = ewrs.groupSettings[groupID].isMetric 
				--trigger.action.outText("Setting groupName to " .. UTILS.OneLineSerialize(groupName).. " || playername: " .. playerName .. " || isMetric: " .. UTILS.OneLineSerialize(isMetric) , 20)
				if isMetric == true then
					ewrs.groupSettings[groupID].measurements = "metric"
				end
			end
		end
	end
	
	playerMetricCheck(groupID)
	
end

function ewrs.setGroupReference(args)
	local groupID = args[1]
	ewrs.groupSettings[tostring(groupID)].reference = args[2]
	trigger.action.outTextForGroup(groupID,"Reference changed to "..args[2],ewrs.messageDisplayTime)
end

function ewrs.setGroupMeasurements(args)
	local groupID = args[1]
	ewrs.groupSettings[tostring(groupID)].measurements = args[2]
	trigger.action.outTextForGroup(groupID,"Measurement units changed to "..args[2],ewrs.messageDisplayTime)
end

function ewrs.setGroupMessages(args)
	local groupID = args[1]
	local onOff
	if args[2] then onOff = "on" else onOff = "off" end
	ewrs.groupSettings[tostring(groupID)].messages = args[2]
	trigger.action.outTextForGroup(groupID,"Picture reports for group turned "..onOff,ewrs.messageDisplayTime)
end

function ewrs.setMaxThreats(args)
	local groupID = args[1]
	ewrs.groupSettings[tostring(groupID)].maxThreatsSetting = args[2]
	if ewrs.groupSettings[tostring(groupID)].maxThreatsSetting ~= 999 then
		trigger.action.outTextForGroup(groupID,"Max no. of threat display for group set to "..ewrs.groupSettings[tostring(groupID)].maxThreatsSetting,ewrs.messageDisplayTime)
	else
		trigger.action.outTextForGroup(groupID,"Max no. of threat display for group set to show ALL detected air threats",ewrs.messageDisplayTime)
	end
end

function ewrs.setHeaderText(args)
	local groupID = args[1]
	local onOff
	if args[2] then onOff = "on" else onOff = "off" end
	ewrs.groupSettings[tostring(groupID)].headerText = args[2]
	trigger.action.outTextForGroup(groupID,"Header text in EWRS report for group turned "..onOff,ewrs.messageDisplayTime)
end

function ewrs.setBanditType(args)
	local groupID = args[1]
	local onOff
	if args[2] then onOff = "on" else onOff = "off" end
	ewrs.groupSettings[tostring(groupID)].banditType = args[2]
	trigger.action.outTextForGroup(groupID,"Bandit type name in EWRS report for group turned "..onOff,ewrs.messageDisplayTime)
end

function ewrs.setBanditSpdHdgText(args)
	local groupID = args[1]
	local onOff
	if args[2] then onOff = "on" else onOff = "off" end
	ewrs.groupSettings[tostring(groupID)].banditSpdHdgText = args[2]
	trigger.action.outTextForGroup(groupID,"Bandit speed/heading info in EWRS report for group turned "..onOff,ewrs.messageDisplayTime)
end

function ewrs.setMessageUpdateInterval(args)
	local groupID = args[1]
	ewrs.groupSettings[tostring(groupID)].messageIntervalSetting = args[2]
	trigger.action.outTextForGroup(groupID,"EWRS update interval time (seconds) for group set to "..ewrs.groupSettings[tostring(groupID)].messageIntervalSetting.." seconds.",ewrs.messageDisplayTime)
	messageUpdateIntervalDisplay = ewrs.groupSettings[tostring(groupID)].messageIntervalSetting
end


function ewrs.setDisplayPreset(args)
	local groupID = args[1]
	if args[2] == "Default" then
		ewrs.groupSettings[tostring(groupID)].maxThreatsSetting = ewrs.maxThreatDisplay
		ewrs.groupSettings[tostring(groupID)].banditSpdHdgText = true
		ewrs.groupSettings[tostring(groupID)].headerText = true
		ewrs.groupSettings[tostring(groupID)].threatLevel = true
		ewrs.groupSettings[tostring(groupID)].helicopters = false
	elseif args[2] == "Reduced" then
		ewrs.groupSettings[tostring(groupID)].maxThreatsSetting = ewrs.maxThreatDisplay
		ewrs.groupSettings[tostring(groupID)].headerText = false
		ewrs.groupSettings[tostring(groupID)].threatLevel = false
		ewrs.groupSettings[tostring(groupID)].helicopters = false
	elseif args[2] == "Minimal" then
		ewrs.groupSettings[tostring(groupID)].maxThreatsSetting = 2
		ewrs.groupSettings[tostring(groupID)].banditSpdHdgText = true
		ewrs.groupSettings[tostring(groupID)].headerText = false
		ewrs.groupSettings[tostring(groupID)].threatLevel = false
		ewrs.groupSettings[tostring(groupID)].helicopters = false
	end
	trigger.action.outTextForGroup(groupID,"EWRS Display Preset: ["..args[2].."] display settings applied.",ewrs.messageDisplayTime)
end

function ewrs.buildF10Menu()
	local status, result = pcall(function()
		for i = 1, #ewrs.activePlayers do
			local groupID = ewrs.activePlayers[i].groupID
			local stringGroupID = tostring(groupID)
			if ewrs.builtF10Menus[stringGroupID] == nil then
				local rootPath = missionCommands.addSubMenuForGroup(groupID, "AWACS Reports (EWRS)")
				
				if ewrs.allowBogeyDope then
					missionCommands.addCommandForGroup(groupID, "Request Bogey Dope",rootPath,ewrs.onDemandMessage,{groupID,true})
				end
				
				--if ewrs.onDemand then
				missionCommands.addCommandForGroup(groupID, "Request Picture",rootPath,ewrs.onDemandMessage,{groupID})
				--end
				
				if ewrs.allowFriendlyPicture then
					missionCommands.addCommandForGroup(groupID, "Request Friendly Picture",rootPath,ewrs.friendlyPicture,{groupID})
				end
				
				--missionCommands.addCommandForGroup(groupID, "Quick Air Threat Report", rootPath, tti.a2a.calcAirThreat, groupID)
				
				local measreumentsRefSettingsSubMenuPath = missionCommands.addSubMenuForGroup(groupID, "Measurements/Reference Settings",rootPath)
				
				local settingsSubMenuPath = missionCommands.addSubMenuForGroup(groupID, "EWRS Display Settings",rootPath)
				
				if not ewrs.restrictToOneReference then
					local referenceSetPath = missionCommands.addSubMenuForGroup(groupID,"Set GROUP's reference point", measreumentsRefSettingsSubMenuPath)
					missionCommands.addCommandForGroup(groupID, "Set to Bullseye",referenceSetPath,ewrs.setGroupReference,{groupID, "bulls"})
					missionCommands.addCommandForGroup(groupID, "Set to Self",referenceSetPath,ewrs.setGroupReference,{groupID, "self"})
				end
			
				local measurementsSetPath = missionCommands.addSubMenuForGroup(groupID,"Set GROUP's measurement units",measreumentsRefSettingsSubMenuPath)
				missionCommands.addCommandForGroup(groupID, "Set to Imperial (feet, knts)",measurementsSetPath,ewrs.setGroupMeasurements,{groupID, "imperial"})
				missionCommands.addCommandForGroup(groupID, "Set to Metric (meters, km/h)",measurementsSetPath,ewrs.setGroupMeasurements,{groupID, "metric"})

				local displayPresetsPath = missionCommands.addSubMenuForGroup(groupID, "EWRS Display Presets",settingsSubMenuPath)
				missionCommands.addCommandForGroup(groupID, "Default", displayPresetsPath, ewrs.setDisplayPreset, {groupID, "Default"})
				missionCommands.addCommandForGroup(groupID, "Reduced", displayPresetsPath, ewrs.setDisplayPreset, {groupID, "Reduced"})
				missionCommands.addCommandForGroup(groupID, "Minimal", displayPresetsPath, ewrs.setDisplayPreset, {groupID, "Minimal"})

				if not ewrs.onDemand then
					local messageOnOffPath = missionCommands.addSubMenuForGroup(groupID, "Turn Picture Report On/Off",settingsSubMenuPath)
					missionCommands.addCommandForGroup(groupID, "Message ON", messageOnOffPath, ewrs.setGroupMessages, {groupID, true})
					missionCommands.addCommandForGroup(groupID, "Message OFF", messageOnOffPath, ewrs.setGroupMessages, {groupID, false})
				end
				--[[
				local heloOnOffPath = missionCommands.addSubMenuForGroup(groupID, "Turn Helicopter Report On/Off",settingsSubMenuPath)
				missionCommands.addCommandForGroup(groupID, "Message ON", heloOnOffPath, ewrs.setHeloMessages, {groupID, true})
				missionCommands.addCommandForGroup(groupID, "Message OFF", heloOnOffPath, ewrs.setHeloMessages, {groupID, false})
				
				local threatLevelOnOffPath = missionCommands.addSubMenuForGroup(groupID, "Turn Threat Level Report On/Off",settingsSubMenuPath)
				missionCommands.addCommandForGroup(groupID, "Message ON", threatLevelOnOffPath, ewrs.setThreatLevelMessages, {groupID, true})
				missionCommands.addCommandForGroup(groupID, "Message OFF", threatLevelOnOffPath, ewrs.setThreatLevelMessages, {groupID, false})
				--]]
				
				local banditTypeOnOffPath = missionCommands.addSubMenuForGroup(groupID, "Turn Bandit Type On/Off",settingsSubMenuPath)
				missionCommands.addCommandForGroup(groupID, "Bandit Type ON", banditTypeOnOffPath, ewrs.setBanditType, {groupID, true})
				missionCommands.addCommandForGroup(groupID, "Bandit Type OFF", banditTypeOnOffPath, ewrs.setBanditType, {groupID, false})
				
				local headerMessageOnOffPath = missionCommands.addSubMenuForGroup(groupID, "Turn Report Header Text On/Off",settingsSubMenuPath)
				missionCommands.addCommandForGroup(groupID, "Header Text ON", headerMessageOnOffPath, ewrs.setHeaderText, {groupID, true})
				missionCommands.addCommandForGroup(groupID, "Header Text OFF", headerMessageOnOffPath, ewrs.setHeaderText, {groupID, false})
				
				local banditSpdHdgOnOffPath = missionCommands.addSubMenuForGroup(groupID, "Turn Bandit SPD/HDG On/Off",settingsSubMenuPath)
				missionCommands.addCommandForGroup(groupID, "Bandit SPD/HDG ON", banditSpdHdgOnOffPath, ewrs.setBanditSpdHdgText, {groupID, true})
				missionCommands.addCommandForGroup(groupID, "Bandit SPD/HDG OFF", banditSpdHdgOnOffPath, ewrs.setBanditSpdHdgText, {groupID, false})
				
				local maxThreatDisplayOption = missionCommands.addSubMenuForGroup(groupID, "Max # of threats to Display",settingsSubMenuPath)
				missionCommands.addCommandForGroup(groupID, "1", maxThreatDisplayOption, ewrs.setMaxThreats, {groupID, 1})
				missionCommands.addCommandForGroup(groupID, "2", maxThreatDisplayOption, ewrs.setMaxThreats, {groupID, 2})
				missionCommands.addCommandForGroup(groupID, "3", maxThreatDisplayOption, ewrs.setMaxThreats, {groupID, 3})
				missionCommands.addCommandForGroup(groupID, "4", maxThreatDisplayOption, ewrs.setMaxThreats, {groupID, 4})
				missionCommands.addCommandForGroup(groupID, "5", maxThreatDisplayOption, ewrs.setMaxThreats, {groupID, 5})
				missionCommands.addCommandForGroup(groupID, "6", maxThreatDisplayOption, ewrs.setMaxThreats, {groupID, 6})
				missionCommands.addCommandForGroup(groupID, "Show All", maxThreatDisplayOption, ewrs.setMaxThreats, {groupID, 999})
				
				if ewrsAllowChangeDisplayInterval == true then
				local messageUpdateInervalOption = missionCommands.addSubMenuForGroup(groupID, "EWRS Update Interval",settingsSubMenuPath)
				missionCommands.addCommandForGroup(groupID, "10 Seconds", messageUpdateInervalOption, ewrs.setMessageUpdateInterval, {groupID, 10})
				missionCommands.addCommandForGroup(groupID, "20 Seconds", messageUpdateInervalOption, ewrs.setMessageUpdateInterval, {groupID, 20})
				missionCommands.addCommandForGroup(groupID, "30 Seconds", messageUpdateInervalOption, ewrs.setMessageUpdateInterval, {groupID, 30})
				missionCommands.addCommandForGroup(groupID, "40 Seconds", messageUpdateInervalOption, ewrs.setMessageUpdateInterval, {groupID, 40})
				missionCommands.addCommandForGroup(groupID, "50 Seconds", messageUpdateInervalOption, ewrs.setMessageUpdateInterval, {groupID, 50})
				missionCommands.addCommandForGroup(groupID, "60 Seconds", messageUpdateInervalOption, ewrs.setMessageUpdateInterval, {groupID, 60})
				missionCommands.addCommandForGroup(groupID, "90 Seconds", messageUpdateInervalOption, ewrs.setMessageUpdateInterval, {groupID, 90})
				missionCommands.addCommandForGroup(groupID, "2 Minutes", messageUpdateInervalOption, ewrs.setMessageUpdateInterval, {groupID, 120})
				missionCommands.addCommandForGroup(groupID, "3 Minutes", messageUpdateInervalOption, ewrs.setMessageUpdateInterval, {groupID, 180})
				missionCommands.addCommandForGroup(groupID, "4 Minutes", messageUpdateInervalOption, ewrs.setMessageUpdateInterval, {groupID, 240})
				end

				ewrs.builtF10Menus[stringGroupID] = true
			end
		end
	end)
	
	if not status then
		env.error(string.format("EWRS buildF10Menu Error: %s", result))
	end
end

local function A2A_Easy_MenuStart()
	if a2a_manual_spawn_stacking == false and A2A_Easy_Spawn ~= nil and A2A_Easy_Spawn:IsAlive() then
		trigger.action.outText( "<< There is already an A2A mission of this type currently active. >>\n \nYou can only spawn one of each A2A mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	else
	a2a_easy_menu_start()
	--trigger.action.setUserFlag (1, true )
	end
end

local function A2A_Normal_MenuStart()
	if a2a_manual_spawn_stacking == false and A2A_Norm_Spawn ~= nil and A2A_Norm_Spawn:IsAlive() then
		trigger.action.outText( "<< There is already an A2A mission of this type currently active. >>\n \nYou can only spawn one of each A2A mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	else
	a2a_normal_menu_start()
	--trigger.action.setUserFlag (2, true )
end
end

local function A2A_Hard_MenuStart()
		--if a2a_manual_spawn_stacking == false and A2A_Hard_Spawn ~= nil and A2A_Hard_Spawn:IsAlive() then
		if a2a_manual_spawn_stacking == false and a2a_hard_started ~= true then
		trigger.action.outText( "<< There is already an A2A mission of this type currently active. >>\n \nYou can only spawn one of each A2A mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	else
	a2a_hard_menu_start()
	--trigger.action.setUserFlag (3, true )
end
end

local function A2A_ALL_MenuStart() --107thonly
	if a2a_manual_spawn_stacking == false and A2A_All_Spawn ~= nil and A2A_All_Spawn:IsAlive() then
		trigger.action.outText( "<< There is already an A2A mission of this type currently active. >>\n \nYou can only spawn one of each A2A mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	else
	a2a_random_menu_start()
	--trigger.action.setUserFlag (4, true )
end
end

--bombing add
local function A2A_BOMBING_MenuStart() --107thonly
	if a2a_manual_spawn_stacking == false and A2A_BOMBING_1 ~= nil and A2A_BOMBING_1:IsAlive() then
		trigger.action.outText( "<< There is already an A2A mission of this type currently active. >>\n \nYou can only spawn one of each A2A mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	else
	a2a_intercept_menu_start()
	--trigger.action.setUserFlag ("intercept", true )
end
end

--helo add
local function A2A_HELO_MenuStart() --107thonly
	if a2a_manual_spawn_stacking == false and A2A_Helo_Spawn ~= nil and A2A_Helo_Spawn:IsAlive() then
		trigger.action.outText( "<< There is already an A2A mission of this type currently active. >>\n \nYou can only spawn one of each A2A mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	else
	a2a_helo_menu_start()
	--trigger.action.setUserFlag (5, true )
end
end


a2g_mission_spawn_lock = true
timer.scheduleFunction(function()
tti.debug("Setting A2G Mission Menu Spawn Lock: " .. tostring(a2g_mission_spawn_lock), false)
end, nil, timer.getTime() + 5  )


timer.scheduleFunction(function()
a2g_mission_spawn_lock = false
tti.debug("Setting A2G Mission Menu Spawn Lock: " .. tostring(a2g_mission_spawn_lock), false)
end, nil, timer.getTime() + 125  )

-- A2G
local function A2G_HARD_MenuStart()
if a2g_mission_spawn_lock == false then
	if trigger.misc.getUserFlag("AG-STARTING") == 0 then
	a2g_hard_initialize_spawn()
	--trigger.action.setUserFlag (6, true )
	else
	a2gj_text_fail()
	end
else
A2G_Mission_Started_Too_Early()
end
end

local function A2G_MR_MenuStart()
if a2g_mission_spawn_lock == false then
	if trigger.misc.getUserFlag("MR-STARTING") == 0 then
	 a2g_easy_initialize_spawn()
	--trigger.action.setUserFlag (7, true )
	else
	mr_text_fail()
end
else
A2G_Mission_Started_Too_Early()
end
end

local function A2G_Helo_MenuStart()
if a2g_mission_spawn_lock == false then
	if trigger.misc.getUserFlag("AGH-STARTING") == 0 then
	a2g_helo_initialize_spawn()
	--trigger.action.setUserFlag (8, true )
	else
	a2gh_text_fail()
end
else
A2G_Mission_Started_Too_Early()
end
end

local function A2G_Helo_IA_MenuStart()
if a2g_mission_spawn_lock == false then
if trigger.misc.getUserFlag("AGHIA-STARTING") == 0 then
	a2g_infas_initialize_spawn()
	--trigger.action.setUserFlag (10, true )
	else
	a2gia_text_fail()
end
else
A2G_Mission_Started_Too_Early()
end
end

local function A2G_Convoy_MenuStart()
if a2g_mission_spawn_lock == false then
if trigger.misc.getUserFlag("CONVOY-STARTING") == 0 then
	a2g_convoy_initialize_spawn()
	--trigger.action.setUserFlag (15, true )
	else
	 a2g_convoy_text_fail()
end
else
A2G_Mission_Started_Too_Early()
end
end

function A2G_Mission_Started_Too_Early()
trigger.action.outText( "<< Auto-start Ground Missions are still initializing! >>\n\nPlease wait another minute or so before attempting to manually spawn-in a ground mission.\n", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end

local function A2G_AS_MenuStart()
if trigger.misc.getUserFlag("AS-STARTING") == 0 then
	a2g_as_initialize_spawn()
	--trigger.action.setUserFlag (9, true )
	else
	a2gas_text_fail()
end
end

local function LOCATION_INTEL(groupID)
	main_intel()
end

local function SMOKE_INTEL()
	trigger.action.setUserFlag (800, true )
end

local function AWACS_RESET()
	trigger.action.setUserFlag (50, true )
end

local function TANKERS_RESET()
	--trigger.action.setUserFlag (51, true )
	reset_tankers()
end

local function END_MISSION()
	trigger.action.setUserFlag (667, true )
end

local function AIRFIELDBACKUP1()
	a2a_backup_1_start()
end

--[[
local function AIRFIELDBACKUP2()
	a2a_backup_2_start()
end

local function AIRFIELDBACKUP3()
	a2a_backup_3_start()
end
--]]

local function CVBACKUP1()
	a2a_backup_cv_1_start()
end


local function CVBACKUP2()
	a2a_backup_cv_kuz_1_start()
end


function ewrs.buildmissionmenu()
	local status, result = pcall(function()
		for i = 1, #ewrs.activePlayers do
			local groupID = ewrs.activePlayers[i].groupID
			local stringGroupID = tostring(groupID)
			if ewrs.builtTaskingMenus[stringGroupID] == nil then
			
local mainMenu = missionCommands.addSubMenuForGroup(groupID, "MISSION/TASK SPAWNING MENU")
				
local a2gMenu = missionCommands.addSubMenuForGroup(groupID,"Air-to-Ground", mainMenu)
missionCommands.addCommandForGroup(groupID, "[[ A2G Easy Mission ]]", a2gMenu,A2G_MR_MenuStart,{groupID})
missionCommands.addCommandForGroup(groupID, "[[ A2G Hard Mission ]]", a2gMenu,A2G_HARD_MenuStart,{groupID})
missionCommands.addCommandForGroup(groupID, "[[ A2G Helo Mission ]]", a2gMenu, A2G_Helo_MenuStart,{groupID})
missionCommands.addCommandForGroup(groupID, "[[ A2G Infantry Assault Mission ]]", a2gMenu, A2G_Helo_IA_MenuStart,{groupID})
missionCommands.addCommandForGroup(groupID, "[[ A2G Convoy Hunt Mission ]]", a2gMenu, A2G_Convoy_MenuStart,{groupID})
if env.mission.theatre ~= "Nevada" then
missionCommands.addCommandForGroup(groupID, "[[ Anti-Ship Mission ]]", a2gMenu, A2G_AS_MenuStart,{groupID})
end

local a2aMenu = missionCommands.addSubMenuForGroup(groupID,"Air-to-Air",mainMenu)
missionCommands.addCommandForGroup(groupID, "[[ A2A Easy Mission ]]", a2aMenu, A2A_Easy_MenuStart,{groupID})
missionCommands.addCommandForGroup(groupID, "[[ A2A Normal Mission ]]", a2aMenu, A2A_Normal_MenuStart,{groupID})
missionCommands.addCommandForGroup(groupID, "[[ A2A Hard Mission ]]", a2aMenu, A2A_Hard_MenuStart,{groupID})
missionCommands.addCommandForGroup(groupID, "[[ A2A Intercept Bomber Mission ]]", a2aMenu, A2A_BOMBING_MenuStart,{groupID})
--helo add
missionCommands.addCommandForGroup(groupID, "[[ A2A Helo Mission ]]", a2aMenu, A2A_HELO_MenuStart )
missionCommands.addCommandForGroup(groupID, "[[ A2A Random Mission ]]", a2aMenu, A2A_ALL_MenuStart,{groupID})


local intelMainMenu = missionCommands.addSubMenuForGroup(groupID, "MISSION LOCATION INTEL MENU")
missionCommands.addCommandForGroup(groupID, "[[ Ground Target Location Intel ]]", intelMainMenu, LOCATION_INTEL,{groupID})
missionCommands.addCommandForGroup(groupID, "[[ Smoke Active Target Areas ]]", intelMainMenu, SMOKE_INTEL,{groupID})


-- --original cap backup
-- if enable_blue_cap_backup == true then
-- --a2abackupMenu = missionCommands.addSubMenuForGroup(groupID,"Air-to-Air Reinforcements", mainMenu)
-- a2abackupMenu = missionCommands.addSubMenuForGroup(groupID,"Air-to-Air Reinforcements")
-- missionCommands.addCommandForGroup(groupID, "[[ Request [" .. backup_cap_airfield_1_name .. "] CAP Backup ]]", a2abackupMenu, AIRFIELDBACKUP1,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[[ Request [" .. backup_cap_airfield_2_name .. "] CAP Backup ]]", a2abackupMenu, AIRFIELDBACKUP2,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[[ Request [" .. backup_cap_airfield_3_name .. "] CAP Backup ]]", a2abackupMenu, AIRFIELDBACKUP3,{groupID})
	-- if env.mission.theatre ~= "Nevada" and mission_era == "modern" or mission_era == "cold_war" then
		-- missionCommands.addCommandForGroup(groupID, "[[ Request [" .. backup_cap_cv_1_name .. "] CAP Backup ]]", a2abackupMenu, CVBACKUP1,{groupID})
		-- missionCommands.addCommandForGroup(groupID, "[[ Request [" .. backup_cap_cv_2_name .. "] CAP Backup ]]", a2abackupMenu, CVBACKUP2,{groupID})
	-- end
-- end


if enable_blue_cap_backup == true then
--a2abackupMenu = missionCommands.addSubMenuForGroup(groupID,"Air-to-Air Reinforcements", mainMenu)
a2abackupMenu = missionCommands.addSubMenuForGroup(groupID,"Air-to-Air Reinforcements")
missionCommands.addCommandForGroup(groupID, "[ Request CAP Backup (Airfield) ]", a2abackupMenu, AIRFIELDBACKUP1,{groupID})
	if env.mission.theatre ~= "Nevada" and mission_era == "modern" or mission_era == "cold_war" then
		missionCommands.addCommandForGroup(groupID, "[ Request CAP Backup (US Carrier) ]", a2abackupMenu, CVBACKUP1,{groupID})
		missionCommands.addCommandForGroup(groupID, "[ Request CAP Backup (RU Carrier) ]", a2abackupMenu, CVBACKUP2,{groupID})
	end
end


--debugmenu = missionCommands.addSubMenuForGroup(groupID,"Debug Menu", mainMenu)
debugmenu = missionCommands.addSubMenuForGroup(groupID,"Debug Menu")
if mission_era == "modern" then
--missionCommands.addCommandForGroup(groupID, "[[ Reset AWACS ]]", debugmenu, AWACS_RESET,{groupID})
missionCommands.addCommandForGroup(groupID, "[[ Reset Tankers ]]", debugmenu, TANKERS_RESET,{groupID})
end
missionCommands.addCommandForGroup(groupID, "[[ End Mission ]]", debugmenu, END_MISSION,{groupID})


			ewrs.builtTaskingMenus[stringGroupID] = true
		end	
		end
	end)
	
	if not status then
		env.error(string.format("EWRS buildF10Menu Error: %s", result))
	end
end


-- function ewrs.supercarriermissionmenu()
	-- local status, result = pcall(function()
		-- for i = 1, #ewrs.activePlayers do
			-- local groupID = ewrs.activePlayers[i].groupID
			-- local stringGroupID = tostring(groupID)
			-- if ewrs.builtSuperCarrierMenus[stringGroupID] == nil then
				-- local mainMenuSc = missionCommands.addSubMenuForGroup(groupID, "Super Carrier Deck Layout Menu")
				
-- spawn4Menu = missionCommands.addSubMenuForGroup(groupID,"4 Spawns", mainMenuSc)
-- missionCommands.addCommandForGroup(groupID, "[Blocked]", spawn4Menu,sc4SpawnsBlocked,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Clear Deck]", spawn4Menu,sc4SpawnsClearDeck,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Remove Statics Blocking AI]", spawn4Menu, sc4RemoveTemplateBlockingStaticsForAI,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Remove 4 Spawns Statics]", spawn4Menu, sc4RemoveAllDeckStatics,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Remove ALL Statics]", spawn4Menu, removeAllStatics,{groupID})

-- spawn8Menu = missionCommands.addSubMenuForGroup(groupID,"8 Spawns", mainMenuSc)
-- missionCommands.addCommandForGroup(groupID, "[Blocked]", spawn8Menu,sc8SpawnsBlocked,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Clear Deck]", spawn8Menu,sc8SpawnsClearDeck,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Remove Statics Blocking AI]", spawn8Menu, sc8RemoveTemplateBlockingStaticsForAI,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Remove 8 Spawns Statics]", spawn8Menu, sc8RemoveAllDeckStatics,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Remove ALL Statics]", spawn8Menu, removeAllStatics,{groupID})


-- spawn16Menu = missionCommands.addSubMenuForGroup(groupID,"16 Spawns", mainMenuSc)
-- missionCommands.addCommandForGroup(groupID, "[Blocked]", spawn16Menu,sc16SpawnsBlocked,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Clear Deck]", spawn16Menu,sc16SpawnsClearDeck,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Remove Statics Blocking AI]", spawn16Menu, sc16RemoveTemplateBlockingStaticsForAI,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Remove 16 Spawns Statics]", spawn16Menu, sc16RemoveAllDeckStatics,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Remove ALL Statics]", spawn16Menu, removeAllStatics,{groupID})


-- massLaunchMenu = missionCommands.addSubMenuForGroup(groupID,"Mass Launch", mainMenuSc)
-- missionCommands.addCommandForGroup(groupID, "[Aft Hornets]", massLaunchMenu,massLaunchAftHornets,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Aft Tomcats]", massLaunchMenu,massLaunchAftTomcats,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Remove Mass Launch Statics]", massLaunchMenu,massLaunchRemoveStatics,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Remove ALL Statics]", massLaunchMenu, removeAllStatics,{groupID})


-- massRecoveryMenu = missionCommands.addSubMenuForGroup(groupID,"Mass Recovery", mainMenuSc)
-- missionCommands.addCommandForGroup(groupID, "[Cat 1 Hornets]", massRecoveryMenu,massRecoveryCat1Hornets,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Cat 1 Tomcats]", massRecoveryMenu,massRecoveryCat1Tomcats,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Cat 2 Hornets]", massRecoveryMenu,massRecoveryCat2Hornets,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Cat 2 Tomcats]", massRecoveryMenu,massRecoveryCat2Tomcats,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Remove Cat 1 Statics]", massRecoveryMenu,massRecoveryRemoveCat1Statics,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Remove Cat 2 Statics]", massRecoveryMenu,massRecoveryRemoveCat2Statics,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Remove Mass Recovery Statics]", massRecoveryMenu,massRecoveryRemoveStatics,{groupID})
-- missionCommands.addCommandForGroup(groupID, "[Remove ALL Statics]", massRecoveryMenu, removeAllStatics,{groupID})





			-- ewrs.builtSuperCarrierMenus[stringGroupID] = true
		-- end	
		-- end
	-- end)
	
	-- if not status then
		-- env.error(string.format("EWRS buildF10Menu Error: %s", result))
	-- end
-- end


--temp fix for ground units being detected by radar - FIXED
--[[ Leaving this here just in case I introduce threat based filtering, saves me writing it again
ewrs.validThreats = {
["A-10A"] = true,
["A-10C"] = true,
["A-50"] = true,
["AH-1W"] = true,
["AH-64A"] = true,
["AH-64D"] = true,
["An-26B"] = true,
["An-30M"] = true,
["B-1B"] = true,
["B-52H"] = true,
["Bf-109K-4"] = true,
["C-101CC"] = true,
["C-101EB"] = true,
["C-130"] = true,
["C-17A"] = true,
["CH-47D"] = true,
["CH-53E"] = true,
["E-2D"] = true,
["E-2C"] = true,
["E-3A"] = true,
["F-111F"] = true,
["F-117A"] = true,
["F-14A"] = true,
["F-15C"] = true,
["F-15E"] = true,
["F-16A"] = true,
["F-16A MLU"] = true,
["F-16C bl.50"] = true,
["F-16C bl.52d"] = true,
["F-4E"] = true,
["F-5E"] = true,
["F-5E-3"] = true,
["F-86F Sabre"] = true,
["F/A-18A"] = true,
["F/A-18C"] = true,
["FW-190D9"] = true,
["Hawk"] = true,
["IL-76MD"] = true,
["IL-78M"] = true,
["KC-135"] = true,
["Ka-27"] = true,
["Ka-50"] = true,
["Ka-52"] = true,
["L-39C"] = true,
["L-39ZA"] = true,
["M-2000C"] = true,
["MQ-9 Reaper"] = true,
["Mi-24V"] = true,
["Mi-26"] = true,
["Mi-28N"] = true,
["Mi-8MT"] = true,
["MiG-15bis"] = true,
["MiG-21Bis"] = true,
["MiG-23MLD"] = true,
["MiG-25PD"] = true,
["MiG-25RBT"] = true,
["MiG-27K"] = true,
["MiG-29A"] = true,
["MiG-29G"] = true,
["MiG-29K"] = true,
["MiG-29S"] = true,
["MiG-31"] = true,
["Mirage 2000-5"] = true,
["OH-58D"] = true,
["P-51D"] = true,
["RQ-1A Predator"] = true,
["S-3B"] = true,
["S-3B Tanker"] = true,
["SH-3W"] = true,
["SH-60B"] = true,
["Su-17M4"] = true,
["Su-24M"] = true,
["Su-24MR"] = true,
["Su-25"] = true,
["Su-25T"] = true,
["Su-25TM"] = true,
["Su-27"] = true,
["Su-30"] = true,
["Su-33"] = true,
["Su-34"] = true,
["TF-51D"] = true,
["Tornado GR4"] = true,
["Tornado IDS"] = true,
["Tu-142"] = true,
["Tu-160"] = true,
["Tu-22M3"] = true,
["Tu-95MS"] = true,
["UH-1H"] = true,
["UH-60A"] = true,
["Yak-40"] = true,
}
]]

--SCRIPT INIT
ewrs.currentlyDetectedRedUnits = {}
ewrs.currentlyDetectedBlueUnits = {}
ewrs.redEwrUnits = {}
ewrs.blueEwrUnits = {}
ewrs.activePlayers = {}
ewrs.groupSettings = {}
ewrs.builtF10Menus = {}
ewrs.builtTaskingMenus = {}
--ewrs.builtSuperCarrierMenus = {}
ewrs.notAvailable = 999999

ewrs.update()
if not ewrs.onDemand then
	timer.scheduleFunction(ewrs.displayMessageToAll, nil, timer.getTime() + ewrs.messageUpdateInterval)
end
env.info("EWRS LUA File Loaded ... OK")
--trigger.action.outText("EWRS LUA file loaded...", 10)

--[[
TODO: 
	- Add check on friendly picture to not give one if no AWACS / EWR units are active. Doesn't use radar info anyway. Maybe just leave it to help out people with SA? Feedback Please!!
	- Clean up functions and arguments from bogeyDope and friendly picture additions
	- Threat based filtering if theres interest.
]]
tti_ewrs_script_loaded = true