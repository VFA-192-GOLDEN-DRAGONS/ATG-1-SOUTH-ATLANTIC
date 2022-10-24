env.info("carriergroup loading", false)
------------------------------------
-- Recovery Tanker Example Script --
------------------------------------

-- S-3B at USS Theodore Roosevelt spawning on deck.
tankerTheo=RECOVERYTANKER:New(UNIT:FindByName("CVN-71 Theodore Roosevelt"), "Arco")
tankerTheo:SetRadio(344.025)
tankerTheo:SetSpeed(275)
tankerTheo:SetTACAN(100, "ARC")
tankerTheo:SetCallsign(CALLSIGN.Tanker.Arco, 1)
tankerTheo:SetModex(705)
tankerTheo:SetAltitude(10000)
tankerTheo:SetRespawnInAir()  
tankerTheo:SetTakeoffAir()
tankerTheo:Start()

-- S-3B at USS Forrestal spawning on deck.
tankerTheo=RECOVERYTANKER:New(UNIT:FindByName("CV-59 Forrestal"), "Arco")
tankerTheo:SetRadio(344.500)
tankerTheo:SetSpeed(275)
tankerTheo:SetTACAN(106, "ARC")
tankerTheo:SetCallsign(CALLSIGN.Tanker.Arco, 2)
tankerTheo:SetModex(706)
tankerTheo:SetAltitude(10000)
tankerTheo:SetRespawnInAir()  
tankerTheo:SetTakeoffAir()
tankerTheo:Start()

-- E-2D @ USS Theo spawning in air.
awacsTheo=RECOVERYTANKER:New(UNIT:FindByName("CVN-71 Theodore Roosevelt"), "Focus")
awacsTheo:SetAWACS()
awacsTheo:SetCallsign(CALLSIGN.AWACS.Focus)
awacsTheo:SetTakeoffAir()
awacsTheo:SetAltitude(20000)
awacsTheo:SetSpeed(250)
awacsTheo:SetRadio(317.775)
awacsTheo:SetTACAN(0, "FCS")
awacsTheo:SetRacetrackDistances(40, 20)
awacsTheo:SetModex(600)
awacsTheo:SetRespawnInAir()  
awacsTheo:Start()

-- Rescue Helo @ USS Theodore Roosevelt spawned on deck hot.
heloTheo=RESCUEHELO:New(UNIT:FindByName("CVN-71 Theodore Roosevelt"), "Rescue Helo Group")
heloTheo:SetModex(21)
heloTheo:SetTakeoffAir()
heloTheo:SetRespawnInAir()  
heloTheo:Start()

-- Set carrier strike groups to patrol waypoints indefinitely. Once the last waypoint is reached, group will go back to first waypoint and start over.
Roosevelt = GROUP:FindByName('CVN-71 Theodore Roosevelt')
CVN71 = NAVYGROUP:New(Roosevelt)
CVN71:Activate()
CVN71:SetPatrolAdInfinitum()
CVN71:Cruise(29)


Forrestal = GROUP:FindByName('CV-59 Forrestal')
CV59 = NAVYGROUP:New(Forrestal)
CV59:Activate()
CV59:SetPatrolAdInfinitum()
CV59:Cruise(29)

env.info("carriergroup complete", false)
