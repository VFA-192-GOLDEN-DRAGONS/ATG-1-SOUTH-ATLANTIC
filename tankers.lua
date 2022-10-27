env.info("tankers loading", false)

-----------------
-- AWACS SPAWN --
-----------------
SPAWN:New('bEWR_AWACS_MAGIC'):InitLimit(1,99):SpawnScheduled(60,1):InitRepeatOnLanding()
SPAWN:New('bEWR_AWACS_DARKSTAR'):InitLimit(1,99):SpawnScheduled(60,1):InitRepeatOnLanding()


-------------------
-- F10 RED AWACS --
-------------------

function RedAWACSSpawn ()
  RedAWACS = SPAWN:New('AWACS_BEAR'):InitLimit(1,99):SpawnScheduled(60,1):InitRepeatOnEngineShutDown()
end

function RedAWACSdestroy ()
  RedAWACS:SpawnScheduleStop()
  RedAWACSdel=SET_GROUP:New():FilterPrefixes("AWACS_BEAR#"):FilterActive(true):FilterOnce()
  local RedAWACSdelcount=RedAWACSdel:Count()
    for i = 1, RedAWACSdelcount do
      local grpObj = RedAWACSdel:GetRandom()
      --env.info(grpObj:GetName())
      grpObj:Destroy(true)
    end
end

RedAWACS = MENU_COALITION:New(coalition.side.BLUE, "RED PVP AWACS")
MENU_COALITION_COMMAND:New(coalition.side.BLUE, "SPAWN RED PVP AWACS", RedAWACS, RedAWACSSpawn)
MENU_COALITION_COMMAND:New(coalition.side.BLUE, "REMOVE RED PVP AWACS", RedAWACS, RedAWACSdestroy)

------------------
-- TANKER START --
------------------

local Tanker_KC135MPRS_Shell2 = SPAWN
   :New( "Tanker_KC135MPRS_Shell2" )
   :InitLimit( 1, 99 )
   :InitRepeatOnLanding()
   :InitRadioFrequency(344.025) --TKR1
   :SpawnScheduled( 15, 1 )
   :OnSpawnGroup(
     function( Shell2 )
     Shell2:CommandSetCallsign(3,2)
     end 
     )
    

local Tanker_KC135MPRS_Shell3 = SPAWN
   :New( "Tanker_KC135MPRS_Shell3" )
   :InitLimit( 1, 99 )
   :InitRepeatOnLanding()
   :InitRadioFrequency(367.575) --TKR2
   :SpawnScheduled( 15, 1 )
   :OnSpawnGroup(
     function( Shell3 )
     Shell3:CommandSetCallsign(3,3)
     end 
     )


local Tanker_KC135_Texaco2 = SPAWN
   :New( "Tanker_KC135_Texaco2" )
   :InitLimit( 1, 99 )
   :InitRepeatOnLanding()
   :InitRadioFrequency(317.650)
   :SpawnScheduled( 15, 1 )
   :OnSpawnGroup(
     function( Texaco2 )
     Texaco2:CommandSetCallsign(1,2)
     end 
     )
--[[
local Tanker_C130_Arco2 = SPAWN
   :New( "Tanker_C130_Arco2" )
   :InitLimit( 1, 99 )
   :InitRepeatOnLanding()
   :InitRadioFrequency(317.550)
   :SpawnScheduled( 15, 1 )
   :OnSpawnGroup(
     function( Arco2 )
     Arco2:CommandSetCallsign(2,2)
     end 
     )
     
local Tanker_KC135_Texaco3 = SPAWN
   :New( "Tanker_KC135_Texaco3" )
   :InitLimit( 1, 99 )
   :InitRepeatOnLanding()
   :InitRadioFrequency(317.750)
   :SpawnScheduled( 15, 1 )
   :OnSpawnGroup(
     function( Texaco3 )
     Texaco3:CommandSetCallsign(1,3)
     end 
     )
 
local Tanker_C130_Arco3 = SPAWN
   :New( "Tanker_C130_Arco3" )
   :InitLimit( 1, 99 )
   :InitRepeatOnLanding()
   :InitRadioFrequency(276.125)
   :SpawnScheduled( 15, 1 )
   :OnSpawnGroup(
     function( Arco3 )
     Arco3:CommandSetCallsign(2,3)
     end 
     )
]]--    

     
env.info("tanker complete", false)
