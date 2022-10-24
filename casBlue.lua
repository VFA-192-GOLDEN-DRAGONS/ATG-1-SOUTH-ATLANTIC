env.info("bcas loading", false)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- BEGIN ELECTRONIC COMBAT SIMULATOR RANGE
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- IADS
-- REQUIRES MIST

local bCAS = {}
bCAS.ActiveSite = {}
bCAS.rIADS = nil

bCAS.f10topmenu = MENU_COALITION:New(coalition.side.BLUE, "CAS ZONES")
bCAS.menuEscTop = MENU_COALITION:New(coalition.side.BLUE, "FR15 Blue", bCAS.f10topmenu)

-- SAM spawn emplates
bCAS.templates = {
  {templateName = "CAS_blue_Tolhuin1", threatName = "Blue S Stopped Convoy"},
  {templateName = "CAS_blue_Tolhuin2", threatName = "Blue N Stopped Convoy"},
  {templateName = "CAS_blue_Tolhuin3",  threatName = "Blue E Stopped Convoy"},
  {templateName = "CAS_blue_Tolhuin4",  threatName = "Blue W Stopped Convoy"},
  {templateName = "CAS_blue_Tolhuin9",  threatName = "Moving Convoy"},
  {templateName = "CAS_blue_Tolhuin5",  threatName = "Airport Infrantry"},
  {templateName = "CAS_blue_Tolhuin6", threatName = "West Infrantry"},
  {templateName = "CAS_blue_Tolhuin7", threatName = "South Infrantry"},
  {templateName = "CAS_blue_Tolhuin8", threatName = "Moving Infrantry"},
}

-- Zone in which threat will be spawned
bCAS.zonebCas7769 = ZONE:FindByName("Zone_CasFR15")


function activatebCasThreat(samTemplate, samZone, activeThreat, isReset)

  -- remove threat selection menu options
  if not isReset then
    bCAS.menuEscTop:RemoveSubMenus()
  end
  
  -- spawn threat in bCAS zone
  local bcasSpawn = SPAWN:New(samTemplate)
  bcasSpawn:OnSpawnGroup(
      function (spawnGroup)
        MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Deactivate bCAS zone", bCAS.menuEscTop, resetbCasThreat, spawnGroup, bcasSpawn, activeThreat, false)
        MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Reset bCAS zone", bCAS.menuEscTop, resetbCasThreat, spawnGroup, bcasSpawn, activeThreat, true, samZone)
        local msg = "All players, bCAS Zone is active with " .. activeThreat
        if MISSIONSRS.Radio then -- if MISSIONSRS radio object has been created, send message via default broadbcast.
          MISSIONSRS:SendRadio(msg)
        else -- otherwise, send in-game text message
          MESSAGE:New(msg):ToAll()
        end
        --MESSAGE:New("bCAS Zone is active with " .. activeThreat):ToAll()
        --bCAS.rIADS = SkynetIADS:create("bCASOUTH")
        --bCAS.rIADS:setUpdateInterval(5)
        --bCAS.rIADS:addEarlyWarningRadar("GCI2")
        --bCAS.rIADS:addSAMSite(spawnGroup.GroupName)
        --bCAS.rIADS:getSAMSiteByGroupName(spawnGroup.GroupName):setGoLiveRangeInPercent(80)
        --bCAS.rIADS:activate()        
      end
      , bCAS.menuEscTop, bcasSpawn, activeThreat, samZone --, rangePrefix
    )
    --:SpawnInZone(samZone, false)
    :Spawn()
end

function resetbCasThreat(spawnGroup, bcasSpawn, activeThreat, refreshbCas, samZone)

  bCAS.menuEscTop:RemoveSubMenus()
  
  --if bCAS.rIADS ~= nil then
  --  bCAS.rIADS:deactivate()
  --  bCAS.rIADS = nil
  --end

  if spawnGroup:IsAlive() then
    spawnGroup:Destroy()
  end

  if refreshbCas then
    --bcasSpawn:SpawnInZone(samZone, false)
    bcasSpawn:Spawn()
  else
    addbCasThreatMenu()
    local msg = "All players, bCAS Zone "  .. activeThreat .." has been deactivated."
    if MISSIONSRS.Radio then -- if MISSIONSRS radio object has been created, send message via default broadbcast.
      MISSIONSRS:SendRadio(msg)
    else -- otherwise, send in-game text message
      MESSAGE:New(msg):ToAll()
    end
    --MESSAGE:New("bCAS Zone "  .. activeThreat .." has been deactived."):ToAll()
  end    

end

function addbCasThreatMenu()

  for i, template in ipairs(bCAS.templates) do
    MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Activate " .. template.threatName, bCAS.menuEscTop, activatebCasThreat, template.templateName, bCAS.zonebCas7769, template.threatName)
  end

end

addbCasThreatMenu()

--- END ELECTRONIC COMBAT SIMULATOR RANGE
env.info("bcas complete", false)