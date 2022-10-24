env.info('Initiating Custom GROUND MOOSE for TTI ok')

search_agl_time = 30

function clearTemplate(templateToClear)
    for k in pairs(templateToClear) do
        templateToClear[k] = nil
    end
end

if mission_era == "modern" then
	TemplateTable_INF_GROUND = { 
	"red_inf_georgia_m4",
	--"red_inf_m4",
	"red_inf_ak",
	"red_inf_m249",
	--"red_inf_insurgent_sol",
	--"red_inf_rus_sol",
	"red_inf_paratrooper_aks",
	"red_inf_paratrooper_rpg",
	}
end

if mission_era == "cold_war" then
	TemplateTable_INF_GROUND = { 
	--"red_inf_georgia_m4",
	--"red_inf_m4",
	"red_inf_ak",
	--"red_inf_m249",
	--"red_inf_insurgent_sol",
	--"red_inf_rus_sol",
	--"red_inf_paratrooper_aks",
	"red_inf_paratrooper_rpg",
	}
end

if mission_era == "ww2" and ww2_asset_pack_enable == false then
	TemplateTable_INF_GROUND = { 
	--"red_inf_georgia_m4",
	--"red_inf_m4",
	"red_inf_ak",
	--"red_inf_m249",
	--"red_inf_insurgent_sol",
	--"red_inf_rus_sol",
	--"red_inf_paratrooper_aks",
	--"red_inf_paratrooper_rpg",
	}
end
	
if mission_era == "ww2" and ww2_asset_pack_enable == true then
	TemplateTable_INF_GROUND = { 
	"red_inf_soldier_wwii_br",
	"red_inf_soldier_wwii_gr",
	"red_inf_soldier_wwii_us",
	} 
end

if mission_era == "korean_war" and ww2_asset_pack_enable == false then
	TemplateTable_INF_GROUND = { 
	--"red_inf_georgia_m4",
	--"red_inf_m4",
	"red_inf_ak",
	--"red_inf_m249",
	--"red_inf_insurgent_sol",
	--"red_inf_rus_sol",
	--"red_inf_paratrooper_aks",
	--"red_inf_paratrooper_rpg",
	} 
end

if mission_era == "korean_war" and ww2_asset_pack_enable == true then
	TemplateTable_INF_GROUND = { 
	"red_inf_soldier_wwii_br",
	"red_inf_soldier_wwii_gr",
	"red_inf_soldier_wwii_us",
	} 
end

--INSERT Paid WW2 Units
if mission_era == "ww2" and ww2_asset_pack_enable == true then
table.insert(TemplateTable_GROUND, "red_ar_m8_greyhound")
table.insert(TemplateTable_GROUND, "red_ar_daimler")
table.insert(TemplateTable_GROUND, "red_ar_mbt_centaur")
table.insert(TemplateTable_GROUND, "red_ar_mbt_churchhill")
table.insert(TemplateTable_GROUND, "red_ar_mbt_cromwell")
table.insert(TemplateTable_GROUND, "red_ar_mbt_tiger2")
table.insert(TemplateTable_GROUND, "red_ar_mbt_tiger1")
table.insert(TemplateTable_GROUND, "red_ar_mbt_sherman_ff")
table.insert(TemplateTable_GROUND, "red_ar_puma")
table.insert(TemplateTable_GROUND, "red_ar_mbt_jagdpanther")
table.insert(TemplateTable_GROUND, "red_ar_mbt_jagpz")
table.insert(TemplateTable_GROUND, "red_ar_mbt_pzvpanther")
table.insert(TemplateTable_GROUND, "red_ar_mbt_stug")
table.insert(TemplateTable_GROUND, "red_ar_mbt_elefant")
table.insert(TemplateTable_GROUND, "red_ar_mbt_m10gmc")
table.insert(TemplateTable_GROUND, "red_ar_mbt_sturmpziv")
table.insert(TemplateTable_GROUND, "red_ar_tetrarch")

table.insert(TemplateTable_GROUND, "red_arty_m12_gmc")

table.insert(TemplateTable_GROUND, "red_ua_cckw")
table.insert(TemplateTable_GROUND, "red_ua_m4tractor")
table.insert(TemplateTable_GROUND, "red_ua_kubelwagen")
table.insert(TemplateTable_GROUND, "red_ua_kfz2")
table.insert(TemplateTable_GROUND, "red_ua_horch")
table.insert(TemplateTable_GROUND, "red_ua_kfz7")
table.insert(TemplateTable_GROUND, "red_ua_m30cc")
table.insert(TemplateTable_GROUND, "red_ua_willysmb")
--[[
table.insert(TemplateTable_INF_GROUND, "red_inf_soldier_wwii_br")
table.insert(TemplateTable_INF_GROUND, "red_inf_soldier_wwii_gr")
table.insert(TemplateTable_INF_GROUND, "red_inf_soldier_wwii_us")
--]]
table.insert(TemplateTable_AA, "red_aa_aaa_flakscheinwerfer")
table.insert(TemplateTable_AA, "red_aa_aaa_qf37")
table.insert(TemplateTable_AA, "red_aa_aaa_m45quad")
table.insert(TemplateTable_AA, "red_aa_aaa_flak30")
table.insert(TemplateTable_AA, "red_aa_aaa_flak38")
table.insert(TemplateTable_AA, "red_aa_aaa_m137")
table.insert(TemplateTable_AA, "red_aa_aaa_flak41")
table.insert(TemplateTable_AA, "red_aa_aaa_flak37")
table.insert(TemplateTable_AA, "red_aa_aaa_flak36")

table.insert(TemplateTable_EASY_SAM, "red_aa_aaa_flakscheinwerfer")
table.insert(TemplateTable_EASY_SAM, "red_aa_aaa_qf37")
table.insert(TemplateTable_EASY_SAM, "red_aa_aaa_m45quad")
table.insert(TemplateTable_EASY_SAM, "red_aa_aaa_flak30")
table.insert(TemplateTable_EASY_SAM, "red_aa_aaa_flak38")
table.insert(TemplateTable_EASY_SAM, "red_aa_aaa_m137")
table.insert(TemplateTable_EASY_SAM, "red_aa_aaa_flak41")
table.insert(TemplateTable_EASY_SAM, "red_aa_aaa_flak37")
table.insert(TemplateTable_EASY_SAM, "red_aa_aaa_flak36")

table.insert(TemplateTable_HARD_SAM, "red_aa_aaa_flakscheinwerfer")
table.insert(TemplateTable_HARD_SAM, "red_aa_aaa_qf37")
table.insert(TemplateTable_HARD_SAM, "red_aa_aaa_m45quad")
table.insert(TemplateTable_HARD_SAM, "red_aa_aaa_flak30")
table.insert(TemplateTable_HARD_SAM, "red_aa_aaa_flak38")
table.insert(TemplateTable_HARD_SAM, "red_aa_aaa_m137")
table.insert(TemplateTable_HARD_SAM, "red_aa_aaa_flak41")
table.insert(TemplateTable_HARD_SAM, "red_aa_aaa_flak37")
table.insert(TemplateTable_HARD_SAM, "red_aa_aaa_flak36")

table.insert(TemplateTable_SEA, "red_ship_ww2_uss_samuel_chase")
table.insert(TemplateTable_SEA, "red_ship_ww2_lstmk2")
table.insert(TemplateTable_SEA, "red_ship_ww2_uboatviic")
table.insert(TemplateTable_SEA, "red_ship_ww2_schnellboot")
table.insert(TemplateTable_SEA, "red_ship_ww2_higgins")
end

--INSERT Paid WW2 Units
if mission_era == "korean_war" and ww2_asset_pack_enable == true then
table.insert(TemplateTable_GROUND, "red_ar_m8_greyhound")
table.insert(TemplateTable_GROUND, "red_ar_daimler")
table.insert(TemplateTable_GROUND, "red_ar_mbt_centaur")
table.insert(TemplateTable_GROUND, "red_ar_mbt_churchhill")
table.insert(TemplateTable_GROUND, "red_ar_mbt_cromwell")
table.insert(TemplateTable_GROUND, "red_ar_mbt_tiger2")
table.insert(TemplateTable_GROUND, "red_ar_mbt_tiger1")
table.insert(TemplateTable_GROUND, "red_ar_mbt_sherman_ff")
table.insert(TemplateTable_GROUND, "red_ar_puma")
table.insert(TemplateTable_GROUND, "red_ar_mbt_jagdpanther")
table.insert(TemplateTable_GROUND, "red_ar_mbt_jagpz")
table.insert(TemplateTable_GROUND, "red_ar_mbt_pzvpanther")
table.insert(TemplateTable_GROUND, "red_ar_mbt_stug")
table.insert(TemplateTable_GROUND, "red_ar_mbt_elefant")
table.insert(TemplateTable_GROUND, "red_ar_mbt_m10gmc")
table.insert(TemplateTable_GROUND, "red_ar_mbt_sturmpziv")
table.insert(TemplateTable_GROUND, "red_ar_tetrarch")

table.insert(TemplateTable_GROUND, "red_arty_m12_gmc")

table.insert(TemplateTable_GROUND, "red_ua_cckw")
table.insert(TemplateTable_GROUND, "red_ua_m4tractor")
table.insert(TemplateTable_GROUND, "red_ua_kubelwagen")
table.insert(TemplateTable_GROUND, "red_ua_kfz2")
table.insert(TemplateTable_GROUND, "red_ua_horch")
table.insert(TemplateTable_GROUND, "red_ua_kfz7")
table.insert(TemplateTable_GROUND, "red_ua_m30cc")
table.insert(TemplateTable_GROUND, "red_ua_willysmb")
--[[
table.insert(TemplateTable_INF_GROUND, "red_inf_soldier_wwii_br")
table.insert(TemplateTable_INF_GROUND, "red_inf_soldier_wwii_gr")
table.insert(TemplateTable_INF_GROUND, "red_inf_soldier_wwii_us")
--]]
table.insert(TemplateTable_AA, "red_aa_aaa_flakscheinwerfer")
table.insert(TemplateTable_AA, "red_aa_aaa_qf37")
table.insert(TemplateTable_AA, "red_aa_aaa_m45quad")
table.insert(TemplateTable_AA, "red_aa_aaa_flak30")
table.insert(TemplateTable_AA, "red_aa_aaa_flak38")
table.insert(TemplateTable_AA, "red_aa_aaa_m137")
table.insert(TemplateTable_AA, "red_aa_aaa_flak41")
table.insert(TemplateTable_AA, "red_aa_aaa_flak37")
table.insert(TemplateTable_AA, "red_aa_aaa_flak36")

table.insert(TemplateTable_EASY_SAM, "red_aa_aaa_flakscheinwerfer")
table.insert(TemplateTable_EASY_SAM, "red_aa_aaa_qf37")
table.insert(TemplateTable_EASY_SAM, "red_aa_aaa_m45quad")
table.insert(TemplateTable_EASY_SAM, "red_aa_aaa_flak30")
table.insert(TemplateTable_EASY_SAM, "red_aa_aaa_flak38")
table.insert(TemplateTable_EASY_SAM, "red_aa_aaa_m137")
table.insert(TemplateTable_EASY_SAM, "red_aa_aaa_flak41")
table.insert(TemplateTable_EASY_SAM, "red_aa_aaa_flak37")
table.insert(TemplateTable_EASY_SAM, "red_aa_aaa_flak36")

table.insert(TemplateTable_HARD_SAM, "red_aa_aaa_flakscheinwerfer")
table.insert(TemplateTable_HARD_SAM, "red_aa_aaa_qf37")
table.insert(TemplateTable_HARD_SAM, "red_aa_aaa_m45quad")
table.insert(TemplateTable_HARD_SAM, "red_aa_aaa_flak30")
table.insert(TemplateTable_HARD_SAM, "red_aa_aaa_flak38")
table.insert(TemplateTable_HARD_SAM, "red_aa_aaa_m137")
table.insert(TemplateTable_HARD_SAM, "red_aa_aaa_flak41")
table.insert(TemplateTable_HARD_SAM, "red_aa_aaa_flak37")
table.insert(TemplateTable_HARD_SAM, "red_aa_aaa_flak36")

table.insert(TemplateTable_SEA, "red_ship_ww2_uss_samuel_chase")
table.insert(TemplateTable_SEA, "red_ship_ww2_lstmk2")
table.insert(TemplateTable_SEA, "red_ship_ww2_uboatviic")
table.insert(TemplateTable_SEA, "red_ship_ww2_schnellboot")
table.insert(TemplateTable_SEA, "red_ship_ww2_higgins")
end

AG1 				= 		ZONE:New( "AG1" ) 
AG2 				= 		ZONE:New( "AG2" ) 
AG3 				= 		ZONE:New( "AG3" ) 
AG4 				= 		ZONE:New( "AG4" ) 
AG5 				= 		ZONE:New( "AG5" ) 
AG6 				= 		ZONE:New( "AG6" ) 
AG7 				= 		ZONE:New( "AG7" ) 
AG8 				= 		ZONE:New( "AG8" ) 
AG9 				= 		ZONE:New( "AG9" ) 
AG10 				= 		ZONE:New( "AG10" ) 
AAA_ZONE 			= 		ZONE:New( "AAA_ZONE" ) 
klsv 				= 		ZONE:New( "klsv" )

AG_zone_list = {
[1] = AG1,
[2] = AG2,
[3] = AG3,
[4] = AG4,
[5] = AG5,
[6] = AG6,
[7] = AG7,
[8] = AG8,
[9] = AG9,
[10] = AG10,
}

AG1_vec = AG1:GetVec3()
AG2_vec = AG2:GetVec3()
AG3_vec = AG3:GetVec3()
AG4_vec = AG4:GetVec3()
AG5_vec = AG5:GetVec3()
AG6_vec = AG6:GetVec3()
AG7_vec = AG7:GetVec3()
AG8_vec = AG8:GetVec3()
AG9_vec = AG9:GetVec3()
AG10_vec = AG10:GetVec3()

AG_vec3_list = {
[1] = AG1_vec,
[2] = AG2_vec,
[3] = AG3_vec,
[4] = AG4_vec,
[5] = AG5_vec,
[6] = AG6_vec,
[7] = AG7_vec,
[8] = AG8_vec,
[9] = AG9_vec,
[10] = AG10_vec,
}

