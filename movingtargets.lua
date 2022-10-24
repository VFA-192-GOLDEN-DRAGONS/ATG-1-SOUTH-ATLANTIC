--[[
1. Qty
2. Adding EWR to sam spawns for IADS
3. Adding category in menu for additional types of spawns in Movinges (Patrol, Buildings, etc.)
]]--

env.info("moving loading", false)

--- MENU STRUCTURE
--
-- ACTIVATE MOVING (menu root)
--   |_MOVING ZONE (menu level 1)
--     |_THREAT TYPE (command level 2)
--   |_DEACTIVATE ALL ZONES (command level 1)
-- 
-- A menu for each moving zone is added to the Moving Threat root menu.
-- Menus for spawning each threat type are added to each of the moving zone 
-- menus.
--
-- When a threat is selected, it will be spawned in the chosen moving zone.
-- The threat selection menus are removed from the moving zone menu and 
-- replaced with menus to either respawn a fresh copy of the chosen threat, 
-- or to remove the threat and deactivate the moving.
-- 
-- A list of movinges containing active threats is maintained. This list is 
-- stepped through to obtain the details for each spawned threat if the menu 
-- option to deactivate all zones is selected.


---------------------------------------------------------------------------------------------------
--- MOVING TABLE
---------------------------------------------------------------------------------------------------

--- MOVING table initialisation
-- @table MOVING
local MOVING = {}

--- Root menu.
-- @field #table menuTop Root KILLTABLE top level menu
--MenuTop = MENU_COALITION:New(coalition.side.BLUE, "Moving Menus")
MOVING.menuTop = MENU_COALITION:New(coalition.side.BLUE, "MOVING TARGETS - ARGENTINA")
--- Moving selection menu.
-- @field #table menuZones 
MOVING.menuZones = {}
--- List of active movinges.
-- @field #table activeSites List of sites with an active threat
MOVING.activeSites = {}

--- ZONES
-- @field #table zones
-- @field #string zoneName Name of ZONE object in ME representing the moving. Can be either a ZONE or a ZONE_POLYGON
-- @field #string kbName Lable for moving. MUST be UNIQUE.
-- @field #string menuText Text to be used for the moving's menu.
MOVING.zones = {
  { zoneName = "Convoy Start 1", kbName = "CS1", menuText = "Convoy Start 1"},
  { zoneName = "Convoy Start 2", kbName = "CS2", menuText = "Convoy Start 2"},
  }

--- THREATS
-- @field #table threats each record represents a specific threat
-- @field #string spawnTemplate Name of template GROUP.
-- @field #string menuText Text to be used for the threat's menu.
-- @field #string threatText Text to display in threat's activation message.
MOVING.threats = {
  { spawnTemplate = "Armor A Slow",    menuText = "Armor to A Slow",   threatText = "AAA" },
  { spawnTemplate = "Armor B Slow",    menuText = "Armor to B Slow",   threatText = "AAA" },
  { spawnTemplate = "Armor C Slow",    menuText = "Armor to C Slow",   threatText = "AAA" },
  { spawnTemplate = "Armor A Fast",    menuText = "Armor to A Fast",   threatText = "AAA" },
  { spawnTemplate = "Armor B Fast",    menuText = "Armor to B Fast",   threatText = "AAA" },
  { spawnTemplate = "Armor C Fast",    menuText = "Armor to C Fast",   threatText = "AAA" },
  { spawnTemplate = "SAM A",           menuText = "SAM to A",          threatText = "AAA/RF/IR" },
  { spawnTemplate = "SAM B",           menuText = "SAM to B",          threatText = "AAA/RF/IR" },
  { spawnTemplate = "SAM C",           menuText = "SAM to C",          threatText = "AAA/RF/IR" },
  }


---------------------------------------------------------------------------------------------------
--- ACTIVATE THREAT
-----------------------------------------------------------------------------------------------------

--- Activate threat in chosen zone.
-- @param #string spawnTemplate Name of group used as template for spawning threat. From MOVING.threats.
-- @param #tring kbName Name of the kill box. Used for moving's record in list of active sites. From MOVING.zones.
-- @param #string zoneName Name of kill box zone from MOVING.zones.
-- @param #string threatText Text for threat to be used in activeation message. 
function activateMOVINGThreat(spawnTemplate, kbName, zoneName, threatText)

  --debugMsg = MESSAGE:New(kbName .. "Activating Threat"):ToAll()

  -- remove threat submenus
  MOVING.menuZones[kbName]:RemoveSubMenus()
  --initialise entry in table of active zones 
  MOVING.activeSites[kbName] = {}
  
  -- MOVING zone is either a ZONE or a ZONE_POLYGON
  local kbSpawnZone = (ZONE:FindByName(zoneName) and ZONE:FindByName(zoneName) or ZONE_POLYGON:FindByName(zoneName))
  
  -- Alias to use for each threat SPAWN object so that spawned group names include the moving label
  local spawnAliasPrefix = kbName .. "-" .. spawnTemplate
  
  -- spawn threat in MOVING zone
  MOVING.activeSites[kbName].spawn = SPAWN:NewWithAlias( spawnTemplate, spawnAliasPrefix)  --SPAWN:New(spawnTemplate)
  
   --debugMsg = MESSAGE:New(kbName .. "SPAWN object created"):ToAll()

  -- spawn threat in moving
  -- add threat to moving's entry in activeSites list
  -- activate IADS for threat
  MOVING.activeSites[kbName].spawn:OnSpawnGroup(
      function (spawnGroup)
        MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Deactivate Moving", MOVING.menuZones[kbName], resetMOVINGThreat, spawnGroup, threatText, kbName, zoneName, kbSpawnZone, false)
        MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Reset Moving", MOVING.menuZones[kbName], resetMOVINGThreat, spawnGroup, threatText, kbName, zoneName, kbSpawnZone, true)
        MOVING.activeSites[kbName].activeThreat = {spawnGroup, threatText, kbName, zoneName, kbSpawnZone, false}
        MESSAGE:New("Moving " .. kbName .. " is active with " .. threatText):ToAll()
        MOVING.activeSites[kbName].rIADS = SkynetIADS:create("MOVING" .. kbName)
        MOVING.activeSites[kbName].rIADS:setUpdateInterval(5)
        MOVING.activeSites[kbName].rIADS:addSAMSite(spawnGroup.GroupName)
        MOVING.activeSites[kbName].rIADS:getSAMSiteByGroupName(spawnGroup.GroupName):setGoLiveRangeInPercent(80)
        MOVING.activeSites[kbName].rIADS:activate()        
        --debugMsg = MESSAGE:New(kbName .. " - spawnGoup = " .. spawnGroup.GroupName):ToAll()
      end
      , threatText, kbName, zoneName, kbSpawnZone
    )
    
  -- spawn threat at random point wqithin moving
  MOVING.activeSites[kbName].spawn:SpawnInZone(kbSpawnZone, true)

