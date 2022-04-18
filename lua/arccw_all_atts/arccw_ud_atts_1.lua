local Material = ArcCW.AttachmentMat

------
-- ud_870_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_870_barrel_long")

	att.PrintName = "Express-12 20\" Long Barrel"
	att.AbbrevName = "20\" Long Barrel"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Remington 870 20\" Long Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ud_870_barrel_long.png", "smooth mips")
	att.Description = "Extended barrel with ring sight. Reduces pellet spread and improves range."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_870_barrel"
	att.AutoStats = true
	att.Mult_AccuracyMOA = 0.8
	att.Mult_Recoil = 0.8
	att.Mult_Range = 1.2
	att.Mult_Sway = 1.5
	att.Mult_SightTime = 1.25
	att.Mult_SpeedMult = 0.95
	att.Add_BarrelLength = 4
	--att.Override_HoldtypeSights = "rpg"
	att.ActivateElements = {"ud_870_barrel_long"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_870_barrel_sawnoff.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_870_barrel_sawnoff")

	att.PrintName = "Express-12 10\" ACCWS Breacher Barrel"
	att.AbbrevName = "10\" Breacher Barrel"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Remington 870 MCS 10\" Breacher Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ud_870_barrel_sawnoff.png", "smooth mips")
	att.Description = "Hand-made short barrel with no sights. More agile and has a bigger pellet spread."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.nofs",
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_870_barrel"
	att.AutoStats = true
	att.SortOrder = -1
	att.Mult_AccuracyMOA = 1.5
	att.Mult_Recoil = 1.25
	att.Mult_Range = 0.8
	att.Mult_Sway = 0.5
	att.Mult_SightTime = 0.75
	att.Mult_SpeedMult = 1.05
	att.Add_BarrelLength = -4
	att.A_Hook_Add_SightsDispersion = function(wep, data)
	    if data and !wep.Attachments[1].Installed then
	        data.add = data.add + 250
	    end
	end
	att.ActivateElements = {"ud_870_barrel_sawnoff"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_870_slide_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_870_slide_long")

	att.PrintName = "Express-12 Long Forend"
	att.AbbrevName = "Long Forend"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Remington 870 Long Forend"
	end
	att.Icon = Material("entities/att/acwatt_ud_870_slide_long.png", "smooth mips")
	att.Description = "Long wood forend for the R870. Additional heft improves grip but is slower to cycle."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_870_slide"
	att.AutoStats = true
	--att.Mult_SightTime = 1.75
	--att.Mult_Recoil = 0.5
	--att.Mult_Sway = 3
	att.Mult_SightTime = 1.15
	att.Mult_Sway = 0.75
	att.Mult_Recoil = 0.9
	att.Mult_RecoilSide = 0.5
	att.Mult_CycleTime = 1.1
	att.ActivateElements = {"ud_870_slide_long"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_870_slide_moe.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_870_slide_moe")

	att.PrintName = "Express-12 MOE Forend"
	att.AbbrevName = "MOE Forend"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Remington 870 MOE Forend"
	end
	att.Icon = Material("entities/att/acwatt_ud_870_slide_moe.png", "smooth mips")
	att.Description = "A lightweight polymer forend. Easier to cycle but harder to grip on, increasing both fire rate and recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_870_slide"
	att.AutoStats = true
	-- att.Mult_SightTime = 0.75
	-- att.Mult_Recoil = 1.15
	-- att.Mult_Sway = 1.15
	att.Mult_SightTime = 0.85
	att.Mult_Sway = 1.25
	att.Mult_Recoil = 1.1
	att.Mult_RecoilSide = 1.5
	att.Mult_CycleTime = 0.9
	att.LHIK = true
	att.Model = "models/weapons/arccw/atts/moe_lhik.mdl"
	att.ActivateElements = {"ud_870_slide_moe"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_870_slide_poly.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_870_slide_poly")

	att.PrintName = "Express-12 Polymer Forend"
	att.AbbrevName = "Polymer Forend"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Remington 870 Polymer Forend"
	end
	att.Icon = Material("entities/att/acwatt_ud_870_slide_poly.png", "smooth mips")
	att.Description = "A hardened polymer forend, improving sighted mobility slightly."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_870_slide"
	att.AutoStats = true
	att.Mult_SightTime = 0.95
	att.Mult_SightedSpeedMult = 1.05
	att.Mult_RecoilSide = 1.15
	att.LHIK = true
	att.Model = "models/weapons/arccw/atts/poly_lhik.mdl"
	att.ActivateElements = {"ud_870_slide_poly"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_870_stock_poly.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_870_stock_poly")

	att.PrintName = "Express-12 Polymer Stock"
	att.AbbrevName = "Polymer Stock"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Remington 870 Polymer Stock"
	end
	att.Icon = Material("entities/att/acwatt_ud_870_stock.png", "smooth mips")
	att.Description = "Lightweight polymer stock."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_870_stock"
	att.AutoStats = true
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_SightTime = 0.9
	att.Mult_Recoil = 1.15
	att.ActivateElements = {"ud_870_stock_poly"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_870_stock_raptor.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_870_stock_raptor")

	att.PrintName = "Express-12 Raptor Grip"
	att.AbbrevName = "Raptor Grip"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName =  "Remington 870 Tac-14 Grip"
	    att.AbbrevName = "Tac-14 Grip"
	end
	att.Icon = Material("entities/att/acwatt_ud_870_stock_raptor.png", "smooth mips")
	att.Description = "Stockless polymer grip for when you simply don't care about accuracy or control, and just want the lightest gun possible."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_870_stock"
	att.AutoStats = true
	att.Mult_SpeedMult = 1.05
	att.Mult_SightTime = 0.6
	att.Mult_SightedSpeedMult = 1.2
	att.Mult_ShootSpeedMult = 1.1
	att.Mult_DrawTime = 0.6
	att.Mult_HolsterTime = 0.6
	att.Mult_Recoil = 1.75
	att.Mult_RecoilSide = 2
	att.Mult_VisualRecoilMult = 0.5
	att.Add_BarrelLength = -4
	att.Mult_Sway = 3
	att.ActivateElements = {"ud_870_stock_raptor"}
	att.Override_ActivePos = Vector(0.5, 5, 0.5)
	att.Override_HoldtypeActive = "shotgun"
	att.Override_HoldtypeSights = "ar2"
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_870_stock_sawnoff.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_870_stock_sawnoff")

	att.PrintName = "Express-12 Sawn-off Stock"
	att.AbbrevName = "Sawn-off Stock"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Remington 870 Sawn-off Stock"
	end
	att.Icon = Material("entities/att/acwatt_ud_870_stock_sawnoff.png", "smooth mips")
	att.Description = "Wooden stock with only a grip remaining. In case you want to roleplay as a bank robber."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_870_stock"
	att.AutoStats = true
	att.Mult_SpeedMult = 1.025
	att.Mult_SightTime = 0.75
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_ShootSpeedMult = 1.05
	att.Mult_DrawTime = 0.75
	att.Mult_HolsterTime = 0.75
	att.Mult_Recoil = 1.5
	att.Mult_RecoilSide = 2
	att.Mult_VisualRecoilMult = 0.5
	att.Add_BarrelLength = -4
	att.Mult_Sway = 3
	att.ActivateElements = {"ud_870_stock_sawnoff"}
	att.Override_ActivePos = Vector(0.5, 5, 0.5)
	att.Override_HoldtypeActive = "shotgun"
	att.Override_HoldtypeSights = "ar2"
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_870_tube_ext.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_870_tube_ext")

	att.PrintName = "Express-12 8 Shell Tube"
	att.AbbrevName = "8 Shell Tube"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Remington 870 8 Shell Tube"
	end
	att.Icon = Material("entities/att/acwatt_ud_870_tube_ext.png", "smooth mips")
	att.Description = "An extension of the default shell tube holds more rounds, but increases weapon weight."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {}
	att.Slot = "ud_870_tube"
	att.AutoStats = true
	att.Override_ClipSize = 8
	att.Mult_Sway = 1.5
	att.Mult_SightedSpeedMult = 0.8
	att.Mult_SightTime = 1.15
	att.Mult_ReloadTime = 1.1
	att.ActivateElements = {"ud_870_tube_ext"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_870_tube_reduced.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_870_tube_reduced")

	att.PrintName = "Express-12 4 Shell Tube"
	att.AbbrevName = "4 Shell Tube"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Remington 870 4 Shell Tube"
	end
	att.Icon = Material("entities/att/acwatt_ud_870_tube_reduced.png", "smooth mips")
	att.Description = "Shortened shell tube that holds fewer rounds, but reduces weapon weight."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {}
	att.Slot = "ud_870_tube"
	att.AutoStats = true
	att.Override_ClipSize = 4
	att.Mult_Sway = 0.75
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_SightTime = 0.85
	att.Mult_ReloadTime = 0.9
	att.ActivateElements = {"ud_870_tube_reduced"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_caliber_10auto.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_caliber_10auto")

	att.PrintName = "Glock 10mm Auto Conversion"
	att.AbbrevName = "10mm Auto"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "GEN3 10mm Auto Conversion"
	end
	att.SortOrder = 80
	att.Icon = Material("entities/att/acwatt_ud_glock_caliber.png", "smooth mips")
	att.Description = "The FBI's preferred caliber of choice.\nSignificantly more powerful, but weapon handling suffers."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_glock_caliber"
	att.AutoStats = true
	att.Override_Trivia_Calibre = "10mm Auto"
	att.Mult_Damage = 1.15
	att.Mult_DamageMin = 1.15
	att.Mult_Recoil = 1.25
	att.Mult_RecoilSide = 1.25
	att.Mult_ReloadTime = 1.15
	att.Mult_MalfunctionMean = 0.75
	att.Mult_ClipSize = 0.9
	att.Override_ShellScale = 1
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
	--[[
	att.Override_ClipSize = 15
	att.Override_ClipSize_Priority = -1
	local slotinfo = {
	    [7] = {"15-Round Mag", "15-Round Mag", nil},
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
	]]
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_caliber_22lr.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_caliber_22lr")

	att.PrintName = "Glock .22 LR Conversion"
	att.AbbrevName = ".22 LR"
	if not GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "GEN3 .22 LR Conversion"
	end
	att.SortOrder = 00
	att.Icon = Material("entities/att/acwatt_ud_glock_caliber.png", "smooth mips")
	att.Description = "A plinking cartridge that is easy to handle but not very lethal.\nIts form factor allows more rounds to be stuffed into magazines."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_glock_caliber"
	att.AutoStats = true
	att.Override_Trivia_Calibre = ".22 Long Rifle"
	att.Override_Ammo = "plinking"
	att.Mult_Damage = 0.4
	att.Mult_DamageMin = 0.4
	att.Mult_Recoil = 0.25
	att.Mult_VisualRecoilMult = 0.25
	att.Mult_RPM = 1.5
	att.Mult_Penetration = 0.1
	att.Mult_ShootSpeedMult = 1.2
	att.Mult_ClipSize = 1.2
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
	att.Override_ShellScale = 1
	att.Override_ShellSounds = ArcCW.TinyShellSoundsTable
	att.Hook_GetShootSound = function(wep, sound)
	    if wep:GetBuff_Override("Silencer") then
	        return "weapons/arccw_ud/glock/fire_supp_22.ogg" -- Not Placeholder
	    else
	        return "weapons/arccw_ud/glock/fire_22.ogg" -- Not Placeholder
	    end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then
	        return "weapons/arccw_ud/glock/fire_dist_22.ogg" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_caliber_357sig.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_caliber_357sig")

	att.PrintName = "Glock .357 SIG Conversion"
	att.AbbrevName = ".357 SIG"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "GEN3 .357 SIG Conversion"
	end
	att.SortOrder = 90
	att.Icon = Material("entities/att/acwatt_ud_glock_caliber.png", "smooth mips")
	att.Description = "A law-enforcement caliber well-known for its accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_glock_caliber"
	att.AutoStats = true
	att.Override_Trivia_Calibre = ".357 SIG"
	att.Mult_Damage = 1.1
	att.Mult_AccuracyMOA = 0.5
	att.Mult_Recoil = 1.15
	att.Mult_ClipSize = 0.9
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/357sig.mdl"
	att.Override_ShellScale = 1
	att.Hook_GetShootSound = function(wep, sound)
	    if wep:GetBuff_Override("Silencer") then
	        return "weapons/arccw_ud/glock/fire_supp_357.ogg"
	    else
	        return "weapons/arccw_ud/glock/fire_357.ogg"
	    end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then
	        return "weapons/arccw_ud/glock/fire_dist_357.ogg" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_caliber_380acp.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_caliber_380acp")

	att.PrintName = "Glock .380 ACP Conversion"
	att.AbbrevName = ".380 ACP"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "GEN3 .380 ACP Conversion"
	end
	att.SortOrder = 50
	att.Icon = Material("entities/att/acwatt_ud_glock_caliber.png", "smooth mips")
	att.Description = "An old and smaller pistol caliber that is somewhat obsolete.\nHas lower recoil but also lower range and weaker stopping power."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_glock_caliber"
	att.AutoStats = true
	att.Override_Trivia_Calibre = ".380 ACP"
	att.Mult_Range = 0.75
	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 0.9
	att.Mult_Recoil = 0.65
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/357sig.mdl"
	att.Override_ShellScale = 1
	att.Hook_GetShootSound = function(wep, sound)
	    if wep:GetBuff_Override("Silencer") then
	        return "weapons/arccw_ud/glock/fire_supp_380.ogg"
	    else
	        return "weapons/arccw_ud/glock/fire_380.ogg"
	    end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then
	        return "weapons/arccw_ud/glock/fire_dist_380.ogg" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_caliber_40sw.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_caliber_40sw")

	att.PrintName = "Glock .40 S&W Conversion"
	att.AbbrevName = ".40 S&W"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "GEN3 .40 S&W Conversion"
	end
	att.SortOrder = 100
	att.Icon = Material("entities/att/acwatt_ud_glock_caliber.png", "smooth mips")
	att.Description = "Law-enforcement caliber with a slightly larger bullet and shorter case.\nRetains damage over distance better than other calibers."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_glock_caliber"
	att.AutoStats = true
	att.Override_Trivia_Calibre = ".40 S&W"
	att.Mult_DamageMin = 1.35
	att.Mult_RangeMin = 0.75
	att.Mult_Recoil = 1.15
	att.Mult_ClipSize = .9
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/40sw.mdl"
	att.Override_ShellScale = 1
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
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_caliber_45acp.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_caliber_45acp")

	att.PrintName = "Glock .45 ACP Conversion"
	att.AbbrevName = ".45 ACP"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "GEN3 .45 ACP Conversion"
	end
	att.SortOrder = 70
	att.Icon = Material("entities/att/acwatt_ud_glock_caliber.png", "smooth mips")
	att.Description = "A venerable caliber with excellent close-range stopping power.\nBecause of the large bullet diameter, magazine capacity is significantly reduced."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_glock_caliber"
	att.AutoStats = true
	att.Override_Trivia_Calibre = ".45 ACP"
	att.Mult_Damage = 1.25
	att.Mult_RangeMin = 0.5
	att.Mult_Recoil = 1.5
	att.Mult_RecoilSide = 1.5
	att.Mult_MalfunctionMean = 0.75
	att.Mult_ClipSize = 0.76
	att.Hook_GetShootSound = function(wep, sound)
	    if wep:GetBuff_Override("Silencer") then
	        return "weapons/arccw_ud/glock/fire_supp_45.ogg" -- Placeholder
	    else
	        return "weapons/arccw_ud/glock/fire_45.ogg" -- Not Placeholder
	    end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then
	        return "weapons/arccw_ud/glock/fire_dist_45.ogg" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_frame_flared.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_frame_flared")

	att.PrintName = "GEN3 Flared Frame"
	att.AbbrevName = "Flared Magwell"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Glock 17 Flared Frame"
	end
	att.Icon = Material("entities/att/acwatt_ud_glock_frame_flared.png", "smooth mips")
	att.Description = "Custom frame with a flared magwell to facilitate faster reloads. The extra weight slows down handling by a bit."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_glock_frame"
	att.AutoStats = true
	att.Mult_ReloadTime = 0.9
	att.Mult_SightTime = 1.1
	att.Mult_SightedSpeedMult = 0.95
	att.Mult_DrawTime = 1.25
	att.Mult_HolsterTime = 1.25
	att.ActivateElements = {"ud_glock_frame_flared"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_frame_subcompact.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_frame_subcompact")

	att.PrintName = "GEN3K Subcompact Frame"
	att.AbbrevName = "Subcompact Frame"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Glock 26 Subcompact Frame"
	end
	att.Icon = Material("entities/att/acwatt_ud_glock_frame_subcompact.png", "smooth mips")
	att.Description = "A smaller frame that is noticably shorter on the magwell.\nFast to handle, but the smaller grip surface affects recoil control."
	att.Desc_Pros = {
	    "ud.glock.subcompact"
	}
	att.Desc_Cons = {
	    "uc.nostocks"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_glock_frame"
	att.AutoStats = true
	att.Mult_DrawTime = 0.75
	att.Mult_HolsterTime = 0.75
	att.Mult_Recoil = 1.15
	att.Mult_SightedSpeedMult = 1.05
	att.Mult_SightTime = 0.8
	att.ActivateElements = {"ud_glock_frame_subcompact"}
	att.GivesFlags = {"ud_glock_frame_subcompact"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_mag_10.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_mag_10")

	att.PrintName = "Glock 10-Round Compact Mag"
	att.AbbrevName = "10-Round Compact Mag"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "GEN3 10-Round Compact Mag"
	end
	att.SortOrder = 10
	att.Icon = Material("entities/att/acwatt_ud_glock_mag_10.png", "smooth mips")
	att.Description = "Low-capacity magazine for the Glock, mostly used on subcompact variants like the Glock 26. The lighter load makes the weapon even more ergonomic."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {}
	att.Slot = "ud_glock_mag"
	att.AutoStats = true
	att.Mult_SightTime = 0.9
	att.Mult_ReloadTime = 0.9
	att.Override_ClipSize = 10
	att.Mult_SpeedMult = 1.05
	att.Mult_Sway = 0.5
	att.ActivateElements = {"ud_glock_10_mag"}
	att.RequireFlags = {"ud_glock_frame_subcompact"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_10"
	end
	att.Hook_TranslateAnimation = function(wep, anim)
	    if (anim == "fix") then
	        return anim .. "_10"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_mag_100.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_mag_100")

	att.PrintName = "Glock 100-Round C-Mag"
	att.AbbrevName = "100-Round C-Mag"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "GEN3 100-Round C-Mag"
	end
	att.SortOrder = 100
	att.Icon = Material("entities/att/acwatt_ud_glock_mag_100.png", "smooth mips")
	att.Description = "Twin-drum magazine ideal for suppressive fire (a nicer way to say \"mag dump\"). Bulky construction and high ammo capacity substantially increases weight and shifts the weapon's center of balance. Prone to jamming."
	att.Desc_Pros = {}
	att.Desc_Cons = {
	    "uc.jam"
	}
	att.Desc_Neutrals = {}
	att.Slot = "ud_glock_mag"
	att.AutoStats = true
	att.Mult_SpeedMult = 0.95
	att.Mult_SightTime = 1.2
	att.Mult_ReloadTime = 1.5
	att.Override_ClipSize = 100
	att.Mult_HipDispersion = 1.5
	att.Mult_Sway = 3
	att.Mult_ShootSpeedMult = 0.9
	att.Override_Malfunction = true
	att.Mult_MalfunctionMean = 0.75
	att.Mult_MalfunctionVariance = 1.5
	att.ActivateElements = {"ud_glock_100_mag"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_100"
	end
	att.Hook_TranslateAnimation = function(wep, anim)
	    if (anim == "fix") then
	        return anim .. "_100"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_mag_33.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_mag_33")

	att.PrintName = "Glock 33-Round Extended Mag"
	att.AbbrevName = "33-Round Extended Mag"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "GEN3 33-Round Extended Mag"
	end
	att.SortOrder = 33
	att.Icon = Material("entities/att/acwatt_ud_glock_mag_33.png", "smooth mips")
	att.Description = "Extended stick magazine. Heavier and throws off weapon balance, but does allow you to fire for longer."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {}
	att.Slot = "ud_glock_mag"
	att.AutoStats = true
	att.Mult_SightTime = 1.1
	att.Mult_ReloadTime = 1.15
	att.Override_ClipSize = 33
	att.Mult_HipDispersion = 1.25
	att.Mult_Sway = 1.5
	att.Mult_ShootSpeedMult = 0.95
	att.ActivateElements = {"ud_glock_33_mag"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_33"
	end
	att.Hook_TranslateAnimation = function(wep, anim)
	    if (anim == "fix") then
	        return anim .. "_33"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_skin_olive.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_skin_olive")

	att.PrintName = "Olive Drab"
	att.Icon = Material("entities/att/acwatt_ud_glock_material.png", "smooth mips")
	att.Description = "Olive drab finish for for your polymer handgun."
	att.Desc_Neutrals = {"uc.cosmetic"}
	att.Slot = "ud_glock_skin"
	att.Free = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_skin_tan.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_skin_tan")

	att.PrintName = "FDE Polymer"
	att.Icon = Material("entities/att/acwatt_ud_glock_material.png", "smooth mips")
	att.Description = "Flat dark earth finish for your polymer handgun."
	att.Desc_Neutrals = {"uc.cosmetic"}
	att.Slot = "ud_glock_skin"
	att.Free = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_slide_auto.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_slide_auto")

	att.PrintName = "GEN3 Auto Slide"
	att.AbbrevName = "Auto Slide"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Glock 18C Auto Slide"
	end
	att.Icon = Material("entities/att/acwatt_ud_glock_slide_auto.png", "smooth mips")
	att.Description = "An automatic slide capable of a very high rate of fire. Compensator cuts at the top improve recoil control, although that does not change the fact that this is a hell of a bullet nozzle."
	att.Desc_Pros = {
	    "uc.auto",
	}
	att.Desc_Cons = {
	    "uc.jam"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_glock_slide"
	att.AutoStats = true
	att.Override_Trivia_Class = "Machine Pistol"
	--att.Mult_SightTime = 1
	--att.Mult_Recoil = 1
	--att.Mult_SpeedMult = 1
	att.Mult_MoveDispersion = 1.5
	att.Mult_HipDispersion = 1.25
	att.Mult_Recoil = 0.95
	att.Mult_RPM = 2.38
	att.Mult_ShootSpeedMult = 0.85
	att.Override_Malfunction = true
	att.Override_Firemodes = {
	    {
	        Mode = 2,
	    },
	    {
	        Mode = 1,
	    },
	    {
	        PrintName = "fcg.safe2",
	        Mode = 0,
	    }
	}
	-- att.Hook_TranslateAnimation = function(wep, anim)
	--     if (anim == "fire" || anim == "fire_empty") then
	--         return anim .. "_18"
	--     end
	-- end
	att.ActivateElements = {"ud_glock_slide_auto"}
	att.GivesFlags = {"ud_glock_auto"}
	att.ExcludeFlags = {"ud_glock_not_9mil"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_slide_carbine.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_slide_carbine")

	att.PrintName = "GEN3 Carbine Slide"
	att.AbbrevName = "Carbine Slide"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Glock 17 Euro Carbine Slide"
	end
	att.Icon = Material("entities/att/acwatt_ud_glock_slide_carbine.png", "smooth mips")
	att.Description = "Extraordinarily long extended barrel. Designed for use in countries where handguns are banned, in order to fulfil minimum length requirements."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_glock_slide"
	att.AutoStats = true
	att.Mult_SightTime = 1.75
	att.Mult_Recoil = 0.5
	att.Mult_AccuracyMOA = 0.25
	att.Mult_Sway = 2
	att.Mult_Range = 3
	att.Mult_DrawTime = 1.5
	att.Mult_HolsterTime = 1.5
	att.Add_BarrelLength = 32
	att.ActivateElements = {"ud_glock_slide_carbine"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_slide_comp.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_slide_comp")

	att.PrintName = "GEN3 Competition Slide"
	att.AbbrevName = "Competition Slide"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Glock 17 Competition Slide"
	end
	att.Icon = Material("entities/att/acwatt_ud_glock_slide_comp.png", "smooth mips")
	att.Description = "Custom slide with side vents and ring sight. Improves sighting time and straightens recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_glock_slide"
	att.AutoStats = true
	att.Mult_SightTime = 0.8
	att.Mult_RecoilSide = 0.75
	att.Mult_Recoil = 1.1
	att.ActivateElements = {"ud_glock_slide_comp"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_slide_cs.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_slide_cs")

	att.PrintName = "GEN3 Op. CS Slide"
	att.AbbrevName = "Op. CS Slide"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "G18C Op. CS Slide"
	end
	att.Icon = Material("entities/att/acwatt_ud_glock_slide_cs.png", "smooth mips")
	att.Description = "Custom-made 3 round burst slide, used by various counter-terrorism units and 'agents' around the world. The standard-length magazines are also tweaked for increased capacity."
	att.Desc_Pros = {
	    "uc.3burst",
	    "ud.glock.cs",
	}
	att.Desc_Cons = {
	    "uc.jam"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_glock_slide"
	att.AutoStats = true
	att.Mult_HipDispersion = 1.15
	att.Mult_ShootSpeedMult = 0.9
	att.Override_Malfunction = true
	att.Override_Firemodes = {
	    {
	        Mode = -3,
	        Mult_RPM = 3,
	        PostBurstDelay = 0.2,
	        RunawayBurst = true,
	        Override_ShotRecoilTable = {
	            [1] = 0.85,
	            [2] = 0.7,
	            [3] = 0.5,
	        },
	    },
	    {
	        Mode = 1,
	    },
	    {
	        PrintName = "fcg.safe2",
	        Mode = 0,
	    }
	}
	-- att.Hook_TranslateAnimation = function(wep, anim)
	--     if (anim == "fire" || anim == "fire_empty") then
	--         return anim .. "_18"
	--     end
	-- end
	--[[]
	function att.Hook_GetCapacity(wep,cap)
	    if not wep.Attachments[6].Installed then
	        return cap + 3
	    end
	end
	]]
	att.A_Hook_Add_ClipSize = function(wep, data)
	    if not wep.Attachments[8].Installed then
	        data.add = (data.add or 0) + 3
	    end
	end
	att.Hook_GetDefaultAttName = function(wep, slot)
	    if slot == 8 then
	        return "20-Round Mag"
	    end
	end
	att.ActivateElements = {"ud_glock_slide_cs"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_slide_lb.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_slide_lb")

	att.PrintName = "GEN3L Long Slide"
	att.AbbrevName = "Long Slide"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Glock 17L Long Slide"
	end
	att.Icon = Material("entities/att/acwatt_ud_glock_slide_lb.png", "smooth mips")
	att.Description = "A somewhat uncommon long polymer slide.\nThe longer barrel improves precision but is awkward to handle."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_glock_slide"
	att.AutoStats = true
	att.Mult_DrawTime = 1.15
	att.Mult_HolsterTime = 1.15
	att.Add_BarrelLength = 4
	att.Mult_Sway = 1.25
	att.Mult_HipDispersion = 1.15
	att.Mult_SightTime = 1.1
	att.Mult_AccuracyMOA = 0.85
	att.Mult_Recoil = 0.85
	att.Mult_Range = 1.25
	att.ActivateElements = {"ud_glock_slide_lb"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_slide_nytesyte.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_slide_nytesyte")

	att.PrintName = "GEN3 Homeboy Slide"
	att.AbbrevName = "Homeboy Slide"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "G17 NyteSite Slide"
	end
	att.Icon = Material("entities/att/acwatt_ud_glock_slide_nytesyte.png", "smooth mips")
	att.Description = "Be the first in the hood to have the HoMeBoY brand Night Sights installed on your New-Model Glock!"
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_glock_slide"
	att.AutoStats = true
	att.Mult_SightTime = 1.25
	att.Mult_HipDispersion = 0.9
	att.ActivateElements = {"ud_glock_slide_nytesyte"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_slide_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_slide_sd")

	att.PrintName = "GEN3 Silent Mistress Slide"
	att.AbbrevName = "SD Slide"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "G17SD Hush Puppy Slide"
	end
	att.Icon = Material("entities/att/acwatt_ud_glock_slide_sd.png", "smooth mips")
	att.Description = "A slide with an integrated silencer installed. A slide lock system can prevent the weapon from cycling when fired, reducing its audible report even further."
	att.Desc_Pros = {
	    "uc.invistracer"
	}
	att.Desc_Cons = {
	    --"uc.manual",
	    "uc.nomuzzle"
	}
	att.Desc_Neutrals = {
	    "ud.hushpuppy"
	}
	att.Slot = "ud_glock_slide"
	att.AutoStats = true
	att.Mult_SightTime = 1.15
	att.Mult_Recoil = 0.85
	att.Mult_AccuracyMOA = 0.75
	att.Mult_Sway = 1.5
	att.Mult_Range = 1.25
	att.Mult_ShootVol = 0.65
	att.Mult_ShootPitch = 1.25
	att.Mult_RPM = 0.45
	--att.Override_ManualAction = true
	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.Add_BarrelLength = 8
	att.ActivateElements = {"ud_glock_slide_sd"}
	att.GivesFlags = {"sd"}
	att.Override_Firemodes_Priority = 10
	att.Override_Firemodes = {
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 1,
	        PrintName = "fcg.slidelock",
	        Override_ManualAction = true,
	        Mult_ShootVol = 0.8,
	        Mult_AccuracyMOA = 0.75
	    },
	    {
	        PrintName = "fcg.safe2",
	        Mode = 0,
	    }
	}
	att.Override_TracerNum = 0
	att.Override_PhysTracerProfile = 0
	att.Hook_TranslateAnimation = function(wep, anim)
	    if not wep:GetBuff_Override("Override_ManualAction") then return end
	    if (anim == "fire" || anim == "fire_empty") then
	        return "fire_cycle"
	    elseif (anim == "idle" || anim == "idle_empty") then
	        if wep:GetNeedCycle() then
	            return "idle"
	        end
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_glock_slide_subcompact.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_glock_slide_subcompact")

	att.PrintName = "GEN3K Subcompact Slide"
	att.AbbrevName = "Subcompact Slide"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Glock 26 Subcompact Slide"
	end
	att.Icon = Material("entities/att/acwatt_ud_glock_slide_subcompact.png", "smooth mips")
	att.Description = "Shortest available slide, popular for concealed carry.\nReduced length means less holster to clear and improved handling, but more muzzle rise and terrible effective range."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.noubs"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_glock_slide"
	att.AutoStats = true
	att.Mult_DrawTime = 0.85
	att.Mult_HolsterTime = 0.85
	att.Add_BarrelLength = -4
	att.Mult_Sway = 0.75
	att.Mult_HipDispersion = 0.85
	att.Mult_SightTime = 0.85
	att.Mult_AccuracyMOA = 1.5
	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.ActivateElements = {"ud_glock_slide_subompact"}
	att.GivesFlags = {"ud_glock_slide_subcompact"}
	att.RequireFlags = {"ud_glock_frame_subcompact"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m1014_barrel_sawn.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m1014_barrel_sawn")

	att.PrintName = "12\" M4 Super 90 Sawn-Off Barrel"
	att.AbbrevName = "12\" Sawn-Off Barrel"
	att.Icon = Material("entities/att/acwatt_ud_m1014_barrel_short.png", "smooth mips")
	att.Description = "Homemade short barrel with a very large spread and cannot use muzzle attachments. Marginally increases rate of fire."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.nofs",
	    "uc.nomuzzle"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_1014_barrel"
	att.AutoStats = true
	att.Mult_AccuracyMOA = 2
	att.Mult_Recoil = 1.25
	att.Mult_Range = 0.5
	att.Mult_Sway = 0.5
	att.Mult_SightTime = 0.6
	att.Mult_SpeedMult = 1.05
	att.Mult_ShootSpeedMult = 1.2
	att.Mult_RPM = 240 / 220
	att.Add_BarrelLength = -6
	att.ActivateElements = {"ud_autoshotgun_barrel_sawnoff"}
	att.GivesFlags = {"nomuzzle"}
	att.A_Hook_Add_SightsDispersion = function(wep, data)
	    if data and !wep.Attachments[1].Installed then
	        data.add = data.add + 50
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m1014_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m1014_barrel_short")

	att.PrintName = "14\" M4 Super 90 Entry Barrel"
	att.AbbrevName = "14\" Entry Barrel"
	att.Icon = Material("entities/att/acwatt_ud_m1014_barrel_short.png", "smooth mips")
	att.Description = "Short barrel intended for breaching and close quarters use. Noticeably increases pellet spread, but is easier to manuver."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_1014_barrel"
	att.AutoStats = true
	att.Mult_AccuracyMOA = 1.5
	att.Mult_Recoil = 1.1
	att.Mult_Range = 0.8
	att.Mult_Sway = 0.75
	att.Mult_SightTime = 0.75
	att.Mult_SpeedMult = 1.025
	att.Mult_ShootSpeedMult = 1.1
	att.Add_BarrelLength = -4
	att.ActivateElements = {"ud_autoshotgun_barrel_short"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m1014_barrel_sport.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m1014_barrel_sport")

	att.PrintName = "18\" M4 Super 90 Competition Barrel"
	att.AbbrevName = "18\" Competition Barrel"
	att.Icon = Material("entities/att/acwatt_ud_m1014_barrel.png", "smooth mips")
	att.Description = "Hardened barrel with integral muzzle brake. Abiding by competition restrictions, it has a reduced rate of fire."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.nomuzzle"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_1014_barrel"
	att.AutoStats = true
	att.Add_BarrelLength = -1
	att.Mult_RecoilSide = 0.75
	att.Mult_Recoil = 0.85
	att.Mult_SightTime = 0.9
	att.Mult_Sway = 0.85
	att.Mult_RangeMin = 0.5
	att.Mult_RPM = 180 / 220
	att.ActivateElements = {"ud_autoshotgun_barrel_sport"}
	att.GivesFlags = {"nomuzzle"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m1014_stock_buffer.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m1014_stock_buffer")

	att.PrintName = "Buffer Tube"
	att.Icon = Material("entities/att/acwatt_ud_m1014_stock_buffer.png", "smooth mips")
	att.Description = "Stocks are overrated."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_1014_stock"
	att.AutoStats = true
	att.Free = true
	att.Mult_SpeedMult = 1.05
	att.Mult_SightTime = 0.5
	att.Mult_DrawTime = 0.6
	att.Mult_HolsterTime = 0.6
	att.Mult_Recoil = 1.35
	att.Mult_RecoilSide = 2
	att.Mult_SightedSpeedMult = 1.2
	att.Mult_ShootSpeedMult = 1.15
	att.Add_BarrelLength = -12
	att.Mult_Sway = 3
	att.ActivateElements = {"ud_autoshotgun_stock_buffer"}
	att.Override_ActivePos = Vector(0.5, 4, 1.5)
	att.Override_HoldtypeActive = "shotgun"
	att.Override_HoldtypeSights = "ar2"
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m1014_stock_in.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m1014_stock_in")

	att.PrintName = "Collapsed Stock"
	att.Icon = Material("entities/att/acwatt_ud_m1014_stock_in.png", "smooth mips")
	att.Description = "Pushing in the collapsable stock makes the weapon significantly shorter, allowing for easier use around corners and making it easier on the move at the cost of less stability."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_1014_stock"
	att.AutoStats = true
	att.Free = true
	att.Mult_Recoil = 1.1
	att.Mult_RecoilSide = 1.25
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_ShootSpeedMult = 1.1
	att.Mult_Sway = 1.5
	att.Add_BarrelLength = -8
	att.ActivateElements = {"ud_autoshotgun_stock_in"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m1014_tube_ext.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m1014_tube_ext")

	att.PrintName = "Skeletonkey 7 Shell Tube"
	att.AbbrevName = "7 Shell Tube"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "M4 Super 90 7 Shell Tube"
	end
	att.Icon = Material("entities/att/acwatt_ud_m1014_tube_ext.png", "smooth mips")
	att.Description = "Extended shell tube that adds weight to the weapon."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {}
	att.Slot = "ud_1014_tube"
	att.Override_ClipSize = 7
	att.AutoStats = true
	att.Override_ClipSize = 7
	att.Mult_Sway = 1.5
	att.Mult_SightTime = 1.25
	att.Mult_ReloadTime = 1.15
	att.Mult_SightedSpeedMult = 0.75
	att.ActivateElements = {"ud_autoshotgun_tube_long"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_barrel_adar.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_barrel_adar")

	att.PrintName = "14.5\" RUCAR 225 Barrel"
	att.Description = "Wooden handguard used on the Russian RUCAR 255 rifle. The heavier material allows for lower recoil than most handguards of similar length."
	att.Icon = Material("entities/att/acwatt_ud_m16_barrel_adar.png", "smooth mips")
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "14.5\" ADAR 2-15 Barrel"
	end
	att.Desc_Pros = {
	    --"uc.auto"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_barrel"
	att.AutoStats = true
	-- needs balancing
	--att.Mult_SightTime = 0.85
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_HipDispersion = 0.85
	att.Mult_Recoil = 1.15
	att.Mult_AccuracyMOA = 1.5
	att.Mult_Range = 0.75
	att.Mult_RPM = 1.111 --0.945
	att.Mult_Sway = 0.8
	att.Add_BarrelLength = -4
	att.Mult_PhysBulletMuzzleVelocity = 0.833333
	att.LHIK = true
	att.Model = "models/weapons/arccw/atts/adar_lhik.mdl"
	att.ActivateElements = {"hg_adar", "barrel_14", "fs_adar", "mount_14"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_barrel_classic.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_barrel_classic")

	att.PrintName = "20\" Prototype Barrel"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "20\" Classic A1 Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ud_m16_barrel_classic.png", "smooth mips")
	att.Description = "Classic triangular handguard. In comparison to the modern \"ribbed\" handguard, it is more comfortable to hold but has a tendency to slip."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    --"uc.semionly"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_barrel"
	att.AutoStats = true
	att.Mult_RecoilSide = 1.2
	att.Mult_Recoil = 1.1
	att.Mult_SightTime = .9
	att.LHIK = true
	att.Model = "models/weapons/arccw/atts/classic_lhik.mdl"
	att.ActivateElements = {"hg_m16a1"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_barrel_classic_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_barrel_classic_short")

	att.PrintName = "14.5\" Compact Prototype Barrel"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "14.5\" M605 Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ud_m16_barrel_classic_short.png", "smooth mips")
	att.Description = "Classic full-length triangular handguard on a carbine length barrel. It doesn't place much stress on the hand, but is quite difficult to control in full auto."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_barrel"
	att.AutoStats = true
	att.Mult_SightTime = 0.75
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_HipDispersion = 0.85
	att.Mult_Recoil = 1.35
	att.Mult_RecoilSide = 1.35
	att.Mult_AccuracyMOA = 1.5
	att.Mult_Range = 0.75
	att.Mult_RPM = 1.111
	att.Mult_Sway = 0.85
	att.Add_BarrelLength = -4
	att.Mult_PhysBulletMuzzleVelocity = 0.833333
	--att.Mult_ShootSpeedMult = 1.05
	att.LHIK = true
	att.Model = "models/weapons/arccw/atts/classic_lhik.mdl"
	att.ActivateElements = {"hg_m605"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_barrel_cqbr.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_barrel_cqbr")

	att.PrintName = "10\" Commando Barrel"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "10\" M4 Commando Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ud_m16_barrel_cqbr.png", "smooth mips")
	att.Description = "Short barrel of a length emulating the CAR-15 assault rifle. Technically classified as a submachine gun, it offers relatively high fire rates at the cost of range."
	att.Desc_Pros = {
	    --"uc.auto"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_barrel"
	att.AutoStats = true
	att.Mult_SightTime = 0.85
	att.Mult_SpeedMult = 1.025
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_HipDispersion = 0.7
	att.Mult_RPM = 1.15
	att.Mult_Recoil = 1.5
	att.Mult_AccuracyMOA = 2
	att.Mult_Range = 0.5
	att.Mult_Sway = 0.75
	att.Add_BarrelLength = -6
	att.Mult_PhysBulletMuzzleVelocity = 0.729167
	--[[]
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
	]]
	att.LHIK = true
	att.Model = "models/weapons/arccw/atts/m4_lhik.mdl"
	att.ActivateElements = {"hg_cqbr", "barrel_11", "mount_11"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_barrel_cqbr_ris.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_barrel_cqbr_ris")

	att.PrintName = "10\" Commando RIS Barrel"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "10\" CQBR RIS Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ud_m16_barrel_tactical.png", "smooth mips")
	att.Description = "Commando-length barrel fitted with a SOPMOD I rail interface, as used by special forces for unique CQB roles. Functionally identical to the commando barrel."
	att.Desc_Pros = {
	    --"uc.auto"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_barrel"
	att.AutoStats = true
	att.Mult_SightTime = 0.85
	att.Mult_SpeedMult = 1.025
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_HipDispersion = 0.7
	att.Mult_RPM = 1.15
	att.Mult_Recoil = 1.5
	att.Mult_AccuracyMOA = 2
	att.Mult_Range = 0.5
	att.Mult_Sway = 0.75
	att.Add_BarrelLength = -6
	att.Mult_PhysBulletMuzzleVelocity = 0.729167
	--[[]
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
	]]
	att.LHIK = true
	att.Model = "models/weapons/arccw/atts/m4_lhik.mdl"
	att.ActivateElements = {"hg_m4a1_ris", "barrel_11"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_barrel_fpw.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_barrel_fpw")

	att.PrintName = "14.5\" FPW Barrel"
	att.Icon = Material("entities/att/acwatt_ud_m16_barrel_fpw.png", "smooth mips")
	att.Description = "Barrel from an M231 Firing Port Weapon. Originally intended to be fired from inside an IFV, the FPW has an insanely high cyclic rate and makes no considerations for recoil, accuracy or heat."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.nofs",
	    "uc.overheat"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_barrel"
	att.AutoStats = true
	att.Mult_SightTime = 0.85
	att.Mult_RPM = 1.601
	att.Mult_Recoil = 1.25
	att.Mult_RecoilSide = 1.5
	att.Mult_Range = 0.65
	--att.Mult_Sway = 1.25
	att.Mult_AccuracyMOA = 2
	att.Mult_HipDispersion = 0.85
	att.Override_Jamming = true
	att.Override_HeatLockout = false
	att.Override_HeatCapacity = 180
	att.Override_HeatDissipation = 20
	att.A_Hook_Add_SightsDispersion = function(wep, data)
	    if data and (!wep.Attachments[1].Installed or wep.Attachments[1].Installed == "ud_m16_rs") then
	        data.add = data.add + 50
	    end
	end
	att.Add_BarrelLength = -4
	att.Mult_PhysBulletMuzzleVelocity = 0.729167
	att.LHIK = true
	att.Model = "models/weapons/arccw/atts/fpw_lhik.mdl"
	att.ActivateElements = {"hg_fpw", "barrel_14", "mount_14"}
	att.Hook_ModifyRPM = function(wep, delay)
	    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
	    if heat > 0.5 then
	        return delay * (1 + ((heat - 0.5) / 0.5) ^ 2 * 2)
	    end
	end
	att.M_Hook_Mult_AccuracyMOA = function(wep, data)
	    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
	    if heat > 0.5 then
	        data.mult = data.mult * (1 + ((heat - 0.5) / 0.5) ^ 2)
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_barrel_lmg.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_barrel_lmg")

	att.PrintName = "20\" AMSAW Barrel"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "20\" Colt LMG Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ud_m16_barrel_lmg.png", "smooth mips")
	att.Description = "Heavy duty handguard with built-in bipod and foregrip, sporting improved durability and recoil control for sustained automatic fire."
	att.Desc_Pros = {}
	att.Desc_Cons = {
	    "uc.noubs"
	}
	att.Desc_Neutrals = {}
	att.Slot = "ud_m16_barrel"
	att.AutoStats = true
	att.Mult_SpeedMult = 0.95
	att.Mult_SightedSpeedMult = 0.8
	att.Mult_Sway = 1.5
	att.Mult_SightTime = 1.25
	att.Mult_RPM = 0.915
	att.Mult_Recoil = 0.7
	att.Mult_RecoilSide = 0.5
	att.Mult_MalfunctionMean = 2
	att.Bipod = true
	att.Override_InBipodPos = Vector(-10, 0, -4)
	att.Mult_BipodDispersion = 0.2
	att.Mult_BipodRecoil = 0.15
	att.ActivateElements = {"hg_lmg"}
	att.GivesFlags = {"m16_lmg"}
	att.LHIK = true
	att.Model = "models/weapons/arccw/atts/lmg_lhik.mdl"
	att.ModelOffset = Vector(2.2, 0, 0)
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_barrel_m4.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_barrel_m4")

	att.PrintName = "14.5\" CAR-4 Barrel"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "14.5\" M4 Carbine Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ud_m16_barrel_m4.png", "smooth mips")
	att.Description = "Carbine length barrel with short handguard. Provides a small increase in firerate while maintaining respectable accuracy and range."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_barrel"
	att.AutoStats = true
	att.Mult_SightTime = 0.85
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_HipDispersion = 0.85
	att.Mult_Recoil = 1.25
	att.Mult_AccuracyMOA = 1.5
	att.Mult_Range = 0.75
	att.Mult_RPM = 1.111 --0.945
	att.Mult_Sway = 0.85
	att.Add_BarrelLength = -4
	att.Mult_PhysBulletMuzzleVelocity = 0.833333
	att.LHIK = true
	att.Model = "models/weapons/arccw/atts/m4_lhik.mdl"
	att.ActivateElements = {"hg_m4a1", "barrel_14", "mount_14"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_barrel_ru556.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_barrel_ru556")

	att.PrintName = "10\" RU556 Barrel"
	att.Icon = Material("entities/att/acwatt_ud_m16_barrel_ru556.png", "smooth mips")
	att.Description = "Handguard from the RU556 line of AMCAR accessories, featuring a unique barrel shroud. The thin aluminum frame has extremely low weight."
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "10\" M-LOK Barrel"
	    att.AbbrevName = "10\" M-LOK Barrel"
	    att.Description = "Short handguard from the M-LOK line of AR-15 accessories, featuring a unique barrel shroud. The thin aluminum frame has extremely low weight."
	end
	att.Desc_Pros = {
	    --"uc.auto"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_barrel"
	att.AutoStats = true
	att.Mult_SightTime = 0.75
	att.Mult_SpeedMult = 1.05
	att.Mult_SightedSpeedMult = 1.2
	att.Mult_HipDispersion = 0.8
	att.Mult_RPM = 1.15
	att.Mult_Recoil = 1.75
	att.Mult_AccuracyMOA = 2
	att.Mult_Range = 0.5
	att.Mult_Sway = 0.7
	att.Add_BarrelLength = -6
	att.Mult_PhysBulletMuzzleVelocity = 0.729167
	att.LHIK = true
	att.Model = "models/weapons/arccw/atts/ru556_lhik.mdl"
	--[[]
	att.Override_Firemodes = {
	    {
	        Mode = 2,
	    },
	    {w
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}
	]]
	--[[att.LHIK = true
	att.Model = "models/weapons/arccw/atts/m4_lhik.mdl"]]
	att.ActivateElements = {"hg_ru556", "barrel_11_ru556", "gasblock_carbine"}
	att.GivesFlags = {"sight_magpul"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_barrel_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_barrel_sd")

	att.PrintName = "10\" AMCAR-S Barrel"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "10\" M16 SD Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ud_m16_barrel_sd.png", "smooth mips")
	att.Description = "Integrally suppressed short barrel made by hobbyists. Dampens sound effectively, but the suppressor adds to weapon weight.\nPerformance may degrade with sustained fire."
	att.Desc_Pros = {
	    --"uc.auto"
	}
	att.Desc_Cons = {
	    "uc.overheat"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_barrel"
	att.AutoStats = true
	att.Mult_SightTime = 1.15
	att.Mult_Range = 0.65
	att.Mult_Recoil = 1.25
	att.Mult_AccuracyMOA = 1.25
	att.Mult_RPM = 1.111
	att.Add_BarrelLength = -6
	att.Mult_PhysBulletMuzzleVelocity = 0.78125
	att.LHIK = true
	att.Model = "models/weapons/arccw/atts/m4_lhik.mdl"
	att.Mult_ShootVol = 0.65
	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.GivesFlags = {"sd","sight_magpul"}
	att.SDBarrel = true
	att.ActivateElements = {"hg_sd"}
	att.Override_Jamming = true
	att.Override_HeatLockout = false
	att.Override_HeatFix = false
	att.Override_HeatCapacity = 150
	att.Override_HeatDelayTime = 0.2
	att.Override_HeatDissipation = 5
	att.Hook_ModifyRPM = function(wep, delay)
	    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
	    if heat > 0.5 then
	        return delay * (1 + ((heat - 0.5) / 0.5) * 0.5)
	    end
	end
	att.M_Hook_Mult_ShootVol = function(wep, data)
	    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
	    data.mult = data.mult * (1 + heat * 0.25)
	end
	att.M_Hook_Mult_ShootPitch = function(wep, data)
	    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
	    if heat > 0.5 then
	        data.mult = data.mult * (1 - (heat - 0.5) / 0.5 * 0.15)
	    end
	end
	att.M_Hook_Mult_AccuracyMOA = function(wep, data)
	    local heat = math.Clamp(wep:GetHeat() / wep:GetMaxHeat(), 0, 1)
	    if heat > 0.5 then
	        data.mult = data.mult * (1 + ((heat - 0.5) / 0.5))
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_barrel_smg.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_barrel_smg")

	att.PrintName = "9\" SMG Barrel"
	att.Icon = Material("entities/att/obsolete.png", "mips smooth")
	att.Description = "Short barrel for use with a 9mm receiver."
	att.Desc_Pros = {
	    --"uc.auto"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_barrel"
	att.SortOrder = -0.1
	att.AutoStats = true
	att.Mult_SightTime = 0.85
	att.Mult_SpeedMult = 1.025
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_RPM = 1.242
	att.Mult_Recoil = 1.5
	att.Mult_AccuracyMOA = 2
	att.Mult_Range = 0.75
	att.Mult_Sway = 0.75
	att.Add_BarrelLength = -6
	--[[]
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
	]]
	att.ActivateElements = {"hg_smg"}
	att.RequireFlags = {"m16_9mm"}
	att.HideIfBlocked = true
	att.Description = "OBSOLETE"
	att.Ignore = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_barrel_stub.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_barrel_stub")

	att.PrintName = "2\" Stub Barrel"
	att.Icon = Material("entities/att/obsolete.png", "mips smooth")
	att.Description = "OBSOLETE" --"Jesus Christ, I think I see the bullet sticking out."
	att.Desc_Pros = {
	    --"uc.auto"
	}
	att.Desc_Cons = {
	    "uc.nofs",
	    "uc.noubs"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_barrel"
	att.SortOrder = -1
	att.AutoStats = true
	att.Hidden = true
	--att.Mult_SightTime = 1
	--att.Mult_Recoil = 1
	--att.Mult_SpeedMult = 1
	att.Mult_Recoil = 2
	att.Mult_AccuracyMOA = 5
	att.Mult_Range = 0.25
	att.Mult_RPM = 1.35
	att.Mult_SpeedMult = 1.1
	att.Mult_SightedSpeedMult = 1.25
	att.Mult_SightTime = 0.6
	att.A_Hook_Add_SightsDispersion = function(wep, data)
	    if not wep.Attachments[1].Installed then
	        data.add = data.add + 100
	    end
	end
	att.Add_BarrelLength = -8
	--[[]
	att.Override_Firemodes = {
	    {
	        Mode = 2,
	    },
	    {
	        Mode = 0
	    }
	}
	]]
	att.LHIK = true
	att.Model = "models/weapons/arccw/atts/stub_lhik.mdl"
	att.ActivateElements = {"hg_stub", "barrel_stub"}
	att.GivesFlags = {"m16_stub"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_barrel_tactical.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_barrel_tactical")

	att.PrintName = "14.5\" CAR-4 RIS Barrel"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "14.5\" M4A1 RIS Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ud_m16_barrel_tactical.png", "smooth mips")
	att.Description = "Handguard from the SOPMOD I kit, giving the rifle the ability to better take the attachment of tactical devices or foregrips. Functionally identical to the carbine barrel."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_barrel"
	att.AutoStats = true
	att.Mult_SightTime = 0.85
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_HipDispersion = 0.85
	att.Mult_Recoil = 1.25
	att.Mult_AccuracyMOA = 1.5
	att.Mult_Range = 0.75
	att.Mult_RPM = 1.111 --0.945
	att.Mult_Sway = 0.85
	att.Add_BarrelLength = -4
	att.Mult_PhysBulletMuzzleVelocity = 0.833333
	att.LHIK = true
	att.Model = "models/weapons/arccw/atts/tactical_lhik.mdl"
	att.ActivateElements = {"hg_m4a1_ris", "barrel_14"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_barrel_tactical_a4.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_barrel_tactical_a4")

	att.PrintName = "20\" AMR-16 A4 Barrel"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "20\" M16A4 RIS Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ud_m16_barrel_tactical_a4.png", "smooth mips")
	att.Description = "Standard barrel shrouded by a quad-rail RIS handguard, giving the rifle the ability to accept the attachment of tactical devices or foregrips without any additional modification. Functionally identical to the standard barrel."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "uc.cosmetic"
	}
	att.Slot = "ud_m16_barrel"
	att.ActivateElements = {"hg_m16a4_ris"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_barrel_wood.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_barrel_wood")

	att.PrintName = "20\" \"Service Rifle\" Barrel"
	att.Icon = Material("entities/att/acwatt_ud_m16_barrel_classic.png", "smooth mips")
	att.Description = "Custom wooden handguard created by independent gunsmiths from the state of California. Its heft gives it some extra stability."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    --"uc.semionly"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_barrel"
	att.AutoStats = true
	att.Mult_Sway = 0.85
	att.Mult_RecoilSide = 0.85
	att.Mult_Recoil = 0.95
	att.Mult_SightedSpeedMult = 0.95
	att.Mult_ShootSpeedMult = 0.95
	-- att.Override_Firemodes_Priority = -1
	-- att.Override_Firemodes = {
	--     {
	--         Mode = 1,
	--     },
	--     {
	--         Mode = 0
	--     }
	-- }
	att.LHIK = true
	att.Model = "models/weapons/arccw/atts/classic_lhik.mdl"
	att.ActivateElements = {"hg_m16a1_wood"}
	-- att.ExcludeFlags = {"m16_auto"}
	-- att.GivesFlags = {"m16_noauto"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_barrel_wood_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_barrel_wood_short")

	att.PrintName = "14.5\" \"Service Carbine\" Barrel"
	att.Icon = Material("entities/att/acwatt_ud_m16_barrel_classic_short.png", "smooth mips")
	att.Description = "Full length wooden handguard on a carbine length barrel. Surprisingly comfortable to shoot."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_barrel"
	att.AutoStats = true
	att.Mult_AccuracyMOA = 1.5
	att.Mult_Range = 0.75
	att.Mult_RPM = 1.111
	att.Mult_Sway = 0.75
	att.Mult_SightedSpeedMult = 0.975
	att.Mult_ShootSpeedMult = 0.975
	att.Add_BarrelLength = -4
	att.Mult_PhysBulletMuzzleVelocity = 0.833333
	att.LHIK = true
	att.Model = "models/weapons/arccw/atts/classic_lhik.mdl"
	--att.Model = "models/weapons/arccw/atts/wood_short_lhik.mdl"
	att.ActivateElements = {"hg_m605_wood"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_charm_ch.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_charm_ch")

	att.PrintName = "Modern Rail Mount"
	att.Icon = Material("entities/att/acwatt_ud_m16_charm_ch.png", "smooth mips")
	att.Description = "Keep it retro.\nReject flat top. Return to carry handle."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {
	    "ud.m16_ch.1",
	    "ud.m16_ch.2",
	    "ud.m16_nors"
	}
	att.Slot = "ud_m16_charm"
	att.ActivateElements = {"ud_m16_upper_charm"}
	att.GivesFlags = {"ud_m16_retro"}
	att.ExcludeFlags = {"ud_m16_not_retro", "ud_m16_a1"}
	att.TopMount = 1
	att.SortOrder = 1001
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_charm_ch2.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_charm_ch2")

	att.PrintName = "Classic Rail Mount"
	att.Icon = Material("entities/att/acwatt_ud_m16_charm_ch2.png", "smooth mips")
	att.Description = "Keep it extra retro with this old-school rail mount."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {
	    "ud.m16_ch.1",
	    "ud.m16_ch.2",
	    "ud.m16_nors"
	}
	att.Slot = "ud_m16_charm"
	att.ActivateElements = {"ud_m16_upper_charm2"}
	att.GivesFlags = {"ud_m16_retro"}
	att.ExcludeFlags = {"ud_m16_not_retro", "ud_m16_a1"}
	att.TopMount = 4
	att.SortOrder = 1000
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_charm_fs.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_charm_fs")

	att.PrintName = "Preserved Front Sight"
	att.Icon = Material("entities/att/acwatt_ud_m16_charm_fs.png", "smooth mips")
	att.Description = "Those irons aren't out of style yet."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {
	    "ud.m16_fs.1",
	    "ud.m16_fs.2",
	}
	att.Slot = "ud_m16_charm"
	att.SortOrder = 999
	att.ExcludeFlags = {"ud_m16_a1","sight_magpul"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_charm_strap.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_charm_strap")

	att.PrintName = "MACV-SOG Wrapped Sling"
	att.AbbrevName = "Wrapped Sling"
	att.Icon = Material("entities/att/acwatt_ud_m16_charm_strap.png", "smooth mips")
	att.Description = "Wrap your sling around the weapon to make it look cooler and more commando-like.\nIt almost looks like you're doing... Black Ops. Haha."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "uc.cosmetic"
	}
	att.Slot = "ud_m16_charm"
	att.AutoStats = true
	att.SortOrder = 999
	att.Free = true
	att.ActivateElements = {"m16_strap"}
	att.Ignore = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_charm_tl.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_charm_tl")

	att.PrintName = "Tactical Laser Position"
	att.Icon = Material("entities/att/arccw_ud_pointshoot.png", "smooth mips")
	att.Description = "Give your AN/PEQ a reason to be thin."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {
	    "ud.m16_tl.1",
	    "ud.m16_tl.2",
	    "ud.m16_nors"
	}
	att.Slot = "ud_m16_charm"
	att.ActivateElements = {"bravo_dicks_going_fart"}
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 20, -6),
	        Ang = Angle(0, 0, -25),
	        GlobalPos = false,
	        GlobalAng = true,
	        Magnification = 1
	    }
	}
	att.SortOrder = 998
	att.TacLaserPos = true
	att.RequireFlags = {"tac"}
	att.Ignore = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_grip_ergo.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_grip_ergo")

	att.PrintName = "Ergonomic Grip"
	att.Icon = Material("entities/att/acwatt_ud_m16_grip_ergo.png", "smooth mips")
	att.Description = "Polymer grip with a comfortable shape, enabling faster handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_grip"
	att.AutoStats = true
	att.Mult_SightTime = 0.9
	att.Mult_SightedSpeedMult = 0.95
	--att.Mult_Recoil = 1
	--att.Mult_SpeedMult = 1
	att.ActivateElements = {"grip_ergo"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_grip_skel.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_grip_skel")

	att.PrintName = "Skeletonized Grip"
	att.Icon = Material("entities/att/acwatt_ud_m16_grip_skel.png", "smooth mips")
	att.Description = "Lightweight grip, marginally reducing weapon weight."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_grip"
	att.AutoStats = true
	att.Mult_RecoilSide = 1.15
	att.Mult_SightedSpeedMult = 1.05
	--att.Mult_SightTime = 1
	--att.Mult_Recoil = 1
	--att.Mult_SpeedMult = 1
	att.ActivateElements = {"grip_skel"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_grip_wood.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_grip_wood")

	att.PrintName = "Wooden Grip"
	att.Icon = Material("entities/att/acwatt_ud_m16_grip_default.png", "smooth mips")
	att.Description = "For a classy look."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_grip"
	att.AutoStats = true
	att.Mult_RecoilSide = 0.85
	att.Mult_SightedSpeedMult = 0.95
	--att.Mult_Recoil = 1
	--att.Mult_SpeedMult = 1
	att.ActivateElements = {"grip_wood"}
	ArcCW.LoadAttachmentType(att)
end

