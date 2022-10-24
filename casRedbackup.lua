env.info("rcas loading", false)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- BEGIN ELECTRONIC COMBAT SIMULATOR RANGE
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- IADS
-- REQUIRES MIST

local rCAS = {}
rCAS.ActiveSite = {}
rCAS.rIADS = nil

rCAS.f10topmenu = MENU_COALITION:New(coalition.side.BLUE, "CAS Zones")
rCAS.menuEscTop = MENU_COALITION:New(coalition.side.BLUE, "FR15 Red", rCAS.f10topmenu)

-- SAM spawn emplates
rCAS.templates = {
  {templateName = "CAS_red_Tolhuin1", threatName = "East Armor"},
  {templateName = "CAS_red_Tolhuin2", threatName = "North Armor"},
  {templateName = "CAS_red_Tolhuin6",  threatName = "South Amphibius Assult"},
  {templateName = "CAS_red_Tolhuin3",  threatName = "Moving Infantry"},
  {templateName = "CAS_red_Tolhuin4",  threatName = "West Infrantry"},
  {templateName = "CAS_red_Tolhuin5",  threatName = "North Infrantry"},
  {templateName = "CAS_red_Tolhuin7b", threatName = "Airport Helo Insertion"},
  {templateName = "CAS_red_Tolhuin12", threatName = "North Artillery"},
  {templateName = "CAS_red_Tolhuin8", threatName = "South Artillery"},
  {templateName = "CAS_red_Tolhuin9", threatName = "West Artillery"},
  }
-- Zone in which threat will be spawned
rCAS.zonerCas7769 = ZONE:FindByName("Zone_CasFR15")


function activaterCasThreat(samTemplate, samZone, activeThreat, isReset)

  -- remove threat selection menu options
  if not isReset then
    rCAS.menuEscTop:RemoveSubMenus()
  end
  
  -- spawn threat in rCAS zone
  local rcasSpawn = SPAWN:New(samTemplate)
  rcasSpawn:OnSpawnGroup(
      function (spawnGroup)
        MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Deactivate rCAS zone", rCAS.menuEscTop, resetrCasThreat, spawnGroup, rcasSpawn, activeThreat, false)
        MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Reset rCAS zone", rCAS.menuEscTop, resetrCasThreat, spawnGroup, rcasSpawn, activeThreat, true, samZone)
        local msg = "All players, rCAS Zone is active with " .. activeThreat
        if MISSIONSRS.Radio then -- if MISSIONSRS radio object has been created, send message via default broadrcast.
          MISSIONSRS:SendRadio(msg)
        else -- otherwise, send in-game text message
          MESSAGE:New(msg):ToAll()
        end
        --MESSAGE:New("rCAS Zone is active with " .. activeThreat):ToAll()
        --rCAS.rIADS = SkynetIADS:create("rCASOUTH")
        --rCAS.rIADS:setUpdateInterval(5)
        --rCAS.rIADS:addEarlyWarningRadar("GCI2")
        --rCAS.rIADS:addSAMSite(spawnGroup.GroupName)
        --rCAS.rIADS:getSAMSiteByGroupName(spawnGroup.GroupName):setGoLiveRangeInPercent(80)
        --rCAS.rIADS:activate()        
      end
      , rCAS.menuEscTop, rcasSpawn, activeThreat, samZone --, rangePrefix
    )
    --:SpawnInZone(samZone, false)
    :Spawn()
end

function resetrCasThreat(spawnGroup, rcasSpawn, activeThreat, refreshrCas, samZone)

  rCAS.menuEscTop:RemoveSubMenus()
  
  --if rCAS.rIADS ~= nil then
  --  rCAS.rIADS:deactivate()
  --  rCAS.rIADS = nil
  --end

  if spawnGroup:IsAlive() then
    spawnGroup:Destroy()
  end

  if refreshrCas then
    --rcasSpawn:SpawnInZone(samZone, false)
    rcasSpawn:Spawn()
  else
    addrCasThreatMenu()
    local msg = "All players, rCAS Zone "  .. activeThreat .." has been deactivated."
    if MISSIONSRS.Radio then -- if MISSIONSRS radio object has been created, send message via default broadrcast.
      MISSIONSRS:SendRadio(msg)
    else -- otherwise, send in-game text message
      MESSAGE:New(msg):ToAll()
    end
    --MESSAGE:New("rCAS Zone "  .. activeThreat .." has been deactived."):ToAll()
  end    

end

function addrCasThreatMenu()

  for i, template in ipairs(rCAS.templates) do
    MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Activate " .. template.threatName, rCAS.menuEscTop, activaterCasThreat, template.templateName, rCAS.zonerCas7769, template.threatName)
  end

end

addrCasThreatMenu()

--- END ELECTRONIC COMBAT SIMULATOR RANGE
env.info("rcas complete", false)