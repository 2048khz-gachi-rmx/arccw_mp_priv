local Material = ArcCW.AttachmentMat

------
-- ur_aw_cal_338.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_aw_cal_338")

	att.PrintName = "AWM .338 Lapua Magnum Receiver"
	att.AbbrevName = ".338 Lapua Magnum"
	att.Icon = Material("entities/att/ur_aw/rec338.png", "mips smooth")
	att.Description = "Powerful sniper cartridge that exerts substantially more muzzle energy, practically guaranteed to be fatal on a successful hit beyond point blank. The recoil is tremendous, and the lengthened bolt required to accommodate the cartridge is harder to cycle."
	att.Slot = "ur_aw_cal"
	att.AutoStats = true
	att.Desc_Pros = {
	    "ur.aw.velocity"
	}
	att.Desc_Cons = {
	    "Disables Magazine attachments"
	}
	att.Mult_Damage = 85 / 75
	att.Mult_DamageMin = 160 / 40
	--att.Mult_Range = 2
	att.Override_Range = 100
	att.Override_RangeMin = 20
	att.Override_PhysBulletMuzzleVelocity = 1000
	att.Mult_Penetration = 2
	att.Mult_Recoil = 2
	att.Mult_CycleTime = 1.18
	att.Mult_ReloadTime = 5.55 / 5.15
	att.Mult_ShootSpeedMult = 0.8
	local path = ")^weapons/arccw_ur/aw_placeholders/338/"
	local path1 = ")^weapons/arccw_ur/aw_placeholders/"
	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "fire-01.ogg", path .. "fire-02.ogg", path .. "fire-03.ogg", path .. "fire-04.ogg", path .. "fire-05.ogg", path .. "fire-06.ogg"} end
	    if fsound == wep.ShootSoundSilenced then return path .. "fire_sup.ogg" end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then return {path1 .. "fire-dist-01.ogg", path1 .. "fire-dist-02.ogg", path1 .. "fire-dist-03.ogg", path1 .. "fire-dist-04.ogg", path1 .. "fire-dist-05.ogg", path1 .. "fire-dist-06.ogg"} end
	end
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_338"
	end
	local slotinfo = {
	    [5] = {"5-Round Mag", "5-Round Mag", Material("entities/att/ur_aw/mag338_5.png", "mips smooth")},
	}
	att.Hook_GetDefaultAttIcon = function(wep, slot)
	    if slotinfo[slot] then
	        return slotinfo[slot][3]
	    end
	end
	att.Override_Trivia_Calibre = ".338 Lapua Magnum"
	att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
	att.Override_Ammo = "SniperPenetratedRound"
	att.GivesFlags = {"mag_338"}
	att.ActivateElements = {"mag_338"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_aw_mag_10.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_aw_mag_10")

	att.PrintName = "AW 10-Round Extended Mag"
	att.AbbrevName = "10-Round Extended Mag"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "AP 10-Round Extended Mag"
	end
	att.SortOrder = 10
	att.Icon = Material("entities/att/ur_aw/mag308_10.png", "mips smooth")
	att.Description = "Extended magazine for the Arctic Warfare. The extra rounds add weight to the magazine, but allow for twice as many shots to be taken between reloads."
	att.Desc_Pros = {}
	att.Desc_Neutrals = {}
	att.Slot = "ur_aw_mag"
	att.AutoStats = true
	att.HideIfBlocked = true
	att.Override_ClipSize = 10
	att.Desc_Cons = {
	    --"+ Reload time"
	}
	att.Mult_SightTime = 1.25
	att.Mult_ReloadTime = 5.675 / 5.15 -- compensation for longer anim length
	att.Mult_Sway = 1.25
	att.Mult_SpeedMult = 0.975
	att.Mult_ShootSpeedMult = 0.95
	att.ActivateElements = {"mag_ext"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_10"
	end
	att.ExcludeFlags = {"mag_338","mag_300"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_aw_mag_10m.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_aw_mag_10m")

	att.PrintName = "AWM .300 10-Round Extended Mag"
	att.AbbrevName = "10-Round Extended Mag"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "AP 10-Round Extended Mag"
	end
	att.SortOrder = 10
	att.Icon = Material("entities/att/ur_aw/mag338_10.png", "mips smooth")
	att.Description = "Extended magazine for the Arctic Warfare. The extra rounds add weight to the magazine, but allow for twice as many shots to be taken between reloads."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {}
	att.Slot = "ur_aw_mag"
	att.AutoStats = true
	att.HideIfBlocked = true
	att.Override_ClipSize = 10
	att.Mult_SightTime = 1.25
	att.Mult_ReloadTime = 6 / 5.55
	att.Mult_Sway = 1.25
	att.Mult_SpeedMult = 0.975
	att.Mult_ShootSpeedMult = 0.95
	att.ActivateElements = {"mag_ext_338"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_10_338"
	end
	att.RequireFlags = {"mag_300"}
	att.ExcludeFlags = {"mag_308"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_aw_muzzle_brake.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_aw_muzzle_brake")

	att.PrintName = "AI Muzzle Brake"
	att.Icon = Material("entities/att/ur_aw/muzzle.png", "mips smooth")
	att.Description = "Light muzzle brake unique to the AW platform."
	att.AutoStats = true
	att.Slot = {"ur_aw_muzzle"}
	att.Mult_Recoil = .9
	att.Mult_RecoilSide = .9
	att.Add_BarrelLength = 2
	att.Mult_SightTime = 1.05
	att.Mult_Sway = 1.05
	att.SortOrder = 999
	att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
	att.Model = "models/weapons/arccw/ur_aw_muzzle.mdl"
	att.ModelScale = Vector(2/3,2/3,2/3)
	att.ModelOffset = Vector(0,0,-.075)
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_aw_muzzle_brake_sights.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_aw_muzzle_brake_sights")

	att.PrintName = "AI Ironsight Brake"
	att.Icon = Material("entities/att/ur_aw/muzzle_sights.png", "mips smooth")
	att.Description = "Light muzzle brake unique to the AW platform.\n\nEquips alternative \"compact\" iron sights."
	att.AutoStats = true
	att.Slot = {"ur_aw_muzzle"}
	att.Mult_Recoil = .9
	att.Mult_RecoilSide = .9
	att.Add_BarrelLength = 2
	att.Mult_SightTime = 1.05
	att.Mult_Sway = 1.05
	att.SortOrder = 998
	att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
	att.Model = "models/weapons/arccw/ur_aw_muzzlesight.mdl"
	att.ModelScale = Vector(2/3,2/3,2/3)
	att.ModelOffset = Vector(0,0,-.075)
	att.GivesFlags = {"sights_compact"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_aw_skin_black.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_aw_skin_black")

	att.PrintName = "Black Finish"
	att.Icon = Material("entities/att/ur_aw/skin_black.png", "mips smooth")
	--att.Icon = Material("entities/att/acwatt_ur_deagle_finish_chrome.png","mips smooth")
	att.Description = "As used by law enforcement, or those lacking a father figure."
	att.Slot = "ur_aw_skin"
	att.Desc_Neutrals = {
	    "uc.cosmetic"
	}
	att.SortOrder = 2
	att.IgnorePickX = true
	att.ActivateElements = {"skin_black"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_aw_skin_custom.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_aw_skin_custom")

	att.PrintName = "Custom Finish"
	att.AbbrevName = "Custom"
	att.Icon = Material("entities/att/ur_aw/skin_rainbow.png", "mips smooth")
	att.Description = "This skin matches your player color. Let your imagination run wild."
	att.Slot = "ur_aw_skin"
	att.Desc_Neutrals = {
	    "uc.cosmetic"
	}
	att.SortOrder = 1
	att.IgnorePickX = true
	att.ActivateElements = {"skin_cust"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_aw_skin_tan.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_aw_skin_tan")

	att.PrintName = "Flat Dark Earth Finish"
	att.AbbrevName = "Flat Dark Earth"
	att.Icon = Material("entities/att/ur_aw/skin_tan.png", "mips smooth")
	att.Description = "The fury of the sandstorm, realized."
	att.Slot = "ur_aw_skin"
	att.Desc_Neutrals = {
	    "uc.cosmetic"
	}
	att.SortOrder = 1
	att.IgnorePickX = true
	att.ActivateElements = {"skin_tan"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_aw_stock_at.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_aw_stock_at")

	att.PrintName = "Tactical Stock"
	att.Description = "Variant folding stock with a pistol grip design. Lighter and perhaps more comfortable, but not as sturdy."
	att.Icon = Material("entities/att/ur_aw/stock_at.png", "mips smooth")
	att.Slot = {"ur_aw_stock"}
	att.AutoStats = true
	att.SortOrder = 3
	att.Mult_SightTime = .85
	att.Mult_Sway = 1.25
	att.Mult_Recoil = 1.1
	att.ActivateElements = {"stock_at"}
	att.GivesFlags = {"pistolgrip"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_aw_stock_fixed.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_aw_stock_fixed")

	att.PrintName = "Fixed Stock"
	att.Description = "Variant, one-piece stock without a hinge for folding. More rigid than side-folding stocks, but the lack of folding makes it harder to conceal."
	att.Icon = Material("entities/att/ur_aw/stock_nonfold.png", "mips smooth")
	att.Slot = {"ur_aw_stock"}
	att.AutoStats = true
	att.SortOrder = 3
	att.Mult_Sway = .85
	att.Mult_DrawTime = 1.2
	att.ActivateElements = {"stock_fixed"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_aw_stock_none.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_aw_stock_none")

	att.PrintName = "No Stock"
	att.Description = "Your wrists will never function again."
	att.Icon = Material("entities/att/ur_aw/stock_removed.png", "mips smooth")
	att.Slot = {"ur_aw_stock"}
	att.AutoStats = true
	att.Free = true
	att.SortOrder = -1
	att.Mult_SightTime = 0.5
	att.Mult_DrawTime = 0.6
	att.Mult_HolsterTime = 0.6
	att.Mult_Recoil = 2.5
	att.Mult_RecoilSide = 1.55
	att.Mult_SightedSpeedMult = 1.25
	att.Mult_SpeedMult = 1.1
	att.Mult_ShootSpeedMult = 1.15
	att.Add_BarrelLength = -9
	att.Mult_Sway = 3.5
	att.ActivateElements = {"stock_none"}
	att.GivesFlags = {"pistolgrip"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_aw_stock_ru.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_aw_stock_ru")

	att.PrintName = "RU556 Fixed-Adjustable Stock"
	att.AbbrevName = "Fixed-Adjustable Stock"
	att.Icon = Material("entities/att/ur_aw/stock_ru.png", "mips smooth")
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Magpul UBR GEN2 Stock"
	end
	att.Description = "Polymer stock designed for assault rifles. Unstable, but provides much-needed mobility."
	att.Slot = {"ur_aw_stock"}
	att.AutoStats = true
	att.SortOrder = 2.1
	att.Mult_SpeedMult = 1.08
	att.Mult_MoveDispersion = .6
	att.Mult_SightTime = .9
	att.Mult_Sway = 1.5
	att.Mult_RecoilSide = 1.5
	att.ActivateElements = {"stock_ru"}
	att.GivesFlags = {"pistolgrip"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_aw_stock_ru_rubber.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_aw_stock_ru_rubber")

	att.PrintName = "RU556 Fixed-Adjustable Stock (Rubberized)"
	att.AbbrevName = "Rubberized Carbine Stock"
	att.Icon = Material("entities/att/ur_aw/stock_rurubber.png", "mips smooth")
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Magpul UBR GEN2 Stock (Rubberized)"
	end
	att.Description = "Polymer stock designed for assault rifles. Rubber accents reduce the impact on aim sway, but weigh the stock down."
	att.Slot = {"ur_aw_stock"}
	att.AutoStats = true
	att.SortOrder = 2
	att.Mult_MoveDispersion = .6
	att.Mult_Sway = 1.25
	att.Mult_RecoilSide = 1.2
	att.ActivateElements = {"stock_ru_rubber"}
	att.GivesFlags = {"pistolgrip"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_deagle_barrel_annihilator.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_deagle_barrel_annihilator")

	att.PrintName = "6.75\" Desert Eagle Annihilator Barrel"
	att.AbbrevName = "6.75\" Annihilator Barrel"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "6.75\" Predator Annihilator Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ur_deagle_barrel_annihilator.png","smooth mips")
	att.Description = "Heavily modified barrel with gilded parts and an oversized integral muzzle brake. Effects are exacerbated, and the sheer volume of vented gas can get disorienting.\nMuzzle attachments will not work at all with this barrel."
	att.Slot = "ur_deagle_barrel"
	att.AutoStats = true
	att.Desc_Cons = {
	    "+150% Visual recoil",
	    "uc.nomuzzle"
	}
	att.SortOrder = 6
	att.Mult_Recoil = 0.8
	att.Mult_RecoilSide = 0.6
	att.Mult_VisualRecoilMult = 2.5
	att.Mult_ShootVol = 1.2
	att.Mult_Range = 0.8
	att.Mult_ShootPitch = 0.95
	att.Mult_SightedSpeedMult = 1.05
	att.Mult_AccuracyMOA = 1.15
	att.Mult_RPM = .8
	--att.ActivateElements = {"ur_deagle_barrel_annihilator"}
	att.GivesFlags = {"barrel_annihilator"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_deagle_barrel_compact.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_deagle_barrel_compact")

	att.PrintName = "5.5\" Desert Eagle Compact Barrel"
	att.AbbrevName = "5.5\" Compact Barrel"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "5.5\" Predator Compact Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ur_deagle_barrel_compact.png","smooth mips")
	att.Description = "Aftermarket reduced barrel that enhances concealability and ergonomics at the cost of ranged performance."
	att.Slot = "ur_deagle_barrel"
	att.AutoStats = true
	att.SortOrder = 5.5
	att.Mult_AccuracyMOA = 1.25
	att.Mult_Range = 0.9
	att.Mult_SightTime = 0.9
	att.Mult_Sway = 0.8
	att.Add_BarrelLength = -2
	att.Mult_HipDispersion = 0.95
	att.Mult_DrawTime = 0.9
	att.Mult_HolsterTime = 0.9
	att.ActivateElements = {"ur_deagle_barrel_compact"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_deagle_barrel_compen.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_deagle_barrel_compen")

	att.PrintName = "6\" Desert Eagle Compensated Barrel"
	att.AbbrevName = "6\" Compensated Barrel"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "6\" Predator Compensated Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ur_deagle_barrel_compensated.png","smooth mips")
	att.Description = "Barrel with an integral muzzle brake. Redirects propellant gases to stabilize the weapon's heavy recoil, but the reduced volume of gas directed to the bolt mechanism results in a lower cyclic rate.\nBecause gas is vented out of the sides of the barrel, external muzzle accessories cannot operate correctly."
	att.Slot = "ur_deagle_barrel"
	att.AutoStats = true
	att.Desc_Cons = {
	    "uc.nomuzzle"
	}
	att.SortOrder = 6
	att.Mult_Recoil = 0.85
	att.Mult_RecoilSide = 0.75
	--att.Mult_VisualRecoilMult = 1.5
	att.Mult_ShootVol = 1.1
	att.Mult_Range = 0.95
	att.Mult_ShootPitch = 0.95
	--att.Mult_SightedSpeedMult = .9
	att.Mult_RPM = .9
	--att.ActivateElements = {"ur_deagle_barrel_compen", "tac_rail"}
	att.GivesFlags = {"barrel_annihilator"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_deagle_barrel_ext.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_deagle_barrel_ext")

	att.PrintName = "7\" Desert Eagle Extended Barrel"
	att.AbbrevName = "7\" Extended Barrel"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "7\" Predator Extended Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ur_deagle_barrel_long.png","smooth mips")
	att.Description = "Slightly extended barrel that provides extra counterweight in addition to marginal ballistic enhancements."
	att.Slot = "ur_deagle_barrel"
	att.AutoStats = true
	att.SortOrder = 7
	att.Mult_AccuracyMOA = 0.8
	att.Mult_Range = 1.25
	att.Mult_Recoil = 0.9
	att.Mult_SightTime = 1.1
	att.Mult_Sway = 1.15
	att.Mult_HipDispersion = 1.1
	att.Add_BarrelLength = 4
	att.Mult_DrawTime = 1.25
	att.Mult_HolsterTime = 1.25
	att.ActivateElements = {"ur_deagle_barrel_ext"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_deagle_barrel_marksman.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_deagle_barrel_marksman")

	att.PrintName = "10\" Desert Eagle Marksman Barrel"
	att.AbbrevName = "10\" Marksman Barrel"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "10\" Predator Marksman Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ur_deagle_barrel_police.png","smooth mips")
	att.Description = "Elongated barrel for niche mid-range roles. Especially front-heavy."
	att.Slot = "ur_deagle_barrel"
	att.AutoStats = true
	att.SortOrder = 10
	att.Mult_AccuracyMOA = 0.5
	att.Mult_Range = 2
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.25
	att.Mult_Sway = 1.25
	att.Mult_ShootPitch = 0.9
	att.Mult_HipDispersion = 1.2
	att.Add_BarrelLength = 10
	att.Mult_DrawTime = 1.5
	att.Mult_HolsterTime = 1.5
	att.ActivateElements = {"ur_deagle_barrel_marksman"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_deagle_barrel_modern.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_deagle_barrel_modern")

	att.PrintName = "6\" Desert Eagle Mark XIX Barrel"
	att.AbbrevName = "6\" Modern Barrel"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "6\" Predator Modern Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ur_deagle_barrel_modern.png","smooth mips")
	att.Description = "Variation of the factory barrel with a built-in Weaver attachment mount."
	att.Slot = "ur_deagle_barrel"
	att.Desc_Neutrals = {"uc.cosmetic"}
	att.SortOrder = 5.5
	--att.ActivateElements = {"ur_deagle_barrel_modern", "tac_rail"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_deagle_caliber_357.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_deagle_caliber_357")

	att.PrintName = "Desert Eagle .357 Magnum Conversion"
	att.AbbrevName = ".357 Magnum"
	att.Icon = Material("entities/att/acwatt_ur_deagle_bullets_357mag.png","smooth mips")
	att.Description = "A more practical caliber with higher capacity magazines and actually manageable recoil, but not as much raw power."
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Predator .357 Magnum Conversion"
	end
	att.Hook_GetShootSound = function(wep, sound)
	    if wep:GetBuff_Override("Silencer") then
	        return "weapons/arccw_ur/deagle/fire_supp_10.ogg" -- Placeholder
	    else
	        return {"weapons/arccw_ur/deagle/fire_357_1.ogg", "weapons/arccw_ur/deagle/fire_357_2.ogg"} -- Not Placeholder
	    end
	end
	--[[att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then
	        return "weapons/arccw_ur/deagle/fire_dist_10.ogg" end
	end]]
	att.AutoStats = true
	att.Slot = "ur_deagle_caliber"
	att.Mult_ClipSize = 1.3
	att.Mult_Recoil = 0.7
	att.Mult_Damage = 0.72
	att.Mult_DamageMin = 0.72
	att.Mult_ShootSpeedMult = 1.2
	--att.Mult_RPM = 1.2
	att.Override_Trivia_Calibre = att.AbbrevName -- E F F I C I E N C Y
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/357sig.mdl"
	att.Override_ShellScale = 1
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_deagle_caliber_410.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_deagle_caliber_410")

	att.PrintName = "Desert Eagle .410 Bore Conversion"
	att.AbbrevName = ".410 Bore"
	att.Icon = Material("entities/att/acwatt_ur_deagle_bullets_410b.png","smooth mips")
	att.Description = "Hobbyist conversion that allows the weapon to accept .410 bore shotgun shells. Because the weapon was never meant to fire these, performance beyond point blank is poor."
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Predator .410 Bore Conversion"
	end
	-- Todo: alt shoot sound
	att.AutoStats = true
	att.Desc_Pros = {
	    "ur.deagle.410.1"
	}
	att.Desc_Cons = {
	    "ur.deagle.410.2"
	}
	att.Slot = "ur_deagle_caliber"
	att.SortOrder = -1
	att.Override_Num = 4
	att.Mult_Range = 0.5
	att.Override_AccuracyMOA = 35
	att.Override_AccuracyMOA_Priority = 0
	att.Mult_ClipSize = 1.15
	att.Mult_Recoil = 0.75
	att.Mult_Damage = 72 / 70
	att.Mult_DamageMin = 20 / 17
	att.Override_HullSize = 0.1
	att.Override_BodyDamageMults = ArcCW.UC.BodyDamageMults_Shotgun
	att.Override_Penetration = 1
	--att.Override_Malfunction = true
	--att.Mult_MalfunctionVariance = 1.5
	att.Override_IsShotgun = true
	att.Override_Ammo = "buckshot"
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/410bore.mdl"
	att.Override_ShellScale = 1
	att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable
	att.Override_Trivia_Class = "Shot Pistol"
	att.Override_Trivia_Calibre = att.AbbrevName -- E F F I C I E N C Y
	local slotinfo = {
	    [6] = {"8-Round Mag", "8-Round Mag", Material("entities/att/acwatt_ur_deagle_mag_7.png", "mips smooth")},
	    [9] = {"\"BUCK\" #000 Buckshot", "\"BUCK\" #000 Buckshot", Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")},
	}
	att.Hook_GetDefaultAttName = function(wep, slot)
	    if slotinfo[slot] then
	        return GetConVar("arccw_truenames"):GetBool() and slotinfo[slot][2] or slotinfo[slot][1]
	    end
	end
	att.Hook_GetDefaultAttIcon = function(wep, slot)
	    if slotinfo[slot] then
	        return slotinfo[slot][3]
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_deagle_caliber_44.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_deagle_caliber_44")

	att.PrintName = "Desert Eagle .44 Magnum Conversion"
	att.AbbrevName = ".44 Magnum"
	att.Icon = Material("entities/att/acwatt_ur_deagle_bullets_44mag.png","smooth mips")
	att.Description = "Smaller (comparatively speaking) caliber that retains most of .50 AE's iconic punch, but is small enough to fit an extra round in the magazine."
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Predator .44 Magnum Conversion"
	end
	-- Todo: alt shoot sound
	att.AutoStats = true
	att.Slot = "ur_deagle_caliber"
	att.Mult_ClipSize = 1.15
	att.Mult_Recoil = 0.85
	att.Mult_Damage = 0.86
	att.Mult_DamageMin = 0.86
	att.Mult_ShootSpeedMult = 1.1
	--att.Mult_RPM = 1.1
	att.Override_Trivia_Calibre = att.AbbrevName -- E F F I C I E N C Y
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/40sw.mdl"
	att.Override_ShellScale = 1
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_deagle_grip_rubber.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_deagle_grip_rubber")

	att.PrintName = "Desert Eagle Rubberized Grip"
	att.AbbrevName = "Rubberized Grip"
	att.Icon = Material("entities/att/acwatt_ur_deagle_grip_rubber.png","mips smooth")
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Predator Rubberized Grip"
	end
	att.Description = "Creates higher friction against the shooter's hands, dampening recoil slightly."
	att.Slot = "ur_deagle_grip"
	att.AutoStats = true
	att.Mult_Recoil = 0.9825
	att.Mult_RecoilSide = 0.9
	att.Mult_SightedSpeedMult = 0.95
	att.ActivateElements = {"ur_deagle_grip_rubber"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_deagle_grip_wood.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_deagle_grip_wood")

	att.PrintName = "Desert Eagle Wooden Grip"
	att.AbbrevName = "Wooden Grip"
	att.Icon = Material("entities/att/acwatt_ur_deagle_grip_plastic.png","smooth mips")
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Predator Wooden Grip"
	end
	att.Description = "Premium and hand-carved. Classy and smooth, but more difficult to grip."
	att.Slot = "ur_deagle_grip"
	att.AutoStats = true
	att.Mult_Recoil = 1.0125
	att.Mult_RecoilSide = 1.1
	att.Mult_SightTime = 0.975
	att.ActivateElements = {"ur_deagle_grip_wooden"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_deagle_mag_10.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_deagle_mag_10")

	att.PrintName = "Desert Eagle 10-Round Extended Magazine"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Predator 10-Round Extended Magazine"
	end
	att.AbbrevName = "10-Round Extended Mag"
	att.Icon = Material("entities/att/acwatt_ur_deagle_mag_10.png","mips smooth")
	att.Description = "A higher capacity magazine increases the time you can spend without reloading. However, the extra rounds add even more weight to an already unwieldy weapon."
	att.Slot = "ur_deagle_mag"
	att.AutoStats = true
	att.Override_ClipSize = 10
	att.Mult_SightTime = 1.1
	att.Mult_ReloadTime = 1.15
	att.Mult_Sway = 1.5
	att.Mult_SpeedMult = 0.98
	att.Mult_ShootSpeedMult = 0.95
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_10"
	end
	-- 10-round anims don't exist yet
	-- now exist
	att.ActivateElements = {"ur_deagle_mag_ext"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_deagle_skin_black.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_deagle_skin_black")

	att.PrintName = "Desert Eagle Matte Black Finish"
	att.AbbrevName = "Matte Black"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Predator Matte Black Finish"
	end
	att.Icon = Material("entities/att/acwatt_ur_deagle_finish_black.png","mips smooth")
	att.Description = "The finish of choice for assassins and agents everywhere.\n\n\"We're willing to wipe the slate clean, give you a fresh start. All that we're asking in return is your cooperation in bringing a known terrorist to justice.\""
	att.Slot = "ur_deagle_skin"
	att.Desc_Neutrals = {
	    "uc.cosmetic"
	}
	att.SortOrder = 2
	att.IgnorePickX = true
	att.ActivateElements = {"ur_deagle_skin_black"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_deagle_skin_chrome.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_deagle_skin_chrome")

	att.PrintName = "Desert Eagle Polished Chrome Finish"
	att.AbbrevName = "Polished Chrome"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Predator Polished Chrome Finish"
	end
	att.Icon = Material("entities/att/acwatt_ur_deagle_finish_chrome.png","mips smooth")
	att.Description = "A luster that demands attention.\n\n\"I had to kill Bob Morton because he made a mistake. Now it's time to erase that mistake.\""
	att.Slot = "ur_deagle_skin"
	att.Desc_Neutrals = {
	    "uc.cosmetic"
	}
	att.SortOrder = 2
	att.IgnorePickX = true
	att.ActivateElements = {"ur_deagle_skin_chrome"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_deagle_skin_gold.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_deagle_skin_gold")

	att.PrintName = "Desert Eagle Titanium Gold Finish"
	att.AbbrevName = "Titanium Gold"
	att.Icon = Material("entities/att/acwatt_ur_deagle_finish_gold.png","mips smooth")
	att.Description = "Look, you're already using a Desert Eagle, so we might as well gut whatever sense of style you have left."
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Predator Titanium Gold Finish"
	    att.Description = "Look, you're already using a Predator, so we might as well gut whatever sense of style you have left."
	end
	att.Description = att.Description .. "\n\n\"The time has come to show our true strength. They underestimate our resolve. Let us show that we do not fear them. As one people, we shall free our brethren from the yoke of foreign oppression!\""
	att.Slot = "ur_deagle_skin"
	att.Desc_Neutrals = {
	    "uc.cosmetic"
	}
	att.SortOrder = 1
	att.IgnorePickX = true
	att.ActivateElements = {"ur_deagle_skin_gold"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_deagle_tritium.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_deagle_tritium")

	att.PrintName = "Tritium Night Sights"
	att.AbbrevName = "Tritium Sights"
	att.Icon = nil --todo
	att.Description = "A set of luminescent iron sights for use in low-lit conditions."
	att.Slot = "ur_deagle_tritium"
	att.Desc_Neutrals = {
	    "uc.cosmetic"
	}
	att.SortOrder = 999
	att.ActivateElements = {"ur_deagle_tritium"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_mp5_barrel_kurz.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_mp5_barrel_kurz")

	att.PrintName = "4.5\" Kurz Barrel"
	att.Icon = Material("entities/att/acwatt_ur_mp5_barrel_kurz.png", "smooth mips")
	att.Description = "Machine pistol variant with a maximally compact barrel, a lightened bolt assembly for increased cyclic rate, and an integrated foregrip that reduces its impact on recoil control.\nMid-range accuracy is poor, and the lack of an outer barrel makes it unable to accept muzzle attachments."
	att.Desc_Cons = {
	    "uc.nomuzzle",
	    "uc.noubs"
	}
	att.AutoStats = true
	att.Slot = "ur_mp5_barrel"
	att.LHIK = true
	att.ModelOffset = Vector(25, 2.5, -4.7)
	att.Model = "models/weapons/arccw/atts/ur_kurzlhik.mdl" // stole this pose from the tall troy grip lol!!!
	att.SortOrder = 4.5
	att.Add_BarrelLength = -4
	att.Mult_Sway = .5
	att.Mult_SightTime = .75
	att.Mult_RPM = 1.125
	att.Mult_Recoil = 1.15
	att.Mult_AccuracyMOA = 3
	att.Mult_Range = .5
	att.GivesFlags = {"mp5_kurz"}
	att.Override_Trivia_Class = "Machine Pistol"
	att.Override_HoldtypeActive = "smg"
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_mp5_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_mp5_barrel_long")

	att.PrintName = "16\" Carbine Barrel"
	att.Icon = Material("entities/att/acwatt_ur_mp5_barrel_long.png", "smooth mips")
	att.Description = "Carbine-length barrel used on some civilian sporting variants of the weapon. Improves long range performance, but adds weight."
	att.AutoStats = true
	att.Slot = "ur_mp5_barrel"
	att.SortOrder = 13
	att.Mult_AccuracyMOA = 0.75
	att.Mult_Recoil = 0.85
	att.Mult_Range = 1.25
	att.Mult_SightTime = 1.25
	att.Mult_Sway = 1.5
	att.Add_BarrelLength = 7
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_mp5_barrel_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_mp5_barrel_sd")

	att.PrintName = "13\" Schalldämpfer Barrel"
	att.AbbrevName = "13\" SD Barrel"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Schalldämpfer Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ur_mp5_barrel_sd.png", "smooth mips")
	att.Description = "Large, specialized integral suppressor for the MP5.\nProjectiles are slowed to subsonic velocities, which results in an extremely quiet report but reduced effective range.\nOnly compatible with 9mm rounds."
	att.Desc_Pros = {
	    "pro.invistracers",
	    --"ur.mp5.sd"
	}
	att.Desc_Cons = {
	    "uc.nomuzzle"
	}
	att.AutoStats = true
	att.Slot = "ur_mp5_barrel"
	att.SortOrder = 13
	att.Silencer = true
	att.Mult_ShootVol = 0.5
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.Override_PhysTracerProfile = 7
	att.Override_TracerNum = 0
	att.Mult_SightTime = 1.1
	att.Mult_SightedSpeedMult = .75
	att.Mult_Sway = 1.25
	att.Mult_Range = .5
	att.Add_BarrelLength = 4
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSoundSilenced then
	        return false end
	end
	att.Mult_ShootPitch = 1.15
	att.ActivateElements = {"ur_mp5_barrel_sd"}
	att.GivesFlags = {"barrel_sd"}
	--att.ExcludeFlags = {"ur_mp5_cal_10mm","ur_mp5_cal_40sw"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_mp5_caliber_10auto.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_mp5_caliber_10auto")

	att.PrintName = "MP5/10 10mm Auto Conversion"
	att.AbbrevName = "10mm Auto Receiver"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "PK5/10 10mm Auto Conversion"
	end
	att.SortOrder = 80
	att.Icon = Material("entities/att/acwatt_ur_mp5_caliber.png", "smooth mips")
	att.Description = "The FBI's preferred caliber of choice.\nSignificantly more powerful, but weapon handling suffers."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ur_mp5_caliber"
	att.AutoStats = true
	att.Override_Trivia_Calibre = "10mm Auto"
	att.Mult_Damage = 1.15
	att.Mult_DamageMin = 1.15
	att.Mult_Recoil = 1.25
	att.Mult_RecoilSide = 1.25
	att.Mult_ReloadTime = 1.15
	att.Mult_MalfunctionMean = 0.75
	--att.Mult_ClipSize = 0.9
	att.Override_ShellScale = 1.1
	att.Hook_GetShootSound = function(wep, sound)
	    if wep:GetBuff_Override("Silencer") then
	        return "weapons/arccw_ud/glock/fire_supp_10.ogg" -- Placeholder
	    else
	        return "weapons/arccw_ud/glock/fire_10.ogg" -- Not Placeholder
	    end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then
	        return "weapons/arccw_ud/glock/fire_dist_10.ogg" end
	end
	att.GivesFlags = {"ur_mp5_cal_10mm"}
	--att.ExcludeFlags = {"barrel_sd"}
	att.ActivateElements = {"ur_mp5_mag_waffle"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_mp5_caliber_40sw.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_mp5_caliber_40sw")

	att.PrintName = "MP5/40 .40 Smith & Wesson Conversion"
	att.AbbrevName = ".40 S&W Receiver"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "PK5/40 .40 S&W Conversion"
	end
	att.SortOrder = 100
	att.Icon = Material("entities/att/acwatt_ur_mp5_caliber.png", "smooth mips")
	att.Description = "Law-enforcement caliber with a slightly larger bullet and shorter case.\nRetains damage over distance better than other calibers."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ur_mp5_caliber"
	att.AutoStats = true
	att.Override_Trivia_Calibre = ".40 Smith & Wesson"
	att.Mult_DamageMin = 1.35
	att.Mult_RangeMin = 0.75
	att.Mult_Recoil = 1.15
	--att.Mult_ClipSize = .9
	att.Override_ShellScale = 1.1
	att.Hook_GetShootSound = function(wep, sound)
	    if wep:GetBuff_Override("Silencer") then
	        return "weapons/arccw_ud/glock/fire_supp_40.ogg" -- Placeholder
	    else
	        return "weapons/arccw_ud/glock/fire_40.ogg" -- Not Placeholder
	    end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then
	        return "weapons/arccw_ud/glock/fire_dist_40.ogg" end
	end
	att.GivesFlags = {"ur_mp5_cal_40sw"}
	--att.ExcludeFlags = {"barrel_sd"}
	att.ActivateElements = {"ur_mp5_mag_waffle"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_mp5_caliber_noburst.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_mp5_caliber_noburst")

	att.PrintName = "MP5A3 SEF Receiver"
	att.AbbrevName = "SEF Receiver"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "PK5-3 SEF Receiver"
	end
	att.SortOrder = 201
	att.Icon = Material("entities/att/acwatt_ur_mp5_caliber.png", "smooth mips")
	att.Description = "Original receiver that lacks the Navy receiver's three-round burst fire mode. Its grooved grip is more comfortable to hold."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "ur.mp5.noburst"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ur_mp5_caliber"
	att.AutoStats = true
	att.Mult_SightTime = .95
	att.Override_Firemodes_Priority = 0.5
	att.Override_Firemodes = {
	    {
	        Mode = 2,
	    },
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}
	att.ActivateElements = {"receiver_lower"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_mp5_mag_15.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_mp5_mag_15")

	att.PrintName = "MP5 15-Round Flush Mag"
	att.AbbrevName = "15-Round Flush Mag"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "PK5 15-Round Flush Mag"
	end
	att.SortOrder = 20
	att.Icon = Material("entities/att/acwatt_ur_mp5_mag_15.png", "smooth mips")
	att.Description = "Low-capacity magazine. The lighter load makes the weapon even more ergonomic."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ur_mp5_mag"
	att.AutoStats = true
	att.Mult_SightTime = 0.9
	att.Mult_ReloadTime = 0.85
	att.Override_ClipSize = 15
	att.Mult_Sway = 0.75
	att.Mult_ShootSpeedMult = 1.1
	att.ActivateElements = {"ur_mp5_mag_15"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_15"
	end
	att.ExcludeFlags = {"ur_mp5_cal_10mm","ur_mp5_cal_40sw"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_mp5_mag_40.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_mp5_mag_40")

	att.PrintName = "MP5 40-Round Extended Mag"
	att.AbbrevName = "40-Round Extended Mag"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "PK5 40-Round Extended Mag"
	end
	att.SortOrder = 40
	att.Icon = Material("entities/att/acwatt_ur_mp5_mag_40.png", "smooth mips")
	att.Description = "Extended magazine for the MP5. It is only somewhat longer than the standard magazine, making it not that difficult to handle."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ur_mp5_mag"
	att.AutoStats = true
	att.Mult_SightTime = 1.08
	--att.Mult_Recoil = 0.9
	att.Mult_ReloadTime = 1.12
	--att.Mult_SpeedMult = 0.9
	att.Override_ClipSize = 40
	att.Mult_Sway = 1.15
	att.ActivateElements = {"ur_mp5_mag_40"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_40"
	end
	att.ExcludeFlags = {"ur_mp5_cal_10mm","ur_mp5_cal_40sw"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_mp5_mag_50.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_mp5_mag_50")

	att.PrintName = "MP5 50-Round Drum Magazine"
	att.AbbrevName = "50-Round Drum"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "K7 50-Round Drum"
	end
	att.SortOrder = 100
	att.Icon = Material("entities/att/acwatt_ur_mp5_mag_50.png", "smooth mips")
	att.Description = "Drum magazine for the MP5. Allows for a long period between reloads, but harms the weapon's ergonomics significantly. Prone to jamming."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.jam"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ur_mp5_mag"
	att.AutoStats = true
	att.Mult_SightTime = 1.5
	--att.Mult_Recoil = 0.9
	att.Mult_ReloadTime = 1.4
	att.Mult_SpeedMult = 0.9
	att.Mult_DrawTime = 1.25
	att.Override_ClipSize = 50
	att.Mult_Sway = 2
	att.Mult_ShootSpeedMult = 0.85
	att.ActivateElements = {"ur_mp5_50_mag"}
	--att.Override_Jamming = true
	att.Override_Malfunction = true
	att.Mult_MalfunctionMean = 0.75
	att.Mult_MalfunctionVariance = 1.5
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_50"
	end
	att.Ignore = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_mp5_stock_a2.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_mp5_stock_a2")

	att.PrintName = "MP5A2 Wooden Stock"
	att.AbbrevName = "Wooden Stock"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "K7 Wooden Stock"
	end
	att.Icon = Material("entities/att/acwatt_ur_mp5_stock_solid.png", "smooth mips")
	att.Description = "A solid, non-foldable stock made of wood. Its weight improves recoil control but harms handling."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {}
	att.Slot = "ur_mp5_stock"
	att.AutoStats = true
	att.SortOrder = 4
	att.Mult_Recoil = 0.75
	att.Mult_RecoilSide = 0.5
	att.Mult_VisualRecoilMult = 0.5
	att.Mult_Sway = 0.5
	att.Mult_SightTime = 1.25
	att.Mult_SightedSpeedMult = 0.9
	att.Mult_ShootSpeedMult = 0.9
	att.Mult_DrawTime = 1.25
	att.Mult_HolsterTime = 1.25
	att.ActivateElements = {"ur_mp5_stock_wood"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_mp5_stock_a3.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_mp5_stock_a3")

	att.PrintName = "MP5A3 Retractable Stock"
	att.AbbrevName = "Retractable Stock"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "K7-3 Retractable Stock"
	end
	att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
	att.Description = "Retractable skeletal stock, signficantly less massive than solid polymer. It can be collapsed to reduce profile even further at the cost of recoil.\n\nToggling the stock modifies performance accordingly."
	att.AutoStats = true
	att.Slot = "ur_mp5_stock"
	att.ToggleLockDefault = true
	att.ToggleSound = "arccw_uc/common/stockslide.ogg"
	att.Mult_SightTime = 0.75
	att.ToggleStats = {
	    {
	        PrintName = "Extended",
	        ActivateElements = {"stock_a3"},
	        AutoStats = true,
	        Mult_Recoil = 1.25,
	    },
	    {
	        PrintName = "Collapsed",
	        ActivateElements = {"stock_a3_folded"},
	        AutoStats = true,
	        Mult_HipDispersion = .8,
	        Mult_DrawTime = 0.85,
	        Mult_HolsterTime = 0.85,
	        Mult_ShootSpeedMult = 1.15,
	        Add_BarrelLength = -5,
	        Mult_Recoil = 2,
	        Mult_RecoilSide = 1.25,
	        Mult_Sway = 3,
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_mp5_stock_none.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_mp5_stock_none")

	att.PrintName = "MP5A1 Buttcap"
	att.AbbrevName = "Buttcap"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "PK5-1 Buttcap"
	end
	att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
	att.Description = "Remove your stock. Who needs it, anyway? Not you, that's for sure."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ur_mp5_stock"
	att.AutoStats = true
	att.Free = true
	att.SortOrder = -1
	att.Mult_Recoil = 2.15
	att.Mult_RecoilSide = 1.25
	att.Mult_Sway = 3
	att.Mult_SightTime = 0.65
	att.Mult_SpeedMult = 1.1
	att.Mult_SightedSpeedMult = 1.25
	att.Mult_ShootSpeedMult = 1.2
	att.Mult_DrawTime = 0.6
	att.Mult_HolsterTime = 0.6
	att.Add_BarrelLength = -6
	att.ActivateElements = {"ur_mp5_stock_remove"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_mp5_stock_pdw.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_mp5_stock_pdw")

	att.PrintName = "MP5K PDW Folding Stock"
	att.AbbrevName = "PDW Stock"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "PK5-PDW Folding Stock"
	end
	att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
	att.Description = "Light polymer \"personal defense weapon\" stock. Ideal for point shooting due to its conventional shape. It can be folded to reduce profile even further at the cost of recoil.\n\nToggling the stock modifies performance accordingly."
	att.AutoStats = true
	att.Slot = "ur_mp5_stock"
	att.ToggleLockDefault = true
	att.ToggleSound = "arccw_uc/common/stockslide.ogg"
	att.Mult_MoveDispersion = .85
	att.ToggleStats = {
	    {
	        PrintName = "Extended",
	        ActivateElements = {"stock_pdw"},
	        AutoStats = true,
	        Mult_Recoil = 1.2,
	        Mult_HipDispersion = .85
	    },
	    {
	        PrintName = "Folded",
	        ActivateElements = {"stock_pdw_folded"},
	        AutoStats = true,
	        Mult_HipDispersion = .75,
	        Mult_DrawTime = 0.85,
	        Mult_HolsterTime = 0.85,
	        Mult_ShootSpeedMult = 1.15,
	        Add_BarrelLength = -5,
	        Mult_Recoil = 2,
	        Mult_RecoilSide = 1.25,
	        Mult_Sway = 3,
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_mp5_ub_classic.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_mp5_ub_classic")

	att.PrintName = "Slim Handguard"
	att.Icon = Material("entities/att/acwatt_ur_mp5_barrel_classic.png", "smooth mips")
	att.Description = "Early rounded handguard, lighter than the current iteration but more difficult to brace."
	att.AutoStats = true
	att.Slot = "ur_mp5_hg"
	att.SortOrder = 999
	att.Mult_Sway = .75
	att.Mult_SightTime = .95
	att.Mult_Recoil = 1.15
	att.ActivateElements = {"ur_mp5_ub_classic"}
	att.ExcludeFlags = {"barrel_sd"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_mp5_ub_ris.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_mp5_ub_ris")

	att.PrintName = "RIS Handguard"
	att.Icon = Material("entities/att/acwatt_ur_mp5_barrel_ris.png", "smooth mips")
	att.Description = "Alternative handguard with a tacticool picatinny rail interface. Does not provide any tacticool benefits."
	att.Desc_Neutrals = {
	    "uc.cosmetic"
	}
	att.AutoStats = true
	att.Slot = "ur_mp5_hg"
	att.SortOrder = 998
	att.IgnorePickX = true
	att.ActivateElements = {"ur_mp5_rail_fg"}
	att.ExcludeFlags = {"barrel_sd"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_pm_variant_pmm.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_pm_variant_pmm")

	att.PrintName = "Modernized Makarov"
	att.Icon = Material("entities/att/ur_ak/barrel/aksu.png", "mips smooth")
	att.Description = "Modernized variant with many redesigned features, including a new extended magazine alongside more robust grip panels. Although this improves on the pistol's already great handling, reloading is somewhat hampered."
	att.Slot = {"ur_pm_variant"}
	att.AutoStats = true
	att.SortOrder = 2
	att.Override_ClipSize = 12
	att.Mult_ReloadTime = 1.05
	att.Mult_SightTime = 0.9
	att.ActivateElements = {"ur_pmm"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_spas12_ammo_sg_baton.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_spas12_ammo_sg_baton")

	att.PrintName = "\"BATON\" Flexible Baton"
	att.SortOrder = -1
	att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
	att.Description = [[Less-lethal law enforcement round that fires a cushioned, low-velocity "bean bag" filled with lead pellets.
	Designed to apprehend targets through pain instead of killing them, though the 40-gram projectile can still inflict deadly or permanent injuries.
	Only compatible with manual action shotguns due to a weak pressure curve.]]
	att.Desc_Pros = {
	    "Targets may drop their weapon",
	}
	att.Desc_Cons = {
	    "uc.alwaysphys",
	    "ur.spas12.pump",
	}
	att.Desc_Neutrals = {
	    "uc.oneprojectile"
	}
	att.Slot = {"ur_ammo_spas12"}
	att.AutoStats = true
	att.Override_Num = 1
	att.Override_Num_Priority = 2
	att.Mult_Recoil = .5
	local path = ")^arccw_uc/common/"
	att.Hook_PhysBulletHit = function(wep,data)
	    if CLIENT then return end
	    local tr = data.tr
	    local bullet = data.bullet
	    if tr.Entity and (tr.Entity:IsPlayer() or tr.Entity:IsNPC()) and tr.Entity:GetActiveWeapon() then
	        local delta = bullet.Travelled / (bullet.Range / ArcCW.HUToM)
	        delta = math.Clamp(delta, 0, 1)
	        local dmg = Lerp(delta, bullet.DamageMax, bullet.DamageMin) -- one day I will understand this math
	        local chance = math.random() * bullet.DamageMax
	        -- if tr.HitGroup == HITGROUP_LEFTARM or tr.HitGroup == HITGROUP_RIGHTARM then
	        --     chance = chance * 2
	        -- end
	        if chance <= dmg * .75 then -- Chance for a weapon drop increases the closer the shooter is to the target, but is never guaranteed
	            tr.Entity:DropWeapon()
	            if tr.Entity:IsPlayer() then
	                tr.Entity:ScreenFade(1,Color(128,0,0,64),.5,0)
	                tr.Entity:ViewPunch(Angle(3,0,0))
	            end
	        end
	    end
	end
	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "shotgun-lesslethal-01.ogg", path .. "shotgun-lesslethal-02.ogg"} end
	    --if fsound == wep.ShootSoundSilenced then return path .. "shotgun-lesslethal_sup.ogg" end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound or distantsound == wep.DistantShootSoundSilenced then return false 
	    end
	end
	att.Mult_Damage = .2
	att.Mult_DamageMin = .2
	att.Mult_Penetration = 0
	att.Mult_Range = .33
	att.Mult_RangeMin = .33
	att.Override_AlwaysPhysBullet = true
	--att.Override_PhysBulletMuzzleVelocity = 80
	att.Override_Firemodes = {
	    {
	        Mode = 1,
	        PrintName = "fcg.pump",
	        Override_ManualAction = true,
	        Mult_AccuracyMOA = 0.8,
	        Mult_HipDispersion = 0.8,
	    },
	    {
	        Mode = 0,
	    },
	}
	att.Override_Firemodes_Priority = 2
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_spas12_ammo_sg_drgn.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_spas12_ammo_sg_drgn")

	att.PrintName = "\"DRGN\" Dragon's Breath"
	att.SortOrder = -1
	att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
	att.Description = [[Novelty magnesium-based round that projects a spectacular jet of sparks and fire.
	Burning at over 3,000 °F, the blast isn't immediately lethal, but can easily set objects and people ablaze.
	Only compatible with manual action shotguns due to a weak pressure curve.]]
	att.Desc_Pros = {
	    "pro.ignite",
	    "uc.pellet.24"
	}
	att.Desc_Cons = {
	    "uc.dragon",
	    "uc.alwaysphys",
	    "ur.spas12.pump",
	}
	att.Desc_Neutrals = {
	}
	att.Slot = {"ur_ammo_spas12"}
	att.AutoStats = true
	--att.Override_DamageType = DMG_BURN
	att.Add_Num = 24    
	-- att.Hook_PostBulletHit = function(wep,data)
	--     if SERVER and data.tr.Entity then
	--         local delta = data.range / (wep.Range / ArcCW.HUToM)
	--         delta = math.Clamp(delta, 0, 1)
	--         local dur = Lerp(delta, 0, 6) -- one day I will understand this math
	--         if dur > 0 then
	--             data.tr.Entity:Extinguish() -- Entity:Ignite() doesn't work if it's already on fire, gotta prevent that DPS loss
	--             print(dur)
	--             data.tr.Entity:Ignite(dur)
	--         end
	--         local effect = EffectData()
	--         effect:SetOrigin(data.tr.HitPos)
	--         util.Effect("StunstickImpact",effect)
	--     end
	-- end
	att.Hook_PhysBulletHit = function(wep,data)
	    if SERVER and data.tr.Entity then
	        local dur = 6 - (data.bullet.Travelled * 2 * ArcCW.HUToM) / wep.Range
	        if dur > 0 then
	            data.tr.Entity:Extinguish() -- Entity:Ignite() doesn't work if it's already on fire, gotta prevent that DPS loss
	            data.tr.Entity:Ignite(dur)
	        end
	    end
	    local effect = EffectData()
	    effect:SetOrigin(data.tr.HitPos)
	    util.Effect("StunstickImpact",effect)
	    -- if data.tr.HitWorld and math.random(1,3) == 3 then
	    --     util.Decal("FadingScorch",data.tr.HitPos - data.tr.HitNormal,data.tr.HitPos + data.tr.HitNormal) -- this is too spammy
	    -- end
	end
	att.Mult_AccuracyMOA = 1.5
	att.Mult_Damage = .5
	att.Mult_DamageMin = .5
	att.Mult_Penetration = .5
	att.Mult_Range = .35
	att.Override_AlwaysPhysBullet = true
	att.Mult_PhysBulletGravity = 3
	--att.Override_PhysTracerProfile = 1
	att.Override_MuzzleEffect = "muzzleflash_dragonbreath"
	att.Hook_AddShootSound = function(wep, data)
	    wep:EmitSound("DB_ADD",data.volume,data.pitch,1,CHAN_WEAPON - 1) -- lua/arccw/shared/sh_0_uc.lua
	end
	att.Override_Firemodes = {
	    {
	        Mode = 1,
	        PrintName = "fcg.pump",
	        Override_ManualAction = true,
	        Mult_AccuracyMOA = 0.8,
	        Mult_HipDispersion = 0.8,
	    },
	    {
	        Mode = 0,
	    },
	}
	att.Override_Firemodes_Priority = 2
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_spas12_barrel_hl.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_spas12_barrel_hl")

	att.PrintName = "21.5\" Freeman Barrel"
	att.Icon = nil
	att.Description = [[Futuristic fire control group and barrel accomodation that supports a near-instant, gas-powered two-round burst, as well as slamfiring. However, the original dual-mode mechanism is replaced.
	The two-round burst can shred most targets, but depletes ammo quickly. The complicated mechanism also has a heavier pump.]]
	att.Desc_Pros = {
	    "uc.slam",
	    "ur.ak.burst",
	}
	att.Desc_Cons = {
	    "ur.spas12.pump"
	}
	att.SortOrder = 21.5
	att.Slot = "ur_spas12_barrel"
	att.AutoStats = true
	att.Override_Firemodes = {
	    {
	        Mode = 2,
	        PrintName = "fcg.slam",
	        Override_ManualAction = true,
	        Mult_AccuracyMOA = 0.8,
	        Mult_HipDispersion = 0.8,
	    },
	    {
	        Mode = 1,
	        PrintName = "ur.spas12.dbl",
	        Override_ManualAction = true,
	        Mult_AccuracyMOA = 1.15,
	        Mult_HipDispersion = 0.8,
	        Mult_Num = 2,
	        Override_AmmoPerShot = 2,
	        Mult_Damage = 2,
	        Mult_DamageMin = 2,
	        Mult_Recoil = 1.5,
	        CustomBars = "--___",
	        Mult_CycleTime = 1.13
	    },
	    {
	        Mode = 0,
	    },
	}
	att.Override_Firemodes_Priority = 1
	att.Hook_GetShootSound = function(wep,sound)
	    if wep:GetCurrentFiremode().Override_AmmoPerShot == 2 then
	        return "arccw_uc/common/gl_fire_buck.ogg"
	    end
	end
	att.Hook_GetDistantShootSound = function(wep,sound)
	    if wep:GetCurrentFiremode().Override_AmmoPerShot == 2 then
	        --return "arccw_uc/common/gl_fire_buck_dist.ogg"
	    end
	end
	-- Overwritten by weapon's hook
	--[[]
	att.Hook_SelectFireAnimation = function(wep,curanim)
	    if wep:GetCurrentFiremode().Override_AmmoPerShot == 2 then
	        return "fire_2bst"
	    end
	end
	]]
	att.Mult_CycleTime = 1.15
	att.Override_ActivePos = Vector(1.90, -1.50, -0.40) --Vector(1, -3, 0)
	att.Override_ActivePos_Priority = 10
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_spas12_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_spas12_barrel_short")

	att.PrintName = "18\" SPAS-12 Compact Barrel"
	att.AbbrevName = "18\" Compact Barrel"
	att.Icon = Material("entities/att/acwatt_ud_m1014_barrel_short.png", "smooth mips")
	att.Description = "Rare short barrel intended for breaching and close quarters use. Noticeably increases pellet spread, but is easier to manuver."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ur_spas12_barrel"
	att.SortOrder = 18
	att.AutoStats = true
	att.Mult_AccuracyMOA = 1.5
	att.Mult_Recoil = 1.1
	att.Mult_Range = 0.8
	att.Mult_Sway = 0.75
	att.Mult_SightTime = 0.75
	att.Mult_SpeedMult = 1.025
	att.Mult_ShootSpeedMult = 1.1
	att.Add_BarrelLength = -4
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_spas12_barrel_sport.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_spas12_barrel_sport")

	att.PrintName = "22.5\" SPAS-12 Competition Barrel"
	att.AbbrevName = "22.5\" Competition Barrel"
	att.Icon = Material("entities/att/acwatt_ud_m1014_barrel.png", "smooth mips")
	att.Description = "Aftermarket sporting barrel with a heavy muzzle brake. Abiding by competition restrictions, it has a reduced rate of fire."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.nomuzzle"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ur_spas12_barrel"
	att.SortOrder = 22.5
	att.AutoStats = true
	att.Add_BarrelLength = 1
	att.Mult_RecoilSide = 0.85
	att.Mult_Recoil = 0.8
	att.Mult_SightTime = 1.15
	att.Mult_Sway = 1.2
	att.Mult_AccuracyMOA = 0.9
	att.Mult_RangeMin = 2
	att.Mult_RPM = 180 / 220
	att.ActivateElements = {"ud_autoshotgun_barrel_sport"}
	att.GivesFlags = {"nomuzzle"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_spas12_charm_rail.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_spas12_charm_rail")

	att.PrintName = "Modern Rail Mount"
	--att.Icon = Material("entities/att/aksidemount.png", "smooth mips")
	att.Description = "As if this thing wasn't imposing enough."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {
	    "uc.cosmetic",
	}
	att.Slot = "ur_spas12_charm"
	att.ActivateElements = {"rail_modern"}
	att.SortOrder = 998
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_spas12_stock_full.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_spas12_stock_full")

	att.PrintName = "Sporting Stock"
	att.Icon = Material("entities/att/acwatt_ud_m1014_stock_in.png", "smooth mips")
	att.Description = "Solid, non-adjustable polymer stock designed specifically for the civilian market. Provides a better brace at the cost of combat mobility."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ur_spas12_stock"
	att.AutoStats = true
	att.Mult_Recoil = .8
	att.Mult_Sway = .8
	att.Mult_SightedSpeedMult = .85
	att.Mult_DrawTime = 1.25
	att.Mult_HolsterTime = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_spas12_stock_in.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_spas12_stock_in")

	att.PrintName = "Folded Stock"
	att.Icon = Material("entities/att/acwatt_ud_m1014_stock_in.png", "smooth mips")
	att.Description = [[Folding the stock makes the weapon significantly shorter, allowing for easier use around corners and making it easier on the move at the cost of less stability.
	Contrary to some depictions, the stock obstructs iron sights when folded.]]
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "ur.spas12.folded",
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ur_spas12_stock"
	att.AttachSound = "arccw_uc/common/stockslide.ogg"
	att.AutoStats = true
	att.Free = true
	att.IgnorePickX = true
	att.Mult_Recoil = 1.2
	att.Mult_RecoilSide = 1.5
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_ShootSpeedMult = 1.1
	att.Mult_SightTime = 0.5
	att.Mult_Sway = 2
	att.Add_BarrelLength = -12
	att.Override_IronSightStruct = {
	    Pos = Vector(-1 ,6.5, 0),
	     Ang = Angle(1, 0, -5),
	     Magnification = 1.075,
	     SwitchToSound = "",
	     CrosshairInSights = true,
	}
	att.Hook_TranslateAnimation = function(wep,anim)
	    if string.StartWith(anim,"sgreload") then
	        return anim .. "_fold"
	    end
	end
	att.Override_ActivePos = Vector(0.5, 5, 0)
	att.Override_HoldtypeActive = "shotgun"
	att.Override_HoldtypeSights = "ar2"
	att.A_Hook_Add_SightsDispersion = function(wep, data)
	    if data and !wep.Attachments[1].Installed then
	        data.add = data.add + 75
	    end
	end
	att.GivesFlags = {"spas12_foldstock"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_spas12_stock_none.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_spas12_stock_none")

	att.PrintName = "No Stock"
	att.Icon = Material("entities/att/acwatt_ud_m1014_stock_buffer.png", "smooth mips")
	att.Description = "A real theoretical physicist won't need this."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ur_spas12_stock"
	att.AutoStats = true
	att.Free = true
	att.SortOrder = -1
	att.Mult_SpeedMult = 1.05
	att.Mult_SightTime = 0.5
	att.Mult_DrawTime = 0.75
	att.Mult_HolsterTime = 0.75
	att.Mult_Recoil = 1.4
	att.Mult_RecoilSide = 2
	att.Mult_SightedSpeedMult = 1.2
	att.Mult_ShootSpeedMult = 1.15
	att.Add_BarrelLength = -12
	att.Mult_Sway = 3
	att.Override_ActivePos = Vector(0.5, 5, 0)
	att.Override_HoldtypeActive = "shotgun"
	att.Override_HoldtypeSights = "ar2"
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_spas12_tube_reduced.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_spas12_tube_reduced")

	att.PrintName = "Martello 12/70 6 Shell Tube"
	att.AbbrevName = "6 Shell Tube"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "SPAS-12 6 Shell Tube"
	end
	att.Icon = Material("entities/att/acwatt_ud_870_tube_reduced.png", "smooth mips")
	att.Description = "Shortened shell tube that holds fewer rounds, but reduces weapon weight."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {}
	att.Slot = "ur_spas12_tube"
	att.AutoStats = true
	att.Override_ClipSize = 6
	att.Mult_Sway = 0.75
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_SightTime = 0.85
	att.Mult_ReloadTime = 0.9
	att.ActivateElements = {"ud_870_tube_reduced"}
	ArcCW.LoadAttachmentType(att)
end