AG1_vec2 = AG1:GetVec2()
AG2_vec2 = AG2:GetVec2()
AG3_vec2 = AG3:GetVec2()
AG4_vec2 = AG4:GetVec2()
AG5_vec2 = AG5:GetVec2()
AG6_vec2 = AG6:GetVec2()
AG7_vec2 = AG7:GetVec2()
AG8_vec2 = AG8:GetVec2()
AG9_vec2 = AG9:GetVec2()
AG10_vec2 = AG10:GetVec2()

MR1 				= 		ZONE:New( "MR1" ) 
MR2 				= 		ZONE:New( "MR2" ) 
MR3 				= 		ZONE:New( "MR3" ) 
MR4 				= 		ZONE:New( "MR4" ) 
MR5 				= 		ZONE:New( "MR5" )
MR6 				= 		ZONE:New( "MR6" ) 
MR7 				= 		ZONE:New( "MR7" ) 
MR8 				= 		ZONE:New( "MR8" ) 
MR9 				= 		ZONE:New( "MR9" ) 
MR10 				= 		ZONE:New( "MR10" ) 

MR_zone_list = {
[1] = MR1,
[2] = MR2,
[3] = MR3,
[4] = MR4,
[5] = MR5,
[6] = MR6,
[7] = MR7,
[8] = MR8,
[9] = MR9,
[10] = MR10,
}


MR_coord_list = {
[1] = MR1:GetCoordinate(),
[2] = MR2:GetCoordinate(),
[3] = MR3:GetCoordinate(),
[4] = MR4:GetCoordinate(),
[5] = MR5:GetCoordinate(),
[6] = MR6:GetCoordinate(),
[7] = MR7:GetCoordinate(),
[8] = MR8:GetCoordinate(),
[9] = MR9:GetCoordinate(),
[10] = MR10:GetCoordinate(),
}


MR1_vec = MR1:GetVec3()
MR2_vec = MR2:GetVec3()
MR3_vec = MR3:GetVec3()
MR4_vec = MR4:GetVec3()
MR5_vec = MR5:GetVec3()
MR6_vec = MR6:GetVec3()
MR7_vec = MR7:GetVec3()
MR8_vec = MR8:GetVec3()
MR9_vec = MR9:GetVec3()
MR10_vec = MR10:GetVec3()

MR_vec3_list = {
[1] = MR1_vec,
[2] = MR2_vec,
[3] = MR3_vec,
[4] = MR4_vec,
[5] = MR5_vec,
[6] = MR6_vec,
[7] = MR7_vec,
[8] = MR8_vec,
[9] = MR9_vec,
[10] = MR10_vec,
}

MR1_vec2 = MR1:GetVec2()
MR2_vec2 = MR2:GetVec2()
MR3_vec2 = MR3:GetVec2()
MR4_vec2 = MR4:GetVec2()
MR5_vec2 = MR5:GetVec2()
MR6_vec2 = MR6:GetVec2()
MR7_vec2 = MR7:GetVec2()
MR8_vec2 = MR8:GetVec2()
MR9_vec2 = MR9:GetVec2()
MR10_vec2 = MR10:GetVec2()

AGH1 				= 		ZONE:New( "AGH1" ) 
AGH2 				= 		ZONE:New( "AGH2" ) 
AGH3 				= 		ZONE:New( "AGH3" ) 
AGH4 				= 		ZONE:New( "AGH4" ) 
AGH5 				= 		ZONE:New( "AGH5" ) 

AGH6 				= 		ZONE:New( "AGH6" ) 
AGH7 				= 		ZONE:New( "AGH7" ) 
AGH8 				= 		ZONE:New( "AGH8" ) 
AGH9 				= 		ZONE:New( "AGH9" ) 
AGH10 				= 		ZONE:New( "AGH10" ) 

INFAS1 				= 		ZONE:New( "INFAS1" ) 
INFAS2 				= 		ZONE:New( "INFAS2" ) 
INFAS3 				= 		ZONE:New( "INFAS3" ) 
INFAS4 				= 		ZONE:New( "INFAS4" ) 
INFAS5 				= 		ZONE:New( "INFAS5" ) 

INFAS6 				= 		ZONE:New( "INFAS6" ) 
INFAS7 				= 		ZONE:New( "INFAS7" ) 
INFAS8 				= 		ZONE:New( "INFAS8" ) 
INFAS9 				= 		ZONE:New( "INFAS9" ) 
INFAS10 				= 		ZONE:New( "INFAS10" ) 

INFAS1_vec = INFAS1:GetVec3()
INFAS2_vec = INFAS2:GetVec3()
INFAS3_vec = INFAS3:GetVec3()
INFAS4_vec = INFAS4:GetVec3()
INFAS5_vec = INFAS5:GetVec3()
INFAS6_vec = INFAS6:GetVec3()
INFAS7_vec = INFAS7:GetVec3()
INFAS8_vec = INFAS8:GetVec3()
INFAS9_vec = INFAS9:GetVec3()
INFAS10_vec = INFAS10:GetVec3()

AGH_zone_list = {
[1] = AGH1,
[2] = AGH2,
[3] = AGH3,
[4] = AGH4,
[5] = AGH5,
[6] = AGH6,
[7] = AGH7,
[8] = AGH8,
[9] = AGH9,
[10] = AGH10,
}


AGH1_vec = AGH1:GetVec3()
AGH2_vec = AGH2:GetVec3()
AGH3_vec = AGH3:GetVec3()
AGH4_vec = AGH4:GetVec3()
AGH5_vec = AGH5:GetVec3()
AGH6_vec = AGH6:GetVec3()
AGH7_vec = AGH7:GetVec3()
AGH8_vec = AGH8:GetVec3()
AGH9_vec = AGH9:GetVec3()
AGH10_vec = AGH10:GetVec3()

AGH_vec3_list = {
[1] = AGH1_vec,
[2] = AGH2_vec,
[3] = AGH3_vec,
[4] = AGH4_vec,
[5] = AGH5_vec,
[6] = AGH6_vec,
[7] = AGH7_vec,
[8] = AGH8_vec,
[9] = AGH9_vec,
[10] = AGH10_vec,
}

INF_vec3_list = {
[1] = INFAS1_vec,
[2] = INFAS2_vec,
[3] = INFAS3_vec,
[4] = INFAS4_vec,
[5] = INFAS5_vec,
[6] = INFAS6_vec,
[7] = INFAS7_vec,
[8] = INFAS8_vec,
[9] = INFAS9_vec,
[10] = INFAS10_vec,
}

INF_zone_list = {
[1] = INFAS1,
[2] = INFAS2,
[3] = INFAS3,
[4] = INFAS4,
[5] = INFAS5,
[6] = INFAS6,
[7] = INFAS7,
[8] = INFAS8,
[9] = INFAS9,
[10] = INFAS10,
}


--[[
helo_cas_backup_init = ZONE:New( "helo_cas_backup_init" )
helo_cas_backup_init_vec3 = helo_cas_backup_init:GetVec3()
helo_cas_backup_init_vec2 = helo_cas_backup_init:GetVec2()
--]]


if env.mission.theatre ~= "Nevada" then
ASS1 				= 		ZONE:New( "ASS1" ) 
ASS2 				= 		ZONE:New( "ASS2" ) 
ASS3				= 		ZONE:New( "ASS3" ) 
ASS4				= 		ZONE:New( "ASS4" ) 
ASS5 				= 		ZONE:New( "ASS5" ) 

ASS1_vec = ASS1:GetVec3()
ASS2_vec = ASS2:GetVec3()
ASS3_vec = ASS3:GetVec3()
ASS4_vec = ASS4:GetVec3()
ASS5_vec = ASS5:GetVec3()

ASS_vec3_list = {
[1] = ASS1_vec,
[2] = ASS2_vec,
[3] = ASS3_vec,
[4] = ASS4_vec,
[5] = ASS5_vec,
}

ASS_zone_list = {
[1] = ASS1,
[2] = ASS2,
[3] = ASS3,
[4] = ASS4,
[5] = ASS5,
}

end

SAM1 				= 		ZONE:New( "SAM1" ) 
SAM2 				= 		ZONE:New( "SAM2" ) 
SAM3 				= 		ZONE:New( "SAM3" ) 

SAM_zone_list = {
[1] = SAM1,
[2] = SAM2,
[3] = SAM3,
}



if enable_polygon_mission_zones == true then
poly_MR1 = ZONE_POLYGON:NewFromGroupName("poly_MR1", "poly_MR1")
poly_MR2 = ZONE_POLYGON:NewFromGroupName("poly_MR2", "poly_MR2")
poly_MR3 = ZONE_POLYGON:NewFromGroupName("poly_MR3", "poly_MR3")
poly_MR4 = ZONE_POLYGON:NewFromGroupName("poly_MR4", "poly_MR4")
poly_MR5 = ZONE_POLYGON:NewFromGroupName("poly_MR5", "poly_MR5")
poly_MR6 = ZONE_POLYGON:NewFromGroupName("poly_MR6", "poly_MR6")
poly_MR7 = ZONE_POLYGON:NewFromGroupName("poly_MR7", "poly_MR7")
poly_MR8 = ZONE_POLYGON:NewFromGroupName("poly_MR8", "poly_MR8")
poly_MR9 = ZONE_POLYGON:NewFromGroupName("poly_MR9", "poly_MR9")
poly_MR10 = ZONE_POLYGON:NewFromGroupName("poly_MR10", "poly_MR10")


poly_AG1 = ZONE_POLYGON:NewFromGroupName("poly_AG1", "poly_AG1")
poly_AG2 = ZONE_POLYGON:NewFromGroupName("poly_AG2", "poly_AG2")
poly_AG3 = ZONE_POLYGON:NewFromGroupName("poly_AG3", "poly_AG3")
poly_AG4 = ZONE_POLYGON:NewFromGroupName("poly_AG4", "poly_AG4")
poly_AG5 = ZONE_POLYGON:NewFromGroupName("poly_AG5", "poly_AG5")
poly_AG6 = ZONE_POLYGON:NewFromGroupName("poly_AG6", "poly_AG6")
poly_AG7 = ZONE_POLYGON:NewFromGroupName("poly_AG7", "poly_AG7")
poly_AG8 = ZONE_POLYGON:NewFromGroupName("poly_AG8", "poly_AG8")
poly_AG9 = ZONE_POLYGON:NewFromGroupName("poly_AG9", "poly_AG9")
poly_AG10 = ZONE_POLYGON:NewFromGroupName("poly_AG10", "poly_AG10")



poly_AGH1 = ZONE_POLYGON:NewFromGroupName("poly_AGH1", "poly_AGH1")
poly_AGH2 = ZONE_POLYGON:NewFromGroupName("poly_AGH2", "poly_AGH2")
poly_AGH3 = ZONE_POLYGON:NewFromGroupName("poly_AGH3", "poly_AGH3")
poly_AGH4 = ZONE_POLYGON:NewFromGroupName("poly_AGH4", "poly_AGH4")
poly_AGH5 = ZONE_POLYGON:NewFromGroupName("poly_AGH5", "poly_AGH5")
poly_AGH6 = ZONE_POLYGON:NewFromGroupName("poly_AGH6", "poly_AGH6")
poly_AGH7 = ZONE_POLYGON:NewFromGroupName("poly_AGH7", "poly_AGH7")
poly_AGH8 = ZONE_POLYGON:NewFromGroupName("poly_AGH8", "poly_AGH8")
poly_AGH9 = ZONE_POLYGON:NewFromGroupName("poly_AGH9", "poly_AGH9")
poly_AGH10 = ZONE_POLYGON:NewFromGroupName("poly_AGH10", "poly_AGH10")

poly_INFAS1 = ZONE_POLYGON:NewFromGroupName("poly_INFAS1", "poly_INFAS1")
poly_INFAS2 = ZONE_POLYGON:NewFromGroupName("poly_INFAS2", "poly_INFAS2")
poly_INFAS3 = ZONE_POLYGON:NewFromGroupName("poly_INFAS3", "poly_INFAS3")
poly_INFAS4 = ZONE_POLYGON:NewFromGroupName("poly_INFAS4", "poly_INFAS4")
poly_INFAS5 = ZONE_POLYGON:NewFromGroupName("poly_INFAS5", "poly_INFAS5")
poly_INFAS6 = ZONE_POLYGON:NewFromGroupName("poly_INFAS6", "poly_INFAS6")
poly_INFAS7 = ZONE_POLYGON:NewFromGroupName("poly_INFAS7", "poly_INFAS7")
poly_INFAS8 = ZONE_POLYGON:NewFromGroupName("poly_INFAS8", "poly_INFAS8")
poly_INFAS9 = ZONE_POLYGON:NewFromGroupName("poly_INFAS9", "poly_INFAS9")
poly_INFAS10 = ZONE_POLYGON:NewFromGroupName("poly_INFAS10", "poly_INFAS10")

else

poly_MR1 = MR1 
poly_MR2 = MR2 
poly_MR3 = MR3 
poly_MR4 = MR4 
poly_MR5 = MR5 
poly_MR6 = MR6 
poly_MR7 = MR7 
poly_MR8 = MR8 
poly_MR9 = MR9 
poly_MR10 = MR10 

poly_AG1 = AG1 
poly_AG2 = AG2 
poly_AG3 = AG3 
poly_AG4 = AG4 
poly_AG5 = AG5 
poly_AG6 = AG6 
poly_AG7 = AG7 
poly_AG8 = AG8 
poly_AG9 = AG9 
poly_AG10 = AG10 

poly_AGH1 = AGH1 
poly_AGH2 = AGH2 
poly_AGH3 = AGH3 
poly_AGH4 = AGH4 
poly_AGH5 = AGH5 
poly_AGH6 = AGH6 
poly_AGH7 = AGH7 
poly_AGH8 = AGH8 
poly_AGH9 = AGH9 
poly_AGH10 = AGH10 

poly_INFAS1 = INFAS1 
poly_INFAS2 = INFAS2 
poly_INFAS3 = INFAS3 
poly_INFAS4 = INFAS4 
poly_INFAS5 = INFAS5 
poly_INFAS6 = INFAS6 
poly_INFAS7 = INFAS7 
poly_INFAS8 = INFAS8 
poly_INFAS9 = INFAS9 
poly_INFAS10 = INFAS10 

end

