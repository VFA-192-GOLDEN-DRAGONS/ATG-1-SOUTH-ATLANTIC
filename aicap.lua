env.info("aicap loading", false)

BASE:TraceOn()
BASE:TraceClass("AI_A2A_DISPATCHER")

NorthRedPatrolZone = {"NorthRedPatrolZone1", "NorthRedPatrolZone2", "NorthRedPatrolZone3", "NorthRedPatrolZone4", "NorthRedPatrolZone5"}
SouthRedPatrolZone = {"SouthRedPatrolZone1", "SouthRedPatrolZone2", "SouthRedPatrolZone3", "SouthRedPatrolZone4", "SouthRedPatrolZone5"}

--Setup red EWR system
DetectionSetGroupRED = SET_GROUP:New()
DetectionSetGroupRED:FilterPrefixes("rEWR")
DetectionSetGroupRED:FilterStart()
DetectionRED = DETECTION_AREAS:New(DetectionSetGroupRED, 30000)
--Set red border
REDBorderZone = ZONE_POLYGON:New("RED Border", GROUP:FindByName("RED Border"))
REDBorderZone:Boundary(-1, {128,0,0},1000,1,25)--This Draws the border

--function randomCAPzone ()  --Not working yet
  NorthZonename = NorthRedPatrolZone[math.random(1,5)]
  NorthCAPZone = ZONE:New(NorthZonename)
  SouthZonename = SouthRedPatrolZone[math.random(1,5)]
  SouthCAPZone = ZONE:New(SouthZonename)
  --NorthGroupSize = math.random(1,4)  --Not working yet
  --SouthGroupSize = math.random(1,4)  --Not working yet
--  timer.scheduleFunction(randomCAPzone, nil, timer.getTime() + 3600)  --Not working yet
--end  --Not working yet
--timer.scheduleFunction(randomCAPzone, nil, timer.getTime())  --Not working yet

--Setup Red Air
REDAir = AI_A2A_DISPATCHER:New(DetectionRED)
REDAir:SetEngageRadius(150000)
REDAir:SetBorderZone(REDBorderZone)
REDAir:SetTacticalDisplay(false)
REDAir:SetDefaultFuelThreshold( 0.35 )

--Setup first red sqd
REDAir:SetSquadron("Gallegos CAP", "Rio Gallegos" , {"AICAP Mig-21","AICAP F1CE","AICAP L-39C","AICAP Mig-29A","AICAP M-2000C","AICAP Mig-19P"}, 4)
REDAir:SetSquadronGrouping("Gallegos CAP", 2) --math.random(1,4)
REDAir:SetSquadronTakeoffFromParkingHot("Gallegos CAP")
REDAir:SetSquadronLandingAtEngineShutdown("Gallegos CAP")
--REDAir:SetSquadronOverhead("Gallegos CAP", 1.5)
--Setup second red sqd
REDAir:SetSquadron("San Julian CAP", "San Julian" , {"AICAP Mig-21","AICAP F1CE","AICAP L-39C","AICAP Mig-29A","AICAP M-2000C","AICAP Mig-19P"}, 4)
REDAir:SetSquadronGrouping("San Julian CAP", 2) --math.random(1,4)
REDAir:SetSquadronTakeoffFromParkingHot("San Julian CAP")
REDAir:SetSquadronLandingAtEngineShutdown("San Julian CAP")
--REDAir:SetSquadronOverhead("Bandar Fishbed", 2.5)

--Setup first red CAP
REDAir:SetSquadronCap("Gallegos CAP",SouthCAPZone,4000,10000,500,600,600,1500)
--REDAir:SetSquadronCapRacetrack("Gallegos CAP", 10000, 20000, 90, 180, 10*60, 20*60)
--REDAir:SetSquadronCapInterval("Gallegos CAP",1,0,120)
--Setup second red CAP
REDAir:SetSquadronCap("San Julian CAP",NorthCAPZone,4000,10000,500,600,600,1500)
--REDAir:SetSquadronCapRacetrack("San Julian CAP", 10000, 20000, 90, 180, 10*60, 20*60)
--REDAir:SetSquadronCapInterval("San Julian CAP",2,0,120)


--[[Setup GCI intercept system
REDAir:SetSquadronGci("Bandar Fulcrum", 900, 2400)
REDAir:SetSquadronGci("Bandar Fishbed", 900, 2200)
REDAir:SetSquadronGci("Kerman Flogger", 900, 2500)
REDAir:SetSquadronGci("Kerman Foxhound", 900, 3000)
REDAir:SetSquadronGci("Kerman Flanker", 900, 2500 )
--]]
--Start A2A Stuff
REDAir:Start()



