----------------------- INIT -------------------------------------------------------------
env.info('Enhancer Script LOADING ...')

local evento = {};
enhancer = {};
enhancer.common = {};
enhancer.lase = {};
enhancer.recon = {};
enhancer.strike = {};
enhancer.sead = {};
enhancer.attack = {};
enhancer.sweep = {};

------------------------- CONFIGURATION -------------------------------------------------------------
enhancer.lase.availability = 100; -- chance of lase support available in the mission. 0 = no available at all; 1 - 99 = % availability; 100% = always available
enhancer.lase.waitTime = 300; -- time in seconds between request a lase support and the lase support became available to use
enhancer.recon.availability = 100;-- chance of recon support available in the mission. 0 = no available at all; 1 - 99 = % availability; 100% = always available
enhancer.recon.waitTime = 300;-- time in seconds between request a recon support and the recon support become available to use
enhancer.strike.availability = 100;-- chance of strike support available in the mission. 0 = no available at all; 1 - 99 = % availability; 100% = always available
enhancer.strike.waitTime = 300;-- time in seconds between request a strike support and the strike support become available to use
enhancer.sead.availability = 100; -- chance of SEAD support available in the mission. 0 = no available at all; 1 - 99 = % availability; 100% = always available
enhancer.sead.waitTime = 300;-- time in seconds between request a SEAD support and the SEAD support became available to use
enhancer.sead.maxRequest = 2; -- max number of SEAD packages available
enhancer.attack.availability = 100;-- chance of ground attack support available in the mission. 0 = no available at all; 1 - 99 = % availability; 100% = always available
enhancer.attack.waitTime = 300;-- time in seconds between request a ground attack support and the ground attack support become available to use
enhancer.attack.maxRequest = 2;-- max number of ground attack packages available
enhancer.sweep.availability = 100;-- chance of fighter sweep support available in the mission. 0 = no available at all; 1 - 99 = % availability; 100% = always available
enhancer.sweep.waitTime = 300;-- time in seconds between request a fighter sweep support and the fighter sweep support become available to use
enhancer.sweep.maxRequest = 2; -- max number of fighter sweep packages available



----------------------- VARIABLES -------------------------------------------------------------
enhancer.common.RPPos = nil;
enhancer.common.TakeOff = nil;
enhancer.lase.laserPos = nil;
enhancer.lase.laserCode = nil;
enhancer.lase.laserSpot = nil;
enhancer.lase.reaperInProgress = false;
enhancer.lase.reaperInOA = false;
enhancer.lase.isLaseAvailable = false;
enhancer.recon.satellitePos = nil;
enhancer.recon.satelliteInProgress = false;
enhancer.recon.satelliteInOA = false;
enhancer.recon.isSatelliteAvailable = false;
enhancer.strike.herculesPos = nil;
enhancer.strike.herculesInProgress = false;
enhancer.strike.herculesInOA = false;
enhancer.strike.isHerculesAvailable = false;
enhancer.sead.samList = "SNR_75V;TOR 9A331;2S6 TUNGUSKA;55G6 EWR;1L13 EWR;S-300PS 54K6 CP;S-300PS 64H6E SR;DOG EAR RADAR;SA-11 BUK CC 9S470M1;S-300PS 40B6M TR;S-300PS 40B6MD SR; SA-11 BUK SR 9S18M1;STRELA-10M3;M48 CHAPARRAL;M1097 AVENGER;HQ-7_STR_SP;HAWK TR;HAWK SR;HAWK CWAR;PATRIOT ECS;PATRIOT AMG;NASAMS_RADAR_MPQ64F1;PATRIOT STR;RAPIER_FSA_BLINDFIRE_RADAR;RAPIER_FSA_OPTICAL_TRACKER_UNIT;P-19 S-125 SR;SNR S-125 TR;ROLAND RADAR;OSA 9A33 LN;KUB 1S1 STR;RPC 5N62V";
enhancer.sead.targetPos = nil;
enhancer.sead.packageInProgress = false;
enhancer.sead.packageInOA = false;
enhancer.sead.isPackageAvailable = false;
enhancer.sead.packageName = nil;
enhancer.sead.targetGroupName = nil;
enhancer.sead.currentRequest = 0;
enhancer.attack.targetPos = nil;
enhancer.attack.packageInProgress = false;
enhancer.attack.packageInOA = false;
enhancer.attack.isPackageAvailable = false;
enhancer.attack.packageName = nil;
enhancer.attack.targetGroupName = nil;
enhancer.attack.currentRequest = 0;
enhancer.sweep.targetPos = nil;
enhancer.sweep.packageInProgress = false;
enhancer.sweep.packageInOA = false;
enhancer.sweep.isPackageAvailable = false;
enhancer.sweep.packageName = nil;
enhancer.sweep.targetGroupName = nil;
enhancer.sweep.currentRequest = 0;


----------------------- FUNCTIONS ----------------------------------------------------------------------
function evento:onEvent(event)
	if (world.event.S_EVENT_MARK_CHANGE == event.id) then	
		if (string.match(event.text, "DO_LASE;")) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				if enhancer.lase.laserSpot ~= nil then
					--trigger.action.outText("Laser destruido", 15, false)						
					enhancer.lase.laserSpot:destroy()
					enhancer.lase.laserSpot = nil
				end
			
				local index1 = string.find(event.text, ";", 0)
				enhancer.lase.laserCode = enhancer.trim(string.sub(event.text, index1 + 1, string.len(event.text)))			
				enhancer.lase.laserPos = event.pos
				--trigger.action.outText("Target for laser; X: " .. enhancer.lase.laserPos.x .. "; Y: " .. enhancer.lase.laserPos.y .. "; Z: " .. enhancer.lase.laserPos.z, 20, 0)			
				if enhancer.lase.laserPos ~= nil and enhancer.lase.laserCode ~= nil and enhancer.lase.laserCode ~= "" and enhancer.isInteger(enhancer.lase.laserCode) then		 				
					trigger.action.outText("You can request lasing on target now. Code: " .. enhancer.lase.laserCode, 10, false)
					trigger.action.outSound("Enhancer Soundfiles/enhancer_Beep.ogg")
				else
					trigger.action.outText("Target for laser not created. Wrong mark format. Check documentation", 10, false)
					trigger.action.outSound("Enhancer Soundfiles/enhancer_IncorrectBeep.ogg")
				end
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers
			
		elseif (string.match(event.text, "DO_RECON")) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				enhancer.recon.satellitePos = event.pos
				trigger.action.outText("You can request recon on target now.", 10, false)
				trigger.action.outSound("Enhancer Soundfiles/enhancer_Beep.ogg")
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers
		elseif (string.match(event.text, "DO_STRIKE")) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				enhancer.strike.herculesPos = event.pos
				trigger.action.outText("You can request strike on target now.", 10, false)
				trigger.action.outSound("Enhancer Soundfiles/enhancer_Beep.ogg")
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers
		elseif (string.match(event.text, "DO_RP")) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				enhancer.common.RPPos = event.pos
				trigger.action.outText("Rally Point for support packages has been established.", 10, false)
				trigger.action.outSound("Enhancer Soundfiles/enhancer_Beep.ogg")
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers	
		elseif (string.match(event.text, "DO_SEAD")) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				enhancer.sead.targetPos = event.pos
				trigger.action.outText("Target area for SEAD packages has been established.", 10, false)
				trigger.action.outSound("Enhancer Soundfiles/enhancer_Beep.ogg")
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers
		elseif (string.match(event.text, "DO_ATTACK")) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				enhancer.attack.targetPos = event.pos
				trigger.action.outText("Target area for Ground Attack packages has been established.", 10, false)
				trigger.action.outSound("Enhancer Soundfiles/enhancer_Beep.ogg")
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers
		elseif (string.match(event.text, "DO_SWEEP")) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				enhancer.sweep.targetPos = event.pos
				trigger.action.outText("Target area for fighter sweep has been established.", 10, false)
				trigger.action.outSound("Enhancer Soundfiles/enhancer_Beep.ogg")
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers
		elseif (string.match(event.text, "DO_TAKEOFF")) then
			if coalition.getPlayers(coalition.side.RED)[1] ~= nil or coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
				enhancer.common.TakeOff = event.pos
				trigger.action.outText("Take off Airbase for support packages has been established.", 10, false)
				trigger.action.outSound("Enhancer Soundfiles/enhancer_Beep.ogg")
			else
				trigger.action.outText("There is no player in the mission. Can't request support", 10, false)	
			end	 -- fin coalition.getPlayers
		end --fin event.text
	elseif (world.event.S_EVENT_MARK_REMOVED == event.id) then	 ----------------------------------------------------------------------------------			
		if event.text  == "DO_TAKEOFF" then
			trigger.action.outText("INFO: Take off mark has been deleted", 10, false)	
			trigger.action.outSound("Enhancer Soundfiles/enhancer_Beep.ogg")
			enhancer.common.TakeOff = nil
		end
	elseif (world.event.S_EVENT_UNIT_LOST == event.id) then	 ----------------------------------------------------------------------------------		
		
		if event.initiator ~= nil and event.initiator:getCategory() == Object.Category.UNIT  and event.initiator:getGroup() ~= nil and event.initiator:getGroup():getName() == enhancer.sead.packageName 
			and #Group.getByName(enhancer.sead.packageName):getUnits() == 1 then
			--trigger.action.outText("SEAD muertos" , 20, false)
			N41 = missionCommands.addCommand('Request SEAD package', N4, enhancer.requestSEAD, nil)	
			missionCommands.removeItem(N42)	
			missionCommands.removeItem(N43)
			enhancer.sead.packageInProgress = false;
			enhancer.sead.packageInOA = false;
			enhancer.sead.packageName = nil;
			enhancer.sead.targetGroupName = nil;				
		end
		
		if event.initiator ~= nil and event.initiator:getCategory() == Object.Category.UNIT and event.initiator:getGroup() ~= nil and event.initiator:getGroup():getName() == enhancer.attack.packageName 
			and #Group.getByName(enhancer.attack.packageName):getUnits() == 1 then
			--trigger.action.outText("Ground Attack muertos" , 20, false)
			N51 = missionCommands.addCommand('Request Ground Attack package', N5, enhancer.requestGrAttack, nil)	
			missionCommands.removeItem(N52)	
			missionCommands.removeItem(N53)	
			enhancer.attack.packageInProgress = false;
			enhancer.attack.packageInOA = false;
			enhancer.attack.packageName = nil;
			enhancer.attack.targetGroupName = nil;				
		end
		
		if event.initiator ~= nil and event.initiator:getCategory() == Object.Category.UNIT and event.initiator:getGroup() ~= nil and event.initiator:getGroup():getName() == enhancer.sweep.packageName 
			and #Group.getByName(enhancer.sweep.packageName):getUnits() == 1 then
			--trigger.action.outText("Sweep muertos" , 20, false)
			N61 = missionCommands.addCommand('Request Fighter Sweep package', N6, enhancer.requestFighterSweep, nil)	
			missionCommands.removeItem(N62)	
			missionCommands.removeItem(N63)	
			enhancer.sweep.packageInProgress = false;
			enhancer.sweep.packageInOA = false;
			enhancer.sweep.packageName = nil;
			enhancer.sweep.targetGroupName = nil;				
		end		