--[[
MR_poly_zone_list = {
[1] = "poly_MR1",
[2] = "poly_MR2",
[3] = "poly_MR3",
[4] = "poly_MR4",
[5] = "poly_MR5",
[6] = "poly_MR6",
[7] = "poly_MR7",
[8] = "poly_MR8",
[9] = "poly_MR9",
[10] = "poly_MR10",
}--]]

MR_poly_zone_list = {
[1] = poly_MR1,
[2] = poly_MR2,
[3] = poly_MR3,
[4] = poly_MR4,
[5] = poly_MR5,
[6] = poly_MR6,
[7] = poly_MR7,
[8] = poly_MR8,
[9] = poly_MR9,
[10] = poly_MR10,
}

AG_poly_zone_list = {
[1] = poly_AG1,
[2] = poly_AG2,
[3] = poly_AG3,
[4] = poly_AG4,
[5] = poly_AG5,
[6] = poly_AG6,
[7] = poly_AG7,
[8] = poly_AG8,
[9] = poly_AG9,
[10] = poly_AG10,
}

AGH_poly_zone_list = {
[1] = poly_AGH1,
[2] = poly_AGH2,
[3] = poly_AGH3,
[4] = poly_AGH4,
[5] = poly_AGH5,
[6] = poly_AGH6,
[7] = poly_AGH7,
[8] = poly_AGH8,
[9] = poly_AGH9,
[10] = poly_AGH10,
}

INF_poly_zone_list = {
[1] = poly_INFAS1,
[2] = poly_INFAS2,
[3] = poly_INFAS3,
[4] = poly_INFAS4,
[5] = poly_INFAS5,
[6] = poly_INFAS6,
[7] = poly_INFAS7,
[8] = poly_INFAS8,
[9] = poly_INFAS9,
[10] = poly_INFAS10,
}

env.info('Zone ground init ok')

--NORMAL
A2GJ = SPAWN:New( "A2G_Init" )
	--:InitRandomizeTemplate( TemplateTable_HARD_GROUND )
	:InitRandomizeTemplate( TemplateTable_GROUND )
	:InitHeading(0, 360)

A2GAS = SPAWN:New( "A2GAS_Init" )
	:InitRandomizeTemplate( TemplateTable_SEA )
	:InitHeading(0, 360)
	
A2GAS_Disabled = SPAWN:New( "A2GAS_Init_Disabled" )
	:InitRandomizeTemplate( TemplateTable_SEA )
	:InitHeading(0, 360)

A2GMR = SPAWN:New( "A2GMR_Init" )
	--:InitRandomizeTemplate( TemplateTable_EASY_GROUND )
	:InitRandomizeTemplate( TemplateTable_GROUND )
	:InitHeading(0, 360)
	
A2GH = SPAWN:New( "A2GH_Init" )
	--:InitRandomizeTemplate( TemplateTable_HELO_GROUND )
	:InitRandomizeTemplate( TemplateTable_GROUND )
	:InitHeading(0, 360)
	
A2GIA = SPAWN:New( "A2GIA_Init" )
	:InitRandomizeTemplate( TemplateTable_INF_GROUND )
	:InitHeading(0, 360)

A2GIAM = SPAWN:New( "A2GIAMISC_Init" )
	--:InitRandomizeTemplate( TemplateTable_INF_MISC )
	:InitRandomizeTemplate( TemplateTable_GROUND )
	:InitHeading(0, 360)
	
A2G_AA = SPAWN:New( "AA_Init" )
	:InitRandomizeTemplate( TemplateTable_AA )
	:InitHeading(0, 360)
--[[
A2G_SAM = SPAWN:New( "SAM_Init" )
	:InitRandomizeTemplate( TemplateTable_SAM )
	:InitHeading(0, 360)
--]]

A2G_SAM_EASY = SPAWN:NewWithAlias( "SAM_Init", "SAM_Easy_Init" )
--A2G_SAM_EASY = SPAWN:New( "SAM_Init" )
	:InitRandomizeTemplate( TemplateTable_EASY_SAM )
	--:InitRandomizeTemplate( TemplateTable_EASY_GROUND )
	:InitHeading(0, 360)
	
A2G_SAM_HARD = SPAWN:NewWithAlias( "SAM_Init", "SAM_Hard_Init" )
	:InitRandomizeTemplate( TemplateTable_HARD_SAM )
	:InitHeading(0, 360)


--A2G_BLUE_BATTALION = SPAWN:New("Blue_Ground_Battalion_1")
	
env.info('spawn objects ground init co ok')

--SAM ADD
function a2g_sam_start()
	local switch = math.random(1, 3)
	
	a2gsam_spawn(switch)
	
	trigger.action.outText( ">> An enemy SAM site has been detected in the area.<< \nRequesting SEAD aircraft to locate and destroy the SAM Site.", 10)
	trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )
end
--SAM ADD
function a2gsam_spawn(missionNumber) --1 per group
	for i = 1, random_sam_hard_amount do
		A2G_SAM_HARD:SpawnInZone(SAM_zone_list[missionNumber], true)
	end
	for i = 1, random_sam_easy_amount do
		A2G_SAM_EASY:SpawnInZone(SAM_zone_list[missionNumber], true)
	end
activate_SAM_jtac(missionNumber)
end




function a2gj_start()
main_detection(15)
unitThresholdAG = false
-- To allow searching for units above AGL to despawn them.
--allow_mr_agl_search = true
allow_ag_agl_search = true
--allow_agh_agl_search = true
--allow_inf_agl_search = true


timer.scheduleFunction(function() --Stop searching for above AGL spawned units
	--allow_mr_agl_search = true
	allow_ag_agl_search = false
	--allow_agh_agl_search = true
	--allow_inf_agl_search = true
end, nil, timer.getTime() + search_agl_time )


HardMissionNameGen()
trigger.action.setUserFlag('AG-STARTING', true)
	--local switch = math.random (1,10) 

local switch;
repeat
	switch = math.random (1,10)
until switch ~= lastA2GJ;
lastA2GJ = switch;

arrayZoneAG[switch][4] = true
a2gj_spawn(switch)

if ai_troops_transport_location == "a2g hard" then
	timer.scheduleFunction(function() 
		helo_transport("ag")
	end, nil, timer.getTime() + 5  )
end

local RandomRedReinforcementStartTime = math.random(300,1200)
tti.debug("Red Battalion will reinforce A2G Hard Mission in " ..  RandomRedReinforcementStartTime .. " seconds!")

timer.scheduleFunction(function() -- Start Blue Battalion
	for i = 1,#arrayZoneAG,1
		do
		if trigger.misc.getUserFlag(arrayZoneAG[i][3]) == 1 and blue_ground_battalion_hard == true then
			start_blue_ground_battalion(_G[arrayZoneAG[i][1]], HardMissionName, "A2G Hard")
		end
	end
end, nil, timer.getTime() + delayStartBlueBattalionTime  )


timer.scheduleFunction(function() -- Start Red Battalion
	for i = 1,#arrayZoneAG,1
		do
		if trigger.misc.getUserFlag(arrayZoneAG[i][3]) == 1 and red_veh_battalion_hard == true then
			start_red_veh_battalion(_G[arrayZoneAG[i][1]], HardMissionName, "A2G Hard")
		end
	end
end, nil, timer.getTime() + RandomRedReinforcementStartTime  )
--end, nil, timer.getTime() + 10  )

end

function a2gj_spawn(missionNumber)
for i=1, a2g_hard_misc  do
	A2GJ:SpawnInZone( AG_poly_zone_list[missionNumber], true )
end

for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( AG_poly_zone_list[missionNumber], true )
end
for i=1, a2g_hard_sam_easy do
	A2G_SAM_EASY:SpawnInZone( AG_poly_zone_list[missionNumber], true )
end
for i=1, a2g_hard_sam_hard do
	A2G_SAM_HARD:SpawnInZone( AG_poly_zone_list[missionNumber], true )
end
activate_AG_jtac(missionNumber)
create_ag_marker(missionNumber)
end


function a2gmr_start()
main_detection(15)
unitThresholdMR = false
allow_mr_agl_search = true

timer.scheduleFunction(function() --Stop searching for above AGL spawned units
	allow_mr_agl_search = false
end, nil, timer.getTime() + search_agl_time )

EasyMissionNameGen()
trigger.action.setUserFlag('MR-STARTING', true)

local switch;
repeat
	switch = math.random (1,10)
until switch ~= lastMR;
lastMR = switch;

arrayZoneMR[switch][4] = true

a2gmr_spawn(switch) --spawn mission

local RandomRedReinforcementStartTime = math.random(300,1200)
tti.debug("Red Battalion will reinforce A2G Easy Mission in " ..  RandomRedReinforcementStartTime .. " seconds!")

if ai_troops_transport_location == "a2g easy" then
	timer.scheduleFunction(function() 
		helo_transport("mr")
	end, nil, timer.getTime() + 5  )
end

timer.scheduleFunction(function() 
	for i = 1,#arrayZoneMR,1
		do
		if trigger.misc.getUserFlag(arrayZoneMR[i][3]) == 1 and blue_ground_battalion_easy == true then
			start_blue_ground_battalion(_G[arrayZoneMR[i][1]], EasyMissionName, "A2G Easy")
		end
	end
end, nil, timer.getTime() + delayStartBlueBattalionTime  )

timer.scheduleFunction(function() 
	for i = 1,#arrayZoneMR,1
		do
		if trigger.misc.getUserFlag(arrayZoneMR[i][3]) == 1 and red_veh_battalion_easy == true then
			start_red_veh_battalion(_G[arrayZoneMR[i][1]], EasyMissionName, "A2G Easy")
		end
	end
end, nil, timer.getTime() + RandomRedReinforcementStartTime  )
--end, nil, timer.getTime() + 10  )
end

function a2gmr_spawn(missionNumber)
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( MR_poly_zone_list[missionNumber], true )
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( MR_poly_zone_list[missionNumber], true )
end
for i=1, a2g_easy_sam_easy do
	A2G_SAM_EASY:SpawnInZone( MR_poly_zone_list[missionNumber], true )
end
for i=1, a2g_easy_sam_hard do
	A2G_SAM_HARD:SpawnInZone( MR_poly_zone_list[missionNumber], true )
end
activate_MR_jtac(missionNumber)
create_mr_marker(missionNumber)
end

function a2gh_start()
main_detection(15)
unitThresholdAGH = false
-- To allow searching for units above AGL to despawn them.
--allow_mr_agl_search = true
--allow_ag_agl_search = true
allow_agh_agl_search = true
--allow_inf_agl_search = true


timer.scheduleFunction(function() --Stop searching for above AGL spawned units
	--allow_mr_agl_search = false
	--allow_ag_agl_search = false
	allow_agh_agl_search = false
	--allow_inf_agl_search = true
end, nil, timer.getTime() + search_agl_time )

HeloMissionNameGen()
trigger.action.setUserFlag('AGH-STARTING', true)
local switch;
repeat
	switch = math.random (1,10)
until switch ~= lastA2Ghelo; 
lastA2Ghelo = switch;
	
	arrayZoneAGH[switch][4] = true
	a2gh_spawn(switch) --spawn mission
	
	if ai_troops_transport_location == "a2g helo" then
		timer.scheduleFunction(function() 
			helo_transport("agh")
		end, nil, timer.getTime() + 5  )
	end
end

