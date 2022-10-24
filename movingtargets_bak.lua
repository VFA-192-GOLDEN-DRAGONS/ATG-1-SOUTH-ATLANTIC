------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- BEGIN MOVING TARGETS
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- R62 T6208 MOVING TARGETS

local function rangeMovingTarget(targetId)
    local spawnMovingTarget = SPAWN:New( targetId )
    spawnMovingTarget:Spawn()
  end

  local MenuCD = MENU_COALITION:New( coalition.side.BLUE, "Grid CD Moving Targets" )
  local MenuTCD_1 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Argentine Convoy 4 Fast (62 mph)", MenuCD, rangeMovingTarget, "Argentine Convoy 4 Fast")
  local MenuTCD_2 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Argentine Convoy 2 Medium (28 mph)", MenuCD, rangeMovingTarget, "Argentine Convoy 2 Medium")
  local MenuTCD_3 = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Argentine Convoy 3 Slow (12 mph)", MenuCD, rangeMovingTarget, "Argentine Convoy 3 Slow")

  -- END R62 T6208

--- END MOVING TARGETS 