--	elseif (world.event.S_EVENT_TAKEOFF == event.id) then	 ----------------------------------------------------------------------------------		
--		if event.initiator:getCategory() == Object.Category.UNIT
--			and (event.initiator:getGroup():getName() == enhancer.attack.packageName 
--			or event.initiator:getGroup():getName() == enhancer.sead.packageName
--			or event.initiator:getGroup():getName() == enhancer.sweep.packageName) then
--				
--					--trigger.action.outText("despega" , 20, false)
--					local orbit = {
--						   id = 'Orbit', 
--							 params = { 
--							   pattern = 'Circle',
--							   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
--							   speed = 300,
--							   altitude = 10000,
--						   } 
--						 }
--						 
--					local routePoints = {} 
--																	
--						routePoints[1] = {
--								action = "Fly Over Point",
--								type= "Turning Point",
--								x = event.initiator:getPoint().x + 200,
--								y = event.initiator:getPoint().z + 200,
--								alt = 250,
--								alt_type = "RADIO",
--								speed = 300,
--								ETA = 100,
--								ETA_locked = false,
--								name = "WP1", 
--								task = nil,
--								}	
--					
--						routePoints[2] = {
--								action = "Fly Over Point",
--								type= "Turning Point",
--								x = enhancer.common.RPPos.x,
--								y = enhancer.common.RPPos.z,
--								alt = 10000,
--								alt_type = "BARO",
--								speed = 300,
--								ETA = 100,
--								ETA_locked = false,
--								name = "WP2", 
--								task = orbit,
--								}
--						
--					--trigger.action.markToAll(2, "Destination point", {x = xDestiny, y = 0, z = yDestiny})
--					
--					
--					local _mission = { 
--						id = 'Mission', 
--						params = { 
--							airborne = true,
--							route = { 
--								points = routePoints
--							}, 
--						} 
--					}							 
--					 
--					local _controller = event.initiator:getController()		
--							
--					--_controller:pushTask(orbit)	
--					--trigger.action.outText("asignada ruta" , 20, false)
--			end --event.initiator:getName() 		
	end -- world.event.S_EVENT_MARK_CHANGE
end;


function enhancer.trim(s)
  return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end


function enhancer.isInteger(str)
  return not (str == "" or str:match("%D"))
end


function enhancer.getDistancePointPoint(point1, point2)	
	-- la distancia devuelta es en Km
	if point1 ~= nil and point2 ~= nil then
		local distance = math.abs(((point1.x  - point2.x)^2 + (point1.y  - point2.y)^2)^(0.5))
		--trigger.action.outText("distancia entre puntos: " .. distance, 5)
		return distance
	else
		return 100000000000000
	end
	
end


function enhancer.getHeading(unit)
	if unit ~= nil then
		local pos = unit:getPosition()
		if pos then
			local Heading = math.atan2(pos.x.z, pos.x.x)			
			if Heading < 0 then
				Heading = Heading + 2*math.pi
			end
			return Heading
		end
	else 
			return 0
	end
end


function enhancer.getCoordinatesSTR(decLat, decLong)	
	local lat1, latF1 = math.modf(decLat)
	local latF2, latF3 = math.modf(latF1 * 60)
	
	local long1, longF1 = math.modf(decLong)
	local longF2, longF3 = math.modf(longF1 * 60)
	
	return {lat = string.format("%02d", lat1) .. "º " .. string.format("%02d",latF2) .. "' " .. string.format("%02d",math.floor(latF3 * 60)) .. "''N", 
					long = string.format("%02d", long1) .. "º " .. string.format("%02d",longF2) .. "' " .. string.format("%02d",math.floor(longF3 * 60)) .. "''E"}	
end


function enhancer.showMessage(parameters)	
	trigger.action.outText(parameters.ptext, parameters.pduration, parameters.pclear)		
end


function enhancer.setMessageDelayed(text, duration, delaySec, clear)
	if clear == nil or clear == false then
        clear = false
	else
		clear = true
    end
	
	timer.scheduleFunction(enhancer.showMessage, {ptext = text, pduration = duration, pclear = clear}, timer.getTime() + delaySec)	
end


function enhancer.setSoundDelayed(sound, delaySec)
	timer.scheduleFunction(enhancer.playSound, {psound = sound}, timer.getTime() + delaySec)
end


function enhancer.playSound(parameters)
	trigger.action.outSound(parameters.psound)		
end


function enhancer.getNearestAirBase(point)
	--trigger.action.outText("getNearestAirBase", 30, false)
	local playerCoalition = nil
	if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
		playerCoalition = coalition.side.RED
	elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
		playerCoalition = coalition.side.BLUE
	end
	
	local FoundBases = coalition.getAirbases(playerCoalition)
	
	if #FoundBases == 0 then
		FoundBases = coalition.getAirbases(coalition.side.NEUTRAL)
	end
	
	local Mindistance = 100000000
	local distance = 0				
	local nearestBase = nil
	
	for i = 1, #FoundBases do
		--trigger.action.outText(enhancer.sead.targetPos.x .. ";" .. enhancer.sead.targetPos.y ..  ";" .. enhancer.sead.targetPos.z, 30, false)
		--trigger.action.outText(FoundBases[i]:getPoint().x .. ";" .. FoundBases[i]:getPoint().y .. ";" .. FoundBases[i]:getPoint().z, 30, false)
		--trigger.action.outText("distance " .. distance, 30, false)
		
		distance = enhancer.getDistancePointPoint({x = point.x, y = point.z}, {x = FoundBases[i]:getPoint().x, y = FoundBases[i]:getPoint().z})
		if distance < Mindistance then
			nearestBase = FoundBases[i]
			Mindistance = distance
			--trigger.action.outText("new nearest base " .. nearestBase:getName(), 30, false)					
		end		
	end	 --end for
	
	return nearestBase
end;


function enhancer.searchGrTargets(pPoint, pRadius, pType)
	local foundUnits = {}
	local volS = {
	   id = world.VolumeType.SPHERE,
	   params = {
		 point = pPoint,
		 radius = pRadius
	   }
	 }
	 	  
	 local ifFound = function(foundItem, val)
				--trigger.action.outText("something found", 15, true)
				local playerCoalition = coalition.side.BLUE							
					if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
						playerCoalition = coalition.side.RED
					elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
						playerCoalition = coalition.side.BLUE
				end
				if foundItem:inAir() ~= true and foundItem:getCoalition() ~= playerCoalition and foundItem:getLife() > 0 then				
					foundUnits[#foundUnits + 1] = foundItem				
				end
				return true
			end
	
	world.searchObjects(pType, volS, ifFound)
	--trigger.action.outText(foundUnits[1]:getName(), 15, true)						
	return foundUnits
	--Object.Category.UNIT
end;


function enhancer.searchSatelliteTargets(pPoint, pRadius, pType)
	local foundUnits = {}
	local volS = {
	   id = world.VolumeType.SPHERE,
	   params = {
		 point = pPoint,
		 radius = pRadius
	   }
	 }
	 	  
	 local ifFound = function(foundItem, val)
				--trigger.action.outText("something found", 15, true)
				local playerCoalition = coalition.side.BLUE							
					if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
						playerCoalition = coalition.side.RED
					elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
						playerCoalition = coalition.side.BLUE
				end
				if foundItem:inAir() ~= true and foundItem:getCoalition() ~= playerCoalition and foundItem:getLife() > 0 then				
					foundUnits[#foundUnits + 1] = foundItem				
				end
				return true
			end
	
	world.searchObjects(pType, volS, ifFound)
	--trigger.action.outText(foundUnits[1]:getName(), 15, true)						
	return foundUnits
	--Object.Category.UNIT
end;


function enhancer.searchAircraft(pPoint, pRadius, pType)
	local foundUnits = {}
	local volS = {
	   id = world.VolumeType.SPHERE,
	   params = {
		 point = pPoint,
		 radius = pRadius
	   }
	 }
	 	  
	 local ifFound = function(foundItem, val)
				--trigger.action.outText("something found", 15, true)
				local playerCoalition = coalition.side.BLUE							
					if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
						playerCoalition = coalition.side.RED
					elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
						playerCoalition = coalition.side.BLUE
				end
				if #foundUnits == 0 and foundItem:inAir() == true and foundItem:getCoalition() ~= playerCoalition and foundItem:getLife() > 0 then
					foundUnits[#foundUnits + 1] = foundItem				
					--trigger.action.outText("unit selected: " .. foundUnits[1]:getName(), 15, true)
				end
				return true
			end
	
	world.searchObjects(pType, volS, ifFound)
--	trigger.action.outText(foundUnits[1]:getName(), 15, true)						
	return foundUnits
	--Object.Category.UNIT
end;


function enhancer.searchSAMObjects(pPoint, pRadius, pType)
	local foundUnits = {}
	local volS = {
	   id = world.VolumeType.SPHERE,
	   params = {
		 point = pPoint,
		 radius = pRadius
	   }
	 }
	 	  
	 local ifFound = function(foundItem, val)	
		if foundItem:inAir() ~= true then
			--trigger.action.outText(foundItem:getName() .. " is target type " .. string.upper(foundItem:getTypeName()), 15, false)
			
			local sams = string.upper(enhancer.sead.samList:gsub("-",""):gsub(" ",""):gsub("_",""))
			local tipo = string.upper(foundItem:getTypeName():gsub("-",""):gsub(" ",""):gsub("_",""))			
			--trigger.action.outText(sams, 15, false)		
			--trigger.action.outText(foundItem:getTypeName() .. " " .. foundItem:getGroup():getName(), 15, false)				
			local playerCoalition = coalition.side.BLUE
				if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
					playerCoalition = coalition.side.RED
				elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
					playerCoalition = coalition.side.BLUE
			end
			
			if string.match(sams, tipo) and foundItem:getCoalition() ~= playerCoalition and foundItem:getLife() > 0 then		
				foundUnits[#foundUnits + 1] = foundItem	
				--trigger.action.outText("Nuevo Objetivo encontrado " .. foundItem:getTypeName() .. " " .. foundItem:getGroup():getName() .. "; vida: " .. foundItem:getLife(), 15, false)
			end
			
		end-- foundItem:inAir()
		return true
	 end --end funtion ifFound
						
	world.searchObjects(pType, volS, ifFound)
	--trigger.action.outText(foundUnits[1]:getName(), 15, true)						
	return foundUnits
	--Object.Category.UNIT
end;


function removeRadioSilent(controller) 
	controller:setOption( AI.Option.Air.id.SILENCE, false )
end;


function enhancer.requestLaser()	
		if enhancer.lase.laserPos ~= nil and enhancer.lase.laserCode ~= nil then		
			enhancer.setMessageDelayed("PLAYER: Requesting current target painted. Copy following coordinates: ", 7, 1, true)
			enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_PLAYER_ReqPaint.ogg", 1)
			local lat, long, alt = coord.LOtoLL(enhancer.lase.laserPos)		
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)
			enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 7, 1, false)			
			if enhancer.isLaseAvailable == true then
				if (enhancer.lase.reaperInOA == false and enhancer.lase.reaperInProgress == false) then			
					timer.scheduleFunction(enhancer.createLaserDelayed, nil, timer.getTime() + enhancer.lase.waitTime)
					enhancer.setMessageDelayed("COMMAND: Copied, sending Reaper drone to the OA.", 10, 12, true)
					enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_SendDrone.ogg", 12)
					enhancer.setMessageDelayed("INFO: Total ETA for drone " .. enhancer.lase.waitTime .." secs", 10, 12, false)
					enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 60, 12, false)			
					enhancer.lase.reaperInProgress = true;
				elseif (enhancer.lase.reaperInOA == false and enhancer.lase.reaperInProgress == true) then
					enhancer.setMessageDelayed("COMMAND: Negative, MQ-9 Reaper is on its way yet.", 10, 12, true)
					enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_NegativeDrone.ogg", 12)
				else
					timer.scheduleFunction(enhancer.createLaserDelayed, nil, timer.getTime() + 10)			
				end --fin enhancer.lase.reaperInOA
			else
				enhancer.setMessageDelayed("COMMAND: Negative, there is not support available.", 10, 12, true)
				enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_NegativeSupport.ogg", 12)
			end --fin enhancer.isLaseAvailable	
		else
			trigger.action.outText("INFO: You need to create a mark DO_LASE;XXXX for target in F10 map (where XXXX is the laser code)", 15, true)									
			trigger.action.outSound("Enhancer Soundfiles/enhancer_IncorrectBeep.ogg")	
		end	--fin enhancer.lase.laserPos
end;


function enhancer.stopLaser()	
	if enhancer.lase.reaperInOA == true then
		enhancer.setMessageDelayed("PLAYER: Terminate lasing.", 5, 1, true)	
		enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_PLAYER_TermLase.ogg", 1)		
		if enhancer.lase.laserSpot ~= nil then
			enhancer.setMessageDelayed("RAYMAN 18: Wilco. Terminate lasing.... Laser is now off", 10, 8, true)						
			enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_RAYMAN_LaserOff.ogg", 8)
			enhancer.lase.laserSpot:destroy()
			enhancer.lase.laserSpot = nil	
		else			
			enhancer.setMessageDelayed("RAYMAN 18: Negative. Currently not lasing a target", 10, 8, true)						
			enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_RAYMAN_NoLasing.ogg", 8)
		end
	else
		trigger.action.outText("INFO: There is not a drone in the AO", 15, true)	
		trigger.action.outSound("Enhancer Soundfiles/enhancer_IncorrectBeep.ogg")			
	end	
end;


function enhancer.createLaserDelayed()
	if enhancer.lase.laserSpot ~= nil then
		--trigger.action.outText("Laser destruido", 15, false)						
		enhancer.lase.laserSpot:destroy()
		enhancer.lase.laserSpot = nil
	end	
	enhancer.lase.reaperInOA = true
	enhancer.lase.reaperInProgress = false;
	
	local GroupPosition = nil
	
	local FoundUnits = enhancer.searchSatelliteTargets(enhancer.lase.laserPos, 20, {Object.Category.UNIT, Object.Category.STATIC})
		
	if 	FoundUnits ~= nil and #FoundUnits > 0 then	
		GroupPosition = FoundUnits[1]:getPoint()
		enhancer.setMessageDelayed("INFO: target found " .. FoundUnits[1]:getTypeName(), 20, 3, false)
	else
		GroupPosition = enhancer.lase.laserPos
		enhancer.setMessageDelayed("RAYMAN 18: This is Rayman. Painting your target now.... Laser is now on.", 20, 2, true)
		enhancer.setMessageDelayed("INFO: No target found. Targeting mark point", 20, 3, false)
	end		
	
	if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
		enhancer.lase.laserSpot = Spot.createLaser(coalition.getPlayers(coalition.side.RED)[1], nil, GroupPosition, enhancer.lase.laserCode)
		enhancer.setMessageDelayed("RAYMAN 18: This is Rayman. Painting your target now.... Laser is now on.", 20, 2, true)
		enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_RAYMAN_PaintingTarget.ogg", 2)
	elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
		enhancer.lase.laserSpot = Spot.createLaser(coalition.getPlayers(coalition.side.BLUE)[1], nil, GroupPosition, enhancer.lase.laserCode)	
		enhancer.setMessageDelayed("RAYMAN 18: This is Rayman. Painting your target now.... Laser is now on.", 20, 2, true)
		enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_RAYMAN_PaintingTarget.ogg", 2)
	end
end;	


function enhancer.requestSatellite()	
		if enhancer.recon.satellitePos ~= nil then		
			enhancer.setMessageDelayed("PLAYER: Requesting recon on target. Copy following coordinates: ", 7, 1, true)
			enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_PLAYER_ReqRecon.ogg", 1)	
			local lat, long, alt = coord.LOtoLL(enhancer.recon.satellitePos)		
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)
			enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 7, 1, false)			
			if enhancer.recon.isSatelliteAvailable == true then
				if (enhancer.recon.satelliteInOA == false and enhancer.recon.satelliteInProgress == false) then			
					timer.scheduleFunction(enhancer.createSatelliteDelayed, nil, timer.getTime() + enhancer.recon.waitTime)
					enhancer.setMessageDelayed("COMMAND: Copied, diverting surveillance satellite to OA.", 10, 12, true)
					enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_ReqSatellite.ogg", 12)
					enhancer.setMessageDelayed("INFO: Total ETA for getting satellite in position " .. enhancer.recon.waitTime .." secs", 10, 12, false)
					enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 60, 12, false)			
					enhancer.recon.satelliteInProgress = true;
				elseif (enhancer.recon.satelliteInOA == false and enhancer.recon.satelliteInProgress == true) then
					enhancer.setMessageDelayed("COMMAND: Negative, satellite is on its way yet.", 10, 12, true)
					enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_NegativeSatellite.ogg", 12)
				else
					timer.scheduleFunction(enhancer.createSatelliteDelayed, nil, timer.getTime() + 10)			
				end --fin enhancer.recon.satelliteInOA
			else
				enhancer.setMessageDelayed("COMMAND: Negative, there is not support available.", 10, 12, true)
				enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_NegativeSupport.ogg", 12)
			end --fin enhancer.recon.isSatelliteAvailable	
		else
			trigger.action.outText("INFO: You need to create a mark DO_RECON for target in F10 map", 15, true)						
			trigger.action.outSound("Enhancer Soundfiles/enhancer_IncorrectBeep.ogg")	
		end	--fin enhancer.recon.satellitePos