function a2gh_spawn(missionNumber)  --1 per group
for i=1, a2g_helo_misc do
	A2GH:SpawnInZone( AGH_poly_zone_list[missionNumber], true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone( AGH_poly_zone_list[missionNumber], true )
end
for i=1, a2g_helo_sam_easy do
	A2G_SAM_EASY:SpawnInZone( AGH_poly_zone_list[missionNumber], true )
end
for i=1, a2g_helo_sam_hard do
	A2G_SAM_HARD:SpawnInZone( AGH_poly_zone_list[missionNumber], true )
end
activate_AGH_jtac(missionNumber)
create_agh_marker(missionNumber)
end

function a2gia_start()
main_detection(15)
unitThresholdAGHIA = false
-- To allow searching for units above AGL to despawn them.
allow_inf_agl_search = true


timer.scheduleFunction(function() --Stop searching for above AGL spawned units
	allow_inf_agl_search = false
end, nil, timer.getTime() + search_agl_time )

InfMissionNameGen()
trigger.action.setUserFlag('AGHIA-STARTING', true)

local switch;
repeat
	switch = math.random (1,10)
until switch ~= lastA2GIA;
lastA2GIA = switch;


	arrayZoneINFAS[switch][4] = true
	a2gia_spawn(switch)
	
	if ai_troops_transport_location == "a2g infantry assault" then
		timer.scheduleFunction(function() 
			helo_transport("ia")
		end, nil, timer.getTime() + 5  )
	end

local RandomRedReinforcementStartTime = math.random(300,1200)
tti.debug("Red Troops will reinforce A2G Infantry Mission in " ..  RandomRedReinforcementStartTime .. " seconds!")
	
	timer.scheduleFunction(function() 
		for i = 1,#arrayZoneINFAS,1
			do
			if trigger.misc.getUserFlag(arrayZoneINFAS[i][3]) == 1 and blue_ground_battalion_inf == true then
				start_blue_ground_battalion(_G[arrayZoneINFAS[i][1]], InfMissionName, "A2G Infantry Assault")
			end
		end
	end, nil, timer.getTime() + delayStartBlueBattalionTime  )
	
	timer.scheduleFunction(function() 
		for i = 1,#arrayZoneINFAS,1
			do
			if trigger.misc.getUserFlag(arrayZoneINFAS[i][3]) == 1 then
				start_red_inf_battalion(_G[arrayZoneINFAS[i][1]], InfMissionName, "A2G Infantry Assault")
			end
		end
	end, nil, timer.getTime() + RandomRedReinforcementStartTime  )
end

function a2gia_spawn(missionNumber)  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone( INF_poly_zone_list[missionNumber], true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone( INF_poly_zone_list[missionNumber], true )
end
for i=1, a2g_inf_aa do
	A2G_AA:SpawnInZone( INF_poly_zone_list[missionNumber], true )
end
for i=1, a2g_inf_sam_easy do
	A2G_SAM_EASY:SpawnInZone( INF_poly_zone_list[missionNumber], true )
end
for i=1, a2g_inf_sam_hard do
	A2G_SAM_HARD:SpawnInZone( INF_poly_zone_list[missionNumber], true )
end
activate_INF_jtac(missionNumber)
create_infas_marker(missionNumber)
end

function a2gas_start()
main_detection(15)
ShipMissionNameGen()
trigger.action.setUserFlag('AS-STARTING', true)
	--local switch = math.random (1,5) 
	
local switch;
repeat
	switch = math.random (1,5)
until switch ~= lastA2GAS;
lastA2GAS = switch;

arrayZoneASS[switch][4] = true

a2gas_spawn(switch) --spawn mission

end

function a2gas_spawn(missionNumber)
if enemy_ship_ai == true then
	for i=1, a2g_antiship do
		A2GAS:SpawnInZone( ASS_zone_list[missionNumber], true )
	end
elseif enemy_ship_ai == false then
	for i=1, a2g_antiship do
		A2GAS_Disabled:SpawnInZone( ASS_zone_list[missionNumber], true )
	end
end
create_as_marker(missionNumber)
end

TemplateTable_Red_Reinforcements_Inf = {
"Infantry_Red",
}

if mission_era == "modern" then
Red_Veh_Reinforcements_Group = SPAWN:NewWithAlias( "convoy_template_modern", "Red_Reinforcements_Veh" )


Red_Inf_Reinforcements_Group = SPAWN:NewWithAlias( "Infantry_Red", "Red_Reinforcements_Inf" )
end

if mission_era == "cold_war" then
Red_Veh_Reinforcements_Group = SPAWN:NewWithAlias( "convoy_template_cold_war", "Red_Reinforcements_Veh" )


Red_Inf_Reinforcements_Group = SPAWN:NewWithAlias( "Infantry_Red", "Red_Reinforcements_Inf" )
end

if mission_era == "ww2" then
Red_Veh_Reinforcements_Group = SPAWN:NewWithAlias( "convoy_template_ww2", "Red_Reinforcements_Veh" )


Red_Inf_Reinforcements_Group = SPAWN:NewWithAlias( "Infantry_Red", "Red_Reinforcements_Inf" )
end

if mission_era == "korean_war" then
Red_Veh_Reinforcements_Group = SPAWN:NewWithAlias( "convoy_template_korean_war", "Red_Reinforcements_Veh" )


Red_Inf_Reinforcements_Group = SPAWN:NewWithAlias( "Infantry_Red", "Red_Reinforcements_Inf" )
end

TemplateTable_CAS_Helo_Reinforcements = {
--"blue_helo_ah64d",
--"blue_helo_ah64a",
--"blue_helo_oh58d",
--"blue_helo_sa342l",
--"blue_helo_uh1h",
"blue_helo_ah64d_guns_only"
}

blueCasHeloCallsign = {
"Whirly",
"Duster",
"Dirt Devil",
"Whirlwind",
"Whirly Bird",
"Lighting",
"Blazer",
"Hell Storm",
"Doom Bringer",
"Death Dealer",
"Reaper",
"Mud Striker",
"Harbinger",
"Goliath",
"Steel Fire",
"Flamer",
"Ember",
"Pyro",
"Punisher",
"Wrecker",
"Demon",
"Torchlighter",
"Zippo",
"Burner",
"Striker",
}

delayStartBlueBattalionTime = 60
blueBattalionOuterSpawnRadius = 3000
blueBattalionInnerSpawnRadius = 2400
blueBattalionOuterWptRadius = 1200
blueBattalionInnerWptRadius = 600

blueGroundBattalionCallsign = {
"Charger",
"Warrior",
"Roller",
"Boulder",
"Bloodshed",
"Beast",
"Fury",
"Thruster",
"Diplomacy Failed",
"Atomizer",
"Bulldozer",
"Executioner",
"Judge",
"Chaos",
"Shadow",
"Harbinger",
"Cthulu",
"Jackal",
"Ember",
"Inferno",
"Defender",
"Slayer",
"Dragon",
"Spiker",
"Crimson",
"Vampire",
"Scarface",
"Shield",
}

function start_blue_ground_battalion(agMissionZone, missionNameVar, msnTypeStr)
	if blue_ground_battalion_enable == true then
			
			local strBlueBattallonCallsign = string.upper(blueGroundBattalionCallsign[math.random(1,#blueGroundBattalionCallsign)]) .." ".. tostring(math.random (1,9)) .. "-1"
			tti.debug("Blue Ground Battalion 1 Callsign is: " .. strBlueBattallonCallsign)
			
			--A2G_BLUE_BATTALION = SPAWN:NewWithAlias("Blue_Ground_Battalion_1", strBlueBattallonCallsign)
			_G[strBlueBattallonCallsign] = SPAWN:NewWithAlias("Blue_Ground_Battalion_1", strBlueBattallonCallsign)
		--timer.scheduleFunction(function() 
			local random_blue_battalion_starting_cord = agMissionZone:GetCoordinate()
			local random_blue_battalion_starting_vec2 = random_blue_battalion_starting_cord:GetRandomVec2InRadius(blueBattalionOuterSpawnRadius, blueBattalionInnerSpawnRadius)
			local random_blue_battalion_wpt_vec2 = random_blue_battalion_starting_cord:GetRandomVec2InRadius(blueBattalionOuterWptRadius, blueBattalionInnerWptRadius)
			local A2G_Blue_Battalion_Group = _G[strBlueBattallonCallsign]:OnSpawnGroup(
					function( SpawnGroup )
						if blue_battallion_attack_point == "center" then
							local TaskEngage = SpawnGroup:TaskRouteToVec2(agMissionZone:GetVec2())
						elseif blue_battallion_attack_point == "random" then
							local TaskEngage = SpawnGroup:TaskRouteToVec2(random_blue_battalion_wpt_vec2)
						end
					trigger.action.outSound("TTI Soundfiles/Ace Combat 5 Mission Update Sound Effect.ogg" )
					--trigger.action.outText("<< ".. msnTypeStr .. " Mission: \"" .. missionNameVar .. "\" - UPDATE >>\n\nFriendly armored battalion: [" .. _G[strBlueBattallonCallsign]:GetName() .. "] is on the move to the attack the objective!", 40 )
					trigger.action.outText("<< ".. msnTypeStr .. " Mission: \"" .. missionNameVar .. "\" - UPDATE >>\n\nFriendly armored battalion: [" .. SpawnGroup:GetName() .. "] is on the move to the attack the objective!", 40 )
					timer.scheduleFunction(function()
					if voice_lines_audio == "enabled" then
					trigger.action.outSound(tti.a2g.vehiclesDeployedSound[math.random(1,#tti.a2g.vehiclesDeployedSound)])
						elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
				elseif voice_lines_audio == "silent" then
				end			
					end, nil, timer.getTime() + 1  )
					end)
				:SpawnFromVec2(random_blue_battalion_starting_vec2)
		--end, nil, timer.getTime() + delayStartBlueBattalionTime  )
	end
end


red_battallion_attack_point = "center"
--red_veh_battalion_mission = "a2g_easy"
--delayStartRedBattalionTime = 60
redBattalionOuterSpawnRadius = 3000
redBattalionInnerSpawnRadius = 2400
redBattalionOuterWptRadius = 1200
redBattalionInnerWptRadius = 600

--[[ --send to settings!
red_veh_battalion_enable = true
red_veh_battalion_hard = false
red_veh_battalion_easy = true
red_inf_battalion_enable = true
--]]

function randomRedBattalionNotify(msnTypeStr, missionNameVar)
local switch = math.random(1,3)
	if switch == 1 then
		trigger.action.outText("<< ".. msnTypeStr .." Mission: \"" .. missionNameVar .. "\" - UPDATE >>\n\nEnemy reinforcements are advancing to the mission area, requesting additional support.", 40 )
		trigger.action.outSound("TTI Soundfiles/Ace Combat 5 Mission Update Sound Effect.ogg" )
		timer.scheduleFunction(function()
		if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/EnemyReinforcementsAdvancingMissionAreaReqAddSupport.ogg" )
		elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end	
		end, nil, timer.getTime() + 1  )
	elseif switch == 2 then
		trigger.action.outText("<< ".. msnTypeStr .." Mission: \"" .. missionNameVar .. "\" - UPDATE >>\n\nEnemy reinforcements are en route to the mission area!", 40 )					
		trigger.action.outSound("TTI Soundfiles/Ace Combat 5 Mission Update Sound Effect.ogg" )
				timer.scheduleFunction(function()
				if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/EnemyReinforcementsEnRtToMissionArea.ogg" )
		elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end	
		end, nil, timer.getTime() + 1  )
	elseif switch == 3 then
		trigger.action.outText("<< ".. msnTypeStr .." Mission: \"" .. missionNameVar .. "\" - UPDATE >>\n\nThe enemy has called in reinforcements to the mission area!", 40 )					
		trigger.action.outSound("TTI Soundfiles/Ace Combat 5 Mission Update Sound Effect.ogg" )
		timer.scheduleFunction(function()
		if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/TheEnemyHasCalledInReinforcementsToMsnArea.ogg" )
		elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end		
		
		end, nil, timer.getTime() + 1  )
	end
end


function start_red_veh_battalion(agMissionZone, missionNameVar, msnTypeStr)
	--if red_veh_battalion_enable == true then
			--[[
			local attackMissionName
			
			if red_veh_battalion_mission == "a2g_easy" then
				local attackMissionName = EasyMissionName
			elseif red_veh_battalion_mission == "a2g_hard" then
				local attackMissionName = HardMissionName
			else
				env.info("script error: blue ground battalion mission type string error! - SETTING TO A2G HARD DUE TO ERROR")
				local attackMissionName = HardMissionName
			end
			--]]
		--timer.scheduleFunction(function() 
			local random_red_veh_starting_cord = agMissionZone:GetCoordinate()
			local random_red_veh_starting_vec2 = random_red_veh_starting_cord:GetRandomVec2InRadius(redBattalionOuterSpawnRadius, redBattalionInnerSpawnRadius)
			local random_red_veh_wpt_vec2 = random_red_veh_starting_cord:GetRandomVec2InRadius(redBattalionOuterWptRadius, redBattalionInnerWptRadius)
			A2G_Red_Veh_Group = Red_Veh_Reinforcements_Group:OnSpawnGroup(
					function( SpawnGroup )
						if red_battallion_attack_point == "center" then
							local TaskEngage = SpawnGroup:TaskRouteToVec2(agMissionZone:GetVec2())
						elseif red_battallion_attack_point == "random" then
							local TaskEngage = SpawnGroup:TaskRouteToVec2(random_red_veh_wpt_vec2)
						end
					--trigger.action.outSound(tti.a2g.vehiclesDeployedSound[math.random(1,#tti.a2g.vehiclesDeployedSound)])
						--trigger.action.outSound("TTI Soundfiles/Ace Combat 5 Mission Update Sound Effect.ogg" )
						--trigger.action.outText("<< ".. msnTypeStr .." Mission: \"" .. missionNameVar .. "\" - UPDATE >>\n\nEnemy reinforcements are on the move to reinforce the objective!", 40 )
					randomRedBattalionNotify(msnTypeStr, missionNameVar)
					end)
				:SpawnFromVec2(random_red_veh_starting_vec2)
		--end, nil, timer.getTime() + delayStartBlueBattalionTime  )
	--end
end


red_inf_battallion_attack_point = "center"
--delayStartRedInfBattalionTime = 60
redInfBattalionOuterSpawnRadius = 3000
redInfBattalionInnerSpawnRadius = 2400
redInfBattalionOuterWptRadius = 1200
redInfBattalionInnerWptRadius = 600

function start_red_inf_battalion(agMissionZone, missionNameVar, msnTypeStr)
	if red_inf_battalion_enable == true then
			--[[
			local attackMissionName
			
			if red_veh_battalion_mission == "a2g_easy" then
				local attackMissionName = EasyMissionName
			elseif red_veh_battalion_mission == "a2g_hard" then
				local attackMissionName = HardMissionName
			else
				env.info("script error: blue ground battalion mission type string error! - SETTING TO A2G HARD DUE TO ERROR")
				local attackMissionName = HardMissionName
			end
			--]]
		--timer.scheduleFunction(function() 
			local random_red_inf_starting_cord = agMissionZone:GetCoordinate()
			local random_red_inf_starting_vec2 = random_red_inf_starting_cord:GetRandomVec2InRadius(redBattalionOuterSpawnRadius, redBattalionInnerSpawnRadius)
			local random_red_inf_wpt_vec2 = random_red_inf_starting_cord:GetRandomVec2InRadius(redBattalionOuterWptRadius, redBattalionInnerWptRadius)
			A2G_Red_Inf_Group = Red_Inf_Reinforcements_Group:OnSpawnGroup(
					function( SpawnGroup )
						if red_inf_battallion_attack_point == "center" then
							local TaskEngage = SpawnGroup:TaskRouteToVec2(agMissionZone:GetVec2())
						elseif red_inf_battallion_attack_point == "random" then
							local TaskEngage = SpawnGroup:TaskRouteToVec2(random_red_veh_wpt_vec2)
						end
					--trigger.action.outSound(tti.a2g.vehiclesDeployedSound[math.random(1,#tti.a2g.vehiclesDeployedSound)])
					--trigger.action.outSound("TTI Soundfiles/Ace Combat 5 Mission Update Sound Effect.ogg" )
					--trigger.action.outText("<< ".. msnTypeStr .." Mission: \"" .. missionNameVar .. "\" - UPDATE >>\n\nEnemy reinforcements are on the move to reinforce the objective!", 40 )
					randomRedBattalionNotify(msnTypeStr, missionNameVar)
					end)
				:SpawnFromVec2(random_red_inf_starting_vec2)
		--end, nil, timer.getTime() + delayStartBlueBattalionTime  )
	end
end

---

enable_convoy_missions = true
--convoy_map_markers = true

cnv_mission_min = 1
cnv_mission_max = 3 --default 3


TemplateTable_CONVOY_GROUND_MODERN = {
	"convoy_template_modern",
}

TemplateTable_CONVOY_GROUND_WW2 = {
	"convoy_template_ww2",
}

TemplateTable_CONVOY_GROUND_KOREAN_WAR = {
	"convoy_template_korean_war",
}

TemplateTable_CONVOY_GROUND_COLD_WAR = {
	"convoy_template_cold_war",
}

if mission_era == "modern" then
Convoy1 = SPAWN:New("Convoy1")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_MODERN)

Convoy2 = SPAWN:New("Convoy2")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_MODERN)

Convoy3 = SPAWN:New("Convoy3")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_MODERN)
end

if mission_era == "cold_war" then
Convoy1 = SPAWN:New("Convoy1")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_COLD_WAR)

Convoy2 = SPAWN:New("Convoy2")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_COLD_WAR)

Convoy3 = SPAWN:New("Convoy3")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_COLD_WAR)
end

if mission_era == "ww2" then
Convoy1 = SPAWN:New("Convoy1")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_WW2)

Convoy2 = SPAWN:New("Convoy2")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_WW2)

Convoy3 = SPAWN:New("Convoy3")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_WW2)
end

if mission_era == "korean_war" then
Convoy1 = SPAWN:New("Convoy1")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_KOREAN_WAR)

Convoy2 = SPAWN:New("Convoy2")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_KOREAN_WAR)

Convoy3 = SPAWN:New("Convoy3")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_KOREAN_WAR)
end


Convoy1_alive = false
Convoy2_alive = false
Convoy3_alive = false

function random_convoy_start()
	trigger.action.setUserFlag('CONVOY-STARTING', true)
	timer.scheduleFunction(function()
		if enable_convoy_missions == true then
			local switch;
			repeat
				switch = math.random(cnv_mission_min,cnv_mission_max)
			until switch ~= lastConvoy;
			lastConvoy = switch;
				
			ConvoyMissionNameGen()
			trigger.action.outText( "<< Convoy Hunt Mission ".. switch .." started: \""..ConvoyMissionName.."\" >>", 20)
			env.info( "TTI: Convoy Hunt Mission ".. switch ..": \""..ConvoyMissionName.."\" started.")
			trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )
			
			if switch == 1 then
				Convoy1_start()
			elseif switch == 2 then
				Convoy2_start()
			elseif switch == 3 then
				Convoy3_start()
			end
			auto_update_convoy_marker() -- Start convoy marker refresh loop
		end
	end, nil, timer.getTime() + 3 )
end

function Convoy1_start()
	Convoy1_alive = true
	Convoy1spawn = Convoy1:OnSpawnGroup(
		function( SpawnGroup )
			Convoy1GroupName = Convoy1spawn:GetName()
			Convoy1Zone = ZONE_GROUP:New("Convoy1Zone", Convoy1spawn, 20)
		end)
	:Spawn()

	function Convoy1spawn:OnEventDead(EventData)
		env.info("TTI: " .. Convoy1GroupName .. " unit destroyed!")
		env.info("TTI: ... Checking for " .. Convoy1GroupName .." status:")

		timer.scheduleFunction(function() 
			if Convoy1spawn:IsAlive() == true then
				env.info("TTI: " .. Convoy1GroupName .." group is alive!")
				else
				env.info("TTI: " .. Convoy1GroupName .." group is destroyed!")
				trigger.action.outText( "<< Convoy Hunt Mission: \""..ConvoyMissionName.."\" complete! >>", 10)
				trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg" )
				if cnv_id[1] ~= nil then
					trigger.action.removeMark(cnv_id[1])
				end
				
				if cnv_text_id[1] ~= nil and cnv_circle_id[1] ~= nil then
					trigger.action.removeMark(cnv_circle_id[1])
					trigger.action.removeMark(cnv_text_id[1])
				end
				
				Convoy1_alive = false
				if convoy_missions_autostart == true then
					random_convoy_start()
					env.info("TTI: A2G Convoy Started - VIA AUTOSTART CONVOY 1")
				end
			end
		end, nil, timer.getTime() + 2 )
	end
create_convoy1_marker()
Convoy1spawn:HandleEvent( EVENTS.Dead )
end

function convoy1_alive_check()
	env.info("TTI: " .. Convoy1GroupName .." group is destroyed!")
	trigger.action.outText( "<< Convoy Hunt Mission: \""..ConvoyMissionName.."\" complete! >>", 10)
	trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg" )
	trigger.action.removeMark(cnv_id[1])
	Convoy1_alive = false
	if convoy_missions_autostart == true then
		random_convoy_start()
	end
end

function Convoy2_start()
	Convoy2_alive = true
	Convoy2spawn = Convoy2:OnSpawnGroup(
		function( SpawnGroup )
			Convoy2GroupName = Convoy2spawn:GetName()
			Convoy2Zone = ZONE_GROUP:New("Convoy2Zone", Convoy2spawn, 20)
		end)
	:Spawn()

	function Convoy2spawn:OnEventDead(EventData)
		env.info("TTI: " .. Convoy2GroupName .. " unit destroyed!")
		env.info("TTI: ... Checking for " .. Convoy2GroupName .." status:")
		timer.scheduleFunction(function() 
			if Convoy2spawn:IsAlive() == true then
				env.info("TTI: " .. Convoy2GroupName .." group is alive!")
				else
				env.info("TTI: " .. Convoy2GroupName .." group is destroyed!")
				trigger.action.outText( "<< Convoy Hunt Mission: \""..ConvoyMissionName.."\" complete! >>", 10)
				trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg" )
				if cnv_id[2] ~= nil then
					trigger.action.removeMark(cnv_id[1])
				end
				
				if cnv_text_id[2] ~= nil and cnv_circle_id[2] ~= nil then
					trigger.action.removeMark(cnv_circle_id[2])
					trigger.action.removeMark(cnv_text_id[2])
				end
				Convoy2_alive = false
				if convoy_missions_autostart == true then
					random_convoy_start()
					env.info("TTI: A2G Convoy Started - VIA AUTOSTART CONVOY 2")
				end
			end
		end, nil, timer.getTime() + 2 )
	end
create_convoy2_marker()
Convoy2spawn:HandleEvent( EVENTS.Dead )
end

function convoy2_alive_check()
	env.info("TTI: " .. Convoy2GroupName .." group is destroyed!")
	trigger.action.outText( "<< Convoy Hunt Mission: \""..ConvoyMissionName.."\" complete! >>", 10)
	trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg" )
	trigger.action.removeMark(cnv_id[2])
	Convoy2_alive = false
	trigger.action.setUserFlag('CONVOY-STARTING', false)
	if convoy_missions_autostart == true then
		random_convoy_start()
	end
end

function Convoy3_start()
	Convoy3_alive = true
	
	Convoy3spawn = Convoy3:OnSpawnGroup(
		function( SpawnGroup )
			Convoy3GroupName = Convoy3spawn:GetName()
			Convoy3Zone = ZONE_GROUP:New("Convoy3Zone", Convoy3spawn, 20)
		end)
	:Spawn()
	
	function Convoy3spawn:OnEventDead(EventData)
		env.info("TTI: " .. Convoy3GroupName .. " unit destroyed!")
		env.info("TTI: ... Checking for " .. Convoy3GroupName .." status:")
		
		timer.scheduleFunction(function() 
			if Convoy3spawn:IsAlive() == true then
				env.info("TTI: " .. Convoy3GroupName .." group is alive!")
				else
				env.info("TTI: " .. Convoy3GroupName .." group is destroyed!")
				trigger.action.outText( "<< Convoy Hunt Mission: \""..ConvoyMissionName.."\" complete! >>", 10)
				trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg" )
				if cnv_id[3] ~= nil then
					trigger.action.removeMark(cnv_id[3])
				end
				
				if cnv_text_id[3] ~= nil and cnv_circle_id[3] ~= nil then
					trigger.action.removeMark(cnv_circle_id[3])
					trigger.action.removeMark(cnv_text_id[3])
				end
				Convoy3_alive = false
				trigger.action.setUserFlag('CONVOY-STARTING', false)
				if convoy_missions_autostart == true then
					random_convoy_start()
					env.info("TTI: A2G Convoy Started - VIA AUTOSTART CONVOY 3")
				end
			end
		end, nil, timer.getTime() + 2 )
	end
create_convoy3_marker()
Convoy3spawn:HandleEvent( EVENTS.Dead )
end

function convoy3_alive_check()
	env.info("TTI: " .. Convoy3GroupName .." group is destroyed!")
	trigger.action.outText( "<< Convoy Hunt Mission: \""..ConvoyMissionName.."\" complete! >>", 10)
	trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg" )
	trigger.action.removeMark(cnv_id[3])
	Convoy3_alive = false
	trigger.action.setUserFlag('CONVOY-STARTING', false)
	if convoy_missions_autostart == true then
		random_convoy_start()
	end
end


------------- EDIT SHAPES AND TEXT --------------
tti.marker = {}
tti.marker.convoy = {}
tti.marker.a2g = {}
tti.marker.airsupport = {}
---Circle Radius
tti.marker.convoy.circleSize = 1000 
--Circle Fill Color
tti.marker.convoy.circleFillColor = tti.color.red
--Circle Fill Alpha
tti.marker.convoy.circleFillAlpha = 0.18

--Circle Outline Color
tti.marker.convoy.circleOutlineColor = tti.color.white

--Text box offset from circle outline
tti.marker.convoy.textBoxOffset = 1500 + tti.marker.convoy.circleSize
--Text box position 360
tti.marker.convoy.textBoxAnglePosition = 45

tti.marker.convoy.textBoxFontSize = 9

tti.marker.convoy.textBoxTextColor = tti.color.white
tti.marker.convoy.textBoxTextAlpha = 0.8

tti.marker.convoy.textBoxFillColor = tti.color.red
tti.marker.convoy.textBoxFillAlpha = 0.5

cnv_id = {}
cnv_circle_id = {}
cnv_text_id = {}

function create_convoy1_marker()
	if convoy_map_markers == true and Convoy1_alive == true then
		Convoy1Zone_vec = Convoy1spawn:GetVec3()
		Convoy1Zone_coord = COORDINATE:NewFromVec3(Convoy1Zone_vec)
		--Convoy1Zone_vec = Convoy1Zone:GetVec3()
			if cnv_id[1] ~= nil then
				trigger.action.removeMark(cnv_id[1])	
			end
		cnv_id[1] = UTILS.GetMarkID()
		trigger.action.markToAll(cnv_id[1],"Convoy Hunt Mission 1: \n\""..ConvoyMissionName.."\"\n>> Convoy's last known position <<",Convoy1Zone_vec,true)
		
		if enable_drawn_markers == true and Convoy1_alive == true then
			if cnv_circle_id[1] ~= nil and cnv_text_id[1] ~= nil then
				trigger.action.removeMark(cnv_circle_id[1])
				trigger.action.removeMark(cnv_text_id[1])
			end
			cnv_circle_id[1] = UTILS.GetMarkID()
			cnv_circle_id[1] = Convoy1Zone_coord:CircleToAll(tti.marker.convoy.circleSize, -1, tti.marker.convoy.circleOutlineColor, 0.5, tti.marker.convoy.circleFillColor, tti.marker.convoy.circleFillAlpha, 3, false)
			cnv_text_id[1] = UTILS.GetMarkID()
			cnv_text_id[1] = Convoy1Zone_coord:Translate(tti.marker.convoy.textBoxOffset, tti.marker.convoy.textBoxAnglePosition):TextToAll("Convoy Hunt Mission 1\n>> Convoy's last known position <<", -1, tti.marker.convoy.textBoxTextColor, tti.marker.convoy.textBoxTextAlpha, tti.marker.convoy.textBoxFillColor, tti.marker.convoy.textBoxFillAlpha, tti.marker.convoy.textBoxFontSize, false)
		end
		
	end
end

function create_convoy2_marker()
	if convoy_map_markers == true and Convoy2_alive == true then
		Convoy2Zone_vec = Convoy2spawn:GetVec3()
		Convoy2Zone_coord = COORDINATE:NewFromVec3(Convoy2Zone_vec)
		--Convoy1Zone_vec = Convoy1Zone:GetVec3()
			if cnv_id[2] ~= nil then
				trigger.action.removeMark(cnv_id[2])	
			end
		cnv_id[2] = UTILS.GetMarkID()
		trigger.action.markToAll(cnv_id[2],"Convoy Hunt Mission 2: \n\""..ConvoyMissionName.."\"\n>> Convoy's last known position <<",Convoy2Zone_vec,true)
		
		if enable_drawn_markers == true and Convoy2_alive == true then
			if cnv_circle_id[2] ~= nil and cnv_text_id[2] ~= nil then
				trigger.action.removeMark(cnv_circle_id[2])
				trigger.action.removeMark(cnv_text_id[2])
			end
			cnv_circle_id[2] = UTILS.GetMarkID()
			cnv_circle_id[2] = Convoy2Zone_coord:CircleToAll(tti.marker.convoy.circleSize, -1, tti.marker.convoy.circleOutlineColor, 0.5, tti.marker.convoy.circleFillColor, tti.marker.convoy.circleFillAlpha, 3, false)
			cnv_text_id[2] = UTILS.GetMarkID()
			cnv_text_id[2] = Convoy2Zone_coord:Translate(tti.marker.convoy.textBoxOffset, tti.marker.convoy.textBoxAnglePosition):TextToAll("Convoy Hunt Mission 2\n>> Convoy's last known position <<", -1, tti.marker.convoy.textBoxTextColor, tti.marker.convoy.textBoxTextAlpha, tti.marker.convoy.textBoxFillColor, tti.marker.convoy.textBoxFillAlpha, tti.marker.convoy.textBoxFontSize, false)
		end
		
	end
end

function create_convoy3_marker()
	if convoy_map_markers == true and Convoy3_alive == true then
		Convoy3Zone_vec = Convoy3spawn:GetVec3()
		Convoy3Zone_coord = COORDINATE:NewFromVec3(Convoy3Zone_vec)
			if cnv_id[3] ~= nil then
				trigger.action.removeMark(cnv_id[3])	
			end
		cnv_id[3] = UTILS.GetMarkID()
		trigger.action.markToAll(cnv_id[3],"Convoy Hunt Mission 3: \n\""..ConvoyMissionName.."\"\n>> Convoy's last known position <<",Convoy3Zone_vec,true)
		
		if enable_drawn_markers == true and Convoy3_alive == true then
			if cnv_circle_id[3] ~= nil and cnv_text_id[3] ~= nil then
				trigger.action.removeMark(cnv_circle_id[3])
				trigger.action.removeMark(cnv_text_id[3])
			end
			cnv_circle_id[3] = UTILS.GetMarkID()
			cnv_circle_id[3] = Convoy3Zone_coord:CircleToAll(tti.marker.convoy.circleSize, -1, tti.marker.convoy.circleOutlineColor, 0.5, tti.marker.convoy.circleFillColor, tti.marker.convoy.circleFillAlpha, 3, false)
			cnv_text_id[3] = UTILS.GetMarkID()
			cnv_text_id[3] = Convoy3Zone_coord:Translate(tti.marker.convoy.textBoxOffset, tti.marker.convoy.textBoxAnglePosition):TextToAll("Convoy Hunt Mission 3\n>> Convoy's last known position <<", -1, cnv_textBoxTextColor, cnv_textBoxTextAlpha, cnv_textBoxFillColor, cnv_textBoxFillAlpha, cnv_textBoxFontSize, false)
		end
		
	end
end

convoyMarkerRefreshTime = 300

function auto_update_convoy_marker()
timer.scheduleFunction(auto_update_convoy_marker, {}, timer.getTime() + convoyMarkerRefreshTime)

	if convoy_map_markers == true and Convoy1_alive == true then

		Convoy1Zone_vec = Convoy1spawn:GetVec3()
		--Convoy1Zone_vec = Convoy1Zone:GetVec3()
		Convoy1Zone_coord = COORDINATE:NewFromVec3(Convoy1Zone_vec)
			if cnv_id[1] ~= nil then
				trigger.action.removeMark(cnv_id[1])	
			end
		cnv_id[1] = UTILS.GetMarkID()
		trigger.action.markToAll(cnv_id[1],"Convoy Hunt Mission 1: \n\""..ConvoyMissionName.."\"\n>> Convoy's last known position <<",Convoy1Zone_vec,true)
		
		if enable_drawn_markers == true and Convoy1_alive == true then
			if cnv_circle_id[1] ~= nil and cnv_text_id[1] ~= nil then
				trigger.action.removeMark(cnv_circle_id[1])
				trigger.action.removeMark(cnv_text_id[1])
			end
			cnv_circle_id[1] = UTILS.GetMarkID()
			cnv_circle_id[1] = Convoy1Zone_coord:CircleToAll(tti.marker.convoy.circleSize, -1, tti.marker.convoy.circleOutlineColor, 0.5, tti.marker.convoy.circleFillColor, tti.marker.convoy.circleFillAlpha, 3, false)
			cnv_text_id[1] = UTILS.GetMarkID()
			cnv_text_id[1] = Convoy1Zone_coord:Translate(tti.marker.convoy.textBoxOffset, tti.marker.convoy.textBoxAnglePosition):TextToAll("Convoy Hunt Mission 1\n>> Convoy's last known position <<", -1, tti.marker.convoy.textBoxTextColor, tti.marker.convoy.textBoxTextAlpha, tti.marker.convoy.textBoxFillColor, tti.marker.convoy.textBoxFillAlpha, tti.marker.convoy.textBoxFontSize, false)
		end
	end

	if convoy_map_markers == true and Convoy2_alive == true then
		Convoy2Zone_vec = Convoy2spawn:GetVec3()
		--Convoy1Zone_vec = Convoy1Zone:GetVec3()
		Convoy2Zone_coord = COORDINATE:NewFromVec3(Convoy2Zone_vec)
			if cnv_id[2] ~= nil then
				trigger.action.removeMark(cnv_id[2])	
			end
		cnv_id[2] = UTILS.GetMarkID()
		trigger.action.markToAll(cnv_id[2],"Convoy Hunt Mission 2: \n\""..ConvoyMissionName.."\"\n>> Convoy's last known position <<",Convoy2Zone_vec,true)
		
		if enable_drawn_markers == true and Convoy2_alive == true then
			if cnv_circle_id[2] ~= nil and cnv_text_id[2] ~= nil then
				trigger.action.removeMark(cnv_circle_id[2])
				trigger.action.removeMark(cnv_text_id[2])
			end
			cnv_circle_id[2] = UTILS.GetMarkID()
			cnv_circle_id[2] = Convoy2Zone_coord:CircleToAll(tti.marker.convoy.circleSize, -1, tti.marker.convoy.circleOutlineColor, 0.5, tti.marker.convoy.circleFillColor, tti.marker.convoy.circleFillAlpha, 3, false)
			cnv_text_id[2] = UTILS.GetMarkID()
			cnv_text_id[2] = Convoy2Zone_coord:Translate(tti.marker.convoy.textBoxOffset, tti.marker.convoy.textBoxAnglePosition):TextToAll("Convoy Hunt Mission 2\n>> Convoy's last known position <<", -1, tti.marker.convoy.textBoxTextColor, tti.marker.convoy.textBoxTextAlpha, tti.marker.convoy.textBoxFillColor, tti.marker.convoy.textBoxFillAlpha, tti.marker.convoy.textBoxFontSize, false)
		end
	end


	if convoy_map_markers == true and Convoy3_alive == true then
		Convoy3Zone_vec = Convoy3spawn:GetVec3()
		Convoy3Zone_coord = COORDINATE:NewFromVec3(Convoy3Zone_vec)
			if cnv_id[3] ~= nil then
				trigger.action.removeMark(cnv_id[3])	
			end
		cnv_id[3] = UTILS.GetMarkID()
		trigger.action.markToAll(cnv_id[3],"Convoy Hunt Mission 3: \n\""..ConvoyMissionName.."\"\n>> Convoy's last known position <<",Convoy3Zone_vec,true)
		
		if enable_drawn_markers == true and Convoy3_alive == true then
			if cnv_circle_id[3] ~= nil and cnv_text_id[3] ~= nil then
				trigger.action.removeMark(cnv_circle_id[3])
				trigger.action.removeMark(cnv_text_id[3])
			end
			cnv_circle_id[3] = UTILS.GetMarkID()
			cnv_circle_id[3] = Convoy3Zone_coord:CircleToAll(tti.marker.convoy.circleSize, -1, tti.marker.convoy.circleOutlineColor, 0.5, tti.marker.convoy.circleFillColor, tti.marker.convoy.circleFillAlpha, 3, false)
			cnv_text_id[3] = UTILS.GetMarkID()
			cnv_text_id[3] = Convoy3Zone_coord:Translate(tti.marker.convoy.textBoxOffset, tti.marker.convoy.textBoxAnglePosition):TextToAll("Convoy Hunt Mission 3\n>> Convoy's last known position <<", -1, tti.marker.convoy.textBoxTextColor, tti.marker.convoy.textBoxTextAlpha, tti.marker.convoy.textBoxFillColor, tti.marker.convoy.textBoxFillAlpha, tti.marker.convoy.textBoxFontSize, false)
		end
		
	end

end

--enemy_global_killfeed_messages = true


tti.a2g = {}
tti.a2g.troops = {}
tti.a2g.vehicles = {}

tti.a2g.killMSG = {
"Right on target, ",
"Good effect on target, ",
"Target hit! Nice one,  ",
"Good effect, ",
"Direct hit. Nice work, "
}

tti.a2g.infantrySynonyms = { 
"infantry",
"combatant",
"personnel",
"insurgent",
}

tti.a2g.infantryKilledSynonyms = { 
"killed",
"elimitated",
"neutralized",
}

tti.a2g.playerCongratsText = { 
"Nice shot",
"Nice shooting",
"Nice one",
"Great work",
"Great shot",
"Good effect",
"Good hit",
"Nailed it",
"You got him",
}

tti.a2g.killSound = { 
"TTI Soundfiles/BF3-Good Effect on Target.ogg",
"TTI Soundfiles/AC4-Target Destroyed 2.ogg",
"TTI Soundfiles/BF3-On Target Nice Shot.ogg",
"TTI Soundfiles/AC4-Target Destroyed 1.ogg",
"TTI Soundfiles/AC4-Target Destroyed 2.ogg",
"TTI Soundfiles/AC4-Target Destruction Confirmed.ogg",
"TTI Soundfiles/AC0-Alright Direct Hit.ogg",
}

tti.a2g.killSoundInf = { 
"TTI Soundfiles/AC0-EnemyConfirmedDown.ogg",
"TTI Soundfiles/AC0-GotHimInf1.ogg",
"TTI Soundfiles/AC0-GotHimInf2.ogg",
"TTI Soundfiles/AC0-OneEnemyDown.ogg",
"TTI Soundfiles/AC0-TheresHardlyAnyLeft.ogg",
"TTI Soundfiles/ApacheGunCamReal-GoodEffectOver.ogg",
"TTI Soundfiles/ApacheGunCamReal-HesNoLongerWithUs.ogg",
"TTI Soundfiles/ApacheGunCamReal-ThatWasABlastOnOneGuy.ogg",
}

tti.a2g.airSupportRequestSound = { 
"TTI Soundfiles/AC04-Requesting CAS 1.ogg",
"TTI Soundfiles/AC04-Requesting CAS 2.ogg",
"TTI Soundfiles/AC04-Requesting CAS 3.ogg",
"TTI Soundfiles/We're taking fire across.ogg",
"TTI Soundfiles/CODMW2-We have engaged the enemy.ogg",
"TTI Soundfiles/CODMW2-We are cut off.ogg",
"TTI Soundfiles/CODMW2-Where is the air support.ogg",
"TTI Soundfiles/AC0-DamnRequestingSupport.ogg",
}

tti.a2g.troopsDeployedSound = { 
"TTI Soundfiles/were moving were moving.ogg",
"TTI Soundfiles/AC-AirbourneTroopsDropped.ogg",

}

tti.a2g.vehiclesDeployedSound = { 
"TTI Soundfiles/AC-Burn It To The Ground.ogg",
"TTI Soundfiles/AC-AllUnitsAdvance.ogg",
"TTI Soundfiles/AC-CoordinateWithGroundForces.ogg",
"TTI Soundfiles/AC-NotADrillUnitsAssumePosition.ogg",
"TTI Soundfiles/AC-TankUnitAdvancing.ogg",
}


function delayedA2gKillMessageToGroup(iniGroup, tgtUnit, msg, msgDisplayTime, snd, delayedTime)
a2gMessageIsPlaying = true
	timer.scheduleFunction(function()
		trigger.action.outTextForGroup(iniGroup, msg, msgDisplayTime)
		if voice_lines_audio == "enabled" then
		trigger.action.outSoundForGroup(iniGroup, snd)
		elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSoundForGroup(iniGroup, tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		tti.debug("A2G message is cooled down and will play a sound/message.")
		--trigger.action.outText("A2G message is cooled down and will play a sound/message.", 5)
	end, nil, timer.getTime() + delayedTime  )
end

function randomA2gKillVehMessageToGroup(iniGroup, tgtUnit, iniPlayerName, msgDisplayTime, delayedTime)
a2gMessageIsPlaying = true
	timer.scheduleFunction(function()
		tti.debug("A2G message is cooled down and will play a sound/message.")
		local switch = math.random(1,9)
		if switch == 1 then
			trigger.action.outTextForGroup(iniGroup, "Enemy [" .. tgtUnit.. "] destroyed. " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Good effect on target!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/BF3-Good Effect on Target.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 2 then
			trigger.action.outTextForGroup(iniGroup, "Enemy [" .. tgtUnit.. "] destroyed. " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Target destroyed!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/AC4-Target Destroyed 2.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 3 then
			trigger.action.outTextForGroup(iniGroup, "Enemy [" .. tgtUnit.. "] destroyed. " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - On target! Nice Shot!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/BF3-On Target Nice Shot.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 4 then
			trigger.action.outTextForGroup(iniGroup, "Enemy [" .. tgtUnit.. "] destroyed. " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Target destroyed!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/AC4-Target Destroyed 1.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 5 then
			trigger.action.outTextForGroup(iniGroup, "Enemy [" .. tgtUnit.. "] destroyed. " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Target destroyed!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/AC4-Target Destroyed 2.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 6 then
			trigger.action.outTextForGroup(iniGroup, "Enemy [" .. tgtUnit.. "] destroyed. " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Target destruction confirmed.", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/AC4-Target Destruction Confirmed.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 7 then
			trigger.action.outTextForGroup(iniGroup, "Enemy [" .. tgtUnit.. "] destroyed. " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Alright! Direct hit!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/AC0-Alright Direct Hit.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 8 then
			trigger.action.outTextForGroup(iniGroup, "Enemy [" .. tgtUnit.. "] destroyed. " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Good effect, good effect, over.", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/ApacheGunCamReal-GoodEffectOver.ogg" )		
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end				
		end
		end, nil, timer.getTime() + delayedTime  )
end

function randomA2gKillInfMessageToGroup(iniGroup, tgtUnit, iniPlayerName, msgDisplayTime, delayedTime)
a2gMessageIsPlaying = true
	timer.scheduleFunction(function()
		tti.debug("A2G message is cooled down and will play a sound/message.")
		local switch = math.random(1,8)
		if switch == 1 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Enemy confirmed down.", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/AC0-EnemyConfirmedDown.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 2 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Got him!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/AC0-GotHimInf1.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 3 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Got him!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/AC0-GotHimInf2.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 4 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - One enemy down!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/AC0-OneEnemyDown.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 5 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - ...There's hardly any left!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/AC0-TheresHardlyAnyLeft.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 6 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Good effect, good effect, over.", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/ApacheGunCamReal-GoodEffectOver.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 7 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - He's no longer with us.", msgDisplayTime)
		if voice_lines_audio == "enabled" then		
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/ApacheGunCamReal-HesNoLongerWithUs.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 8 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - That was a blast on one guy!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
				trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/ApacheGunCamReal-ThatWasABlastOnOneGuy.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end
		elseif switch == 9 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - That was a blast on one guy!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
				trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/JFA-BoomImpact.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end
		elseif switch == 10 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - That was a blast on one guy!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
				trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/JFA-BoomOhYes.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end
		elseif switch == 11 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - That was a blast on one guy!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
				trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/JFA-Impact.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		end
		end, nil, timer.getTime() + delayedTime  )
end

--[[ TO DO - MAKE MY LIFE EASIER WITH THIS LOL
 local killSound = math.random(1,#tti.a2g.killSound)
tti.a2g.killSound[killSound][1] --Picks the filename
tti.a2g.killSound[killSound][2] --Picks the Subtitle
]]

tti.a2g.eventHandler = EVENTHANDLER:New() --Create Global EventHandler
world.addEventHandler(tti.a2g.eventHandler) -- Subscribe to World Events.

tti.a2g.troops.eventHandler = EVENTHANDLER:New() --Create Global EventHandler
world.addEventHandler(tti.a2g.troops.eventHandler) -- Subscribe to World Events.

tti.a2g.vehicles.eventHandler = EVENTHANDLER:New() --Create Global EventHandler
world.addEventHandler(tti.a2g.vehicles.eventHandler) -- Subscribe to World Events.

aiKillPlayerEventHandler = EVENTHANDLER:New() --Create Global EventHandler
world.addEventHandler(aiKillPlayerEventHandler) -- Subscribe to World Events.


--enable_a2g_kill_messages = true
a2gMessageCooldownTime = 10
a2gKillMessageDelay = 2

function delayedA2gKillMessageToAll(killFeedA2gMsg, killFeedA2gMsgDisplayTime, delayedTime, killFeedA2gSoundName)
a2gKillFeedMessageIsPlaying = true
	timer.scheduleFunction(function()
		trigger.action.outText(killFeedA2gMsg, killFeedA2gMsgDisplayTime)
		if enable_global_killfeed_sound == true and killFeedA2gSoundName then
			trigger.action.outSound(killFeedA2gSoundName)
			elseif enable_global_killfeed_sound == true and killFeedA2gSoundName == nil then
			trigger.action.outSound("TTI Soundfiles/AC6-AWACS Alert 1.ogg")
		end
		tti.debug("A2G killfeed message is cooled down and will play a sound/message.")

	end, nil, timer.getTime() + delayedTime  )
end

mainDetectionAfterDestroyDelayTime = 16

function tti.a2g.eventHandler:onEvent(EventData) -- Parse World Events function.
	if EventData.id == world.event.S_EVENT_KILL or EventData.id == world.event.S_EVENT_BDA then
		tti.serialize(EventData, "EventDataForA2GKill")
		local tgtUnit = EventData.target or EventData.TgtDCSUnit
		local tgtUnitTypeName = tgtUnit:getTypeName()
		local tgtUnitGroup = tgtUnit:getGroup()
		local tgtUnitGroupName = tgtUnit:getName()
		local tgtUnitDesc = tgtUnit:getDesc()
		
		local iniUnit = EventData.initiator or EventData.IniDCSUnit
		local iniUnitTypeName = iniUnit:getTypeName()
		local iniUnitGroup = iniUnit:getGroup()
		local iniUnitGroupName = iniUnitGroup:getName()
		local iniUnitDesc = iniUnit:getDesc()
		
		local weapon = EventData.weapon_name or EventData.WeaponName

		
		--tti.debug("**** MASTER KILL EVENT HANDLING **** \ntgtUnit: " .. tgtUnitGroupName .. " \niniUnit: " .. iniUnitGroupName .. " \nweapon: " .. weapon ..  " \ntgtUnitDesc: " .. tostring(tgtUnit:getDesc()), true)
		tti.debug("**** MASTER KILL EVENT HANDLING **** \ntgtUnit: " .. tgtUnitGroupName .. " \niniUnit: " .. iniUnitGroupName .. " \nweapon: " .. weapon ..  " \ntgtUnitDesc: " .. tostring(tgtUnit:getDesc()))
		--if tgtUnitDesc.attributes then
		if tgtUnitGroupName:find("A2G") or tgtUnitGroupName:find("AA_Init") or tgtUnitGroupName:find("SAM") then
		timer.scheduleFunction(function()
		tti.debug("A ground mission unit named: [" .. tgtUnitGroupName .. "] has been destroyed, detecting zones now!")
		main_detection(1)
		end, nil, timer.getTime() + mainDetectionAfterDestroyDelayTime  )
		end
		
			if tgtUnit:hasAttribute("Ground vehicles") == true or tgtUnit:hasAttribute("Infantry") == true or tgtUnit:hasAttribute("Fortifications") == true or tgtUnit:hasAttribute("Ships") == true or tgtUnit:hasAttribute("MANPADS") == true or tgtUnit:hasAttribute("MANPADS AUX") == true then -- for ground units
			--if tgtUnit:hasAttribute("Ground vehicles") == true or tgtUnit:hasAttribute("Fortifications") == true or tgtUnit:hasAttribute("Ships") == true or tgtUnit:hasAttribute("MANPADS") == true or tgtUnit:hasAttribute("MANPADS AUX") == true then -- for ground units
				if iniUnit:getCoalition() == 2 and tgtUnit:getCoalition() == 1 and enable_a2g_kill_messages == true then -- if shooter is blue, target is red, and if option enabled.
				success, err  = pcall( 
					function()
					tti.debug("**************** A2G Kill Event Handling: " .. iniUnitGroupName .. "(" .. iniUnitTypeName .. ")" .. " killed " .. tgtUnitTypeName .. "(" ..  tgtUnitGroupName .. ")" .. " with " .. weapon .. " ****************")
						if iniUnit:getPlayerName() then
							local killerID = iniUnit:getGroup():getID()
							tti.debug(iniUnit:getPlayerName() .. " killed " .. tgtUnitTypeName)				
							if a2gKillFeedMessageIsPlaying ~= true then
								if enable_player_global_killfeed == true then
									delayedA2gKillMessageToAll("[BLUE] " .. iniUnitTypeName .. " (" .. iniUnit:getPlayerName() ..") ► ["..  weapon .."] ► [RED] " .. tgtUnitTypeName, 8, killFeedDisplayDelayTime, "TTI Soundfiles/AC6-AWACS Alert 1.ogg")
								end
							end
							timer.scheduleFunction(function()
								if a2gKillFeedMessageIsPlaying == true then
									a2gKillFeedMessageIsPlaying = false
									tti.debug("A2G kill field message cool down finished...")
									--trigger.action.outText("A2A message cool down finished...",5)
								end
							end, nil, timer.getTime() + killFeedCoolDownTime  )
							
							if a2gMessageIsPlaying ~= true then
								if tgtUnit:hasAttribute("Infantry") == true then
									--delayedA2gKillMessageToGroup(killerID, tgtUnitTypeName, "Enemy infantry [" .. tgtUnitTypeName.. "] neutralized! - " .. tti.a2g.killMSGInf[math.random(1,#tti.a2g.killMSGInf)] .. iniUnit:getPlayerName() .. "!", 10, tti.a2g.killSoundInf[math.random(1,#tti.a2g.killSoundInf)], a2gKillMessageDelay)
									randomA2gKillInfMessageToGroup(killerID, tgtUnitTypeName, iniUnit:getPlayerName(), 10, a2gKillMessageDelay)
								else
									--delayedA2gKillMessageToGroup(killerID, tgtUnitTypeName, "Enemy [" .. tgtUnitTypeName.. "] destroyed! - " .. tti.a2g.killMSG[math.random(1,#tti.a2g.killMSG)] .. iniUnit:getPlayerName() .. "!", 10, tti.a2g.killSound[math.random(1,#tti.a2g.killSound)], a2gKillMessageDelay)
									randomA2gKillVehMessageToGroup(killerID, tgtUnitTypeName, iniUnit:getPlayerName(), 10, a2gKillMessageDelay)
								end
							else
								tti.debug("A2G message is NOT cooled down and will NOT play a sound/message.")
								--trigger.action.outText("A2G message is NOT cooled down and will NOT play a sound/message.", 5)
							end
								timer.scheduleFunction(function()
									if a2gMessageIsPlaying == true then
										a2gMessageIsPlaying = false
										tti.debug("A2G message cool down finished...")
										--trigger.action.outText("A2G message cool down finished...",5)
									end
								end, nil, timer.getTime() + a2gMessageCooldownTime  )
							end	
								end
								)
					elseif iniUnit:getCoalition() == 2 and tgtUnit:getCoalition() == 2 and enable_a2g_kill_messages == true then
											success, err  = pcall( 
					function()
						tti.debug("**************** A2G Kill Event Handling: " .. iniUnitGroupName .. "(" .. iniUnitTypeName .. ")" .. " killed " .. tgtUnitTypeName .. "(" ..  tgtUnitGroupName .. ")" .. " with " .. weapon .. " ****************")
								if iniUnit:getPlayerName() then
									local killerID = iniUnit:getGroup():getID()
									tti.debug(iniUnit:getPlayerName() .. " killed " .. tgtUnitTypeName)
											if a2gMessageIsPlaying ~= true then
												 delayedA2gKillMessageToGroup(killerID, tgtUnitTypeName, "Cease fire " .. iniUnit:getPlayerName() .. "! Friendly fire on [BLUE " .. tgtUnitTypeName.. "] with [".. weapon .."]", 10, tti.a2a.killFriendlySound[math.random(1,#tti.a2a.killFriendlySound)], a2gKillMessageDelay)
												else
												tti.debug("A2G message is NOT cooled down and will NOT play a sound/message.")
												--trigger.action.outText("A2A message is NOT cooled down and will NOT play a sound/message.", 5)
											end
										timer.scheduleFunction(function()
											if a2gMessageIsPlaying == true then
												a2gMessageIsPlaying = false
												tti.debug("A2G message cool down finished...")
												--trigger.action.outText("A2A message cool down finished...",5)
											end
										end, nil, timer.getTime() + a2gMessageCooldownTime  )
									end	
								end
								)
								
			
							end
						end
			if err then 
				tti.debug("Problem with getting the group!" .. err)
			end
	--end
end

			
if EventData.id == world.event.S_EVENT_HIT then -- friendly fire on HIT

	success, err  = pcall( 
		function()

		tti.serialize(EventData, "EventDataForA2GHit")
		local tgtUnit = EventData.target or EventData.TgtDCSUnit
		local tgtUnitTypeName = tgtUnit:getTypeName()
		local tgtUnitGroup = tgtUnit:getGroup()
		local tgtUnitGroupName = tgtUnit:getName()
		local tgtUnitDesc = tgtUnit:getDesc()
		
		local iniUnit = EventData.initiator or EventData.IniDCSUnit
		local iniUnitTypeName = iniUnit:getTypeName()
		local iniUnitGroup = iniUnit:getGroup()
		local iniUnitGroupName = iniUnitGroup:getName()
		local iniUnitDesc = iniUnit:getDesc()
		
		local weapon = EventData.weapon_name or EventData.WeaponName
	end
	)
	--if tgtUnitDesc.attributes then
	if tgtUnitDesc ~= nil then
		if tgtUnit:hasAttribute("Ground vehicles") == true or tgtUnit:hasAttribute("Infantry") == true or tgtUnit:hasAttribute("Fortifications") == true or tgtUnit:hasAttribute("Ships") == true then -- for ground units
			if iniUnit:getPlayerName() and iniUnit:getCoalition() == 2 and tgtUnit:getCoalition() == 2 and enable_a2g_kill_messages == true then -- if shooter is blue, target is red, and if option enabled.
			success, err  = pcall( 
				function()
					tti.debug("**************** A2G Hit Event Handling: " .. iniUnitGroupName .. "(" .. iniUnitTypeName .. ")" .. " hit " .. tgtUnitTypeName .. "(" ..  tgtUnitGroupName .. ")" .. " with " .. weapon .. " ****************")
						if iniUnit:getPlayerName() then
							local killerID = iniUnit:getGroup():getID()
							tti.debug(iniUnit:getPlayerName() .. " hit " .. tgtUnitTypeName)
									if a2gMessageIsPlaying ~= true then
										delayedA2gKillMessageToGroup(killerID, tgtUnitTypeName, "Cease fire " .. iniUnitGroupName .. "! Friendly fire on [BLUE " .. tgtUnitTypeName.. "] with [".. weapon .."]", 10, tti.a2a.killFriendlySound[math.random(1,#tti.a2a.killFriendlySound)], 1)
										else
										tti.debug("A2G message is NOT cooled down and will NOT play a sound/message.")
										--trigger.action.outText("A2A message is NOT cooled down and will NOT play a sound/message.", 5)
									end
								timer.scheduleFunction(function()
									if a2gMessageIsPlaying == true then
										a2gMessageIsPlaying = false
										tti.debug("A2G message cool down finished...")
										--trigger.action.outText("A2A message cool down finished...",5)
									end
								end, nil, timer.getTime() + a2gMessageCooldownTime  )
						end	
					end
							)
				end
			end
		end
	end
end

function aiKillPlayerEventHandler:onEvent(EventData)
	if EventData.id == world.event.S_EVENT_KILL or EventData.id == world.event.S_EVENT_BDA then
			--tti.serialize(EventData, "EventDataForKill")
		local tgtUnit = EventData.target or EventData.TgtDCSUnit
		local tgtUnitTypeName = tgtUnit:getTypeName()
		local tgtUnitGroup = tgtUnit:getGroup()
		local tgtUnitGroupName = tgtUnit:getName()
		local tgtUnitDesc = tgtUnit:getDesc()
		
		local iniUnit = EventData.initiator or EventData.IniDCSUnit
		local iniUnitTypeName = iniUnit:getTypeName()
		local iniUnitGroup = iniUnit:getGroup()
		local iniUnitGroupName = iniUnitGroup:getName()
		local iniUnitDesc = iniUnit:getDesc()
		
		local weapon = EventData.weapon_name or EventData.WeaponName
		if tgtUnit:getPlayerName() then
			--if tgtUnitDesc.attributes then
			--if tgtUnit:hasAttribute("Ground vehicles") == true or tgtUnit:hasAttribute("Infantry") == true or tgtUnit:hasAttribute("Fortifications") == true or tgtUnit:hasAttribute("Ships") == true then -- for ground units
			if iniUnit:getCoalition() == 1 and tgtUnit:getCoalition() == 2 and enemy_global_killfeed_messages == true and enable_player_global_killfeed == true then
			success, err  = pcall( 
				function()
				tti.debug("**************** A2G Kill Event Handling: " .. iniUnitGroupName .. "(" .. iniUnitTypeName .. ")" .. " killed " .. tgtUnitTypeName .. "(" ..  tgtUnitGroupName .. ")" .. " with " .. weapon .. " ****************")
					if tgtUnit:getPlayerName() then
						local killerID = iniUnit:getGroup():getID()
						tti.debug(iniUnitTypeName .. " killed " .. tgtUnit:getPlayerName())				
						if a2gKillFeedMessageIsPlaying ~= true then
							if enable_player_global_killfeed == true then
									delayedA2gKillMessageToAll("[RED] " .. iniUnitTypeName .. " ► ["..  weapon .."] ► [BLUE] " .. tgtUnitTypeName .. " (" .. tgtUnit:getPlayerName() ..")", 10, 5, "TTI Soundfiles/PlayerKilledUI.ogg")
							end
						end
							timer.scheduleFunction(function()
								if a2gKillFeedMessageIsPlaying == true then
									a2gKillFeedMessageIsPlaying = false
									tti.debug("A2G kill field message cool down finished...")
									--trigger.action.outText("A2A message cool down finished...",5)
								end
							end, nil, timer.getTime() + killFeedCoolDownTime  )
							
							
					end	
				end
							)
			end
		end
		if err then 
			tti.debug("Problem with getting the group!" .. err)
		end
	end
end

--enable_troops_air_support_request_messages = true
airSupportRequestMessageCooldownTime = 300
timeToRemoveAirSupportMarker = 45 --time in minutes.
air_support_troops_id = {}
air_support_troops_circle_id = {}
air_support_troops_text_id = {}
air_support_vehicles_id = {}
air_support_vehicles_circle_id = {}
air_support_vehicles_text_id = {}

---Circle Radius
tti.marker.airsupport.circleSize = 500 
tti.marker.airsupport.circleFillColor = tti.color.blue
tti.marker.airsupport.circleFillAlpha = 0.18
tti.marker.airsupport.circleOutlineColor = tti.color.white
tti.marker.airsupport.textBoxOffset = 500 + tti.marker.airsupport.circleSize
tti.marker.airsupport.textBoxAnglePosition = 125
tti.marker.airsupport.textBoxFontSize = 9
tti.marker.airsupport.textBoxTextColor = tti.color.white
tti.marker.airsupport.textBoxTextAlpha = 0.8
tti.marker.airsupport.textBoxFillColor = tti.color.blue
tti.marker.airsupport.textBoxFillAlpha = 0.5

function delayedAirSupportRequestMessageToAll(airSupportRequestMsg, airSupportRequestMsgDisplayTime, delayedTime)
airSupportRequestMessageIsPlaying = true
	timer.scheduleFunction(function()
		trigger.action.outText(airSupportRequestMsg, airSupportRequestMsgDisplayTime)
		if voice_lines_audio == "enabled" then
			trigger.action.outSound(tti.a2g.airSupportRequestSound[math.random(1,#tti.a2g.airSupportRequestSound)])
		elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end			
		tti.debug("Air Support Request message is cooled down and will play a sound/message.")
	end, nil, timer.getTime() + delayedTime  )
end

function create_air_support_troops_marker(troops_vec3, tgtUnitRequesterName, tgtUnitRequesterType)
		troopMarkerStartTime = timer.getTime()
	if air_support_troops_id[1] ~= nil then
			trigger.action.removeMark(air_support_troops_id[1])	
	end
	
	if air_support_troops_circle_id[1] ~= nil and air_support_troops_text_id[1] ~= nil then
			trigger.action.removeMark(air_support_troops_text_id[1])	
			trigger.action.removeMark(air_support_troops_circle_id[1])	
	end
	
	air_support_troops_id[1] = UTILS.GetMarkID()
	local troopSupportRequestText = "[BLUE] " .. tgtUnitRequesterName ..": \nAIR SUPPORT requested here!"
	trigger.action.markToAll(air_support_troops_id[1], troopSupportRequestText, troops_vec3, true)
	trigger.action.smoke(troops_vec3, 4)
	--trigger.action.outText("Support marker added, will remove in 20 seconds", 60)
	if enable_drawn_markers == true then
	airSupportTroops_coord = COORDINATE:NewFromVec3(troops_vec3)
	air_support_troops_circle_id[1] =  UTILS.GetMarkID()
	air_support_troops_circle_id[1] = airSupportTroops_coord:CircleToAll(tti.marker.airsupport.circleSize, -1, tti.marker.airsupport.circleOutlineColor, 0.5, tti.marker.airsupport.circleFillColor, tti.marker.airsupport.circleFillAlpha, 3, false)
	air_support_troops_text_id[1] = UTILS.GetMarkID()
	air_support_troops_text_id[1] = airSupportTroops_coord:Translate(tti.marker.airsupport.textBoxOffset, tti.marker.airsupport.textBoxAnglePosition):TextToAll(troopSupportRequestText, -1, tti.marker.airsupport.textBoxTextColor, tti.marker.airsupport.textBoxTextAlpha, tti.marker.airsupport.textBoxFillColor, tti.marker.airsupport.textBoxFillAlpha, tti.marker.airsupport.textBoxFontSize, false)
	end
	
	timer.scheduleFunction(function()
		troopMarkerFinishTime = timer.getTime()
		troopMarkerElapsedTime = troopMarkerFinishTime - troopMarkerStartTime
		if troopMarkerElapsedTime >= (timeToRemoveAirSupportMarker * 60) then
			trigger.action.removeMark(air_support_troops_id[1])	
			if enable_drawn_markers == true then
				trigger.action.removeMark(air_support_troops_circle_id[1])	
				trigger.action.removeMark(air_support_troops_text_id[1])	
			end
			trigger.action.outText(tgtUnitRequesterName .. " is no longer requesting air support. Removing map marker.", 60)
		end
	end, nil, timer.getTime() + (timeToRemoveAirSupportMarker * 60)  )
end

function tti.a2g.troops.eventHandler:onEvent(EventData) -- Parse World Events function.
	if EventData.id == world.event.S_EVENT_KILL or EventData.id == world.event.S_EVENT_BDA then
	if enable_troops_air_support_request_messages == true then
		--tti.serialize(EventData, "EventDataForKill")
		local tgtUnit = EventData.target or EventData.TgtDCSUnit
		local tgtUnitTypeName = tgtUnit:getTypeName()
		local tgtUnitGroup = tgtUnit:getGroup()
		local tgtUnitGroupName = tgtUnit:getName()
		local tgtUnitDesc = tgtUnit:getDesc()
		
		local iniUnit = EventData.initiator or EventData.IniDCSUnit
		local iniUnitTypeName = iniUnit:getTypeName()
		local iniUnitGroup = iniUnit:getGroup()
		local iniUnitGroupName = iniUnitGroup:getName()
		local iniUnitDesc = iniUnit:getDesc()
		
		local weapon = EventData.weapon_name or EventData.WeaponName
	local tgtUnitVec3 = tgtUnit:getPoint()
 	--local tgtUnitVec3 = tgtUnit:getVec3()
		if tgtUnitDesc.attributes then
			if tgtUnit:hasAttribute("Infantry") == true then -- for ground units
				--if iniUnit:getCoalition() == 1 and tgtUnit:getCoalition() == 2 and enable_troop_air_support_messages == true then 
				if iniUnit:getCoalition() == 1 and tgtUnit:getCoalition() == 2 then 
				success, err  = pcall( 
					function()
					tti.debug("**************** A2G Kill Event Handling: " .. iniUnitGroupName .. "(" .. iniUnitTypeName .. ")" .. " killed " .. tgtUnitTypeName .. "(" ..  tgtUnitGroupName .. ")" .. " with " .. weapon .. " ****************")
					if airSupportRequestMessageIsPlaying ~= true then
						delayedAirSupportRequestMessageToAll("[BLUE] " .. tgtUnitTypeName .. " (" .. tgtUnitGroupName.."): Taking fire, requesting immediate air support!\nSending coordinates now! (Map marker created and blue smoke deployed)", 60, 1 )
						create_air_support_troops_marker(tgtUnitVec3, tgtUnitGroupName, tgtUnitTypeName)
						airSupportRequestMessageIsPlaying = true
						else
						tti.debug("Air Support Request message is NOT cooled down and will NOT play a sound/message.")
					end
					timer.scheduleFunction(function()
						if airSupportRequestMessageIsPlaying == true then
							airSupportRequestMessageIsPlaying = false
							tti.debug("Air Support Request message cool down finished...")
							--trigger.action.outText("A2A message cool down finished...",5)
						end
					end, nil, timer.getTime() + airSupportRequestMessageCooldownTime  )
						if iniUnit then
							local killerID = iniUnit:getGroup():getID()
							tti.debug(iniUnit:getGroup():getID() .. " killed " .. tgtUnitTypeName)
						end
				end
				)
			end
			
			end
		end
	end
	end
end


function create_air_support_vehicles_marker(vehicles_vec3, tgtUnitRequesterName, tgtUnitRequesterType)
		vehicleMarkerStartTime = timer.getTime()
	if air_support_vehicles_id[1] ~= nil then
			trigger.action.removeMark(air_support_vehicles_id[1])	
	end
	
	if air_support_vehicles_text_id[1] ~= nil and air_support_vehicles_circle_id[1] ~= nil then
			trigger.action.removeMark(air_support_vehicles_text_id[1])	
			trigger.action.removeMark(air_support_vehicles_circle_id[1])	
	end
	
	
	local vehicleSupportRequestText = "[BLUE] " .. tgtUnitRequesterName ..": \nAIR SUPPORT requested here!"
	air_support_vehicles_id[1] = UTILS.GetMarkID()
	trigger.action.markToAll(air_support_vehicles_id[1], vehicleSupportRequestText ,vehicles_vec3, true)
	trigger.action.smoke(vehicles_vec3, 4)
	if enable_drawn_markers == true then
	airSupportVehicles_coord = COORDINATE:NewFromVec3(vehicles_vec3)
	air_support_vehicles_circle_id[1] =  UTILS.GetMarkID()
	air_support_vehicles_circle_id[1] = airSupportVehicles_coord:CircleToAll(tti.marker.airsupport.circleSize, -1, tti.marker.airsupport.circleOutlineColor, 0.5, tti.marker.airsupport.circleFillColor, tti.marker.airsupport.circleFillAlpha, 3, false)
	air_support_vehicles_text_id[1] = UTILS.GetMarkID()
	air_support_vehicles_text_id[1] = airSupportVehicles_coord:Translate(tti.marker.airsupport.textBoxOffset, tti.marker.airsupport.textBoxAnglePosition):TextToAll(vehicleSupportRequestText, -1, tti.marker.airsupport.textBoxTextColor, tti.marker.airsupport.textBoxTextAlpha, tti.marker.airsupport.textBoxFillColor, tti.marker.airsupport.textBoxFillAlpha, tti.marker.airsupport.textBoxFontSize, false)
	end
	timer.scheduleFunction(function()
		vehicleMarkerFinishTime = timer.getTime()
		vehicleMarkerElapsedTime = vehicleMarkerFinishTime - vehicleMarkerStartTime
		if vehicleMarkerElapsedTime >= (timeToRemoveAirSupportMarker * 60) then
			trigger.action.removeMark(air_support_vehicles_id[1])
				if enable_drawn_markers == true then
					trigger.action.removeMark(air_support_vehicles_circle_id[1])	
					trigger.action.removeMark(air_support_vehicles_text_id[1])	
				end
			trigger.action.outText(tgtUnitRequesterName .. " is no longer requesting air support. Removing map marker.", 60)
		end
	end, nil, timer.getTime() + (timeToRemoveAirSupportMarker * 60)  )
end

function tti.a2g.vehicles.eventHandler:onEvent(EventData) -- Parse World Events function.
	if EventData.id == world.event.S_EVENT_KILL or EventData.id == world.event.S_EVENT_BDA then
	if enable_troops_air_support_request_messages == true then
		--tti.serialize(EventData, "EventDataForKill")
		local tgtUnit = EventData.target or EventData.TgtDCSUnit
		local tgtUnitTypeName = tgtUnit:getTypeName()
		local tgtUnitGroup = tgtUnit:getGroup()
		local tgtUnitGroupName = tgtUnit:getName()
		local tgtUnitDesc = tgtUnit:getDesc()
		
		local iniUnit = EventData.initiator or EventData.IniDCSUnit
		local iniUnitTypeName = iniUnit:getTypeName()
		local iniUnitGroup = iniUnit:getGroup()
		local iniUnitGroupName = iniUnitGroup:getName()
		local iniUnitDesc = iniUnit:getDesc()
		
		local weapon = EventData.weapon_name or EventData.WeaponName
	local tgtUnitVec3 = tgtUnit:getPoint()
		if tgtUnitDesc.attributes then
			if tgtUnit:hasAttribute("Ground vehicles") == true then -- for ground units
				--if iniUnit:getCoalition() == 1 and tgtUnit:getCoalition() == 2 and enable_troop_air_support_messages == true then 
				if iniUnit:getCoalition() == 1 and tgtUnit:getCoalition() == 2 then 
				success, err  = pcall( 
					function()
					tti.debug("**************** A2G Kill Event Handling: " .. iniUnitGroupName .. "(" .. iniUnitTypeName .. ")" .. " killed " .. tgtUnitTypeName .. "(" ..  tgtUnitGroupName .. ")" .. " with " .. weapon .. " ****************")
					if airSupportRequestMessageIsPlaying ~= true then
						delayedAirSupportRequestMessageToAll("[BLUE] " .. tgtUnitTypeName .. " (" .. tgtUnitGroupName.."): Taking fire, requesting immediate air support!\nSending coordinates now! (Map marker created and blue smoke deployed)", 60, 1 )
						create_air_support_vehicles_marker(tgtUnitVec3, tgtUnitGroupName, tgtUnitTypeName)
						airSupportRequestMessageIsPlaying = true
						else
						tti.debug("Air Support Request message is NOT cooled down and will NOT play a sound/message.")
					end
					timer.scheduleFunction(function()
						if airSupportRequestMessageIsPlaying == true then
							airSupportRequestMessageIsPlaying = false
							tti.debug("Air Support Request message cool down finished...")
							--trigger.action.outText("A2A message cool down finished...",5)
						end
					end, nil, timer.getTime() + airSupportRequestMessageCooldownTime  )
						if iniUnit then
							local killerID = iniUnit:getGroup():getID()
							tti.debug(iniUnit:getGroup():getID() .. " killed " .. tgtUnitTypeName)
						end
				end
				)
			end
			
			end
		end
	end
	end
end

env.info('functions ground init ok')
--trigger.action.outText("Ground LUA File Loaded...", 10)
env.info('Deadly GROUND scripting complete')
tti_ground_missions_script_loaded = true