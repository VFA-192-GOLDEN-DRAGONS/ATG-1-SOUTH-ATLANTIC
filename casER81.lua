env.info("casER81 loading", false)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- BEGIN ELECTRONIC COMBAT SIMULATOR RANGE
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- IADS
-- REQUIRES MIST

local CAS = {}
CAS.ActiveSite = {}
CAS.rIADS = nil

CAS.f10topmenu = MENU_COALITION:New(coalition.side.BLUE, "CAS ZONES")
CAS.menuEscTop = MENU_COALITION:New(coalition.side.BLUE, "ER 81/91", CAS.f10topmenu)

-- SAM spawn emplates
CAS.templates = {
  {templateName = "CAS_1b", threatName = "Roadblock Attack"},
  {templateName = "CAS_2b", threatName = "Gunboat Attack"},
  {templateName = "CAS_3a",  threatName = "City Patrol"},
  {templateName = "CAS_4c",  threatName = "FARP Attack"},
  {templateName = "CAS_5b",  threatName = "Oilrig Artillery Attack"},
  {templateName = "CAS_6a",  threatName = "Oilrig Helo Attack"},
  {templateName = "CAS_7a", threatName = "City Helo Attack"},
}



-- Zone in which threat will be spawned
CAS.zoneCas7769 = ZONE:FindByName("Zone_CasER81")


function activateCasThreat(samTemplate, samZone, activeThreat, isReset)

  -- remove threat selection menu options
  if not isReset then
    CAS.menuEscTop:RemoveSubMenus()
  end
  
  -- spawn threat in CAS zone
  local casSpawn = SPAWN:New(samTemplate)
  casSpawn:OnSpawnGroup(
      function (spawnGroup)
        MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Deactivate CAS zone", CAS.menuEscTop, resetCasThreat, spawnGroup, casSpawn, activeThreat, false)
        MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Reset CAS zone", CAS.menuEscTop, resetCasThreat, spawnGroup, casSpawn, activeThreat, true, samZone)
        local msg = "All players, CAS Zone is active with " .. activeThreat
        if MISSIONSRS.Radio then -- if MISSIONSRS radio object has been created, send message via default broadcast.
          MISSIONSRS:SendRadio(msg)
        else -- otherwise, send in-game text message
          MESSAGE:New(msg):ToAll()
        end
        --MESSAGE:New("CAS Zone is active with " .. activeThreat):ToAll()
        --CAS.rIADS = SkynetIADS:create("CASOUTH")
        --CAS.rIADS:setUpdateInterval(5)
        --CAS.rIADS:addEarlyWarningRadar("GCI2")
        --CAS.rIADS:addSAMSite(spawnGroup.GroupName)
        --CAS.rIADS:getSAMSiteByGroupName(spawnGroup.GroupName):setGoLiveRangeInPercent(80)
        --CAS.rIADS:activate()        
      end
      , CAS.menuEscTop, casSpawn, activeThreat, samZone --, rangePrefix
    )
    --:SpawnInZone(samZone, false)
    :Spawn()
end

function resetCasThreat(spawnGroup, casSpawn, activeThreat, refreshCas, samZone)

  CAS.menuEscTop:RemoveSubMenus()
  
  --if CAS.rIADS ~= nil then
  --  CAS.rIADS:deactivate()
  --  CAS.rIADS = nil
  --end

  if spawnGroup:IsAlive() then
    spawnGroup:Destroy()
  end

  if refreshCas then
    --casSpawn:SpawnInZone(samZone, false)
    casSpawn:Spawn()
  else
    addCasThreatMenu()
    local msg = "All players, CAS Zone "  .. activeThreat .." has been deactivated."
    if MISSIONSRS.Radio then -- if MISSIONSRS radio object has been created, send message via default broadcast.
      MISSIONSRS:SendRadio(msg)
    else -- otherwise, send in-game text message
      MESSAGE:New(msg):ToAll()
    end
    --MESSAGE:New("CAS Zone "  .. activeThreat .." has been deactived."):ToAll()
  end    

end

function addCasThreatMenu()

  for i, template in ipairs(CAS.templates) do
    MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Activate " .. template.threatName, CAS.menuEscTop, activateCasThreat, template.templateName, CAS.zoneCas7769, template.threatName)
  end

end

addCasThreatMenu()

--- END ELECTRONIC COMBAT SIMULATOR RANGE
env.info("casER81 complete", false)