end;


function enhancer.createSatelliteDelayed()
	-- un radio de 3300 es una triggerzone de radio = 10000 aprox

	enhancer.recon.satelliteInOA = true
	enhancer.recon.satelliteInProgress = false;
	
	local FoundUnits = enhancer.searchSatelliteTargets(enhancer.recon.satellitePos, 5000, {Object.Category.UNIT, Object.Category.STATIC})
		
	local _country = country.id.CJTF_BLUE	
	
	if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
		_country = country.id.CJTF_RED	
	elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
		_country = country.id.CJTF_BLUE	
	end
	
	local nameAllySateliteGroup = "Satelite " .. math.random(9999,99999)				
	
	local GroupPosition = nil
	local tacanUnits = {}
	
	if 	FoundUnits ~= nil and #FoundUnits > 0 then
		GroupPosition = FoundUnits[1]:getPoint()
		enhancer.setMessageDelayed("COMMAND: Recon satellite has found possible targets in the OA.", 20, 2, true)
		enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_SatelliteTargetsFound.ogg", 2)
		enhancer.setMessageDelayed("INFO: Check F10 map to get more info", 20, 2, false)
		local contador = 1
		for i = 1, #FoundUnits do
			local Position = FoundUnits[i]:getPoint()
			local distance = 1000000
			local noTacan = false
			
			for j = 1, #tacanUnits do	
				if tacanUnits[j] ~= nil then
					--trigger.action.outText("hay " .. j .. " de " .. #tacanUnits .. " con i = " .. i, 30, false)					
					
					--trigger.action.outText("objeto encontrado: " .. Position.x .. " " .. Position.z, 30, false)					
					--trigger.action.outText("unidad Tacan " .. j .. ": " .. tacanUnits[j].x .. " " .. tacanUnits[j].y, 30, false)
					--ojo tacan aun no son unidades, tan solo es una tabla a estas alturas. Por eso no se puede usar getPosition, sino que hay que acceder a x e y directamente, ya que son propiedades del objeto contenido.
					-- ademas hay que tener en cuenta que en tacanUnits[j].y, en realidad ya est? la coordenada z, con lo cual comparamos Position.z con objeto.z realmente
					distance = enhancer.getDistancePointPoint({x = Position.x, y = Position.z}, {x = tacanUnits[j].x, y = tacanUnits[j].y})							
					--trigger.action.outText("distance: " .. distance, 30, false)						
					if distance < 1000 then
						noTacan = true
					end
				end	
			end
			
			if noTacan == false then
					tacanUnits[contador] = {
								["alt"] = 0,
								["heading"] = 0,                                        
								["type"] = "TACAN_beacon",
								["psi"] = 0,                                        
								["y"] = Position.z + 20 ,
								["x"] = Position.x + 20,                                        
								["name"] =  "Satellite mark" .. math.random(9999,99999),                                        
								["speed"] = 0,
								["unitId"] =  math.random(9999,99999),                                        
								["skill"] = "High",
							} -- end of [i]
					contador = contador + 1			
					--trigger.action.outText("contador: " .. contador, 30, false)						
			end --noTacan
		end --for
	else
		-- si no encuentra nada, crea el tacan en la propia marca
		enhancer.setMessageDelayed("COMMAND: Recon satellite has not found relevant information in the OA.", 20, 2, true)						
		enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_SatelliteNotFound.ogg", 2)
		GroupPosition = enhancer.recon.satellitePos
		tacanUnits[1] = {
								["alt"] = 0,
								["heading"] = 0,                                        
								["type"] = "TACAN_beacon",
								["psi"] = 0,                                        
								["y"] = GroupPosition.z ,
								["x"] = GroupPosition.x,                                        
								["name"] =  "Satellite mark" .. math.random(9999,99999),                                        
								["speed"] = 0,
								["unitId"] =  math.random(9999,99999),                                        
								["skill"] = "High",
							} -- end of [1]
	end --#FoundUnits ~= nil and FoundUnits > 0
	
	local _tacandata =     {
								["modulation"] = 0,
								["tasks"] = 
								{
								}, -- end of ["tasks"]
								["task"] = "",
								["uncontrolled"] = false,
								["groupId"] = 500 + math.random(1, 1000),
								["hidden"] = false,
								["units"] = tacanUnits,											
								["y"] = GroupPosition.z + 20,
								["x"] = GroupPosition.x + 20,
								["name"] = nameAllySateliteGroup,                                         
								["communication"] = true,
								["start_time"] = 0,
								["frequency"] = 124,
					}
					
					
	local SetInvisible = { 
		id = 'SetInvisible', 
		params = { 
			value = true 
			} 
		}
		
	local SetImmortal = { 
	id = 'SetImmortal', 
	params = { 
		value = true 
		} 
	}	
	
	coalition.addGroup(_country, Group.Category.GROUND, _tacandata)
	
	local allySateliteController = Group.getByName(nameAllySateliteGroup):getController()
	allySateliteController:setCommand(SetInvisible)
	allySateliteController:setCommand(SetImmortal)				
end;


function enhancer.requestStrike()	
		if enhancer.strike.herculesPos ~= nil then		
			enhancer.setMessageDelayed("PLAYER: Requesting strike on target. Copy following coordinates: ", 7, 1, true)
			enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_PLAYER_ReqStrike.ogg", 1)	
			local lat, long, alt = coord.LOtoLL(enhancer.strike.herculesPos)		
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)
			enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 7, 1, false)			
			if enhancer.strike.isHerculesAvailable == true then
				if (enhancer.strike.herculesInOA == false and enhancer.strike.herculesInProgress == false) then			
					timer.scheduleFunction(enhancer.setStrike, nil, timer.getTime() + enhancer.strike.waitTime)
					enhancer.setMessageDelayed("COMMAND: Copied, sending AC-130U strike package to OA.", 10, 12, true)
					enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_ReqStrike.ogg", 12)
					enhancer.setMessageDelayed("INFO: Total ETA for AC-130U gunship in position " .. enhancer.strike.waitTime .." secs", 10, 12, false)
					enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 60, 12, false)			
					enhancer.strike.herculesInProgress = true;
				elseif (enhancer.strike.herculesInOA == false and enhancer.strike.herculesInProgress == true) then
					enhancer.setMessageDelayed("COMMAND: Negative, strike package is on its way yet.", 10, 12, true)
					enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_NegativeStrike.ogg", 12)
				else
					timer.scheduleFunction(enhancer.setStrike, nil, timer.getTime() + 10)			
				end --fin enhancer.strike.herculesInOA
			else
				enhancer.setMessageDelayed("COMMAND: Negative, there is not support available.", 10, 12, true)
				enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_NegativeSupport.ogg", 12)
			end --fin enhancer.strike.isHerculesAvailable	
		else
			trigger.action.outText("INFO: You need to create a mark DO_STRIKE for target in F10 map", 15, true)						
			trigger.action.outSound("Enhancer Soundfiles/enhancer_IncorrectBeep.ogg")	
		end	--fin enhancer.strike.herculesPos