end


---------------------------------------------------------------------------------------------------
--- RESET THREAT
---------------------------------------------------------------------------------------------------

--- Reset selected threat, or deactivate moving.
-- @param #table spawnGroup GROUP object for spawned threat.
-- @param #string threatText Text used in message when threat reset or removed. From MOVING.threats.
-- @param #string kbName Label of moving. From MOVING.zones.
-- @param #string zoneName Name of ZONE or ZONE_POLYGON representing moving. From MOVING.zones.
-- @param #table kbSpawnZone ZONE or ZONE_POLYGON object representing moving.
-- @param #boolean refreshMOVING If ture previously chosen threat will be removed and respawned at a random location within the moving.
function resetMOVINGThreat(spawnGroup, threatText, kbName, zoneName, kbSpawnZone, refreshMOVING)

  --debugMsg = MESSAGE:New(kbName .. " Reset"):ToAll()

  -- remove deactivate and reset submenus from the moving's zone menu.
  MOVING.menuZones[kbName]:RemoveSubMenus()
  
  -- deactivate IADS for threat if currently active.
  if MOVING.activeSites[kbName].rIADS ~= nil then
    MOVING.activeSites[kbName].rIADS:deactivate()
    MOVING.activeSites[kbName].rIADS = nil
  end

  -- remove the spawned threat if it is still alive.
  if spawnGroup:IsAlive() then
    spawnGroup:Destroy()
  end

  if refreshMOVING then
    -- debugMsg = MESSAGE:New(kbName .. "Refresh Threat"):ToAll()
    -- spawn a fresh group of the chosen threat at a random point in the moving.
    MOVING.activeSites[kbName].spawn:SpawnInZone(kbSpawnZone, true)
  else
    -- add threat menus back to the moving's zone menu
    addMOVINGThreatMenu(kbName, zoneName)
    MESSAGE:New("moving " .. kbName .. "  " .. threatText .." has been deactived."):ToAll()
  end    

end


---------------------------------------------------------------------------------------------------
--- DEACTIVATE ALL ZONES
---------------------------------------------------------------------------------------------------

--- Deactivate spawned threats in ALL movinges
function resetMOVINGAll()

  --debugMsg = MESSAGE:New("Reset All"):ToAll()
  
  -- step through MOVING.activeSites list and call resetMOVINGThreat for any movinges that are active.
  for kb, kbActive in pairs(MOVING.activeSites) do
    --debugMsg = MESSAGE:New("Resetting ".. kb):ToAll()
    resetMOVINGThreat( kbActive.activeThreat[1], kbActive.activeThreat[2], kbActive.activeThreat[3], kbActive.activeThreat[4], kbActive.activeThreat[5], kbActive.activeThreat[6] )
  end
  
end


---------------------------------------------------------------------------------------------------
--- ADD ZONE MENUS
---------------------------------------------------------------------------------------------------

--- Add ZONE menus to Moving Threat root menu
function addMOVINGZoneMenu()

  -- step through MOVING.zones and add a zone menu for each moving
  for i, kbZone in ipairs(MOVING.zones) do
    -- add the moving's zone menu to the Moving Threat menu
    MOVING.menuZones[kbZone.kbName] = MENU_COALITION:New( coalition.side.BLUE, kbZone.menuText, MOVING.menuTop )
    -- add threat menus to the moving's zone menu
    addMOVINGThreatMenu( kbZone.kbName, kbZone.zoneName )
  end
  
  -- deactivate ALL active zones
  MENU_COALITION_COMMAND:New(coalition.side.BLUE,"Deactivate all Movinges",MOVING.menuTop,resetMOVINGAll)

end


---------------------------------------------------------------------------------------------------
--- ADD THREAT MENUS
---------------------------------------------------------------------------------------------------
  
--- Add THREAT menu commands to each zone for activating each threat type
function addMOVINGThreatMenu(kbName, zoneName)

  for i, kbThreat in ipairs(MOVING.threats) do
    MENU_COALITION_COMMAND:New( coalition.side.BLUE, kbThreat.menuText, MOVING.menuZones[kbName], activateMOVINGThreat, kbThreat.spawnTemplate, kbName, zoneName, kbThreat.threatText, false )
  end
  
end
 
addMOVINGZoneMenu()


env.info("moving complete", false)
