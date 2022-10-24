env.info("range loading", false)

-- XXX RANGE SCRIPT SECTION (MOOSE)

local atg1RangeControlCommon = 245.000

-- BEGIN DB86Range

local bombtarget_DB86={"RANGE_DB86_NORTH_bombing", 
  "RANGE_DB86_SOUTH_bombing"
  }
local strafepit_DB86_NORTH={"RANGE_DB86_strafepit_A",
  "RANGE_DB86_strafepit_B"
  }
local strafepit_DB86_SOUTH={"RANGE_DB86_strafepit_C",
  "RANGE_DB86_strafepit_D"
  }

Range_DB86= RANGE:New("DB86 Range")
fouldist_DB86= Range_DB86:GetFoullineDistance("RANGE_DB86_strafepit_A", "RANGE_DB86_FoulLine_AB")
Range_DB86:AddStrafePit(strafepit_DB86_NORTH, 3000, 300, nil, true, 20, fouldist_DB86)
Range_DB86:AddStrafePit(strafepit_DB86_SOUTH, 3000, 300, nil, true, 20, fouldist_DB86)
Range_DB86:AddBombingTargets(bombtarget_DB86, 50)
Range_DB86:SetSoundfilesPath("Range Soundfiles/")
--Range_DB86:SetInstructorRadio(atg1RangeControlCommon)
Range_DB86:SetRangeControl(245.000)
Range_DB86:Start()

-- END DB86Range
-- BEGIN EB35Range

local bombtarget_EB35={"RANGE_EB35_NORTH_bombing", 
  "RANGE_EB35_SOUTH_bombing"
  }
local strafepit_EB35_NORTH={"RANGE_EB35_strafepit_A",
  "RANGE_EB35_strafepit_B"
  }
local strafepit_EB35_SOUTH={"RANGE_EB35_strafepit_C",
  "RANGE_EB35_strafepit_D"
  }

Range_EB35= RANGE:New("EB35 Range")
fouldist_EB35= Range_EB35:GetFoullineDistance("RANGE_EB35_strafepit_A", "RANGE_EB35_FoulLine_AB")
Range_EB35:AddStrafePit(strafepit_EB35_NORTH, 3000, 300, nil, true, 20, fouldist_EB35)
Range_EB35:AddStrafePit(strafepit_EB35_SOUTH, 3000, 300, nil, true, 20, fouldist_EB35)
Range_EB35:AddBombingTargets(bombtarget_EB35, 50)
Range_EB35:SetSoundfilesPath("Range Soundfiles/")
--Range_EB35:SetInstructorRadio(atg1RangeControlCommon)
Range_EB35:SetRangeControl(245.000)
Range_EB35:Start()

-- END EB35Range
-- BEGIN DV58Range

 local bombtarget_DV58={"RANGE_DV58_Bombing"}
 Range_DV58=RANGE:New("DV58 Range")
 Range_DV58:AddBombingTargets(bombtarget_DV58, 50)
 --Range_DV58:SetInstructorRadio(atg1RangeControlCommon)
 Range_DV58:SetSoundfilesPath("Range Soundfiles/")
 Range_DV58:SetRangeControl(245.000)
 Range_DV58:Start()
 
 -- END DV58Range
 -- BEGIN DB24 Range

local bombtarget_DB24 = {"Range_DB24-Soft-1",
  "Range_DB24-Soft-2",
  "Range_DB24-Soft-3",
  "Range_DB24-Soft-4",
  "Range_DB24-Soft-5",
  "Range_DB24-Soft-6",
  "Range_DB24-Soft-7",
  "Range_DB24-Soft-8",
  "Range_DB24-Soft-9",
  "Range_DB24-Hard-1",
  "Range_DB24-Hard-2",
  "Range_DB24-Hard-3",
  "Range_DB24-Hard-4",
  "Range_DB24-Hard-5",
  "Range_DB24-Hard-6",
  "Range_DB24-Hard-7",
  "Range_DB24-Hard-8",
  "Range_DB24-Hard-9"
    }

Range_DB24 = RANGE:New("DB24 Range")
Range_DB24:AddBombingTargets(bombtarget_DB24, 50)
Range_DB24:SetSoundfilesPath("Range Soundfiles/")
--Range_DB24:SetInstructorRadio(atg1RangeControlCommon)
Range_DB24:SetRangeControl(245.000)
Range_DB24:Start()

-- END DB24 Range
 
 
 env.info("range complete", false)