end;

	
function enhancer.setStrike()
	enhancer.setMessageDelayed("SPOOKY 25: This is Spooky 25. Requesting confirmation for strike with 105mm cannons.", 8, 1, true)
	enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_SPOOKY_RequestConfirm.ogg", 1)
	enhancer.setMessageDelayed("PLAYER: Spooky 25. Confirmed. Give them hell.", 10, 10, true)
	enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_PLAYER_GiveHell.ogg", 10)	
	enhancer.setMessageDelayed("SPOOKY 25: Commencing.", 10, 17, true)
	enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_SPOOKY_Commencing.ogg", 17)
	enhancer.strike.herculesInOA = true;
	enhancer.strike.herculesInProgress = false;
	for i = 20, 40 do
		timer.scheduleFunction(enhancer.setExplosionDelayed, nil, timer.getTime() + i)			
	end
end;
	

function enhancer.setExplosionDelayed()	
	--trigger.action.outText("PUM1: " .. enhancer.lase.laserPos.x, 15, true)	
	trigger.action.explosion({x = enhancer.strike.herculesPos.x + math.random(-30,30), y = enhancer.strike.herculesPos.y, z = enhancer.strike.herculesPos.z  + math.random(-30,30)}, math.random(50,200))
	--trigger.action.outText("PUM2", 15, false)						
end;


function enhancer.requestSEAD()	
		if enhancer.common.RPPos ~= nil then		
			enhancer.setMessageDelayed("PLAYER: Requesting SEAD support package. Copy following coordinates for Rally Point: ", 7, 1, true)
			enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_PLAYER_ReqSEAD.ogg", 1)	
			local lat, long, alt = coord.LOtoLL(enhancer.common.RPPos)		
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)
			enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 7, 1, false)			
			if enhancer.sead.isPackageAvailable == true and enhancer.sead.currentRequest < enhancer.sead.maxRequest then
				if (enhancer.sead.packageInOA == false and enhancer.sead.packageInProgress == false) then								
					enhancer.setMessageDelayed("COMMAND: Copied, sending SEAD package to OA.", 10, 12, true)
					enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_ReqSEAD.ogg", 12)					
					if enhancer.common.TakeOff ~= nil then
						enhancer.createSEADGroup()
					else			
						timer.scheduleFunction(enhancer.createSEADGroup, nil, timer.getTime() + enhancer.sead.waitTime)					
						enhancer.setMessageDelayed("INFO: Total ETA for SEAD package in position " .. enhancer.sead.waitTime .." secs", 10, 12, false)						
						enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 60, 12, false)
					end					
					enhancer.sead.currentRequest = 	enhancer.sead.currentRequest + 1
					enhancer.sead.packageInProgress = true
				elseif (enhancer.sead.packageInOA == false and enhancer.sead.packageInProgress == true) then
					enhancer.setMessageDelayed("COMMAND: Negative, SEAD package is on its way yet.", 10, 12, true)
					enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_NegSEAD1.ogg", 12)
				else
					enhancer.setMessageDelayed("COMMAND: Negative, SEAD package is already in the OA.", 10, 12, true)			
					enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_NegSEAD2.ogg", 12)
				end --fin enhancer.sead.packageInOA
			else
				enhancer.setMessageDelayed("COMMAND: Negative, there is not support available.", 10, 12, true)
				enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_NegativeSupport.ogg", 12)
			end --fin enhancer.sead.isPackageAvailable
		else
			trigger.action.outText("INFO: You need to create a mark DO_RP for Rally Point in F10 map", 15, true)						
			trigger.action.outSound("Enhancer Soundfiles/enhancer_IncorrectBeep.ogg")	
		end	--fin enhancer.common.RPPos
end;


function enhancer.createSEADGroup()
		--trigger.action.outText("createSEADGroup", 10) 		
		enhancer.sead.packageName = "SEAD package" ..math.random(9999,99999)		
		
		local xAlly = enhancer.common.RPPos.x 
		local yAlly = enhancer.common.RPPos.z
		
		local airBase = nil
			
		if enhancer.common.TakeOff ~= nil then
			xAlly = enhancer.common.TakeOff.x 
			yAlly = enhancer.common.TakeOff.z
			airBase = enhancer.getNearestAirBase(enhancer.common.TakeOff)
			--trigger.action.outText("Despegando de " .. airBase:getName(), 15)
		end
			
		local _airtype = "FA-18C_hornet"
		
		local _player = nil
		local _country = country.id.CJTF_BLUE
		
		if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
			_player = coalition.getPlayers(coalition.side.RED)[1]
			_country = country.id.CJTF_RED	
		elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
			_player = coalition.getPlayers(coalition.side.BLUE)[1]
			_country = country.id.CJTF_BLUE	
		end
		
		local heading = enhancer.getHeading(_player)
		
		if heading == nil then
			heading = math.random(256)
		end
		
		local _payload = nil
		
		_payload =  {
                           ["pylons"] = 
                           {
                               [1] = 
                               {
                                   ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
                               }, -- end of [1]
                               [2] = 
                               {
                                   ["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
                               }, -- end of [2]
                               [3] = 
                               {
                                   ["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
                               }, -- end of [3]
                               [4] = 
                               {
                                   ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                               }, -- end of [4]
                               [5] = 
                               {
                                   ["CLSID"] = "{CBU_99}",
                               }, -- end of [5]
                               [6] = 
                               {
                                   ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                               }, -- end of [6]
                               [7] = 
                               {
                                   ["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
                               }, -- end of [7]
                               [8] = 
                               {
                                   ["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
                               }, -- end of [8]
                               [9] = 
                               {
                                   ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
                               }, -- end of [9]
                           }, -- end of ["pylons"]
                           ["fuel"] = "6103",
                           ["flare"] = 60,
                           ["ammo_type"] = 1,
                           ["chaff"] = 60,
                           ["gun"] = 100,
                    } -- end of ["payload"]
        
            
		local _allyData =     {								
                                ["modulation"] = 0,                                
                                ["uncontrolled"] = false,
                                ["groupId"] = math.random(9999,99999),
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 8000,
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = yAlly,
                                        ["x"] = xAlly,
										["payload"] = _payload,                                        
                                        ["name"] =  "SEAD package unit" .. math.random(9999,99999),                                        
                                        ["speed"] = 350,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "High",
                                    }, -- end of [1]
								[2] = 
                                    {
                                        ["alt"] = 8000,
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = yAlly,
                                        ["x"] = xAlly - 50,                                        
										["payload"] = _payload,
                                        ["name"] =  "SEAD package unit" .. math.random(9999,99999),                                        
                                        ["speed"] = 350,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "High",
									}, -- end of [2]																
                                }, -- end of ["units"]
                                ["y"] = yAlly,
                                ["x"] = xAlly,
                                ["name"] =  enhancer.sead.packageName,
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["frequency"] = 117.5,
								["task"] = "SEAD",
								["taskSelected"] = true,
                    }
            
			
			if enhancer.common.TakeOff ~= nil then
			local orbit = {
				   id = 'Orbit', 
					 params = { 
					   pattern = 'Circle',
					   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
					   speed = 300,
					   altitude = 10000,
				   } 
				 }
		
			_allyData["route"] = 
                                {
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 0,
                                            ["type"] = "TakeOffParking",
                                            ["action"] = "From Parking Area",
                                            ["alt_type"] = "RADIO",
                                            ["formation_template"] = "",
                                            ["ETA"] = 0,
											["airdromeId"] = airBase:getID(),
                                            ["y"] = yAlly,
                                            ["x"] = xAlly,
                                            ["speed"] = 0,
                                            ["ETA_locked"] = true,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                       
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["speed_locked"] = true,
                                        }, -- end of [1]										
										[2] = 
                                        {
                                            ["alt"] = 10000,
                                            ["type"] = "WP2",                                                                                                                                    
                                            ["ETA"] = 100,											
                                            ["y"] = enhancer.common.RPPos.z,
                                            ["x"] = enhancer.common.RPPos.x,
                                            ["speed"] = 350,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = {orbit}, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]     
                                        }, -- end of [2]
                                    }, -- end of ["points"]
                                } -- end of ["route"]
		end		
                    
			coalition.addGroup(_country, Group.Category.AIRPLANE, _allyData)			
			 
			 local SetCallsign = { 
				  id = 'SetCallsign', 
				  params = { 
					callname = 3, 
					number = 8, 
				  } 
				}
			
			local _controller = Group.getByName(enhancer.sead.packageName):getController()			
			
			_controller:setOption( AI.Option.Air.id.PROHIBIT_WP_PASS_REPORT, true )
			_controller:setOption( AI.Option.Air.id.SILENCE, true )		
			_controller:setOption( AI.Option.Air.id.RTB_ON_BINGO, true )
			_controller:setOption( AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE )
			
			_controller:setCommand(SetCallsign)
			
			
			
			if enhancer.common.TakeOff == nil then
			local orbit = {
				   id = 'Orbit', 
					 params = { 
					   pattern = 'Circle',
					   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
					   speed = 100,
					   altitude = 10000,
				   } 
				 }
			_controller:pushTask(orbit)
			enhancer.setMessageDelayed("UZI 8: We are in RP area. Waiting for further instructions.", 15, 2, true)
			enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_UZI_inRP.ogg", 2)
			enhancer.setMessageDelayed("INFO: You can request SEAD on target mark using F10 --> Enhance menu --> SEAD...", 15, 2, false)	
		else
			local lat, long, alt = coord.LOtoLL(enhancer.common.RPPos)		
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)			
			enhancer.setMessageDelayed("UZI 8: Checking 2 hornets for SEAD mission. Proceeding to RP at following coordinates:", 15, 25, true)
			enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_UZI_checkIn.ogg", 25)
			enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 60, 25, false)
		end
				
			timer.scheduleFunction(removeRadioSilent, _controller, timer.getTime() + 5)					
			
			enhancer.sead.packageInOA = true;
			enhancer.sead.packageInProgress = false;
			N42 = missionCommands.addCommand('Push SEAD package', N4, enhancer.setSEAD, nil)				
			missionCommands.removeItem(N41)
								
