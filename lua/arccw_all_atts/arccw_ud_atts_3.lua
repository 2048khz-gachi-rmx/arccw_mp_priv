local Material = ArcCW.AttachmentMat

------
-- ud_uzi_body_carbine.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_uzi_body_carbine")

	att.PrintName = "Uzi 13\" Carbine Barrel"
	att.AbbrevName = "13\" Carbine Barrel"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "STAP 13\" Carbine Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ud_uzi_body_carbine.png", "smooth mips")
	att.Description = "Long barrel for the Uzi, built for long range patrols. Improves range and recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_uzi_frame"
	att.AutoStats = true
	att.SortOrder = 13
	att.Mult_AccuracyMOA = 0.75
	att.Mult_SightTime = 1.15
	att.Mult_Recoil = 0.9
	att.Mult_RecoilSide = 0.75
	att.Mult_RPM = 0.9
	att.Mult_Range = 1.25
	att.Mult_Sway = 1.5
	att.Mult_TriggerDelayTime = 1.15
	att.Add_BarrelLength = 5
	att.ActivateElements = {"ud_uzi_body_carbine"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_uzi_body_civvy.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_uzi_body_civvy")

	att.PrintName = "Uzi 16\" Civilian Barrel"
	att.AbbrevName = "16\" Civilian Barrel"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "STAP 16\" Civilian Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ud_uzi_body_civvy.png", "smooth mips")
	att.Description = "Civilian barrel for the Uzi, elongated to fit minimum length requirements. Substantially improves range and recoil, at the cost of prohibiting fully-automatic fire. Changes weapon to closed bolt operation."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.semionly"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_uzi_frame"
	att.AutoStats = true
	att.SortOrder = 16
	att.Mult_AccuracyMOA = 0.5
	att.Mult_SightTime = 1.25
	att.Mult_Recoil = 0.75
	att.Mult_RecoilSide = 0.5
	att.Mult_RPM = 0.9
	att.Mult_Range = 1.5
	att.Mult_Sway = 2
	att.Mult_TriggerDelayTime = 0
	att.Override_ChamberSize = 1
	att.Override_Firemodes = {
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}
	att.Add_BarrelLength = 8
	att.ActivateElements = {"ud_uzi_body_civvy"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_uzi_body_micro.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_uzi_body_micro")

	att.PrintName = "Uzi 4.6\" Micro Barrel"
	att.AbbrevName = "4.6\" Micro Barrel"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "STAP 4.6\" Micro Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ud_uzi_body_micro.png", "smooth mips")
	att.Description = "Extremely compact frame that turns this sub-machine gun into a machine pistol. Without an attach point for stocks, recoil is dramatically increased. Converts weapon to closed bolt operation."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.nostocks",
	    "uc.noubs"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_uzi_frame"
	att.AutoStats = true
	att.SortOrder = 4.6
	att.Mult_AccuracyMOA = 1.75
	att.Mult_SightTime = 0.6
	att.Mult_Recoil = 1.5
	att.Mult_RecoilSide = 1.5
	att.Mult_RPM = 1.5
	att.Mult_Range = 0.5
	att.Mult_HipDispersion = 1.5
	att.Mult_DrawTime = 0.6
	att.Mult_HolsterTime = 0.6
	att.Add_BarrelLength = -8
	att.Override_ChamberSize = 1
	att.Mult_TriggerDelayTime = 0
	att.LHIK = true
	att.Override_HoldtypeActive = "pistol"
	att.Override_HoldtypeSights = "revolver"
	att.Override_Trivia_Class = "Machine Pistol"
	att.Override_Trivia_Mechanism = "Blowback"
	att.Model = "models/weapons/arccw/atts/mini_lhik.mdl"
	att.ActivateElements = {"ud_uzi_body_micro"}
	att.GivesFlags = {"micro"}
	att.Hook_TranslateAnimation = function(wep, anim)
	    return anim .. "_micro"
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_uzi_body_mini.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_uzi_body_mini")

	att.PrintName = "Uzi 8\" Mini Barrel"
	att.AbbrevName = "8\" Mini Barrel"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "STAP 8\" Mini Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ud_uzi_body_mini.png", "smooth mips")
	att.Description = "Compact frame with a higher firerate."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_uzi_frame"
	att.AutoStats = true
	att.SortOrder = 8
	att.Mult_AccuracyMOA = 1.25
	att.Mult_SightTime = 0.85
	att.Mult_Recoil = 1.25
	att.Mult_RecoilSide = 1.25
	att.Mult_RPM = 1.25
	att.Mult_Range = 0.75
	att.Mult_HipDispersion = 1.25
	att.Add_BarrelLength = -4
	att.Mult_TriggerDelayTime = 0.75
	att.LHIK = true
	att.Override_HoldtypeActive = "pistol"
	att.Override_HoldtypeSights = "revolver"
	att.Model = "models/weapons/arccw/atts/mini_lhik.mdl"
	att.ActivateElements = {"ud_uzi_body_mini"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_uzi_cal_22.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_uzi_cal_22")

	att.PrintName = "Uzi .22 LR Conversion"
	att.AbbrevName = ".22 LR"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "IAL-9 .22 LR Conversion"
	end
	att.Slot = "ud_uzi_caliber"
	att.Icon = Material("entities/att/acwatt_ud_glock_caliber.png", "smooth mips")
	att.Description = "A smaller cartridge that increases the fire rate and magazine capacity, as well as reduced recoil at the cost of greatly reduced damage and range. The subsonic rounds are very quiet when suppressed."
	att.Desc_Pros = {
	    "No distant firing sound when suppressed"
	}
	att.Override_Trivia_Calibre = ".22 Long Rifle"
	att.Override_Ammo = "plinking"
	att.AutoStats = true
	att.Mult_Damage = 12 / 30
	att.Mult_DamageMin = 7 / 17
	att.Mult_Penetration = 3 / 6
	att.Override_PhysBulletMuzzleVelocity = 370
	att.Mult_Recoil = 0.25
	att.Mult_VisualRecoilMult = 0.25
	att.Mult_RPM = 1.5
	att.Mult_ShootSpeedMult = 1.2
	att.Mult_ClipSize = 1.2
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
	att.Override_ShellScale = 1
	att.Override_ShellSounds = ArcCW.TinyShellSoundsTable
	att.Hook_GetShootSound = function(wep, sound)
	    if wep:GetBuff_Override("Silencer") then
	        return "weapons/arccw_ud/glock/fire_supp_22.ogg" -- Placeholder
	    else
	        return "weapons/arccw_ud/glock/fire_22.ogg" -- Placeholder
	    end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSoundSilenced then
	        return false
	    elseif distancesound == wep.DistantShootSound then
	        return "weapons/arccw_ud/glock/fire_dist_22.ogg"
	    end
	end
	att.GivesFlags = {"cal_subsonic"}
	att.ExcludeFlags = {"powder_subsonic"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_uzi_cal_45.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_uzi_cal_45")

	att.PrintName = "Uzi .45 ACP Conversion"
	att.AbbrevName = ".45 ACP"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "IAL-9 .45 ACP Conversion"
	end
	att.Slot = "ud_uzi_caliber"
	att.Icon = Material("entities/att/acwatt_ud_glock_caliber.png", "smooth mips")
	att.Description = "A large cartridge that increases close-range stopping power substantially, but greatly reduces magazine capacity. The subsonic rounds are very quiet when suppressed."
	att.Desc_Pros = {
	    "No distant firing sound when suppressed"
	}
	att.Override_Trivia_Calibre = ".45 ACP"
	att.AutoStats = true
	att.Mult_Damage = 45 / 30
	att.Mult_DamageMin = 15 / 17
	att.Mult_Penetration = 9 / 6
	att.Override_PhysBulletMuzzleVelocity = 320
	att.Mult_RangeMin = 0.5
	att.Mult_Range = .75
	att.Mult_Recoil = 1.5
	att.Mult_RecoilSide = 1.5
	att.Mult_RPM = 0.83
	att.Override_ClipSize = 16
	att.Hook_GetShootSound = function(wep, sound)
	    if wep:GetBuff_Override("Silencer") then
	        return "weapons/arccw_ud/glock/fire_supp_45.ogg" -- Placeholder
	    else
	        return "weapons/arccw_ud/glock/fire_45.ogg" -- Placeholder
	    end
	end
	att.Hook_GetDefaultAttName = function(wep, slot)
	    if slot == 8 then
	        return "16-Round Mag"
	    end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSoundSilenced then
	        return false
	    elseif distancesound == wep.DistantShootSound then
	        return "weapons/arccw_ud/glock/fire_dist_45.ogg"
	    end
	end
	att.GivesFlags = {"uzi_45","cal_subsonic"}
	att.ExcludeFlags = {"powder_subsonic"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_uzi_mag_100.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_uzi_mag_100")

	att.PrintName = "Uzi 100-Round C-Mag"
	att.AbbrevName = "100-Round C-Mag"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "STAP 100-Round C-Mag"
	end
	att.SortOrder = 100
	att.Icon = Material("entities/att/acwatt_ud_uzi_mag_100.png", "smooth mips")
	att.Description = "Twin-drum magazine for the Uzi. Allows for a long period between reloads, but harms the weapon's ergonomics significantly. Prone to jamming."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.jam"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_uzi_mag"
	att.AutoStats = true
	att.Mult_SightTime = 1.5
	--att.Mult_Recoil = 0.9
	att.Mult_ReloadTime = 1.4
	att.Mult_SpeedMult = 0.9
	att.Mult_DrawTime = 1.25
	att.Override_ClipSize = 100
	att.Mult_Sway = 2
	att.Mult_ShootSpeedMult = 0.85
	att.ActivateElements = {"ud_uzi_100_mag"}
	--att.Override_Jamming = true
	att.Override_Malfunction = true
	att.Mult_MalfunctionMean = 0.75
	att.Mult_MalfunctionVariance = 1.5
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_100"
	end
	att.ExcludeFlags = {"uzi_45","uzi_22"}
	att.HideIfBlocked = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_uzi_mag_20.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_uzi_mag_20")

	att.PrintName = "Uzi 20-Round Flush Mag"
	att.AbbrevName = "20-Round Flush Mag"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "IAL-9 20-Round Flush Mag"
	end
	att.SortOrder = 20
	att.Icon = Material("entities/att/acwatt_ud_uzi_mag_20.png", "smooth mips")
	att.Description = "Low-capacity flush magazine. The lighter load makes the weapon more ergonomic."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_uzi_mag"
	att.AutoStats = true
	att.Mult_SightTime = 0.9
	att.Mult_ReloadTime = 0.85
	att.Override_ClipSize = 20
	att.Mult_Sway = 0.75
	att.Mult_ShootSpeedMult = 1.1
	att.ActivateElements = {"ud_uzi_16_mag"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_16"
	end
	att.ExcludeFlags = {"uzi_45","uzi_22"}
	att.HideIfBlocked = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_uzi_mag_40.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_uzi_mag_40")

	att.PrintName = "Uzi 40-Round Extended Mag"
	att.AbbrevName = "40-Round Extended Mag"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "IAL-9 40-Round Extended Mag"
	end
	att.SortOrder = 40
	att.Icon = Material("entities/att/acwatt_ud_uzi_mag_40.png", "smooth mips")
	att.Description = "Extended magazine for the Uzi. It is only somewhat longer than the standard magazine, making it not that difficult to handle."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_uzi_mag"
	att.AutoStats = true
	att.Mult_SightTime = 1.08
	--att.Mult_Recoil = 0.9
	att.Mult_ReloadTime = 1.12
	--att.Mult_SpeedMult = 0.9
	att.Override_ClipSize = 40
	att.Mult_Sway = 1.15
	att.ActivateElements = {"ud_uzi_41_mag"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_41"
	end
	att.ExcludeFlags = {"uzi_45","uzi_22"}
	att.HideIfBlocked = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_uzi_mag_45_10.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_uzi_mag_45_10")

	att.PrintName = "Uzi 12-Round Flush Mag"
	att.AbbrevName = "12-Round Flush Mag"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "IAL-9 12-Round Flush Mag"
	end
	att.SortOrder = 20
	att.Icon = Material("entities/att/acwatt_ud_uzi_mag_20.png", "smooth mips")
	att.Description = "Low-capacity flush magazine. The lighter load makes the weapon more ergonomic."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_uzi_mag"
	att.AutoStats = true
	att.Mult_SightTime = 0.9
	att.Mult_ReloadTime = 0.85
	att.Override_ClipSize = 12
	att.Override_ClipSize_Priority = 2
	att.Mult_Sway = 0.75
	att.Mult_ShootSpeedMult = 1.1
	att.ActivateElements = {"ud_uzi_16_mag"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_16"
	end
	att.RequireFlags = {"uzi_45"}
	att.HideIfBlocked = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_uzi_mag_45_22.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_uzi_mag_45_22")

	att.PrintName = "Uzi 22-Round Extended Mag"
	att.AbbrevName = "22-Round Extended Mag"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "IAL-9 22-Round Extended Mag"
	end
	att.SortOrder = 40
	att.Icon = Material("entities/att/acwatt_ud_uzi_mag_40.png", "smooth mips")
	att.Description = "Extended magazine for the Uzi. It is only somewhat longer than the standard magazine, making it not that difficult to handle."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_uzi_mag"
	att.AutoStats = true
	att.Mult_SightTime = 1.08
	--att.Mult_Recoil = 0.9
	att.Mult_ReloadTime = 1.12
	--att.Mult_SpeedMult = 0.9
	att.Override_ClipSize = 22
	att.Override_ClipSize_Priority = 2
	att.Mult_Sway = 1.15
	att.ActivateElements = {"ud_uzi_41_mag"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_41"
	end
	att.RequireFlags = {"uzi_45"}
	att.HideIfBlocked = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_uzi_stock_folded.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_uzi_stock_folded")

	att.PrintName = "Folded Stock"
	att.Icon = Material("entities/att/acwatt_ud_uzi_stock_folded.png", "smooth mips")
	att.Description = "Tuck in the folding stock, making the weapon easier to manuver but less controllable."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_uzi_stock"
	att.AttachSound = "arccw_uc/common/stockslide.ogg"
	att.AutoStats = true
	att.Free = true
	att.IgnorePickX = true
	att.SortOrder = 2
	att.Mult_Recoil = 1.15
	att.Mult_RecoilSide = 1.25
	att.Mult_VisualRecoilMult = 2
	att.Mult_Sway = 1.5
	att.Mult_SightTime = 0.85
	att.Mult_SightedSpeedMult = 1.05
	att.Mult_ShootSpeedMult = 1.05
	att.Mult_DrawTime = 0.75
	att.Mult_HolsterTime = 0.75
	att.Add_BarrelLength = -2
	att.ActivateElements = {"ud_uzi_folded_stock"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_uzi_stock_polymer.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_uzi_stock_polymer")

	att.PrintName = "Uzi Polymer Stock"
	att.AbbrevName = "Polymer Stock"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "STAP Polymer Stock"
	end
	att.Icon = Material("entities/att/acwatt_ud_uzi_stock_solid.png", "smooth mips")
	att.Description = "A solid, non-foldable stock made of polymer. Provides decent recoil reduction and doesn't weigh as much as a full wooden stock."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {}
	att.Slot = "ud_uzi_stock"
	att.AutoStats = true
	att.SortOrder = 3
	att.Mult_Recoil = 0.85
	att.Mult_RecoilSide = 0.75
	att.Mult_VisualRecoilMult = 0.75
	att.Mult_Sway = 0.75
	att.Mult_SightTime = 1.15
	att.Mult_SightedSpeedMult = 0.95
	att.Mult_ShootSpeedMult = 0.95
	att.Mult_DrawTime = 1.25
	att.Mult_HolsterTime = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_uzi_stock_remove.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_uzi_stock_remove")

	att.PrintName = "No Stock"
	att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
	att.Description = "Remove your stock. Who needs it, anyway? Not you, that's for sure."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_uzi_stock"
	att.AutoStats = true
	att.Free = true
	att.SortOrder = 1
	att.Mult_Recoil = 1.25
	att.Mult_RecoilSide = 1.5
	att.Mult_VisualRecoilMult = 2
	att.Mult_Sway = 2
	att.Mult_SightTime = 0.75
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_ShootSpeedMult = 1.1
	att.Mult_DrawTime = 0.75
	att.Mult_HolsterTime = 0.75
	att.Add_BarrelLength = -2
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_uzi_stock_wood.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_uzi_stock_wood")

	att.PrintName = "Uzi Wooden Stock"
	att.AbbrevName = "Wooden Stock"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "STAP Wooden Stock"
	end
	att.Icon = Material("entities/att/acwatt_ud_uzi_stock_solid.png", "smooth mips")
	att.Description = "A solid, non-foldable stock made of wood. Old-fashioned and very sturdy, though less compact."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {}
	att.Slot = "ud_uzi_stock"
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
	ArcCW.LoadAttachmentType(att)
end

