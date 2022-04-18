local Material = ArcCW.AttachmentMat

------
-- ud_m16_mag_100.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_mag_100")

	att.PrintName = "STANAG 100-Round C-Mag"
	att.AbbrevName = "100-Round C-Mag"
	att.SortOrder = 100
	att.Icon = Material("entities/att/acwatt_ud_m16_mag_100.png", "smooth mips")
	att.Description = "Twin-drum magazine compliant with STANAG 4179 dimensions, ideal for suppressive fire. Bulky construction and high ammo capacity substantially increases weight, making the weapon difficult to handle. Prone to feeding failures."
	att.Desc_Pros = {}
	att.Desc_Cons = {
	    "uc.jam"
	}
	att.Desc_Neutrals = {}
	att.Slot = "ud_m16_mag"
	att.AutoStats = true
	att.HideIfBlocked = true
	att.Override_ClipSize = 100
	att.Mult_SightTime = 1.5
	att.Mult_ReloadTime = 1.5
	att.Mult_Sway = 3
	att.Mult_SpeedMult = 0.9
	att.Mult_ShootSpeedMult = 0.8
	att.Mult_DrawTime = 1.25
	att.Mult_HolsterTime = 1.25
	att.ActivateElements = {"ud_m16_mag_100"}
	--[[]
	att.Override_Jamming = true
	att.Override_HeatCapacity = 200
	att.Override_HeatDissipation = 4
	att.Override_HeatDelayTime = 3
	]]
	att.Override_Malfunction = true
	att.Mult_MalfunctionMean = 0.75
	att.Mult_MalfunctionVariance = 1.5
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_100"
	end
	att.Hook_TranslateAnimation = function(wep, anim)
	    if (anim == "fix") then
	        return anim .. "_100"
	    end
	end
	att.ExcludeFlags = {"m16_usas", "m16_9mm", "m16_50beo"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_mag_15.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_mag_15")

	att.PrintName = "AR-15 15-Round Pinned Mag"
	att.AbbrevName = "15-Round Pinned Mag"
	att.SortOrder = 15
	att.Icon = Material("entities/att/acwatt_ud_m16_mag_15.png", "smooth mips")
	att.Description = "Civilian magazine with capacity restrictions, but is quite easy to load."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {}
	att.Slot = "ud_m16_mag"
	att.AutoStats = true
	att.HideIfBlocked = true
	att.Ignore = true
	att.Override_ClipSize = 15
	att.Mult_SightTime = 0.8
	att.Mult_ReloadTime = 0.75
	att.Mult_Sway = 0.5
	att.Mult_SpeedMult = 1.03
	att.Mult_SightedSpeedMult = 1.07
	att.Mult_ShootSpeedMult = 1.07
	att.Mult_MalfunctionMean = 3
	att.ActivateElements = {"ud_m16_mag_50beo"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_20"
	end
	att.ExcludeFlags = {"m16_usas", "m16_9mm"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_mag_20.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_mag_20")

	att.PrintName = "STANAG 20-Round Compact Mag"
	att.AbbrevName = "20-Round Compact Mag"
	att.SortOrder = 20
	att.Icon = Material("entities/att/acwatt_ud_m16_mag_20.png", "smooth mips")
	att.Description = "Original, low-capacity magazine for the M16. The lighter load reduces the weapon's weight and brings back memories of the rice fields."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {}
	att.Slot = "ud_m16_mag"
	att.AutoStats = true
	att.HideIfBlocked = true
	att.Override_ClipSize = 20
	att.Mult_SightTime = 0.85
	att.Mult_ReloadTime = 0.9
	att.Mult_Sway = 0.75
	att.Mult_SpeedMult = 1.025
	att.Mult_SightedSpeedMult = 1.05
	att.Mult_ShootSpeedMult = 1.05
	att.Mult_MalfunctionMean = 1.5
	att.ActivateElements = {"ud_m16_mag_20"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_20"
	end
	att.ExcludeFlags = {"m16_usas", "m16_9mm", "m16_50beo"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_mag_40.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_mag_40")

	att.PrintName = "STANAG 40-Round Extended Mag"
	att.AbbrevName = "40-Round Extended Mag"
	att.SortOrder = 40
	att.Icon = Material("entities/att/acwatt_ud_m16_mag_40.png", "smooth mips")
	att.Description = "Extended magazine for the M16. Enables slightly longer mag dumps, which may save your life, but the longer mag is more awkward to load."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {}
	att.Slot = "ud_m16_mag"
	att.AutoStats = true
	att.HideIfBlocked = true
	att.Override_ClipSize = 40
	att.Mult_SightTime = 1.1
	att.Mult_ReloadTime = 1.15
	att.Mult_Sway = 1.5
	att.Mult_SpeedMult = 0.975
	att.Mult_ShootSpeedMult = 0.95
	att.ActivateElements = {"ud_m16_mag_40"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_40"
	end
	att.ExcludeFlags = {"m16_usas", "m16_9mm", "m16_50beo"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_mag_50beo_12.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_mag_50beo_12")

	att.PrintName = ".50 Beowulf 12-Round Standard Mag"
	att.AbbrevName = "12-Round Standard Mag"
	att.Icon = Material("entities/att/acwatt_ud_m16_mag_30.png", "smooth mips")
	att.Description = "Standard 5.56mm magazines converted to load .50 Beowulf rounds in a single stack. Requires a bit of elbow grease to squeeze them in."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {}
	att.Slot = "ud_m16_mag"
	att.AutoStats = true
	att.HideIfBlocked = true
	att.Free = true -- since this is just the standard mag
	att.SortOrder = 2
	att.Override_ClipSize = 12
	att.Mult_SightTime = 1.1
	att.Mult_ReloadTime = 1.15
	att.Mult_Sway = 1.5
	att.Mult_SpeedMult = 0.975
	att.RequireFlags = {"m16_50beo"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_mag_50beo_15.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_mag_50beo_15")

	att.PrintName = ".50 Beowulf 15-Round Extended Mag"
	att.AbbrevName = "15-Round Extended Mag"
	att.Icon = Material("entities/att/acwatt_ud_m16_mag_40.png", "smooth mips")
	att.Description = "Extended 5.56mm magazines converted to load .50 Beowulf rounds in a single stack. Really as far as you can go with these thick cartridges."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {}
	att.Slot = "ud_m16_mag"
	att.AutoStats = true
	att.HideIfBlocked = true
	att.InvAtt = "ud_m16_mag_40"
	att.SortOrder = 1
	att.Override_ClipSize = 15
	att.Mult_SightTime = 1.2
	att.Mult_ReloadTime = 1.3
	att.Mult_Sway = 2.25
	att.Mult_SpeedMult = 0.95
	att.ActivateElements = {"ud_m16_mag_40"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_40"
	end
	att.RequireFlags = {"m16_50beo"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_mag_60.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_mag_60")

	att.PrintName = "STANAG 60-Round Casket Mag"
	att.AbbrevName = "60-Round Casket Mag"
	att.SortOrder = 60
	att.Icon = Material("entities/att/acwatt_ud_m16_mag_60.png", "smooth mips")
	att.Description = "Quad-stacked magazine for the M16. Quite bulky, but provides double the ammo capacity of a typical STANAG magazine. Has a tendency to jam."
	att.Desc_Pros = {}
	att.Desc_Cons = {
	    "uc.jam"
	}
	att.Desc_Neutrals = {}
	att.Slot = "ud_m16_mag"
	att.AutoStats = true
	att.HideIfBlocked = true
	att.Override_ClipSize = 60
	att.Mult_SightTime = 1.2
	att.Mult_ReloadTime = 1.3
	att.Mult_Sway = 2
	att.Mult_SpeedMult = 0.95
	att.Mult_ShootSpeedMult = 0.9
	att.Mult_DrawTime = 1.15
	att.Mult_HolsterTime = 1.15
	att.ActivateElements = {"ud_m16_mag_60"}
	--[[]
	att.Override_Jamming = true
	att.Override_HeatCapacity = 300
	att.Override_HeatDissipation = 5
	att.Override_HeatDelayTime = 3
	]]
	att.Override_Malfunction = true
	att.Mult_MalfunctionVariance = 1.25
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_60"
	end
	att.ExcludeFlags = {"m16_usas", "m16_9mm", "m16_50beo"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_mag_9mm_32.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_mag_9mm_32")

	att.PrintName = "32-Round AMSMG Mag"
	att.AbbrevName = "32-Round Mag"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "32-Round 9mm AR-15 Mag"
	end
	att.Icon = Material("entities/att/acwatt_ud_m16_9mm_32.png", "smooth mips")
	att.Description = "A long stick magazine for the 9mm caliber conversion."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {}
	att.Slot = "ud_m16_mag"
	att.AutoStats = true
	att.HideIfBlocked = true
	att.Override_ClipSize = 32
	att.Mult_SightTime = 1.1
	att.Mult_ReloadTime = 1.15
	att.Mult_Sway = 1.25
	att.Mult_ShootSpeedMult = 0.95
	att.ActivateElements = {"ud_m16_9mm_mag_32"}
	att.RequireFlags = {"m16_9mm"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_9mm"
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_mag_usas_20.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_mag_usas_20")

	att.PrintName = "20-Round AMSAS Drum Mag"
	att.AbbrevName = "20-Round Drum Mag"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "20-Round USAR Drum Mag"
	end
	att.SortOrder = -1
	att.Icon = Material("entities/att/obsolete.png", "mips smooth")
	att.Description = "Extended drum magazine that offers extra magazine capacity. Almost no legitimate military uses, but makes a fun range toy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_mag"
	att.AutoStats = true
	att.HideIfBlocked = true
	att.Override_ClipSize = 20
	att.Override_ClipSize_SkipAS = true
	att.Mult_SightTime = 1.25
	--att.Mult_Recoil = 0.9
	att.Mult_ReloadTime = 1.25
	att.Mult_SpeedMult = 0.95
	att.Mult_Sway = 3
	att.ActivateElements = {"ud_m16_usas_mag_20"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_usas_20"
	end
	att.Hook_SelectFireAnimation = function(wep, anim)
	    return anim .. "_usas"
	end
	att.RequireFlags = {"m16_usas"}
	att.Description = "OBSOLETE"
	att.Ignore = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_receiver_300blk.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_receiver_300blk")

	att.PrintName = "AMCAR .300 BLK Receiver"
	att.AbbrevName = ".300 BLK Receiver"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "AR-15 .300 BLK Receiver"
	end
	att.Description = "Automatic receiver modified to take the .300 Blackout cartridge. While identical to 5.56x45mm in diameter, this cartridge carries a much larger projectile, which improves stopping power at the cost of ballistic performance."
	att.Icon = Material("entities/att/acwatt_ud_m16_receiver_auto.png", "smooth mips")
	att.Desc_Pros = {
	    "uc.auto",
	    --"ud.flattop"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_receiver"
	--att.InvAtt = "ud_m16_receiver_auto"
	att.AutoStats = true
	att.SortOrder = 4
	att.Mult_AccuracyMOA = 1.5
	att.Mult_RPM = 850 / 900
	att.Mult_HipDispersion = 1.2
	att.Mult_ShootSpeedMult = 0.8
	att.Mult_Damage = 1.118
	att.Mult_DamageMin = 0.6
	att.Mult_ShootVol = 105 / 120
	att.Mult_HeatDissipation = 1.5
	att.Override_PhysBulletMuzzleVelocity = 642
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/300blk.mdl"
	att.Override_ShellScale = 1
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
	att.GivesFlags = {"m16_auto"}
	att.ExcludeFlags = {"m16_noauto"}
	-- att.ActivateElements = {"ud_m16_upper_flat"}
	att.Override_Trivia_Calibre = ".300 Blackout"
	local path = "weapons/arccw_ud/m16/"
	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.FirstShootSound then return path .. "fire_first.ogg" end
	    if fsound == wep.ShootSound then return {path .. "fire_auto_1.ogg", path .. "fire_auto_2.ogg", path .. "fire_auto_3.ogg"} end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then return path .. "fire_dist.ogg" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_receiver_50beo.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_receiver_50beo")

	att.PrintName = "AMCAR-NG .50 Beowulf Receiver"
	att.AbbrevName = ".50 Beowulf Receiver"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "AR-15 .50 Beowulf Receiver"
	end
	att.SortOrder = -1
	att.Icon = Material("entities/att/acwatt_ud_m16_receiver_semi.png", "smooth mips")
	att.Description = "Semi-automatic receiver chambered in .50 Beowulf, a gigantic short-range cartridge with terrible ballistic performance. It can load single-stack into standard AR-15 magazines at a lower capacity."
	att.Desc_Pros = {}
	att.Desc_Cons = {
	    "uc.semionly"
	}
	att.Desc_Neutrals = {}
	att.Slot = "ud_m16_receiver"
	att.AutoStats = true
	att.HideIfBlocked = true
	att.SortOrder = 1
	att.Override_ClipSize = 7
	att.Override_ClipSize_Priority = 0.5
	att.BaseClipSize = 7
	att.Mult_Damage = 2.2
	att.Mult_Recoil = 3
	att.Mult_RecoilSide = 2
	att.Mult_VisualRecoilMult = 2
	att.Mult_RPM = 0.5
	att.Mult_Range = 0.25
	att.Mult_ShootVol = 1.2
	att.Mult_SightTime = 0.91
	att.Mult_ReloadTime = 0.87
	att.Mult_Sway = 0.667
	att.Mult_SpeedMult = 1.025
	att.Override_PhysBulletMuzzleVelocity = 550
	att.Mult_HeatCapacity = 0.25
	att.Mult_HeatDissipation = 0.25
	-- yes, .50 beowulf is more of an huge magnum bullet than it is a rifle bullet
	att.Override_Ammo = "357"
	att.Override_Trivia_Calibre = ".50 Beowulf"
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/50beo.mdl"
	att.Override_ShellScale = 1
	att.Override_ShellSounds = ArcCW.PistolShellSoundsTable
	att.Override_Firemodes_Priority = 0.5
	att.Override_Firemodes = {
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}
	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return "weapons/arccw_ud/m16/fire_beo.ogg" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_ud/mini14/fire_762_supp.ogg" end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then return "weapons/arccw_ud/mini14/fire_dist.ogg" end
	end
	-- can't be handled here
	--att.ActivateElements = {"ud_m16_mag_50beo"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if wep.Attachments[9].Installed == nil then
	        return anim .. "_20"
	    end
	end
	local slotinfo = {
	    [9] = {"7-Round Mag", "7-Round Mag", Material("entities/att/acwatt_ud_m16_mag_15.png", "smooth mips")},
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
	att.GivesFlags = {"m16_50beo"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_receiver_9mm.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_receiver_9mm")

	att.PrintName = "AMPAW-9 9x19mm Receiver"
	att.AbbrevName = "9x19mm Receiver"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "R0635 9x19mm Receiver"
	end
	att.Icon = Material("entities/att/acwatt_ud_m16_receiver_9mm.png", "smooth mips")
	att.Description = "A converted automatic receiver that fires 9x19mm Parabellum rounds. The smaller caliber drastically reduces recoil, but has much less range and is less accurate."
	att.Desc_Pros = {
	    "uc.auto",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_receiver"
	att.SortOrder = -10
	att.AutoStats = true
	att.SortOrder = 3
	att.Mult_Penetration = 0.25
	att.Mult_Damage = 0.88
	att.Mult_DamageMin = 0.88
	att.Mult_Range = 0.4
	att.Mult_ShootSpeedMult = 1.1
	att.Mult_Recoil = 0.35
	att.Mult_HipDispersion = 0.85
	--att.Mult_ReloadTime = 0.85
	att.Mult_SightTime = 0.9
	att.Override_ClipSize_Priority = -1
	att.Override_ClipSize = 20
	att.Mult_HeatCapacity = 1.5
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
	att.GivesFlags = {"m16_auto", "m16_9mm"}
	att.ExcludeFlags = {"m16_noauto"}
	att.ActivateElements = {"ud_m16_9mm_mag"}
	att.Override_PhysBulletMuzzleVelocity = 396 / 0.833333
	att.Override_Ammo = "pistol"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"
	att.Override_Trivia_Class = "Submachine Gun"
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
	att.Override_ShellScale = 1
	att.Override_ShellSounds = ArcCW.PistolShellSoundsTable
	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return "weapons/arccw_ud/m16/fire_9.ogg" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_ud/glock/fire_supp.ogg" end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then return "weapons/arccw_ud/m16/fire_9_dist.ogg" end
	end
	local slotinfo = {
	    [9] = {"20-Round Mag", "20-Round Mag", Material("entities/att/acwatt_ud_m16_9mm_20.png", "smooth mips")},
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
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_9mm"
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_receiver_a1.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_receiver_a1")

	att.PrintName = "AMRA1 Classic Receiver"
	att.AbbrevName = "Classic Receiver"
	att.Description = "Authentic receiver of the AMRA1 rifle, notable for its use throughout the latter half of the Vietnam War and seldom wielded by fortunate sons. Notorious for its difficult-to-control high RPM and still non-insignificant feeding failures."
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "M16A1 Classic Receiver"
	    att.Description = "Authentic receiver of the M16A1 rifle, notable for its use throughout the latter half of the Vietnam War and seldom wielded by fortunate sons. Notorious for its difficult-to-control high RPM and still non-insignificant feeding failures."
	end
	att.Icon = Material("entities/att/acwatt_ud_m16_receiver_a1.png", "smooth mips")
	att.Desc_Pros = {
	    "uc.auto"
	}
	att.Desc_Cons = {
	    "uc.jam"
	}
	att.Desc_Neutrals = {
	    "ud.m16_a1"
	}
	att.Slot = "ud_m16_receiver"
	--att.InvAtt = "ud_m16_receiver_auto"
	att.AutoStats = true
	att.SortOrder = 4.5
	att.Override_Malfunction = true
	att.Mult_AccuracyMOA = 1.5
	att.Mult_HipDispersion = 1.25
	att.Mult_ShootSpeedMult = 0.8
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
	att.GivesFlags = {"m16_auto", "ud_m16_retro", "ud_m16_a1"}
	att.ExcludeFlags = {"m16_noauto","ud_m16_not_retro"}
	att.ActivateElements = {"upper_classic","ud_m16_upper_charm2"}
	att.TopMount = 4
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_receiver_altburst.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_receiver_altburst")

	att.PrintName = "AMCAR Cam-lock Burst Receiver"
	att.AbbrevName = "Alt. Burst Receiver"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "M16A2 Cam-lock Burst Receiver"
	end
	att.Description = "An alternative burst fire receiver that fires the entire burst with one trigger pull. This has a slight benefit for recoil control, but is mostly down to preference."
	att.Icon = Material("entities/att/acwatt_ud_m16_receiver_default.png", "smooth mips")
	att.Desc_Pros = {
	    "ud.m16_altburst.1"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "ud.m16_altburst.2"
	}
	att.Slot = "ud_m16_receiver"
	att.AutoStats = true
	att.Free = true
	att.SortOrder = 10
	att.Override_Firemodes_Priority = 0.5
	att.Override_Firemodes = {
	    {
	        Mode = -3,
	        PostBurstDelay = 0.08,
	        Mult_Recoil = 0.9,
	        RunawayBurst = true, -- https://en.wikipedia.org/wiki/Burst_mode_(weapons)
	    },
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_receiver_auto.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_receiver_auto")

	att.PrintName = "AMCAR-NG Automatic Receiver"
	att.AbbrevName = "Automatic Receiver"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "M16A3 Automatic Receiver"
	end
	att.Description = "A receiver that allows automatic fire. Comes in semi-auto-safe configuration."
	att.Icon = Material("entities/att/acwatt_ud_m16_receiver_auto.png", "smooth mips")
	att.Desc_Pros = {
	    "uc.auto",
	    --"ud.flattop"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_receiver"
	--att.InvAtt = "ud_m16_receiver_auto"
	att.AutoStats = true
	att.SortOrder = 5
	att.Mult_AccuracyMOA = 1.25
	att.Mult_RPM = 0.85
	att.Mult_HipDispersion = 1.125
	att.Mult_ShootSpeedMult = 0.85
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
	att.GivesFlags = {"m16_auto"}
	att.ExcludeFlags = {"m16_noauto"}
	-- att.ActivateElements = {"ud_m16_upper_flat"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_receiver_cali.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_receiver_cali")

	att.PrintName = "UKCAR .223 Receiver"
	att.AbbrevName = "Manual Receiver"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "AR-15GB .223 Receiver"
	end
	att.Icon = Material("entities/att/acwatt_ud_m16_receiver_cali.png", "smooth mips")
	att.Description = "Straight-pull bolt action receiver for the M16, designed to comply with British centrefire rifle laws."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.manual"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_receiver"
	att.AutoStats = true
	att.SortOrder = -5
	att.Override_CaseEffectAttachment = 6
	att.Mult_PhysBulletMuzzleVelocity = 1.3
	att.Override_Firemodes = {
	    {
	        Mode = 1,
	        PrintName = "fcg.bolt",
	    },
	    {
	        Mode = 0
	    }
	}
	att.Hook_TranslateAnimation = function(wep, anim)
	    if (anim == "fire" || anim == "fire_empty") then
	        return "fire_cycle"
	    end
	end
	att.Override_ManualAction = true
	att.Mult_AccuracyMOA = 0.5
	att.Mult_Range = 1.25
	att.Mult_RangeMin = 1.25
	att.Mult_MalfunctionMean = 1.5
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_receiver_semi.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_receiver_semi")

	att.PrintName = "AMCAR-NG Automatic Receiver"
	att.AbbrevName = "Sporter Receiver"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "AR-15 Sporter Receiver"
	end
	att.Description = "A semi-automatic receiver sold in civilian markets. Designed for sport shooting, this receiver is more accurate and lightweight."
	att.Icon = Material("entities/att/acwatt_ud_m16_receiver_semi.png", "smooth mips")
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.semionly"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_receiver"
	att.AutoStats = true
	att.SortOrder = -1
	att.Mult_RPM = 600 / 900
	att.Mult_Recoil = 0.8
	att.Mult_AccuracyMOA = 0.75
	att.Mult_Range = 1.15
	att.Mult_MoveDispersion = 0.5
	att.Mult_PhysBulletMuzzleVelocity = 1.15
	att.Override_Firemodes_Priority = 0.5
	att.Override_Firemodes = {
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_receiver_usas.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_receiver_usas")

	att.PrintName = "AMSAS-12 12G Receiver"
	att.AbbrevName = "12G Receiver"
	att.Icon = Material("entities/att/obsolete.png", "mips smooth")
	att.Description = "Total conversion kit that turns the rifle into an automatic combat shotgun."
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "USAR-1200 12G Receiver"
	    att.Description = "Total conversion kit that turns the rifle into an automatic combat shotgun, based on the USAS-12."
	end
	att.Description = "OBSOLETE"
	att.Ignore = true
	att.Desc_Pros = {
	    "ud.usas",
	    "uc.auto"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_receiver"
	att.AutoStats = true
	att.SortOrder = -100
	att.Override_ClipSize_Priority = -1
	att.Override_ClipSize = 10
	--att.Mult_HipDispersion = 1.25
	att.Mult_RPM = 0.4
	att.Override_AccuracyMOA_Priority = -1
	att.Override_AccuracyMOA = 40
	att.Override_Num_Priority = -1 -- shotgun ammo may need to overwrite this
	att.Override_Num = 8
	att.Mult_Damage = 3
	att.Mult_DamageMin = 3
	att.Mult_Range = 0.25
	att.Mult_PhysBulletMuzzleVelocity = 3 -- revert velocity changes by range
	--att.Mult_RangeMin = 0.75
	att.Mult_Recoil = 3
	att.Mult_RecoilSide = 2
	att.Mult_ShootSpeedMult = 0.75
	att.Mult_SpeedMult = 0.925
	att.Mult_ReloadTime = 1.15
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
	att.LHIK = true
	att.Model = "models/weapons/arccw/atts/usas_lhik.mdl"
	att.Override_IsShotgun = true
	att.Override_Ammo = "buckshot"
	att.Override_Trivia_Calibre = "12 Gauge"
	att.Override_Trivia_Class = "Automatic Shotgun"
	att.Override_ShellModel = "models/weapons/arccw/ud_shells/12.mdl"
	att.Override_ShellScale = 1.7
	att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable
	att.GivesFlags = {"m16_usas"}
	att.ActivateElements = {"hg_usas"}
	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return "weapons/arccw_ud/m1014/fire.ogg" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_ud/m1014/fire_supp.ogg" end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then return "weapons/arccw_ud/870/fire_dist.ogg" end
	end
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_40"
	end
	local slotinfo = {
	    [2] = {"18\" AMSAS Barrel", "18\" USAR Barrel", att.Icon},
	    [3] = {"Standard Choke", "Standard Choke", att.Icon},
	    [9] = {"10-Round Mag", "10-Round Mag", att.Icon},
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
	att.Hook_TranslateAnimation = function(wep, anim)
	    if (anim == "fire" or anim == "fire_empty") then
	        return anim .. "_usas"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_rs.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_rs")

	att.PrintName = "Flip-up Rear Sight"
	att.Icon = Material("entities/att/acwatt_ud_m16_rs.png", "smooth mips")
	att.Description = "A rail-mounted rear sight for flat top receivers.\nLooks more modern, but that's it."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {
	    "uc.cosmetic"
	}
	att.Slot = "ud_m16_rs"
	att.ActivateElements = {"ud_m16_upper_flat"}
	att.GivesFlags = {"ud_m16_not_retro"}
	att.ExcludeFlags = {"ud_m16_retro"}
	--att.HideIfBlocked = true
	att.SortOrder = 1000
	att.Free = true
	att.M16Sights = 1
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_rs_magpul.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_rs_magpul")

	att.PrintName = "Magpul Rear Sight"
	att.Icon = Material("entities/att/acwatt_ud_m16_rs_magpul.png", "smooth mips")
	att.Description = "Aftermarket rear sight for flat top receivers. Functionally identical to other iron sights, but may look more tactical (or mall-ninja, depending on your taste)."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {
	    "uc.cosmetic"
	}
	att.Slot = "ud_m16_rs"
	att.ActivateElements = {"ud_m16_upper_flat"}
	att.GivesFlags = {"ud_m16_not_retro"}
	att.ExcludeFlags = {"ud_m16_retro"}
	--att.HideIfBlocked = true
	att.SortOrder = 1000
	att.Free = true
	att.M16Sights = 2
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_stock_231.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_stock_231")

	att.PrintName = "AMCAR 231 Wire Stock"
	att.AbbrevName = "Wire Stock"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "M16 M231 Wire Stock"
	end
	att.Icon = Material("entities/att/acwatt_ud_m16_stock_231.png", "smooth mips")
	att.Description = "Wire stock used on the M231 FPW that provides some semblance of recoil control. Can be made even more agile by collapsing, improving point-shooting capabilities at the cost of recoil control.\n\nToggling this stock modifies performance accordingly."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_stock"
	att.AutoStats = true
	att.SortOrder = 3
	att.Mult_DrawTime = 0.75
	att.Mult_HolsterTime = 0.75
	att.Mult_SightTime = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_Sway = 2
	att.Mult_SpeedMult = 1.025
	att.Add_BarrelLength = -4
	att.ToggleSound = "arccw_uc/common/stockslide.ogg"
	att.ToggleStats = {
	    {
	        PrintName = "Extended",
	        ActivateElements = {"stock_231_ex"},
	    },
	    {
	        PrintName = "Collapsed",
	        AutoStats = true,
	        ActivateElements = {"stock_231_in"},
	        Mult_HipDispersion = 0.75,
	        Mult_MoveDispersion = 0.75,
	        Mult_RecoilSide = 2,
	        Override_ActivePos = Vector(0.33, -1, 1),
	    },
	    --[[] -- we already have a buffer tube attachment
	    {
	        PrintName = "Removed",
	        ActivateElements = {"stock_231_tube"},
	    },
	    ]]
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_stock_607.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_stock_607")

	att.PrintName = "AMCAR 607 Stock"
	att.AbbrevName = "M607 Stock"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "M16 Model 607 Stock"
	end
	att.Icon = Material("entities/att/acwatt_ud_m16_stock_607.png", "smooth mips")
	att.Description = "Collapsable combat stock used on the Model 607 SMG. While not very good for point shooting, the stock allows for quick target acquisition when collapsed.\n\nToggling this stock modifies performance accordingly."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_stock"
	att.AutoStats = true
	att.SortOrder = 5
	--[[]
	att.Mult_SightTime = 0.95
	att.Mult_HipDispersion = 1.15
	att.Mult_RecoilSide = 0.9
	att.Mult_Sway = 1.1
	]]
	att.Mult_Sway = 1.25
	att.Add_BarrelLength = 0
	att.ToggleSound = "arccw_uc/common/stockslide.ogg"
	att.ToggleStats = {
	    {
	        PrintName = "Collapsed",
	        ActivateElements = {"stock_607_in"},
	        Mult_SightTime = 0.8,
	        Mult_ShootSpeedMult = 1.05,
	        Mult_HipDispersion = 1.2,
	        Add_BarrelLength = -4,
	        Override_ActivePos = Vector(0.33, -1, 1),
	    },
	    {
	        PrintName = "Extended",
	        ActivateElements = {"stock_607_ex"}
	    },
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_stock_608.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_stock_608")

	att.PrintName = "AMCAR 608 Stock"
	att.AbbrevName = "M608 Stock"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "M16 Model 608 Stock"
	end
	att.Icon = Material("entities/att/acwatt_ud_m16_stock_608.png", "smooth mips")
	att.Description = "Stock used on the Model 608 survival rifle. Essentially an elongated buffer tube with a cap. Improves point shooting abilities."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_stock"
	att.AutoStats = true
	att.SortOrder = 4
	att.Mult_HipDispersion = 0.75
	att.Mult_MoveDispersion = 0.85
	att.Mult_SightTime = 1.15
	att.Mult_Recoil = 1.25
	att.Mult_Sway = 1.5
	att.Add_BarrelLength = 0
	att.ActivateElements = {"stock_608"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_stock_adar.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_stock_adar")

	att.PrintName = "RUCAR 225 Stock"
	att.Icon = Material("entities/att/acwatt_ud_m16_stock_adar.png", "smooth mips")
	att.Description = "Wooden fixed stock with integral grip used on the Russian RUCAR 225 rifle. The sturdiest stock currently available for the AMCAR platform."
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "ADAR 2-15 Stock"
	    att.Description = "Wooden fixed stock with integral grip used on the Russian ADAR 2-15 rifle. The sturdiest stock currently available for the AR platform."
	end
	att.Desc_Pros = {
	    --"uc.auto"
	}
	att.Desc_Cons = {
	    "uc.nogrip"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_stock"
	att.AutoStats = true
	att.Mult_Sway = 0.5
	att.Mult_Recoil = 0.75
	att.Mult_RecoilSide = 0.75
	att.Mult_SpeedMult = .95
	att.Mult_SightedSpeedMult = .8
	att.Mult_SightTime = 1.25
	att.ActivateElements = {"stock_adar"}
	att.GivesFlags = {"m16_adar"}
	local slotinfo = {
	    [7] = {"Intergral Grip", "Integral Grip", att.Icon},
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
-- ud_m16_stock_buffer.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_stock_buffer")

	att.PrintName = "Buffer Tube"
	att.Icon = Material("entities/att/acwatt_ud_m16_stock_buffer.png", "smooth mips")
	att.Description = "The concept of \"stocks\" and \"recoil reduction\" are liberal gibberish made up to stop FREEDOM-LOVING AMERICANS from exercising their GOD-GIVEN RIGHTS."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_stock"
	att.AutoStats = true
	att.SortOrder = -100
	att.Free = true
	att.Mult_SpeedMult = 1.05
	att.Mult_SightTime = 0.5
	att.Mult_DrawTime = 0.6
	att.Mult_HolsterTime = 0.6
	att.Mult_Recoil = 1.5
	att.Mult_RecoilSide = 2
	att.Mult_SightedSpeedMult = 1.2
	att.Mult_ShootSpeedMult = 1.15
	att.Add_BarrelLength = -8
	att.Mult_Sway = 3
	att.ActivateElements = {"stock_231_tube"}
	att.Override_ActivePos = Vector(1.5, 1.5, 1.5)
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_stock_carbine.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_stock_carbine")

	att.PrintName = "AMCAR Carbine Stock"
	att.AbbrevName = "Carbine Stock"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "M16 Carbine Stock"
	end
	att.Icon = Material("entities/att/acwatt_ud_m16_stock_carbine.png", "smooth mips")
	att.Description = "Adjustable combat stock used on the XM177 carbine. When collapsed, it allows the user to move swiftly in close quarters; when extended, it functions similarly to a full stock.\n\nToggling this stock modifies performance accordingly."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_stock"
	att.AutoStats = true
	att.SortOrder = 6
	--[[]
	att.Mult_SightTime = 0.9
	att.Mult_HipDispersion = 0.85
	att.Mult_RecoilSide = 1.1
	att.Mult_Sway = 1.25
	]]
	att.Mult_Sway = 1.25
	att.ToggleSound = "arccw_uc/common/stockslide.ogg"
	att.ToggleStats = {
	    {
	        PrintName = "Collapsed",
	        ActivateElements = {"stock_carbine_in"},
	        Mult_SightedSpeedMult = 1.1,
	        Mult_ShootSpeedMult = 1.1,
	        Mult_RecoilSide = 1.5,
	        Add_BarrelLength = -4,
	        Override_ActivePos = Vector(0.33, -1, 1),
	    },
	    {
	        PrintName = "Extended",
	        ActivateElements = {"stock_carbine_ex"},
	    },
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_stock_ru556.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_stock_ru556")

	att.PrintName = "RU556 Fixed-Adjustable Stock"
	att.AbbrevName = "Fixed-Adjustable Stock"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Magpul UBR GEN2 Stock"
	end
	att.Icon = Material("entities/att/acwatt_ud_m16_stock_ru556.png", "smooth mips")
	att.Description = "Polymer sliding stock attached from underneath the buffer tube. Allows for better weapon control when moving."
	att.Desc_Pros = {
	    --"uc.auto"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_stock"
	att.AutoStats = true
	att.Mult_MoveDispersion = 0.6
	att.Mult_RecoilSide = 1.1
	att.Mult_Recoil = 1.15
	att.Mult_Sway = 1.25
	att.ActivateElements = {"stock_ru556"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m16_stock_wood.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m16_stock_wood")

	att.PrintName = "AMCAR Wooden Stock"
	att.AbbrevName = "Wooden Stock"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "M16 Wooden Stock"
	end
	att.Icon = Material("entities/att/acwatt_ud_m16_stock_default.png", "smooth mips")
	att.Description = "A sturdy stock made from wood. Heavier than polymer, and almost makes you wish for a nuclear winter."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m16_stock"
	att.AutoStats = true
	att.SortOrder = 2
	att.Mult_Recoil = 0.85
	att.Mult_RecoilSide = 0.75
	att.Mult_SightedSpeedMult = 0.9
	att.Mult_SpeedMult = 0.975
	att.Mult_Sway = 0.75
	att.ActivateElements = {"stock_wood"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m79_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m79_barrel_short")

	att.PrintName = "AMSGL Short Tube"
	att.AbbrevName = "Short Tube"
	if GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "M79 Short Tube"
	end
	att.Icon = Material("entities/att/acwatt_ud_m79_barrel_short.png", "smooth mips")
	att.Description = "Nicknamed the 'Pirate Gun' due to its likeliness to a hand cannon, this short barrel improves agility at the cost of precision and projectile range."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.altnofs"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m79_barrel"
	att.LHIK = true
	att.Model = "models/weapons/arccw/atts/lhik_short.mdl"
	att.AutoStats = true
	att.Mult_MuzzleVelocity = 0.5
	att.Mult_Recoil = 1.25
	att.Mult_AccuracyMOA = 2
	att.Mult_MoveDispersion = 0.75
	att.Mult_SightTime = 0.75
	att.Mult_ReloadTime = 0.85
	att.Mult_SpeedMult = 1.01
	att.Mult_SightedSpeedMult = 1.05
	att.Mult_Sway = 0.75
	att.A_Hook_Add_SightsDispersion = function(wep, data)
	    if data and !wep.Attachments[1].Installed then
	        data.add = data.add + 50
	    end
	end
	att.ActivateElements = {"m79_pirategun"}
	att.GivesFlags = {"m79_pirategun"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_m79_stock_sawn.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_m79_stock_sawn")

	att.PrintName = "Sawn-off Stock"
	att.Icon = Material("entities/att/acwatt_ud_m79_stock_sawn.png", "smooth mips")
	att.Description = "Removing the wooden stock and leaving only a grip massively increases the agility of the weapon, but also makes it difficult to fire accurately or controllably."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.sightdisp.50"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_m79_stock"
	att.AutoStats = true
	att.Free = true
	att.Add_SightsDispersion = 50
	att.Mult_Recoil = 1.5
	att.Mult_RecoilSide = 1.5
	att.Mult_Sway = 3
	att.Mult_SightTime = 0.75
	att.Mult_HipDispersion = 0.75
	att.Mult_SpeedMult = 1.05
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_ShootSpeedMult = 1.1
	att.Mult_DrawTime = 0.5
	att.Mult_HolsterTime = 0.5
	att.ActivateElements = {"m79_nostock"}
	att.Override_ActivePos = Vector(0.5, 2, 1.5)
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_mini14_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_mini14_barrel_long")

	att.PrintName = "Mini-14 24\" Long Barrel"
	att.AbbrevName = "24\" Long Barrel"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Patriot 809 24\" Long Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ud_mini14_barrel_long.png", "smooth mips")
	att.SortOrder = 24
	att.Description = "Lengthened barrel for shooting far-away varmints. More accurate, but slightly heavier."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_mini14_barrel"
	att.Mult_SightTime = 1.25
	att.Mult_Recoil = 0.9
	att.Mult_AccuracyMOA = 0.5
	att.Mult_Range = 1.2
	att.Mult_Sway = 1.5
	att.Add_BarrelLength = 4
	att.AutoStats = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_mini14_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_mini14_barrel_short")

	att.PrintName = "Mini-14 18\" Short Barrel"
	att.AbbrevName = "18\" Short Barrel"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Patriot 809 18\" Short Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ud_mini14_barrel_short.png", "smooth mips")
	att.SortOrder = 18
	att.Description = "Compact barrel for popping close-up varmints. More agile but less accurate."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_mini14_barrel"
	att.Mult_SightTime = 0.8
	att.Mult_Recoil = 1.1
	att.Mult_AccuracyMOA = 1.5
	att.Mult_Range = 0.5
	att.Mult_Sway = 0.75
	att.Mult_SightedSpeedMult = 1.1
	att.Add_BarrelLength = -4
	att.AutoStats = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_mini14_barrel_stub.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_mini14_barrel_stub")

	att.PrintName = "Mini-14 15\" Stub Barrel"
	att.AbbrevName = "15\" Stub Barrel"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Patriot 809 15\" Stub Barrel"
	end
	att.Icon = Material("entities/att/acwatt_ud_mini14_barrel_stub.png", "smooth mips")
	att.SortOrder = 15
	att.Description = "No, using your hacksaw on the barrel is not gunsmithing."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.nofs",
	    "uc.nomuzzle",
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_mini14_barrel"
	att.Mult_SightTime = 0.65
	att.Mult_Recoil = 1.25
	att.Mult_AccuracyMOA = 3
	att.Mult_Range = 0.25
	att.Mult_Sway = 0.5
	att.Mult_SightedSpeedMult = 1.25
	att.Add_BarrelLength = -8
	att.AutoStats = true
	att.GivesFlags = {"nomuzzle"}
	att.A_Hook_Add_SightsDispersion = function(wep, data)
	    if data and !wep.Attachments[1].Installed then
	        data.add = data.add + 50
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_mini14_mag_10.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_mini14_mag_10")

	att.PrintName = "Mini-14 10-Round Flush Mag"
	att.AbbrevName = "10-Round Flush Mag"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Patriot 809 10-Round Flush Mag"
	end
	att.SortOrder = 10
	att.Icon = Material("entities/att/acwatt_ud_mini14_mag_10.png", "smooth mips")
	att.Description = "Low-capacity 5.56mm flush magazine. The lighter load makes the weapon even more ergonomic."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_mini14_mag"
	att.AutoStats = true
	att.Mult_SightTime = 0.85
	att.Mult_ReloadTime = 0.9
	att.Override_ClipSize = 10
	att.Mult_Sway = 0.75
	att.ActivateElements = {"ud_mini14_mag_10"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_10"
	end
	att.ExcludeFlags = {"mini14_762", "mini14_22lr"}
	att.HideIfBlocked = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_mini14_mag_10_762.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_mini14_mag_10_762")

	att.PrintName = "Mini-30 7.62x39mm 10-Round Flush Mag"
	att.AbbrevName = "10-Round Flush Mag"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Patriot 816 7.62x39mm 10-Round Flush Mag"
	end
	att.SortOrder = 10
	att.Icon = Material("entities/att/acwatt_ud_mini14_mag_10.png", "smooth mips")
	att.Description = "Low-capacity 7.62mm flush magazine. It is much less likely to jam thanks to the low capaacity."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_mini14_mag"
	att.AutoStats = true
	att.Mult_SightTime = 0.85
	att.Mult_ReloadTime = 0.9
	att.Override_ClipSize = 10
	att.Mult_Sway = 0.75
	att.Mult_MalfunctionMean = 1.5
	att.ActivateElements = {"ud_mini14_mag_10"}
	att.RequireFlags = {"mini14_762"}
	att.HideIfBlocked = true
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_10"
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_mini14_mag_30.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_mini14_mag_30")

	att.PrintName = "Mini-14 30-Round Extended Mag"
	att.AbbrevName = "30-Round Extended Mag"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Patriot 809 30-Round Extended Mag"
	end
	att.SortOrder = 30
	att.Icon = Material("entities/att/acwatt_ud_mini14_mag_30.png", "smooth mips")
	att.Description = "An official but rare extended magazine. Despite its similar appearance, this is not STANAG compatible."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_mini14_mag"
	att.AutoStats = true
	att.Mult_SightTime = 1.1
	att.Mult_ReloadTime = 1.15
	att.Override_ClipSize = 30
	att.Mult_Sway = 1.5
	att.Mult_ShootSpeedMult = 0.95
	att.ActivateElements = {"ud_mini14_mag_30"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_30"
	end
	att.ExcludeFlags = {"mini14_762", "mini14_22lr"}
	att.HideIfBlocked = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_mini14_mag_30_762.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_mini14_mag_30_762")

	att.PrintName = "Mini-30 7.62x39mm 30-Round Extended Mag"
	att.AbbrevName = "30-Round Extended Mag"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Patriot 816 7.62x39mm 30-Round Extended Mag"
	end
	att.SortOrder = 30
	att.Icon = Material("entities/att/acwatt_ud_mini14_mag_30_762.png", "smooth mips")
	att.Description = "Effectively an AK magazine with a modified feeding lip, this magazine is proof of gun hobbyists' dedication (and lunacy) in search of more dakka."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_mini14_mag"
	att.AutoStats = true
	att.Mult_SightTime = 1.15
	att.Mult_ReloadTime = 1.2
	att.Override_ClipSize = 30
	att.Mult_Sway = 1.5
	att.Mult_ShootSpeedMult = 0.95
	att.Mult_MalfunctionMean = 0.75
	att.ActivateElements = {"ud_mini14_mag_30_762"}
	att.RequireFlags = {"mini14_762"}
	att.HideIfBlocked = true
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_762"
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_mini14_mag_42.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_mini14_mag_42")

	att.PrintName = "Mini-14 42-Round ProMag"
	att.AbbrevName = "42-Round Polymer Mag"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Patriot 809 42-Round Polymer Mag"
	end
	att.SortOrder = 30
	att.Icon = Material("entities/att/acwatt_ud_mini14_mag_30_polymer.png", "smooth mips")
	att.Description = "Polymer aftermarket extended magazine with a generous capacity."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_mini14_mag"
	att.AutoStats = true
	att.Override_ClipSize = 42
	att.Mult_SightTime = 1.2
	att.Mult_ReloadTime = 1.25
	att.Mult_Sway = 1.75
	att.Mult_SpeedMult = 0.975
	att.Mult_ShootSpeedMult = 0.925
	att.Mult_DrawTime = 1.15
	att.Mult_HolsterTime = 1.15
	att.ActivateElements = {"ud_mini14_mag_42"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_30_tac"
	end
	att.ExcludeFlags = {"mini14_762", "mini14_22lr"}
	att.HideIfBlocked = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_mini14_mag_60.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_mini14_mag_60")

	att.PrintName = "Mini-14 60-Round Casket Magazine"
	att.AbbrevName = "60-Round Casket Mag"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Patriot 809 60-Round Casket Magazine"
	end
	att.SortOrder = 30
	att.Icon = Material("entities/att/acwatt_ud_mini14_mag_60.png", "smooth mips")
	att.Description = "Quad-stack magazine for sustained vermin hunting. Has a tendency to jam."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.jam"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_mini14_mag"
	att.AutoStats = true
	att.Override_ClipSize = 60
	att.Mult_SightTime = 1.2
	att.Mult_ReloadTime = 1.5
	att.Mult_Sway = 2
	att.Mult_SpeedMult = 0.95
	att.Mult_ShootSpeedMult = 0.9
	att.Mult_DrawTime = 1.25
	att.Mult_HolsterTime = 1.25
	att.Override_Malfunction = true
	att.ActivateElements = {"ud_mini14_mag_60"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_60"
	end
	att.ExcludeFlags = {"mini14_762", "mini14_22lr"}
	att.HideIfBlocked = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_mini14_receiver_22lr.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_mini14_receiver_22lr")

	att.PrintName = "Mini-14 .22 LR Receiver"
	att.AbbrevName = ".22 LR Receiver"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Patriot 809 .22 LR Receiver"
	end
	att.Icon = Material("entities/att/acwatt_ud_mini14_receiver_22lr.png", "smooth mips")
	att.Description = "Aftermarket .22 Long Rifle conversion for the Mini-14. While the light, weak cartridge has poor stopping power, its recoil is extremely manageable, making it a cinch to follow up shots."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_mini14_receiver"
	att.AutoStats = true
	att.Mult_SightTime = 0.8
	att.Mult_ReloadTime = 0.85
	att.Mult_Sway = 0.75
	att.Mult_Damage = 0.4
	att.Mult_DamageMin = 0.4
	att.Mult_Range = 0.5
	att.Mult_Recoil = 0.25
	att.Mult_VisualRecoilMult = 0.25
	att.Mult_RPM = 1000 / 540
	att.Mult_Penetration = 0.1
	att.Mult_ShootSpeedMult = 1.2
	att.Override_ClipSize = 15
	att.ActivateElements = {"ud_mini14_mag_15_22lr", "ud_mini14_receiver_22lr"}
	att.GivesFlags = {"mini14_22lr"}
	att.Override_Ammo = "plinking"
	att.Override_Trivia_Calibre = ".22 Long Rifle"
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/22lr.mdl"
	att.Override_ShellScale = 1
	att.Override_ShellSounds = ArcCW.TinyShellSoundsTable
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_15_22lr"
	end
	att.Hook_GetShootSound = function(wep, sound)
	    if wep:GetBuff_Override("Silencer") then
	        return "weapons/arccw_ud/mini14/fire_22_supp.ogg" -- Not Placeholder
	    else
	        return "weapons/arccw_ud/mini14/fire_22.ogg" -- Not Placeholder
	    end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then
	        return "weapons/arccw_ud/mini14/fire_22_dist.ogg" end
	end
	local slotinfo = {
	    [7] = {"15-Round Mag", "15-Round Mag", Material("entities/att/acwatt_ud_mini14_mag_15_22lr.png", "smooth mips")},
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
-- ud_mini14_receiver_762.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_mini14_receiver_762")

	att.PrintName = "Mini-30 7.62x39mm Receiver"
	att.AbbrevName = "7.62x39mm Receiver"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Patriot 816 7.62x39mm Receiver"
	end
	att.SortOrder = 30
	att.Icon = Material("entities/att/acwatt_ud_mini14_receiver_762.png", "smooth mips")
	att.Description = "A curious yet offically produced receiver variant made to circumvent caliber restrictions in deer hunting. The high pressure of this round makes this model liable to feeding failures."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.jam"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_mini14_receiver"
	att.AutoStats = true
	att.Mult_ReloadTime = 1.15
	att.Mult_ShootSpeedMult = 0.8
	att.Mult_RPM = 360 / 540
	att.Mult_Recoil = 1.25
	att.Mult_RecoilSide = 1.5
	att.Mult_HipDispersion = 1.5
	att.Mult_Damage = 1.5
	att.Mult_DamageMin = 1.5
	att.Mult_Range = 2
	att.Override_Malfunction = true
	att.Mult_MalfunctionVariance = 1.5
	att.Override_Ammo = "ar2"
	att.Override_Trivia_Calibre = "7.62x39mm"
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/762x39.mdl"
	att.Override_ShellScale = 1
	att.ActivateElements = {"ud_mini14_receiver_762"}
	att.GivesFlags = {"mini14_762"}
	att.Hook_GetShootSound = function(wep, sound)
	    if wep:GetBuff_Override("Silencer") then
	        return "weapons/arccw_ud/mini14/fire_762_supp.ogg" -- Not Placeholder
	    else
	        return "weapons/arccw_ud/mini14/fire_762.ogg" -- Not Placeholder
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_mini14_receiver_auto.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_mini14_receiver_auto")

	att.PrintName = "AC-556 Automatic Receiver"
	att.AbbrevName = "Automatic Receiver"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Patriot ACC Automatic Receiver"
	end
	att.Icon = Material("entities/att/acwatt_ud_mini14_receiver_auto.png", "smooth mips")
	att.Description = "Receiver adapted with a military auto sear and fire selector."
	att.Desc_Pros = {
	    "uc.auto"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_mini14_receiver"
	att.AutoStats = true
	att.Override_Firemodes = {
	    {
	        Mode = 2,
	    },
	    {
	        Mode = -3,
	        Override_ShotRecoilTable = {
	            [1] = 0.9,
	            [2] = 0.8,
	            [3] = 0.7,
	        },
	    },
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}
	att.ActivateElements = {"ud_mini14_receiver_auto"}
	att.Mult_RPM = 750 / 540
	att.Mult_RecoilSide = 1.5
	att.Mult_HipDispersion = 1.25
	att.Mult_AccuracyMOA = 2
	att.Mult_ShootSpeedMult = 0.85
	att.Mult_MalfunctionMean = 0.75
	att.Mult_MalfunctionVariance = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_mini14_stock_polymer.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_mini14_stock_polymer")

	att.PrintName = "Mini-14 Polymer Stock"
	att.AbbrevName = "Polymer Stock"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Patriot 809 Polymer Stock"
	end
	att.Icon = Material("entities/att/acwatt_ud_mini14_stock.png", "smooth mips")
	att.Description = "A lightweight body replacement that improves weapon agility."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_mini14_stock"
	att.AutoStats = true
	att.Mult_SightTime = 0.9
	att.Mult_SpeedMult = 1.05
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_Recoil = 1.25
	--att.Mult_Sway = 3
	-- att.Add_BarrelLength = 32
	att.ActivateElements = {"ud_mini14_stock_polymer"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_mini14_stock_sawnoff.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_mini14_stock_sawnoff")

	att.PrintName = "Mini-14 Sawn-off Stock"
	att.AbbrevName = "Sawn-off Stock"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Patriot 809 Sawn-off Stock"
	end
	att.Icon = Material("entities/att/acwatt_ud_mini14_stock_sawnoff.png", "smooth mips")
	att.Description = "Using your hacksaw on the stock is not gunsmithing either."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_mini14_stock"
	att.AutoStats = true
	att.Mult_SightTime = 0.75
	att.Mult_DrawTime = 0.75
	att.Mult_HolsterTime = 0.75
	att.Mult_Recoil = 1.5
	att.Mult_RecoilSide = 2
	att.Mult_Sway = 2
	att.Mult_SightedSpeedMult = 1.2
	att.Mult_ShootSpeedMult = 1.15
	att.Add_BarrelLength = -4
	att.ActivateElements = {"ud_mini14_stock_sawnoff"}
	att.Override_ActivePos = Vector(0.5, 2, 1.5)
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_mini14_stock_tactical.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_mini14_stock_tactical")

	att.PrintName = "Mini-14 Folding Stock"
	att.AbbrevName = "Folding Stock"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Patriot 809 Folding Stock"
	end
	att.Icon = Material("entities/att/obsolete.png", "mips smooth") --Material("entities/att/acwatt_ud_mini14_stock_tactical_wood.png", "smooth mips")
	att.Description = "A lightweight body replacement that improves weapon agility."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_mini14_stock"
	att.AutoStats = true
	att.Mult_SightTime = 0.9
	att.Mult_SpeedMult = 1.05
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_Recoil = 1.25
	--att.Mult_Sway = 3
	-- att.Add_BarrelLength = 32
	att.ActivateElements = {"ud_mini14_stock_tactical"}
	att.Ignore = true -- where animation
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_mini14_stock_tactical_polymer.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_mini14_stock_tactical_polymer")

	att.PrintName = "Mini-14 Tactical Stock"
	att.AbbrevName = "Tactical Stock"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "Patriot 809 Tactical Stock"
	end
	att.Icon = Material("entities/att/obsolete.png", "mips smooth") --Material("entities/att/acwatt_ud_mini14_stock_tactical_polymer.png", "smooth mips")
	att.Description = "A lightweight body replacement that improves weapon agility."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_mini14_stock"
	att.AutoStats = true
	att.Mult_SightTime = 0.9
	att.Mult_SpeedMult = 1.05
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_Recoil = 1.25
	--att.Mult_Sway = 3
	-- att.Add_BarrelLength = 32
	att.ActivateElements = {"ud_mini14_stock_tactical_polymer"}
	att.Ignore = true -- where animation
	ArcCW.LoadAttachmentType(att)
end

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
	    "uc.nostocks"
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
	    att.PrintName = "STAP 20-Round Flush Mag"
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
	ArcCW.LoadAttachmentType(att)
end