end

	
function enhancer.setSEAD()	
		--Group.getByName(enhancer.sead.packageName):destroy()
		
		if enhancer.sead.targetPos ~= nil then			
								
			enhancer.setMessageDelayed("PLAYER: Begin SEAD mission.", 8, 2, true)
			enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_PLAYER_BeginSEAD.ogg", 2)		
			
			local FoundUnits = enhancer.searchSAMObjects(enhancer.sead.targetPos, 14500, Object.Category.UNIT)
			
			if FoundUnits ~= nil and FoundUnits[1] ~= nil then			
				
				enhancer.setMessageDelayed("UZI 8: Wilco, attacking new targets.", 15, 10, true)
				enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_UZI_AttackTargets.ogg", 10)
				
				
				local Mindistance = 100000000
				local distance = 0				
				local nearestUnit = nil
				
				for i = 1, #FoundUnits do
					--trigger.action.outText(enhancer.sead.targetPos.x .. ";" .. enhancer.sead.targetPos.y ..  ";" .. enhancer.sead.targetPos.z, 30, false)
					--trigger.action.outText(FoundUnits[i]:getPoint().x .. ";" .. FoundUnits[i]:getPoint().y .. ";" .. FoundUnits[i]:getPoint().z, 30, false)
					--trigger.action.outText("distance " .. distance, 30, false)
					
					distance = enhancer.getDistancePointPoint({x = enhancer.sead.targetPos.x, y = enhancer.sead.targetPos.z}, {x = FoundUnits[i]:getPoint().x, y = FoundUnits[i]:getPoint().z})
					if distance < Mindistance then
						nearestUnit = FoundUnits[i]
						Mindistance = distance
						--trigger.action.outText("new nearest unit " .. nearestUnit:getTypeName(), 30, false)					
					end
					
				end	
				
				
				enhancer.sead.targetGroupName = nearestUnit:getGroup():getName()
				Group.getByName(enhancer.sead.packageName):getController():setOption( AI.Option.Air.id.SILENCE, true )	
				enhancer.doSEAD(Group.getByName(enhancer.sead.packageName), nearestUnit:getGroup())
				timer.scheduleFunction(removeRadioSilent, Group.getByName(enhancer.sead.packageName):getController(), timer.getTime() + 5)					
			else
				
				enhancer.setMessageDelayed("UZI 8: Negative, I have no enemy spikes near the target area.", 15, 10, true)
				enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_UZI_NoTargets.ogg", 10)
					
			end
		else			
			trigger.action.outText("INFO: You need to create a mark DO_SEAD for target area in F10 map", 15, true)						
			trigger.action.outSound("Enhancer Soundfiles/enhancer_IncorrectBeep.ogg")	
		end	
end;


function enhancer.doSEAD(attackingGroup, objetiveGroup)

		--objetiveGroup = Group.getByName("testSAM")
		--trigger.action.outText("attack_Group: " .. attackingGroup:getName(), 30)    		
		--trigger.action.outText("victim_Group: " .. objetiveGroup:getName(), 30)    		
				
	if objetiveGroup ~= nil then	
				
		local routePoints = {}
		
		local AttackGroup = { 
		  id = 'AttackGroup', 
		  params = { 
			groupId = objetiveGroup:getID(),    
		  } 
		}
		
		
			routePoints[1] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = attackingGroup:getUnit(1):getPoint().x,
					y = attackingGroup:getUnit(1):getPoint().z,
					alt = 5000,
					alt_type = "RADIO",
					speed = 350,
					ETA = 100,
					ETA_locked = false,
					name = "Starting point", 
					task = AttackGroup,
					}	
		
			routePoints[2] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = objetiveGroup:getUnit(1):getPoint().x,
					y = objetiveGroup:getUnit(1):getPoint().z,
					alt = 6000,
					alt_type = "BARO",
					speed = 350,
					ETA = 100,
					ETA_locked = false,
					name = "WP1", 
					task = nil,
					}
				
		local _mission = { 
            id = 'Mission', 
            params = { 
				airborne = true,
                route = { 
                    points = routePoints
                }, 
            } 
        }
		
			
		local _controller = attackingGroup:getController();
		_controller:setOption( AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.WEAPON_FREE )
		_controller:setOption( AI.Option.Air.id.PROHIBIT_WP_PASS_REPORT, true )
		_controller:setOption( AI.Option.Air.id.RTB_ON_BINGO, true )
		_controller:setOption( AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE )
		
		_controller:pushTask(_mission)
		   
		missionCommands.removeItem(N42)
		N43 = missionCommands.addCommand('Cancel SEAD mission', N4, enhancer.cancelSEAD, nil)
		--trigger.action.outText("ataque asignado", 30)	
		
	end --fin objetiveGroup ~= nil
	
end


function enhancer.cancelSEAD()

	enhancer.setMessageDelayed("PLAYER: Cancel SEAD mission and return to RP area.", 8, 2, true)
	enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_PLAYER_CancelSEAD.ogg", 2)

	local _controller = Group.getByName(enhancer.sead.packageName):getController()	
	_controller:setOption( AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.RETURN_FIRE )	
	
	enhancer.setMessageDelayed("UZI 8: WILCO, Cancelling current SEAD mission.", 15, 10, true)
	enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_UZI_CancelSEAD.ogg", 10)
	N42 = missionCommands.addCommand('Push SEAD package', N4, enhancer.setSEAD, nil)				
	missionCommands.removeItem(N43)	
end;


function enhancer.requestGrAttack()	
		if enhancer.common.RPPos ~= nil then		
			enhancer.setMessageDelayed("PLAYER: Requesting Ground Attack support package. Copy following coordinates for Rally Point: ", 7, 1, true)
			enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_PLAYER_ReqAttack.ogg", 1)
			local lat, long, alt = coord.LOtoLL(enhancer.common.RPPos)		
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)
			enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 7, 1, false)			
			if enhancer.attack.isPackageAvailable == true and enhancer.attack.currentRequest < enhancer.attack.maxRequest then
				if (enhancer.attack.packageInOA == false and enhancer.attack.packageInProgress == false) then			
					enhancer.setMessageDelayed("COMMAND: Copied, sending Ground Attack package to OA.", 10, 12, true)
					enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_ReqAttack.ogg", 12)
					if enhancer.common.TakeOff ~= nil then
						enhancer.createGrAttackGroup()
					else
						timer.scheduleFunction(enhancer.createGrAttackGroup, nil, timer.getTime() + enhancer.attack.waitTime)
						enhancer.setMessageDelayed("INFO: Total ETA for Ground Attack package in position " .. enhancer.attack.waitTime .." secs", 10, 12, false)						
						enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 60, 12, false)
					end						
					enhancer.attack.currentRequest = enhancer.attack.currentRequest + 1					
					enhancer.attack.packageInProgress = true
				elseif (enhancer.attack.packageInOA == false and enhancer.attack.packageInProgress == true) then
					enhancer.setMessageDelayed("COMMAND: Negative, Ground Attack package is on its way yet.", 10, 12, true)
					enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_NegAttack1.ogg", 12)
				else
					enhancer.setMessageDelayed("COMMAND: Negative, Ground Attack package is already in the OA.", 10, 12, true)			
					enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_NegAttack2.ogg", 12)
				end --fin enhancer.attack.packageInOA
			else
				enhancer.setMessageDelayed("COMMAND: Negative, there is not support available.", 10, 12, true)
				enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_NegativeSupport.ogg", 12)
			end --fin enhancer.attack.isPackageAvailable
		else
			trigger.action.outText("INFO: You need to create a mark DO_RP for Rally Point in F10 map", 15, true)						
			trigger.action.outSound("Enhancer Soundfiles/enhancer_IncorrectBeep.ogg")	
		end	--fin enhancer.common.RPPos
end;


