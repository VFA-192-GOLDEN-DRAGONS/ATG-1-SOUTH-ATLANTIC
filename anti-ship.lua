env.info("anti-ship loading", false)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- BEGIN ELECTRONIC COMBAT SIMULATOR RANGE
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- IADS
-- REQUIRES MIST

local SHIP = {}
SHIP.ActiveSite = {}
SHIP.rIADS = nil

SHIP.menuEscTop = MENU_COALITION:New(coalition.side.BLUE, "ANTI-SHIP")

-- SAM spawn emplates
SHIP.templates = {
  {templateName = "Ship1", threatName = "Tanker - No threat"},
  {templateName = "Ship2", threatName = "Sub convoy - Minimum threat"},
  {templateName = "Ship3",  threatName = "Chinese Marine Convoy - Medium threat"},
  {templateName = "Ship4",  threatName = "Kuznetsov Carrier Group - High threat"},
  {templateName = "Ship5",  threatName = "Battlecruiser convoy - Maximum threat"},
}



-- Zone in which threat will be spawned
SHIP.zoneShip7769 = ZONE:FindByName("ZONE_SHIP")


function activateShipThreat(samTemplate, samZone, activeThreat, isReset)

  -- remove threat selection menu options
  if not isReset then
    SHIP.menuEscTop:RemoveSubMenus()
  end
  
  -- spawn threat in SHIP zone
  local shipSpawn = SPAWN:New(samTemplate)
  shipSpawn:OnSpawnGroup(
      function (spawnGroup)
        MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Deactivate ANTI-SHIP zone", SHIP.menuEscTop, resetShipThreat, spawnGroup, shipSpawn, activeThreat, false)
        MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Reset ANTI-SHIP zone", SHIP.menuEscTop, resetShipThreat, spawnGroup, shipSpawn, activeThreat, true, samZone)
        local msg = "All players, ANTI-SHIP Zone is active with " .. activeThreat
        if MISSIONSRS.Radio then -- if MISSIONSRS radio object has been created, send message via default broadshipt.
          MISSIONSRS:SendRadio(msg)
        else -- otherwise, send in-game text message
          MESSAGE:New(msg):ToAll()
        end
        --MESSAGE:New("SHIP Zone is active with " .. activeThreat):ToAll()
        --SHIP.rIADS = SkynetIADS:create("SHIPOUTH")
        --SHIP.rIADS:setUpdateInterval(5)
        --SHIP.rIADS:addEarlyWarningRadar("GCI2")
        --SHIP.rIADS:addSAMSite(spawnGroup.GroupName)
        --SHIP.rIADS:getSAMSiteByGroupName(spawnGroup.GroupName):setGoLiveRangeInPercent(80)
        --SHIP.rIADS:activate()        
      end
      , SHIP.menuEscTop, shipSpawn, activeThreat, samZone --, rangePrefix
    )
    --:SpawnInZone(samZone, false)
    :Spawn()
end

function resetShipThreat(spawnGroup, shipSpawn, activeThreat, refreshShip, samZone)

  SHIP.menuEscTop:RemoveSubMenus()
  
  --if SHIP.rIADS ~= nil then
  --  SHIP.rIADS:deactivate()
  --  SHIP.rIADS = nil
  --end

  if spawnGroup:IsAlive() then
    spawnGroup:Destroy()
  end

  if refreshShip then
    --shipSpawn:SpawnInZone(samZone, false)
    shipSpawn:Spawn()
  else
    addShipThreatMenu()
    local msg = "All players, ANTI-SHIP Zone "  .. activeThreat .." has been deactivated."
    if MISSIONSRS.Radio then -- if MISSIONSRS radio object has been created, send message via default broadshipt.
      MISSIONSRS:SendRadio(msg)
    else -- otherwise, send in-game text message
      MESSAGE:New(msg):ToAll()
    end
    --MESSAGE:New("SHIP Zone "  .. activeThreat .." has been deactived."):ToAll()
  end    

end

function addShipThreatMenu()

  for i, template in ipairs(SHIP.templates) do
    MENU_COALITION_COMMAND:New(coalition.side.BLUE, " " .. template.threatName, SHIP.menuEscTop, activateShipThreat, template.templateName, SHIP.zoneShip7769, template.threatName)
  end

end

addShipThreatMenu()

--- END ELECTRONIC COMBAT SIMULATOR RANGE
env.info("anti-ship complete", false)