--[[
--Setup blue EWR system
DetectionSetGroupBlue = SET_GROUP:New()
DetectionSetGroupBlue:FilterPrefixes("Blue_EWR")
DetectionSetGroupBlue:FilterStart()
--Group stuff thats close (I think idk what this does)
DetectionBlue = DETECTION_AREAS:New(DetectionSetGroupBlue, 30000)
--Set red border
BlueBorderZone = ZONE_POLYGON:New("Blue Border", GROUP:FindByName("Blue Border"))
--BlueBorderZone:Boundary()--This draws the border
CAPZone = ZONE:New("Blue Patrol Zone")
--Setup Blue Air
BlueAir = AI_A2A_DISPATCHER:New(DetectionBlue)
BlueAir:SetEngageRadius(150000)
BlueAir:SetBorderZone(BlueBorderZone)
BlueAir:SetTacticalDisplay(true)
BlueAir:SetDefaultFuelThreshold( 0.30 )

--Setup first blue sqd
BlueAir:SetSquadron("Kahamah Eagle", AIRBASE.PersianGulf.Sharjah_Intl, "F15 CAP", 40)
--BlueAir:SetSquadronTakeoffFromParkingCold("Kahamah Eagle")
--BlueAir:SetSquadronGrouping("Kahamah Eagle", 2)
--BlueAir:SetSquadronOverhead("Kahamah Eagle", 1.5)
BlueAir:SetSquadronFuelThreshold("Kahamah Eagle",0.3)
--Setup second blue sqd
BlueAir:SetSquadron("Kahamah Viper", AIRBASE.PersianGulf.Sharjah_Intl, "F16 CAP", 40)
--BlueAir:SetSquadronTakeoffFromParkingCold("Kahamah Viper")
--BlueAir:SetSquadronGrouping("Kahamah Viper", 2)
--BlueAir:SetSquadronOverhead("Kahamah Viper", 2)
BlueAir:SetSquadronFuelThreshold("Kahamah Viper",0.3)

--Setup first blue CAP
BlueAir:SetSquadronCap("Kahamah Eagle",CAPZone,5000,10000,400,600,500,1500)
--BlueAir:SetSquadronCapRacetrack("Kahamah Eagle", 10000, 20000, 90, 180, 10*60, 20*60)
--BlueAir:SetSquadronCapInterval("Kahamah Eagle",3,0,120)
--Setup second blue CAP
BlueAir:SetSquadronCap("Kahamah Viper",CAPZone,5000,10000,400,600,500,1500)
--BlueAir:SetSquadronCapRacetrack("Kahamah Viper", 10000, 20000, 90, 180, 10*60, 20*60)
--BlueAir:SetSquadronCapInterval("Kahamah Viper",4,0,120)

Setup GCI intercept system
BlueAir:SetSquadronGci("Kahamah Eagle", 900, 1200)
BlueAir:SetSquadronGci("Kahamah Viper", 900, 1200)

--Start A2A Stuff

BlueAir:Start()

--Set FAD zone
FADZone = ZONE_POLYGON:New("FAD Border", GROUP:FindByName("FAD Border"))
--Setup Navey Air
NaveyAir = AI_A2A_DISPATCHER:New(DetectionBlue)
NaveyAir:SetEngageRadius(150000)
NaveyAir:SetBorderZone(FADZone)
NaveyAir:SetTacticalDisplay(true)
NaveyAir:SetDefaultFuelThreshold( 0.30 )

--Setup first navey sqd
NaveyAir:SetSquadron("Fleet Air Defence", "George Washington", "F14 Navel CAP", 40)
--NaveyAir:SetSquadronTakeoffFromParkingCold("Fleet Air Defence")
--NaveyAir:SetSquadronGrouping("Fleet Air Defence", 2)
--NaveyAir:SetSquadronOverhead("Fleet Air Defence", 1.5)
NaveyAir:SetSquadronFuelThreshold("Fleet Air Defence",0.3)
--NaveyAir:SetSquadronTanker( "Fleet Air Defence", "S3 Tanker" )

--Setup first Navey FAD
NaveyAir:SetSquadronCap("Fleet Air Defence",FADZone,5000,10000,400,600,500,1500)
--NaveyAir:SetSquadronCapRacetrack("Fleet Air Defence", 10000, 20000, 90, 180, 10*60, 20*60)
--NaveyAir:SetSquadronCapInterval("Fleet Air Defence",2,0,120)

--Start A2A Stuff
NaveyAir:Start()

]]--
env.info("aicap complete", false)