function enhancer.createGrAttackGroup()
		--trigger.action.outText("createAttackGroup", 10) 		
		enhancer.attack.packageName = "GrAtt package" ..math.random(9999,99999)		
		
		local xAlly = enhancer.common.RPPos.x 
		local yAlly = enhancer.common.RPPos.z
		local airBase = nil
			
		if enhancer.common.TakeOff ~= nil then
			xAlly = enhancer.common.TakeOff.x 
			yAlly = enhancer.common.TakeOff.z
			airBase = enhancer.getNearestAirBase(enhancer.common.TakeOff)
			--trigger.action.outText("Despegando de " .. airBase:getName(), 15)
		end
						
		local _airtype =  "A-10C"		
		
		local _player = nil
		local _country = country.id.CJTF_BLUE
		
		if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
			_player = coalition.getPlayers(coalition.side.RED)[1]
			_country = country.id.CJTF_RED	
		elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
			_player = coalition.getPlayers(coalition.side.BLUE)[1]
			_country = country.id.CJTF_BLUE	
		end
		
		
		local heading = enhancer.getHeading(_player)
		
		if heading == nil then
			heading = math.random(256)
		end
		
		
		local _payload = nil
		_payload = {
				["pylons"] =
				{	[1] =
					{	
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [1]			
					[2] =
					{	
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [2]			
					[3] =
					{
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [3]			
					[4] =
					{
					["CLSID"] = "{69926055-0DA8-4530-9F2F-C86B157EA9F6}",
					}, -- end of [4]
					[5] =
					{
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [5]
					[6] =
					{
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [6]
					[7] =
					{
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [7]
					[8] =
					{
					["CLSID"] = "{69926055-0DA8-4530-9F2F-C86B157EA9F6}",
					}, -- end of [8]	
					[9] =
					{	
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [9]							
					[10] =
					{
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					}, -- end of [10]
					[11] =
					{					
					}, -- end of [3]		
					
				}, -- end of ["pylons"]
				["fuel"] = "6103",
				["flare"] = 120,
				["chaff"] = 240,
				["gun"] = 100,
			}
        
            
		local _allyData =     {
                                ["modulation"] = 0,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["uncontrolled"] = false,
                                ["groupId"] = math.random(9999,99999),
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 8000,
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = yAlly,
                                        ["x"] = xAlly,
										["payload"] = _payload,                                        
                                        ["name"] =  "GrAtt package unit" .. math.random(9999,99999),                                        
                                        ["speed"] = 350,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "High",
                                    }, -- end of [1]
								[2] = 
                                    {
                                        ["alt"] = 8000,
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = yAlly,
                                        ["x"] = xAlly - 50,                                        
										["payload"] = _payload,
                                        ["name"] =  "GrAtt package unit" .. math.random(9999,99999),                                        
                                        ["speed"] = 350,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "High",
                                    }, -- end of [1]								
                                }, -- end of ["units"]
                                ["y"] = yAlly,
                                ["x"] = xAlly,
                                ["name"] =  enhancer.attack.packageName,
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["frequency"] = 117.5,
								["task"] = "CAS"
                    }
            
                   
		if enhancer.common.TakeOff ~= nil then
		
			local orbit = {
				   id = 'Orbit', 
					 params = { 
					   pattern = 'Circle',
					   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
					   speed = 300,
					   altitude = 10000,
				   } 
				 }
		
			_allyData["route"] = 
                                {
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 0,
                                            ["type"] = "TakeOffParking",
                                            ["action"] = "From Parking Area",
                                            ["alt_type"] = "RADIO",
                                            ["formation_template"] = "",
                                            ["ETA"] = 0,
											["airdromeId"] = airBase:getID(),
                                            ["y"] = yAlly,
                                            ["x"] = xAlly,
                                            ["speed"] = 0,
                                            ["ETA_locked"] = true,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                       
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
										[2] = 
                                        {
                                            ["alt"] = 10000,
                                            ["type"] = "WP1",                                                                                                                                    
                                            ["ETA"] = 100,											
                                            ["y"] = enhancer.common.RPPos.z,
                                            ["x"] = enhancer.common.RPPos.x,
                                            ["speed"] = 350,
                                            ["ETA_locked"] = true,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = {orbit}, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]                                            
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                } -- end of ["route"]
		end		
				   
				   
		coalition.addGroup(_country, Group.Category.AIRPLANE, _allyData)
			 
		local SetCallsign = { 
				  id = 'SetCallsign', 
				  params = { 
					callname = 10, 
					number = 7, 
				  } 
				}	 
			 
			
		local _controller = Group.getByName(enhancer.attack.packageName):getController()		
		_controller:setOption( AI.Option.Air.id.PROHIBIT_WP_PASS_REPORT, true )
		_controller:setOption( AI.Option.Air.id.SILENCE, true )		
		_controller:setOption( AI.Option.Air.id.RTB_ON_BINGO, true )
		_controller:setOption( AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE )			
		_controller:setCommand(SetCallsign)
		
		if enhancer.common.TakeOff == nil then
			local orbit = {
				   id = 'Orbit', 
					 params = { 
					   pattern = 'Circle',
					   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
					   speed = 300,
					   altitude = 10000,
				   } 
				 }
			_controller:pushTask(orbit)
						
			enhancer.setMessageDelayed("BOAR 7: We are in RP area. Waiting for further instructions.", 15, 2, true)
			enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_BOAR_inRP.ogg", 2)
			enhancer.setMessageDelayed("INFO: You can request Ground Attack on target mark using F10 --> Enhance menu --> Ground Attack...", 15, 2, false)
		else
			local lat, long, alt = coord.LOtoLL(enhancer.common.RPPos)		
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)			
			enhancer.setMessageDelayed("BOAR 7: Checking 2 warthogs for Ground Attack mission. Proceeding to RP at following coordinates:", 15, 25, true)
			enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_BOAR_checkIn.ogg", 25)
			enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 60, 25, false)
		end
		
		timer.scheduleFunction(removeRadioSilent, _controller, timer.getTime() + 5)	
			
		enhancer.attack.packageInOA = true;
		enhancer.attack.packageInProgress = false;
		N52 = missionCommands.addCommand('Push Ground Attack package', N5, enhancer.setGrAttack, false)	
		missionCommands.removeItem(N51)
			
end

	
function enhancer.setGrAttack()	
		if enhancer.attack.targetPos ~= nil then			
		
			enhancer.setMessageDelayed("PLAYER: Begin Attack mission.", 8, 2, true)
			enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_PLAYER_BeginAttack.ogg", 2)
		
			local FoundUnits = enhancer.searchGrTargets(enhancer.attack.targetPos, 14500, Object.Category.UNIT)					
			if FoundUnits ~= nil and FoundUnits[1] ~= nil then
				enhancer.setMessageDelayed("BOAR 7: Wilco, attacking new ground targets.", 15, 10, true)					
				enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_BOAR_AttackTargets.ogg", 10)
				
				local Mindistance = 100000000
				local distance = 0				
				local nearestUnit = nil
				
				for i = 1, #FoundUnits do
					--trigger.action.outText(enhancer.attack.targetPos.x .. ";" .. enhancer.attack.targetPos.y ..  ";" .. enhancer.attack.targetPos.z, 30, false)
					--trigger.action.outText(FoundUnits[i]:getPoint().x .. ";" .. FoundUnits[i]:getPoint().y .. ";" .. FoundUnits[i]:getPoint().z, 30, false)
					--trigger.action.outText("distance " .. distance, 30, false)
					
					distance = enhancer.getDistancePointPoint({x = enhancer.attack.targetPos.x, y = enhancer.attack.targetPos.z}, {x = FoundUnits[i]:getPoint().x, y = FoundUnits[i]:getPoint().z})
					if distance < Mindistance then
						nearestUnit = FoundUnits[i]
						Mindistance = distance
						--trigger.action.outText("new nearest unit " .. nearestUnit:getTypeName(), 30, false)
					end
				end	
				
				enhancer.attack.targetGroupName = nearestUnit:getGroup():getName()				
				Group.getByName(enhancer.attack.packageName):getController():setOption( AI.Option.Air.id.SILENCE, true )	
					
				enhancer.doGrAttack(Group.getByName(enhancer.attack.packageName), nearestUnit:getGroup())
				
				--enhancer.doGrAttack(Group.getByName(enhancer.attack.packageName), nearestUnit:getGroup())
				timer.scheduleFunction(removeRadioSilent, Group.getByName(enhancer.attack.packageName):getController(), timer.getTime() + 5)									
			else				
				enhancer.setMessageDelayed("BOAR 7: Negative, no tally enemy near the target area.", 15, 10, true)
				enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_BOAR_NoTargets.ogg", 10)
			end
		else			
			trigger.action.outText("INFO: You need to create a mark DO_ATTACK for target area in F10 map", 15, true)
			trigger.action.outSound("Enhancer Soundfiles/enhancer_IncorrectBeep.ogg")	
		end	
end;


function enhancer.doGrAttack(attackingGroup, objetiveGroup)

	--trigger.action.outText("attack_Group: " .. attackingGroup:getName(), 30)    		
	--trigger.action.outText("victim_Group: " .. objetiveGroup:getName(), 30) 
	
	if objetiveGroup ~= nil then			 
		local AttackGroup = nil
		local objetiveType = objetiveGroup:getUnit(1):getTypeName()
		
		objetiveType = string.upper(objetiveType):gsub("-",""):gsub(" ",""):gsub("_","")
		--trigger.action.outText("comprobando tipo" .. objetiveType, 30) 	
		if (string.match(objetiveType, "SOLDIER") ~= nil or string.match(objetiveType, "PARATROOPER") ~= nil or string.match(objetiveType, "INFANTRY") ~= nil) and string.match(objetiveType, "AAA") == nil then
			--trigger.action.outText("es infanteria: " .. objetiveType, 30)  
			AttackGroup = { 
							  id = 'AttackGroup', 
							  params = { 
								groupId = objetiveGroup:getID(),  
								weaponType = 30720,	
								expend = "QUARTER",
							  } 
							}
		else
			--trigger.action.outText("no es infanteria: " .. objetiveType, 30)  
			AttackGroup = { 
							  id = 'AttackGroup', 
							  params = { 
								groupId = objetiveGroup:getID(),			
							  } 
							}
		end
				
		local routePoints = {} 
														
			routePoints[1] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = attackingGroup:getUnit(1):getPoint().x,
					y = attackingGroup:getUnit(1):getPoint().z,
					alt = 10000,
					alt_type = "RADIO",
					speed = 300,
					ETA = 100,
					ETA_locked = false,
					name = "Starting point", 
					task = AttackGroup,
					}	
		
			routePoints[2] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = objetiveGroup:getUnit(1):getPoint().x,
					y = objetiveGroup:getUnit(1):getPoint().z,
					alt = 10000,
					alt_type = "BARO",
					speed = 300,
					ETA = 100,
					ETA_locked = false,
					name = "WP1", 
					task = nil,
					}
			
		--trigger.action.markToAll(2, "Destination point", {x = xDestiny, y = 0, z = yDestiny})
		
		
		local _mission = { 
            id = 'Mission', 
            params = { 
				airborne = true,
                route = { 
                    points = routePoints
                }, 
            } 
        }
		
			
		local _controller = attackingGroup:getController();
		_controller:setOption( AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE )
		_controller:pushTask(_mission)
		
		missionCommands.removeItem(N52)
		N53 = missionCommands.addCommand('Cancel Attack mission', N5, enhancer.cancelGrAttack, nil)
		
		--trigger.action.outText("ataque asignado", 30)	
		
	end
end;


function enhancer.cancelGrAttack()
	
	enhancer.setMessageDelayed("PLAYER: Cancel Attack mission and return to RP area.", 8, 2, true)
	enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_PLAYER_CancelAttack.ogg", 2)

	local _controller = Group.getByName(enhancer.attack.packageName):getController()	
	_controller:setOption( AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.RETURN_FIRE )
	enhancer.setMessageDelayed("BOAR 7: WILCO, Cancelling current attack mission.", 15, 10, true)
	enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_BOAR_CancelAttack.ogg", 10)
	N52 = missionCommands.addCommand('Push Ground Attack package', N5, enhancer.setGrAttack, nil)				
	missionCommands.removeItem(N53)	
end;


function enhancer.requestFighterSweep()	
		if enhancer.common.RPPos ~= nil then		
			enhancer.setMessageDelayed("PLAYER: Requesting Fighter Sweep support package. Copy following coordinates for Rally Point: ", 7, 1, true)
			enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_PLAYER_ReqSweep.ogg", 1)
			local lat, long, alt = coord.LOtoLL(enhancer.common.RPPos)		
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)
			enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 7, 1, false)			
			if enhancer.sweep.isPackageAvailable == true and enhancer.sweep.currentRequest < enhancer.sweep.maxRequest then
				if (enhancer.sweep.packageInOA == false and enhancer.sweep.packageInProgress == false) then			
					enhancer.setMessageDelayed("COMMAND: Copied, sending fighter sweep package to OA.", 10, 12, true)
					enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_ReqSweep.ogg", 12)
					
					if enhancer.common.TakeOff ~= nil then
						enhancer.createFighterSweepGroup()
					else			
						timer.scheduleFunction(enhancer.createFighterSweepGroup, nil, timer.getTime() + enhancer.sweep.waitTime)					
						enhancer.setMessageDelayed("INFO: Total ETA for Fighter Sweep package in position " .. enhancer.sweep.waitTime .." secs", 10, 12, false)						
						enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 60, 12, false)
					end					
					enhancer.sweep.currentRequest = enhancer.sweep.currentRequest + 1
					enhancer.sweep.packageInProgress = true
				elseif (enhancer.sweep.packageInOA == false and enhancer.sweep.packageInProgress == true) then
					enhancer.setMessageDelayed("COMMAND: Negative, Fighter Sweep package is on its way yet.", 10, 12, true)
					enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_NegSweep1.ogg", 12)
				else
					enhancer.setMessageDelayed("COMMAND: Negative, Fighter Sweep package is already in the OA.", 10, 12, true)			
					enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_NegSweep2.ogg", 12)
				end --fin enhancer.sweep.packageInOA
			else
				enhancer.setMessageDelayed("COMMAND: Negative, there is not support available.", 10, 12, true)
				enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_COMMAND_NegativeSupport.ogg", 12)
			end --fin enhancer.sweep.isPackageAvailable
		else
			trigger.action.outText("INFO: You need to create a mark DO_RP for Rally Point in F10 map", 15, true)						
			trigger.action.outSound("Enhancer Soundfiles/enhancer_IncorrectBeep.ogg")	
		end	--fin enhancer.common.RPPos
end;


