OWC.Config.SHOP = OWC.Config.SHOP or {}

--ENTITY Shop
OWC.Config.SHOP.entsArr = OWC.Config.SHOP.entsArr or {}
--entsArr[# in order (ex. [1], then [2], and so on)] = {"model", "weapon's/ents folder name (found in qmenu and copying to clipboard)", "name", "cost"}
OWC.Config.SHOP.entsArr[1] = {"models/Items/BoxSRounds.mdl", "cw_ammo_kit_small", "Small Ammo Kit", "250"}
OWC.Config.SHOP.entsArr[2] = {"models/Items/BoxSRounds.mdl", "cw_attpack_various", "Various Attachments", "550"}
OWC.Config.SHOP.entsArr[3] = {"models/Items/BoxSRounds.mdl", "cw_attpack_sights_cqb", "CQB Sights", "450"}
OWC.Config.SHOP.entsArr[4] = {"models/Items/BoxSRounds.mdl", "cw_attpack_sights_midrange", "Mid-Range Sight", "550"}
OWC.Config.SHOP.entsArr[5] = {"models/Items/BoxSRounds.mdl", "cw_attpack_sights_longrange", "Long Range Sights", "750"}
OWC.Config.SHOP.entsArr[6] = {"models/Items/BoxSRounds.mdl", "cw_attpack_sights_sniper", "Sniper Sights", "250"}
OWC.Config.SHOP.entsArr[7] = {"models/Items/BoxSRounds.mdl", "cw_attpack_ammotypes_rifles", "Match Grade and Magnum Ammo", "850"}
OWC.Config.SHOP.entsArr[8] = {"models/Items/BoxSRounds.mdl", "cw_attpack_suppressors", "Supressors", "650"}

--WEAPON Shop
--weaponsArr[# in order (ex. [1], then [2], and so on)] = {"model", "weapon's/ents folder name (found in qmenu and copying to clipboard)", "name", "cost"}
OWC.Config.SHOP.weaponsArr = OWC.Config.SHOP.weaponsArr or {}
OWC.Config.SHOP.weaponsArr[1] = {"models/weapons/w_rif_ak47.mdl", "cw_ak74", "AK-74", "1000"}
OWC.Config.SHOP.weaponsArr[2] = {"models/weapons/w_pist_deagle.mdl", "cw_deagle", "Deagle", "450"}
OWC.Config.SHOP.weaponsArr[3] = {"models/weapons/w_cstm_l96.mdl", "cw_l115", "L115", "1250"}
OWC.Config.SHOP.weaponsArr[4] = {"models/weapons/w_smg_mp5.mdl", "cw_mp5", "MP5", "750"}
OWC.Config.SHOP.weaponsArr[5] = {"models/weapons/w_snip_g3sg1.mdl", "cw_g3a3", "G3A3", "1125"}
OWC.Config.SHOP.weaponsArr[6] = {"models/weapons/w_eq_smokegrenade.mdl", "cw_deagle", "Smoke Grenade", "250"}
OWC.Config.SHOP.weaponsArr[7] = {"models/weapons/w_rif_m4a1.mdl", "cw_ar15", "AR-15", "1300"}
OWC.Config.SHOP.weaponsArr[8] = {"models/weapons/w_eq_smokegrenade.mdl", "cw_frag_grenade", "Grenade", "550"}
OWC.Config.SHOP.weaponsArr[9] = {"models/weapons/w_pist_deagle.mdl", "cw_g4p_usp40", "USP", "500"}
OWC.Config.SHOP.weaponsArr[10] = {"models/weapons/w_cstm_m3super90.mdl", "cw_m3super90", "M3 Super 90", "1350"}
OWC.Config.SHOP.weaponsArr[11] = {"models/weapons/w_cstm_m14.mdl", "cw_m14", "M14", "1100"}
OWC.Config.SHOP.weaponsArr[12] = {"models/weapons/w_cst_mac11.mdl", "cw_mac11", "MAC11", "900"}
OWC.Config.SHOP.weaponsArr[12] = {"", "tfbow_crybow", "Compound Bow", "900"}

OWC.Config.DisabledModules = {
	["nope"] = true
}