function enhancer.createFighterSweepGroup()
		--trigger.action.outText("createFighterSweepGroup", 10)    
		
		local xHostiles = enhancer.common.RPPos.x
		local yHostiles = enhancer.common.RPPos.z
		local airBase = nil
			
		if enhancer.common.TakeOff ~= nil then
			xAlly = enhancer.common.TakeOff.x 
			yAlly = enhancer.common.TakeOff.z
			airBase = enhancer.getNearestAirBase(enhancer.common.TakeOff)
			--trigger.action.outText("Despegando de " .. airBase:getName(), 15)
		end
			
		local _player = nil
		local _country = nil
		
		
		if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
			_player = coalition.getPlayers(coalition.side.RED)[1]
			_country = country.id.CJTF_RED	
		elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
			_player = coalition.getPlayers(coalition.side.BLUE)[1]
			_country = country.id.CJTF_BLUE
		end
				
		local heading = enhancer.getHeading(_player)
		
		if heading == nil then
			heading = math.random(256)
		end
		
		local _airtype = ""
		local _velocity = 0		
		local _allyData = nil
		local _payload = nil
	
		local nameAllyAirGroup = "Sweep" .. math.random(1,9999) 		
		enhancer.sweep.packageName = nameAllyAirGroup
		
		if _country == country.id.CJTF_RED then
			_airtype = "MiG-29A"
			_velocity = 100	
			
			_payload = {
				["pylons"] =
				{	[1] =
					{		
					["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}", --R-73
					}, -- end of [1]			
					[2] =
					{
					["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}", --R-73
					}, -- end of [2]			
					[3] =
					{	
					["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}", --R-27ER
					}, -- end of [3]			
					[4] =
					{
					["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}", --fuel tank
					}, -- end of [4]
					[5] =
					{
					["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}", --R-27ER
					}, -- end of [5]
					[6] =
					{
					["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}", --R-73
					}, -- end of [6]
					[7] =
					{
					["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}", --R-73
					}, -- end of [7]
					
				}, -- end of ["pylons"]
				["fuel"] = "6103",
				["flare"] = 120,
				["chaff"] = 240,
				["gun"] = 100,
			}
				            
		_allyData =     {
                                ["modulation"] = 0,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["uncontrolled"] = false,
                                ["groupId"] = math.random(9999,99999),
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 8000,
										["alt_type"] = "RADIO",
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = yHostiles,
                                        ["x"] = xHostiles,
										["payload"] = _payload,                                        
                                        ["name"] =  "SweepUnit" .. math.random(9999,99999),                                        
                                        ["speed"] = _velocity,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "High",
                                    }, -- end of [1]
								[2] = 
                                    {
                                        ["alt"] = 8000,
										["alt_type"] = "RADIO",
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = yHostiles,
                                        ["x"] = xHostiles - 25,                                        
										["payload"] = _payload,
                                        ["name"] =  "SweepUnit" .. math.random(9999,99999),                                        
                                        ["speed"] = _velocity,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "High",
									}, -- end of [2]
								[3] = 
                                    {
                                        ["alt"] = 8000,
										["alt_type"] = "RADIO",
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = yHostiles,
                                        ["x"] = xHostiles + 25,                                        
										["payload"] = _payload,
                                        ["name"] =  "SweepUnit" .. math.random(9999,99999),                                        
                                        ["speed"] = _velocity,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "High",
									}, -- end of [3]
								[4] = 
                                    {
                                        ["alt"] = 8000,
										["alt_type"] = "RADIO",
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = yHostiles,
                                        ["x"] = xHostiles + 50,                                        
										["payload"] = _payload,
                                        ["name"] =  "SweepUnit" .. math.random(9999,99999),                                        
                                        ["speed"] = _velocity,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "High",		
									}, -- end of [4]									
                                }, -- end of ["units"]
                                ["y"] = yHostiles,
                                ["x"] = xHostiles,
                                ["name"] =  nameAllyAirGroup,
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["frequency"] = 130.5,
								["task"] = "Escort",
                    }
					
		elseif _country == country.id.CJTF_BLUE then	
			_airtype = "F-16C bl.50"
			_velocity = 100	
			
			_payload = {
				["pylons"] =
				{	[1] =
					{		
					["CLSID"] = "{AIM-9L}", --AIM-9
					}, -- end of [1]			
					[2] =
					{
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}", --AIM-120
					}, -- end of [2]			
					[3] =
					{	
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}", --AIM-7
					}, -- end of [3]			
					[4] =
					{
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}", --fuel tank
					}, -- end of [4]
					[5] =
					{					
					}, -- end of [5]
					[6] =
					{
					
					}, -- end of [6]
					[7] =
					{
					["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}", --fuel tank
					}, -- end of [7]
					[8] =
					{
					["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}", --AIM-7
					}, -- end of [8]
					[9] =
					{
					["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}", --AIM-120
					}, -- end of [9]
					[10] =
					{
					["CLSID"] = "{AIM-9L}", --AIM-9
					}, -- end of [10]
					
					
				}, -- end of ["pylons"]
				["fuel"] = "6103",
				["flare"] = 120,
				["chaff"] = 240,
				["gun"] = 100,
			}
				            
		_allyData =     {
                                ["modulation"] = 0,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["uncontrolled"] = false,
                                ["groupId"] = math.random(9999,99999),
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 8000,
										["alt_type"] = "RADIO",
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = yHostiles,
                                        ["x"] = xHostiles,
										["payload"] = _payload,                                        
                                        ["name"] =  "hostileAirUnit" .. math.random(9999,99999),                                        
                                        ["speed"] = _velocity,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "Excellent",
                                    }, -- end of [1]
								[2] = 
                                    {
                                        ["alt"] = 8000,
										["alt_type"] = "RADIO",
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = yHostiles,
                                        ["x"] = xHostiles - 25,                                        
										["payload"] = _payload,
                                        ["name"] =  "hostileAirUnit" .. math.random(9999,99999),                                        
                                        ["speed"] = _velocity,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "Excellent",
									}, -- end of [2]
								[3] = 
                                    {
                                        ["alt"] = 8000,
										["alt_type"] = "RADIO",
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = yHostiles,
                                        ["x"] = xHostiles + 25,                                        
										["payload"] = _payload,
                                        ["name"] =  "hostileAirUnit" .. math.random(9999,99999),                                        
                                        ["speed"] = _velocity,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "Excellent",
									}, -- end of [3]								
                                }, -- end of ["units"]
                                ["y"] = yHostiles,
                                ["x"] = xHostiles,
                                ["name"] =  nameAllyAirGroup,
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["frequency"] = 130.5,
								["task"] = "Fighter Sweep",
                    }	
		end  
		
		
		if enhancer.common.TakeOff ~= nil then
			local orbit = {
				   id = 'Orbit', 
					 params = { 
					   pattern = 'Circle',
					   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
					   speed = 300,
					   altitude = 10000,
				   } 
				 }
		
			_allyData["route"] = 
                                {
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 0,
                                            ["type"] = "TakeOffParking",
                                            ["action"] = "From Parking Area",
                                            ["alt_type"] = "RADIO",
                                            ["formation_template"] = "",
                                            ["ETA"] = 0,
											["airdromeId"] = airBase:getID(),
                                            ["y"] = yAlly,
                                            ["x"] = xAlly,
                                            ["speed"] = 0,
                                            ["ETA_locked"] = true,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                       
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
										[2] = 
                                        {
                                            ["alt"] = 10000,
                                            ["type"] = "WP1",                                                                                                                                    
                                            ["ETA"] = 100,											
                                            ["y"] = enhancer.common.RPPos.z,
                                            ["x"] = enhancer.common.RPPos.x,
                                            ["speed"] = 300,
                                            ["ETA_locked"] = true,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = {orbit}, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]                                            
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                } -- end of ["route"]
		end		
		
		coalition.addGroup(_country, Group.Category.AIRPLANE, _allyData)
				 
		 local SetCallsign = { 
				  id = 'SetCallsign', 
				  params = { 
					callname = 6, 
					number = 6, 
				  } 
				}	
		 
		 
		
		local _controller = Group.getByName(enhancer.sweep.packageName):getController()		
		
		_controller:setOption( AI.Option.Air.id.PROHIBIT_WP_PASS_REPORT, true )
		_controller:setOption( AI.Option.Air.id.SILENCE, true )		
		_controller:setOption( AI.Option.Air.id.RTB_ON_BINGO, true )
		_controller:setOption( AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE )		
		
		_controller:setCommand(SetCallsign)
		
		if enhancer.common.TakeOff == nil then
			local orbit = {
				   id = 'Orbit', 
					 params = { 
					   pattern = 'Circle',
					   point = {x = enhancer.common.RPPos.x, y = enhancer.common.RPPos.z},
					   speed = 100,
					   altitude = 10000,
				   } 
				 }
			_controller:pushTask(orbit)
			enhancer.setMessageDelayed("FORD 6: We are in RP area. Waiting for further instructions.", 15, 2, true)
			enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_FORD_inRP.ogg", 2)
			enhancer.setMessageDelayed("INFO: You can request Fighter Sweep on target mark using F10 --> Enhance menu --> SWEEP...", 15, 2, false)
		else
			local lat, long, alt = coord.LOtoLL(enhancer.common.RPPos)		
			local coordSTR = enhancer.getCoordinatesSTR(lat, long)			
			enhancer.setMessageDelayed("FORD 6: Checking 4 aircrafts for Fighter Sweep mission. Proceeding to RP at following coordinates:", 15, 25, true)
			enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_FORD_checkIn.ogg", 25)
			enhancer.setMessageDelayed(coordSTR.lat .. " " .. coordSTR.long, 60, 25, false)
		end
			
		timer.scheduleFunction(removeRadioSilent, _controller, timer.getTime() + 5)			
			
			
		enhancer.sweep.packageInOA = true;
		enhancer.sweep.packageInProgress = false;
		N62 = missionCommands.addCommand('Push fighter sweep package', N6, enhancer.setFighterSweep, nil)	
		missionCommands.removeItem(N61)
end


function enhancer.setFighterSweep()	
		--trigger.action.outText("setFighterSweep", 15, true)
		if enhancer.sweep.targetPos ~= nil and Group.getByName(enhancer.sweep.packageName) ~= nil then				
			
			enhancer.setMessageDelayed("PLAYER: Begin Fighter Sweep mission.", 8, 2, true)
			enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_PLAYER_BeginSweep.ogg", 2)
		
			local FoundUnits = enhancer.searchAircraft(enhancer.sweep.targetPos, 30000, Object.Category.UNIT)					
			if FoundUnits ~= nil and FoundUnits[1] ~= nil then
				enhancer.setMessageDelayed("FORD 6: Wilco, proceding with sweep mission.", 15, 10, true)					
				enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_FORD_AttackTargets.ogg", 10)
				enhancer.sweep.targetGroupName = FoundUnits[1]:getGroup():getName()
				Group.getByName(enhancer.sweep.packageName):getController():setOption( AI.Option.Air.id.SILENCE, true )	
				enhancer.doSweepAttack(Group.getByName(enhancer.sweep.packageName), FoundUnits[1]:getGroup())
				timer.scheduleFunction(removeRadioSilent, Group.getByName(enhancer.sweep.packageName):getController(), timer.getTime() + 5)									
			else				
				enhancer.setMessageDelayed("FORD 6: Negative, no enemies near the target area.", 15, 20, true)
				enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_FORD_NoTargets.ogg", 20)				
				enhancer.setMessageDelayed("FORD 6: We will proceed to the target area and do TARCAP until further instructions", 30, 25, false)
				enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_FORD_TARCAP.ogg", 25)
				local SEADController = Group.getByName(enhancer.sweep.packageName):getController()
				SEADController:setOption( AI.Option.Air.id.SILENCE, true )
				SEADController:resetTask()
				timer.scheduleFunction(removeRadioSilent, SEADController, timer.getTime() + 5)									
				timer.scheduleFunction(enhancer.doTARCAP, {groupTARCAP = Group.getByName(enhancer.sweep.packageName), point = enhancer.sweep.targetPos}, timer.getTime() + 5)
			end
		else			
			trigger.action.outText("INFO: You need to create a mark DO_SWEEP for target area in F10 map", 15, true)
			trigger.action.outSound("Enhancer Soundfiles/enhancer_IncorrectBeep.ogg")	
		end	
end;


function enhancer.doSweepAttack(attackingGroup, objetiveGroup)

	--trigger.action.outText("attack_Group: " .. attackingGroup:getName(), 30)    		
	--trigger.action.outText("victim_Group: " .. objetiveGroup:getName(), 30)    		
				
	if objetiveGroup ~= nil then	
				
		local routePoints = {}
		
		local AttackGroup = { 
		  id = 'AttackGroup', 
		  params = { 
			groupId = objetiveGroup:getID(),    
		  } 
		}
		
		--trigger.action.markToAll(1, "Starting point", {x = 25, y = 23, z = 060})												
			routePoints[1] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = attackingGroup:getUnit(1):getPoint().x,
					y = attackingGroup:getUnit(1):getPoint().z,
					alt = 10000,
					alt_type = "RADIO",
					speed = 300,
					ETA = 100,
					ETA_locked = false,
					name = "Starting point", 
					task = AttackGroup,
					}	
		
			routePoints[2] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = objetiveGroup:getUnit(1):getPoint().x,
					y = objetiveGroup:getUnit(1):getPoint().z,
					alt = 10000,
					alt_type = "BARO",
					speed = 300,
					ETA = 100,
					ETA_locked = false,
					name = "WP1", 
					task = nil,
					}
			
		--trigger.action.markToAll(2, "Destination point", {x = xDestiny, y = 0, z = yDestiny})
		
		
		local _mission = { 
            id = 'Mission', 
            params = { 
				airborne = true,
                route = { 
                    points = routePoints
                }, 
            } 
        }
		
			
		local _controller = attackingGroup:getController();
		_controller:setOption( AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE )
		_controller:pushTask(_mission)
		
		missionCommands.removeItem(N62)
		N63 = missionCommands.addCommand('Cancel Fighter Sweep mission', N6, enhancer.cancelFighterSweep, nil)
		--trigger.action.outText("ataque asignado", 30)	
		
	end
end;


function enhancer.cancelFighterSweep()

	enhancer.setMessageDelayed("PLAYER: Cancel Fighter Sweep mission and return to RP area.", 8, 2, true)
	enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_PLAYER_CancelSweep.ogg", 2)

	local _controller = Group.getByName(enhancer.sweep.packageName):getController()	
	_controller:setOption( AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.RETURN_FIRE )
	enhancer.setMessageDelayed("FORD 6: WILCO, Cancelling current Fighter Sweep mission.", 15, 10, true)
	enhancer.setSoundDelayed("Enhancer Soundfiles/enhancer_FORD_CancelSweep.ogg", 10)
	N62 = missionCommands.addCommand('Push fighter sweep package', N6, enhancer.setFighterSweep, nil)
	missionCommands.removeItem(N63)	
end;


function enhancer.doTARCAP(parameters)
	--trigger.action.outText("Mejor una tarcap x=" .. parameters.point.x .. "; y= " .. parameters.point.z , 15, true)
	local orbit = {
					   id = 'Orbit', 
						 params = { 
						   pattern = 'Circle',
						   point = {x = parameters.point.x, y = parameters.point.z},
						   speed = 100,
						   altitude = 10000,
					   } 
					 }
					
	local routePoints = {}			
	routePoints[1] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = parameters.groupTARCAP:getUnit(1):getPoint().x,
					y = parameters.groupTARCAP:getUnit(1):getPoint().z,
					alt = 10000,
					alt_type = "RADIO",
					speed = 300,
					ETA = 100,
					ETA_locked = false,
					name = "WP1",					
					}	
		
	routePoints[2] = {
					action = "Fly Over Point",
					type= "Turning Point",
					x = parameters.point.x,
					y = parameters.point.z,
					alt = 10000,
					alt_type = "BARO",
					speed = 300,
					ETA = 100,
					ETA_locked = false,
					name = "WP2", 
					task = orbit,
					}
			
		--trigger.action.markToAll(2, "Destination point", {x = xDestiny, y = 0, z = yDestiny})
		
		
		local _mission = { 
            id = 'Mission', 
            params = { 
				airborne = true,
                route = { 
                    points = routePoints
                }, 
            } 
        }					
					
	
	parameters.groupTARCAP:getController():pushTask(_mission)	
	parameters.groupTARCAP:getController():setOption( AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE )

end


function enhancer.createTakeoffGroup()
		--trigger.action.outText("createAttackGroup", 10) 		
		testName = "GrAtt package" ..math.random(9999,99999)		
		
		local xAlly = enhancer.common.TakeOff.x
		local yAlly = enhancer.common.TakeOff.z
				
		local heading = 0
		
		local _airtype =  "A-10C"		
		
		local _country = country.id.CJTF_BLUE
		
		if coalition.getPlayers(coalition.side.RED)[1] ~= nil then
			_country = country.id.CJTF_RED	
		elseif coalition.getPlayers(coalition.side.BLUE)[1] ~= nil then
			_country = country.id.CJTF_BLUE	
		end
		local _payload = nil		
		--TODO: poner cohetes
		_payload = {
				["pylons"] =
				{	[1] =
					{	
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [1]			
					[2] =
					{	
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [2]			
					[3] =
					{
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [3]			
					[4] =
					{
					["CLSID"] = "{69926055-0DA8-4530-9F2F-C86B157EA9F6}",
					}, -- end of [4]
					[5] =
					{
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [5]
					[6] =
					{
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [6]
					[7] =
					{
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [7]
					[8] =
					{
					["CLSID"] = "{69926055-0DA8-4530-9F2F-C86B157EA9F6}",
					}, -- end of [8]	
					[9] =
					{	
					["CLSID"] = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}",
					}, -- end of [9]							
					[10] =
					{
					["CLSID"] = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",
					}, -- end of [10]
					[11] =
					{					
					}, -- end of [3]		
					
				}, -- end of ["pylons"]
				["fuel"] = "6103",
				["flare"] = 120,
				["chaff"] = 240,
				["gun"] = 100,
			}
        
            
		local _allyData =     {
                                ["modulation"] = 0,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["uncontrolled"] = false,
                                ["groupId"] = math.random(9999,99999),
                                ["hidden"] = false,
								["route"] = 
                                {
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 0,
                                            ["type"] = "TakeOffParking",
                                            ["action"] = "From Parking Area",
                                            ["alt_type"] = "RADIO",
                                            ["formation_template"] = "",
                                            ["ETA"] = 0,
											["airdromeId"] = Airbase.getByName('Batumi'):getID(),
                                            ["y"] = yAlly,
                                            ["x"] = xAlly,
                                            ["speed"] = 0,
                                            ["ETA_locked"] = true,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                       
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 0,
                                        ["heading"] = heading,                                        
                                        ["type"] = _airtype,
                                        ["psi"] = 0,                                        
                                        ["y"] = yAlly,
                                        ["x"] = xAlly,
										["payload"] = _payload,                                        
                                        ["name"] =  "test package unit" .. math.random(9999,99999),                                        
                                        ["speed"] = 350,
                                        ["unitId"] =  math.random(9999,99999),                                        
                                        ["skill"] = "High",
                                    }, -- end of [1]															
                                }, -- end of ["units"]
                                ["y"] = yAlly,
                                ["x"] = xAlly,
                                ["name"] =  testName,
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["frequency"] = 117.5,
								["task"] = "CAS"
                    }
            
                   
		coalition.addGroup(_country, Group.Category.AIRPLANE, _allyData)
						 
			 
		local SetCallsign = { 
				  id = 'SetCallsign', 
				  params = { 
					callname = 10, 
					number = 5, 
				  } 
				}	
				 
end





function enhancer.setEnhancerMenu()
	menuPrinc = missionCommands.addSubMenu('Mission Enhancer Menu...')
	N1 = missionCommands.addSubMenu('LASE...', menuPrinc)
	N11 = missionCommands.addCommand('Paint my target', N1, enhancer.requestLaser, nil)
	N12 = missionCommands.addCommand('Terminate painting', N1, enhancer.stopLaser, nil)
	
	N2 = missionCommands.addCommand('Recon my target', menuPrinc, enhancer.requestSatellite, nil)
	
	N3 = missionCommands.addCommand('Strike on my target', menuPrinc, enhancer.requestStrike, nil)	
	
	N4 = missionCommands.addSubMenu('SEAD...', menuPrinc)
	N41 = missionCommands.addCommand('Request SEAD package', N4, enhancer.requestSEAD, nil)	
	--N43 = missionCommands.addCommand('Test destroy unit', N4, destroyUnit, nil)	
	
	N5 = missionCommands.addSubMenu('GROUND ATTACK...', menuPrinc)
	N51 = missionCommands.addCommand('Request Ground Attack package', N5, enhancer.requestGrAttack, nil)	
	
	N6 = missionCommands.addSubMenu('SWEEP...', menuPrinc)
	N61 = missionCommands.addCommand('Request fighter sweep package', N6, enhancer.requestFighterSweep, nil)	
	
	--N7 = missionCommands.addSubMenu('TEST...', menuPrinc)
	--N71 = missionCommands.addCommand('prueba', N7, enhancer.createTakeoffGroup, nil)
	
end;


function destroyUnit()
	--trigger.action.outText(enhancer.attack.packageName, 30)	
	trigger.action.explosion(Group.getByName(enhancer.attack.packageName):getUnit(1):getPoint(), 10000)
end


function enhancer.setAvailability()
	local randomLase = math.random() * 100
	--trigger.action.outText("randomLase: " .. randomLase, 10, false)
	if randomLase < enhancer.lase.availability then
		--trigger.action.outText("isLaseAvailable: true", 10, false)
		enhancer.isLaseAvailable = true
	else
		--trigger.action.outText("isLaseAvailable: false", 10, false)
		enhancer.isLaseAvailable = false
	end
	
	local randomRecon = math.random() * 100
	--trigger.action.outText("randomRecon: " .. randomRecon, 10, false)
	if randomRecon < enhancer.recon.availability then
		--trigger.action.outText("isSatelliteAvailable: true", 10, false)
		enhancer.recon.isSatelliteAvailable = true
	else
		--trigger.action.outText("isSatelliteAvailable: false", 10, false)
		enhancer.recon.isSatelliteAvailable = false
	end
	
	local randomStrike = math.random() * 100
	--trigger.action.outText("randomStrike: " .. randomStrike, 10, false)
	if randomStrike < enhancer.strike.availability then
		--trigger.action.outText("isHerculesAvailable: true", 10, false)
		enhancer.strike.isHerculesAvailable = true
	else
		--trigger.action.outText("isHerculesAvailable: false", 10, false)
		enhancer.strike.isHerculesAvailable = false
	end
	
	local randomSEAD = math.random() * 100
	--trigger.action.outText("randomSEAD: " .. randomSEAD, 10, false)
	if randomSEAD < enhancer.sead.availability then
		--trigger.action.outText("isPackageAvailable: true", 10, false)
		enhancer.sead.isPackageAvailable = true
	else
		--trigger.action.outText("isPackageAvailable: false", 10, false)
		enhancer.strike.isPackageAvailable = false
	end
	
	local randomATTACK = math.random() * 100
	--trigger.action.outText("randomATTACK: " .. randomSEAD, 10, false)
	if randomATTACK < enhancer.attack.availability then
		--trigger.action.outText("isPackageAvailable: true", 10, false)
		enhancer.attack.isPackageAvailable = true
	else
		--trigger.action.outText("isPackageAvailable: false", 10, false)
		enhancer.attack.isPackageAvailable = false
	end
	
	local randomSweep = math.random() * 100
	--trigger.action.outText("randomSweep: " .. randomSEAD, 10, false)
	if randomSweep < enhancer.sweep.availability then
		--trigger.action.outText("isPackageAvailable: true", 10, false)
		enhancer.sweep.isPackageAvailable = true
	else
		--trigger.action.outText("isPackageAvailable: false", 10, false)
		enhancer.sweep.isPackageAvailable = false
	end
	
end;
	
world.addEventHandler(evento);
enhancer.setEnhancerMenu();
enhancer.setAvailability();

env.info('Enhancer Script Loaded ... OK')