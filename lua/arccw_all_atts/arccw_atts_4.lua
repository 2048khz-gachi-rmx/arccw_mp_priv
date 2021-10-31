local Material = ArcCW.AttachmentMat

------
-- go_glock_mag_26_45acp.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_glock_mag_26_45acp")

	att.PrintName = "26-Round .45 ACP G21"
	att.Icon = Material("entities/acwatt_go_glock_mag_28.png", "mips smooth")
	att.Description = "Extended .45 ACP magazine for the Glock 21. Heavy, but may be worth the extra ammo."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	    "con.gsoe.nog18"
	}
	att.SortOrder = 4
	att.AutoStats = true
	att.Slot = "go_glock_mag"
	att.GivesFlags = {"noauto"}
	att.ExcludeFlags = {"go_glock_slide_auto"}
	att.Override_Trivia_Calibre = ".45 ACP"
	att.Hook_NameChange = function(wep, name)
	    if wep.Attachments[3].Installed == "go_glock_slide_short" then
	        return "Glock 30"
	    elseif wep.Attachments[3].Installed == "go_glock_slide_long" then
	        return "Glock 21L"
	    else
	        return "Glock 21"
	    end
	end

	att.Mult_RPM = 0.8
	att.Mult_Damage = 1.3
	att.Mult_DamageMin = 1.1
	att.Mult_Recoil = 1.3
	--att.Mult_ShootPitch = 1.1

	att.ActivateElements = {"go_glock_mag_28"}
	att.Override_ClipSize = 26
	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.15
	att.Mult_ReloadTime = 1.25

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_long"
	    elseif anim == "reload_empty" then
	        return "reload_long_empty"
	    end
	end

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return "arccw_go/glock18/glock_45.wav" end
	end
	--[[att.Hook_GetDistantShootSound = function(wep, sound)
	    if snd == wep.DistantShootSound then return "arccw_go/usp/usp_unsil-1-distant.wav" end
	end]]
	ArcCW.LoadAttachmentType(att)
end

------
-- go_glock_mag_28.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_glock_mag_28")

	att.PrintName = "31-Round 9mm G18"
	att.Icon = Material("entities/acwatt_go_glock_mag_28.png", "mips smooth")
	att.Description = "Extended magazine for the Glock pistol. Heavy, but may be worth the extra ammo."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 31
	att.AutoStats = true
	att.Slot = "go_glock_mag"

	att.Override_ClipSize_Priority = 2
	att.Override_ClipSize = 31

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.15
	att.Mult_ReloadTime = 1.25

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_long"
	    elseif anim == "reload_empty" then
	        return "reload_long_empty"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_glock_mag_30_10auto.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_glock_mag_30_10auto")

	att.PrintName = "30-Round 10mm G20"
	att.Icon = Material("entities/acwatt_go_glock_mag_28.png", "mips smooth")
	att.Description = "Extended 10mm magazine for the Glock 20. Heavy, but may be worth the extra ammo."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	    "con.gsoe.nog18"
	}
	att.SortOrder = 5
	att.AutoStats = true
	att.Slot = "go_glock_mag"
	att.GivesFlags = {"noauto"}
	att.ExcludeFlags = {"go_glock_slide_auto"}
	att.Override_Trivia_Calibre = "10mm Auto"
	att.Hook_NameChange = function(wep, name)
	    if wep.Attachments[3].Installed == "go_glock_slide_short" then
	        return "Glock 29"
	    elseif wep.Attachments[3].Installed == "go_glock_slide_long" then
	        return "Glock 20L"
	    else
	        return "Glock 20"
	    end
	end

	att.Mult_RPM = 0.9
	att.Mult_Damage = 1.2
	att.Mult_DamageMin = 1.2
	att.Mult_Recoil = 1.3
	--att.Mult_ShootPitch = 0.95

	att.ActivateElements = {"go_glock_mag_28"}
	att.Override_ClipSize = 30
	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.15
	att.Mult_ReloadTime = 1.25

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_long"
	    elseif anim == "reload_empty" then
	        return "reload_long_empty"
	    end
	end

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return "arccw_go/glock18/glock_10.wav" end
	end
	--[[att.Hook_GetDistantShootSound = function(wep, sound)
	    if snd == wep.DistantShootSound then return "arccw_go/p250/p250-1-distant.wav" end
	end]]
	ArcCW.LoadAttachmentType(att)
end

------
-- go_glock_slide_auto.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_glock_slide_auto")

	att.PrintName = "120mm G18 Slide"
	att.Icon = Material("entities/acwatt_go_glock_slide_auto.png", "mips smooth")
	att.Description = "Long slide that improves range but also adds weight, as well as adding the ability to fire in full auto."
	att.Desc_Pros = {
	    "pro.fullauto"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_glock_slide"

	att.Mult_Range = 1.25
	att.Mult_SightTime = 1.25
	att.Mult_DrawTime = 1.25

	att.Mult_RPM = 1.5

	att.Mult_ShootPitch = 0.95

	att.Override_Firemodes = {
	    {
	        Mode = 2
	    },
	    {
	        Mode = 1
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- go_glock_slide_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_glock_slide_long")

	att.PrintName = "150mm G17L Slide"
	att.Icon = Material("entities/acwatt_go_glock_slide_long.png", "mips smooth")
	att.Description = "Long slide that significantly improves range and accuracy. Produced in limited quantities, because a long Glock is quite unwieldy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_glock_slide"

	att.SortOrder = -1
	att.Mult_Range = 1.5
	att.Mult_AccuracyMOA = 0.5
	att.Mult_Recoil = 0.75
	att.Mult_RPM = 0.85
	att.Mult_SightTime = 1.3
	att.Mult_DrawTime = 1.25

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_glock_slide_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_glock_slide_short")

	att.PrintName = "90mm G26 Slide"
	att.Icon = Material("entities/acwatt_go_glock_slide_short.png", "mips smooth")
	att.Description = "Compact slide that improves weapon handling and trigger response. Equips a compact frame and reduced magazine."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_glock_slide"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.7
	att.Mult_AccuracyMOA = 1.5
	att.Mult_DrawTime = 0.75

	att.Override_ClipSize_Priority = 0.5
	att.Override_ClipSize = 15

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_homemade_auto.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_homemade_auto")

	att.PrintName = "Homemade Auto"
	att.Icon = Material("entities/acwatt_go_homemade_auto.png", "mips smooth")
	att.Description = "Illegally modify the weapon to be fully automatic."
	att.Desc_Pros = {
	    "pro.fullauto"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"

	att.Override_Firemodes_Priority = 10
	att.Override_Firemodes = {
	    {
	        Mode = 2,
	    },
	}

	att.Hook_Compatible = function(wep)
	    if wep.ManualAction then return false end
	    local auto = false
	    for i, v in pairs(wep.Firemodes) do
	        if v.Mode and v.Mode == 2 then
	            auto = true
	            break
	        end
	    end
	    if auto then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_laser.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_laser")

	att.PrintName = "1mW Laser"
	att.Icon = Material("entities/acwatt_go_laser.png", "mips smooth")
	att.Description = "Low-power laser pointer. Improves hip-fire accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.beam"
	}
	att.AutoStats = true
	att.Slot = {"tac_pistol", "tac"}

	att.Model = "models/weapons/arccw_go/atts/laser.mdl"

	att.KeepBaseIrons = true

	att.Laser = false
	att.LaserStrength = 0.2
	att.LaserColor = Color(255, 0, 0)
	att.LaserBone = "laser"
	-- att.Mult_MoveDispersion = 0.5
	--att.Mult_SightTime = 0.9

	att.Mult_MoveSpeed = 0.95

	att.Mult_SightTime = 1.1

	att.ToggleStats = {
	    {
	        PrintName = "Red",
	        Laser = true,
	        LaserColor = Color(255, 0, 0),
	        Mult_HipDispersion = 0.75,
	    },
	    {
	        PrintName = "Green",
	        Laser = true,
	        LaserColor = Color(0, 255, 0),
	        Mult_HipDispersion = 0.75,
	    },
	    {
	        PrintName = "Blue",
	        Laser = true,
	        LaserColor = Color(0, 0, 255),
	        Mult_HipDispersion = 0.75,
	    },
	    {
	        PrintName = "Off",
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- go_laser_peq.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_laser_peq")

	att.PrintName = "5mW Laser"
	att.Icon = Material("entities/acwatt_go_laser_peq.png", "mips smooth")
	att.Description = "High-power laser pointer. Improves hip fire, moving accuracy, and sight time."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.beam"
	}
	att.AutoStats = true
	att.Slot = "tac"

	att.Model = "models/weapons/arccw_go/atts/laser_peq.mdl"

	att.KeepBaseIrons = true

	att.Laser = false
	att.LaserStrength = 1
	att.LaserBone = "laser"

	att.Mult_MoveSpeed = 0.95

	att.ToggleStats = {
	    {
	        PrintName = "Red",
	        Laser = true,
	        LaserColor = Color(255, 0, 0),
	        Mult_HipDispersion = 0.75,
	        Mult_MoveDispersion = 0.75,
	        Mult_SightTime = 0.9,
	    },
	    {
	        PrintName = "Green",
	        Laser = true,
	        LaserColor = Color(0, 255, 0),
	        Mult_HipDispersion = 0.75,
	        Mult_MoveDispersion = 0.75,
	        Mult_SightTime = 0.9,
	    },
	    {
	        PrintName = "Blue",
	        Laser = true,
	        LaserColor = Color(0, 0, 255),
	        Mult_HipDispersion = 0.75,
	        Mult_MoveDispersion = 0.75,
	        Mult_SightTime = 0.9,
	    },
	    {
	        PrintName = "Off",
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- go_laser_surefire.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_laser_surefire")

	att.PrintName = "3mW Laser"
	att.Icon = Material("entities/acwatt_go_laser_surefire.png", "mips smooth")
	att.Description = "Medium-power laser pointer. Improves hip fire and sight time."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.beam"
	}
	att.AutoStats = true
	att.Slot = {"tac_pistol", "tac"}

	att.Model = "models/weapons/arccw_go/atts/laser_surefire.mdl"

	att.KeepBaseIrons = true

	att.Laser = false
	att.LaserStrength = 3 / 5
	att.LaserBone = "laser"

	att.Mult_MoveSpeed = 0.95

	att.Mult_SightTime = 1.1

	att.ToggleStats = {
	    {
	        PrintName = "Red",
	        Laser = true,
	        LaserColor = Color(255, 0, 0),
	        Mult_HipDispersion = 0.75,
	        Mult_MoveDispersion = 0.75,
	    },
	    {
	        PrintName = "Green",
	        Laser = true,
	        LaserColor = Color(0, 255, 0),
	        Mult_HipDispersion = 0.75,
	        Mult_MoveDispersion = 0.75,
	    },
	    {
	        PrintName = "Blue",
	        Laser = true,
	        LaserColor = Color(0, 0, 255),
	        Mult_HipDispersion = 0.75,
	        Mult_MoveDispersion = 0.75,
	    },
	    {
	        PrintName = "Off",
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m1014_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m1014_barrel_long")

	att.PrintName = "750mm M1014 Barrel"
	att.Icon = Material("entities/acwatt_go_m1014_barrel_long.png", "mips smooth")
	att.Description = "Long tactical barrel improves ranged performance, but at the cost of mobility."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_m1014_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_MoveDispersion = 1.25
	att.Mult_SightTime = 1.15
	att.Mult_AccuracyMOA = 0.8
	att.Mult_ShootPitch = 0.95

	ArcCW.LoadAttachmentType(att)
end

------
-- go_m1014_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m1014_barrel_short")

	att.PrintName = "350mm M1014 Barrel"
	att.Icon = Material("entities/acwatt_go_m1014_barrel_short.png", "mips smooth")
	att.Description = "Sawn-off barrel improves handling but increases spread."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_m1014_barrel"

	att.Mult_MoveDispersion = 0.85
	att.Mult_SightTime = 0.85
	att.Mult_AccuracyMOA = 1.5
	att.Mult_ShootPitch = 1.1
	att.Mult_HipDispersion = 0.75

	ArcCW.LoadAttachmentType(att)
end

------
-- go_m1014_mag_4.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m1014_mag_4")

	att.PrintName = "4-Round M1014 Tube"
	att.Icon = Material("entities/acwatt_go_m1014_mag_4.png", "mips smooth")
	att.Description = "Small tube with lighter load. Improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 4
	att.AutoStats = true
	att.Slot = "go_m1014_mag"

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Override_ClipSize = 4
	att.Mult_ReloadTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m1014_mag_7.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m1014_mag_7")

	att.PrintName = "7-Round M1014 Tube"
	att.Icon = Material("entities/acwatt_go_m1014_mag_7.png", "mips smooth")
	att.Description = "Extended magazine with 7-round capacity."
	att.SortOrder = 7
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_m1014_mag"

	att.Mult_MoveSpeed = 0.98
	att.Mult_SightTime = 1.05
	att.Override_ClipSize = 7
	att.Mult_ReloadTime = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m16a2_barrel_med.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m16a2_barrel_med")

	att.PrintName = "370mm Carbine Barrel"
	att.Icon = Material("entities/acwatt_go_ar15_barrel_short.png", "mips smooth")
	att.Description = "Medium-length barrel used on the original M4 carbine."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_m16a2_barrel"
	att.InvAtt = "go_ar15_barrel_med"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.1
	att.Mult_SightTime = 0.85
	att.Mult_AccuracyMOA = 1.25

	att.Mult_ShootPitch = 1.05
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m16a2_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m16a2_barrel_short")

	att.PrintName = "270mm CAR Barrel"
	att.Icon = Material("entities/acwatt_go_ar15_barrel_short.png", "mips smooth")
	att.Description = "Short CAR barrel used in CQB scenarios."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_m16a2_barrel"

	att.Mult_Range = 0.5
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.75
	att.Mult_AccuracyMOA = 1.5

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m16a2_mag_30.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m16a2_mag_30")

	att.PrintName = "30-Round 5.56mm USGI"
	att.Icon = Material("entities/acwatt_go_g3_mag_30_556.png", "mips smooth")
	att.Description = "Standard-sized magazine with a minor decrease in handling."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 20
	att.AutoStats = true
	att.Slot = "go_m16a2_mag"

	att.Mult_SightTime = 1.1
	att.Override_ClipSize = 30
	att.Mult_ReloadTime = 1.05

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload_smallmag" then
	        return "reload"
	    elseif anim == "reload_smallmag_empty" then
	        return "reload_empty"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m249_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m249_barrel_long")

	att.PrintName = "510mm SAW Barrel"
	att.Icon = Material("entities/acwatt_go_m249_barrel_long.png", "mips smooth")
	att.Description = "Heavy squad assault barrel. Good for long range engagements."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_m249_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.3
	att.Mult_AccuracyMOA = 0.75

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m249_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m249_barrel_short")

	att.PrintName = "330mm Para Barrel"
	att.Icon = Material("entities/acwatt_go_m249_barrel_short.png", "mips smooth")
	att.Description = "Compact CQB barrel for commando forces. Gas system has been set to Adverse, improving fire rate at the cost of severe overheating. Improves handling, though offers much worse range and accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_m249_barrel"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.5
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 2

	att.Mult_ShootPitch = 1.1

	att.Mult_HeatCapacity = 0.5
	att.Mult_RPM = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m249_bipod.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m249_bipod")

	att.PrintName = "Integral Bipod"
	att.Icon = Material("entities/acwatt_go_m249_bipod.png", "mips smooth")
	att.Description = "Bring down the bipod, making handling clunkier."

	att.SortOrder = 1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "m249_bipod"

	att.Free = true

	att.Mult_SightTime = 1.15

	att.Bipod = true
	att.Mult_BipodRecoil = 0.45
	att.Mult_BipodDispersion = 0.5
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m249_mag_12g_45.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m249_mag_12g_45")

	att.PrintName = "45-Round 12 Gauge Belt"
	att.Icon = Material("entities/acwatt_go_m249_mag_12g_45.png", "mips smooth")
	att.Description = "Conversion for the M249, turning it into a 12 gauge automatic shotgun."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 45
	att.AutoStats = true
	att.Slot = "go_m249_mag"

	att.Override_MuzzleEffect = "muzzleflash_m3"

	att.Mult_Range = 0.25
	att.Mult_Penetration = 0.1
	att.Mult_Recoil = 2.5
	att.Mult_RPM = 0.75
	att.Mult_AccuracyMOA = 10
	att.Override_ClipSize = 45
	att.Mult_Damage = 3
	att.Mult_DamageMin = 1.5
	att.Mult_HeatCapacity = 0.5
	att.Mult_HipDispersion = 2

	att.Override_Num_Priority = 0.5
	att.Override_Num = 8

	att.Override_IsShotgun = true

	att.Override_Ammo = "buckshot"

	att.Override_ShellModel = "models/shells/shell_12gauge.mdl"
	att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable
	att.Override_ShellScale = 2

	att.Override_Trivia_Class = "Machine Shotgun"
	att.Override_Trivia_Calibre = "12 Gauge"

	att.Override_BulletBones = {
	    [1] = "v_weapon.bullet11",
	    [2] = "v_weapon.bullet09",
	    [3] = "v_weapon.bullet07",
	    [4] = "v_weapon.bullet05",
	    [5] = "v_weapon.bullet03",
	    [6] = "v_weapon.bullet01",
	}

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "arccw_go/m249/m249-1.wav" then return "arccw_go/nova/nova-1.wav" end
	    if fsound == "arccw_go/m4a1/m4a1_silencer_01.wav" then return "arccw_go/m590_suppressed_fp.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m249_mag_9_200.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m249_mag_9_200")

	att.PrintName = "200-Round 9mm Belt"
	att.Icon = Material("entities/acwatt_go_m249_mag_9_200.png", "mips smooth")
	att.Description = "9mm conversion, turning the LMG into a submachine gun with a massive capacity, similar to the SMG 08/18."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 200
	att.AutoStats = true
	att.Slot = "go_m249_mag"

	att.Mult_Range = 0.5
	att.Mult_Penetration = 0.5
	att.Mult_Recoil = 0.9
	att.Mult_RPM = 1.5
	att.Mult_AccuracyMOA = 2
	att.Override_ClipSize = 200
	att.Mult_Damage = 0.75
	att.Mult_DamageMin = 0.75
	att.Mult_HeatCapacity = 2

	att.Override_Ammo = "pistol"

	att.Override_ShellModel = "models/shells/shell_9mm.mdl"

	att.Override_Trivia_Class = "Pistol Machine Gun"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "arccw_go/m249/m249-1.wav" then return "arccw_go/bizon/bizon_02.wav" end
	    if fsound == "arccw_go/m4a1/m4a1_silencer_01.wav" then return "arccw_go/mp5/mp5_01.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m4_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m4_barrel_long")

	att.PrintName = "510mm A4 Barrel"
	att.Icon = Material("entities/acwatt_go_m4_barrel_long.png", "mips smooth")
	att.Description = "Long M16A4 barrel with RIS handguard. Good for long range engagements."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_m4_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.5
	att.Mult_AccuracyMOA = 0.75

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m4_barrel_med.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m4_barrel_med")

	att.PrintName = "370mm Carbine Barrel"
	att.Icon = Material("entities/acwatt_go_m4_barrel_med.png", "mips smooth")
	att.Description = "Medium-length barrel used on the original M4 carbine."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_m4_barrel"

	att.Mult_Range = 1.15
	att.Mult_Recoil = 0.9
	att.Mult_SightTime = 1.1
	att.Mult_AccuracyMOA = 0.9

	att.Mult_ShootPitch = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m4_barrel_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m4_barrel_sd")

	att.PrintName = "300mm INT-SD Barrel"
	att.Icon = Material("entities/acwatt_go_m4_barrel_sd.png", "mips smooth")
	att.Description = "M4 barrel with an integrated silencer. Whisper quiet."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_m4_barrel"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Mult_ShootPitch = 0.9
	att.Mult_ShootVol = 0.75
	att.Mult_AccuracyMOA = 0.75
	att.Mult_Range = 1.25

	att.Mult_SightTime = 1.35

	att.Override_PhysTracerProfile = 7
	att.Override_TracerNum = 0
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m4_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m4_barrel_short")

	att.PrintName = "210mm Compact Barrel"
	att.Icon = Material("entities/acwatt_go_m4_barrel_short.png", "mips smooth")
	att.Description = "Shortened barrel that turns the rifle into a 'Commando' carbine."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_m4_barrel"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.85
	att.Mult_AccuracyMOA = 2

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m4_barrel_stub.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m4_barrel_stub")

	att.PrintName = "50mm Stub Barrel"
	att.Icon = Material("entities/acwatt_go_m4_barrel_stub.png", "mips smooth")
	att.Description = "Ultra-short barrel with horrendous effects on weapon performance. Effectively a gimmick."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_m4_barrel"

	att.Mult_Range = 0.25
	att.Mult_Recoil = 3
	att.Mult_SightTime = 0.5
	att.Mult_AccuracyMOA = 10

	att.Mult_ShootVol = 1.5

	att.LHIK = true
	att.LHIK_JustHide = true
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m4_mag_10_50.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m4_mag_10_50")

	att.PrintName = "10-Round .50 Beowulf"
	att.Icon = Material("entities/acwatt_go_m4_mag_10_50.png", "mips smooth")
	att.Description = "Magazine that converts weapon to .50 Beowulf ammunition. Heavier bullets deal more damage but are not as good at long range. They also kick much more, and not as many can be fit into a magazine."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 10
	att.AutoStats = true
	att.Slot = "go_m4_mag"

	att.Override_ClipSize = 10
	att.Mult_Damage = 1.5
	att.Mult_DamageMin = 1.15
	att.Mult_Range = 0.45
	att.Mult_Recoil = 3
	att.Mult_ShootPitch = 0.85

	att.Override_Ammo = "357"

	att.Override_Trivia_Calibre = ".50 Beowulf"

	att.Hook_GetShootSound = function(wep, ss)
	    if ss == "arccw_go/m4a1/m4a1_02.wav" or ss == "arccw_go/m4a1/m4a1_03.wav" then
	        return "arccw_go/m4a1/m4a1-1-single.wav"
	    elseif ss == "arccw_go/m4a1/m4a1_silencer_01.wav" then
	        return "arccw_go/usp/usp_02.wav"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m4_mag_20.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m4_mag_20")

	att.PrintName = "20-Round 5.56mm USGI"
	att.Icon = Material("entities/acwatt_go_m4_mag_20.png", "mips smooth")
	att.Description = "Small magazine with lighter load. Improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 20
	att.AutoStats = true
	att.Slot = "go_m4_mag"

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Override_ClipSize = 20
	att.Mult_ReloadTime = 0.9

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_smallmag"
	    elseif anim == "reload_empty" then
	        return "reload_smallmag_empty"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m4_mag_21_9mm.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m4_mag_21_9mm")

	att.PrintName = "21-Round 9mm Colt"
	att.Icon = Material("entities/acwatt_go_m4_mag_21_9mm.png", "mips smooth")
	att.Description = "9mm magazine conversion, turning the rifle into a submachine gun. Lighter magazines improve handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 21
	att.AutoStats = true
	att.Slot = "go_m4_mag"

	att.Mult_MoveSpeed = 1.1
	att.Mult_ReloadTime = 0.9

	att.Mult_Range = 0.5
	att.Mult_Penetration = 0.5
	att.Mult_Recoil = 0.9
	att.Mult_SightTime = 0.7
	att.Mult_RPM = 1.5
	att.Mult_AccuracyMOA = 2
	att.Override_ClipSize = 21
	att.Mult_Damage = 0.75
	att.Mult_DamageMin = 0.75

	att.Override_Ammo = "pistol"

	att.Override_ShellModel = "models/shells/shell_9mm.mdl"

	att.Override_Trivia_Class = "Submachine Gun"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "arccw_go/m4a1/m4a1_03.wav" then return "arccw_go/bizon/bizon_02.wav" end
	    if fsound == "arccw_go/m4a1/m4a1_01.wav" then return "arccw_go/bizon/bizon_02.wav" end
	    if fsound == "arccw_go/m4a1/m4a1_02.wav" then return "arccw_go/bizon/bizon_02.wav" end
	    if fsound == "arccw_go/m4a1/m4a1_04.wav" then return "arccw_go/bizon/bizon_02.wav" end
	    if fsound == "arccw_go/m4a1/m4a1_silencer_01.wav" then return "arccw_go/mp5/mp5_01.wav" end
	end

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_smallmag"
	    elseif anim == "reload_empty" then
	        return "reload_smallmag_empty"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m4_mag_30_9mm.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m4_mag_30_9mm")

	att.PrintName = "30-Round 9mm Colt"
	att.Icon = Material("entities/acwatt_go_m4_mag_30_9mm.png", "mips smooth")
	att.Description = "9mm magazine conversion, turning the rifle into a submachine gun."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 30
	att.AutoStats = true
	att.Slot = "go_m4_mag"

	att.Mult_Range = 0.5
	att.Mult_Penetration = 0.5
	att.Mult_Recoil = 0.9
	att.Mult_SightTime = 0.8
	att.Mult_RPM = 1.5
	att.Mult_AccuracyMOA = 2
	att.Override_ClipSize = 30
	att.Mult_Damage = 0.75
	att.Mult_DamageMin = 0.75

	att.Override_Ammo = "pistol"

	att.Override_ShellModel = "models/shells/shell_9mm.mdl"

	att.Override_Trivia_Class = "Submachine Gun"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "arccw_go/m4a1/m4a1_03.wav" then return "arccw_go/bizon/bizon_02.wav" end
	    if fsound == "arccw_go/m4a1/m4a1_01.wav" then return "arccw_go/bizon/bizon_02.wav" end
	    if fsound == "arccw_go/m4a1/m4a1_02.wav" then return "arccw_go/bizon/bizon_02.wav" end
	    if fsound == "arccw_go/m4a1/m4a1_04.wav" then return "arccw_go/bizon/bizon_02.wav" end
	    if fsound == "arccw_go/m4a1/m4a1_silencer_01.wav" then return "arccw_go/mp5/mp5_01.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m4_mag_5_50.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m4_mag_5_50")

	att.PrintName = "5-Round .50 Beowulf"
	att.Icon = Material("entities/acwatt_go_m4_mag_20.png", "mips smooth")
	att.Description = "Magazine that converts weapon to .50 Beowulf ammunition. Heavier bullets deal more damage but are not as good at long range. Small mags are lighter weight."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 5
	att.AutoStats = true
	att.Slot = "go_m4_mag"

	att.InvAtt = "go_m4_mag_20"

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Mult_ReloadTime = 0.9

	att.Override_ClipSize = 5
	att.Mult_Damage = 1.5
	att.Mult_DamageMin = 1.15
	att.Mult_Range = 0.45
	att.Mult_Recoil = 3
	att.Mult_ShootPitch = 0.85

	att.Override_Ammo = "357"

	att.Override_Trivia_Calibre = ".50 Beowulf"

	att.Hook_GetShootSound = function(wep, ss)
	    if ss == "arccw_go/m4a1/m4a1_02.wav" or ss == "arccw_go/m4a1/m4a1_03.wav" then
	        return "arccw_go/m4a1/m4a1-1-single.wav"
	    elseif ss == "arccw_go/m4a1/m4a1_silencer_01.wav" then
	        return "arccw_go/usp/usp_02.wav"
	    end
	end

	att.ActivateElements = {"go_m4_mag_20"}
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m4_stock_m16.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m4_stock_m16")

	att.PrintName = "M16 Stock"
	att.Icon = Material("entities/acwatt_go_m4_stock_m16.png", "mips smooth")
	att.Description = "Solid stock used for the M16 rifle. Improves recoil, at the cost of aim speed."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_m4_stock"

	att.Mult_SightTime = 1.25
	att.Mult_Recoil = 0.9
	att.Mult_MoveDispersion = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m9_mag_24.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m9_mag_24")

	att.PrintName = "24-Round 9mm M92"
	att.Icon = Material("entities/acwatt_go_m9_mag_24.png", "mips smooth")
	att.Description = "Extended magazine for the M9 pistol. Heavy, but may be worth the extra ammo."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 24
	att.AutoStats = true
	att.Slot = "go_m9_mag"

	att.Override_ClipSize = 24

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.15
	att.Mult_ReloadTime = 1.25

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_long"
	    elseif anim == "reload_empty" then
	        return "reload_long_empty"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m9_slide_auto.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m9_slide_auto")

	att.PrintName = "210mm 93R Slide"
	att.Icon = Material("entities/acwatt_go_m9_slide_auto.png", "mips smooth")
	att.Description = "Slide with integral compensator that improves recoil and adds the ability to fire in full auto."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_m9_slide"

	att.Mult_Recoil = 0.95

	att.Mult_RPM = 1.5

	att.Mult_ShootPitch = 0.95

	att.Override_Firemodes = {
	    {
	        Mode = 2
	    },
	    {
	        Mode = 1
	    },
	    {
	        Mode = 0
	    },
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m9_slide_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m9_slide_long")

	att.PrintName = "240mm L Slide"
	att.Icon = Material("entities/acwatt_go_m9_slide_long.png", "mips smooth")
	att.Description = "Long slide that improves range but also adds weight."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_m9_slide"

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.5
	att.Mult_AccuracyMOA = 0.5
	att.Mult_DrawTime = 1.15

	att.Mult_RPM = 0.85

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_m9_slide_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_m9_slide_short")

	att.PrintName = "170mm G Slide"
	att.Icon = Material("entities/acwatt_go_m9_slide_short.png", "mips smooth")
	att.Description = "Compact slide that improves weapon handling and trigger response."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_m9_slide"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 1.5
	att.Mult_DrawTime = 0.75

	att.Mult_RPM = 1.15

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mac10_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mac10_barrel_long")

	att.PrintName = "350mm Carbine Barrel"
	att.Icon = Material("entities/acwatt_go_mac10_barrel_long.png", "mips smooth")
	att.Description = "Long barrel that converts the M-10 into a carbine. Good for long range engagements."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mac10_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.5
	att.Mult_AccuracyMOA = 0.75
	att.Mult_RPM = 0.5

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mac10_barrel_med.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mac10_barrel_med")

	att.PrintName = "200mm Patrol Barrel"
	att.Icon = Material("entities/acwatt_go_mac10_barrel_med.png", "mips smooth")
	att.Description = "Medium-length barrel that moderately improves ballistic performance."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mac10_barrel"

	att.Mult_Range = 1.15
	att.Mult_Recoil = 0.9
	att.Mult_SightTime = 1.15
	att.Mult_AccuracyMOA = 0.9
	att.Mult_RPM = 0.75

	att.Mult_ShootPitch = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mac10_barrel_stub.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mac10_barrel_stub")

	att.PrintName = "50mm Stub Barrel"
	att.Icon = Material("entities/acwatt_go_mac10_barrel_stub.png", "mips smooth")
	att.Description = "Ultra-short barrel with horrendous effects on weapon performance. Prohibits the use of muzzle attachments, as there is simply nothing to attach them to."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mac10_barrel"

	att.Mult_Range = 0.25
	att.Mult_Recoil = 3
	att.Mult_SightTime = 0.5
	att.Mult_AccuracyMOA = 10

	att.Mult_ShootVol = 1.5
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mac10_mag_16.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mac10_mag_16")

	att.PrintName = "16-Round .45 Ingram"
	att.Icon = Material("entities/acwatt_go_mac10_mag_16.png", "mips smooth")
	att.Description = "Small magazine with lighter load. Improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 16
	att.AutoStats = true
	att.Slot = "go_mac10_mag"

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Override_ClipSize = 16
	att.Mult_ReloadTime = 0.9

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_smallmag"
	    elseif anim == "reload_empty" then
	        return "reload_smallmag_empty"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mac10_mag_48.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mac10_mag_48")

	att.PrintName = "48-Round .45 Grave"
	att.Icon = Material("entities/acwatt_go_mac10_mag_48.png", "mips smooth")
	att.Description = "Extended magazine with 48-round capacity and cloth mag pull. Good capacity, but slows handling."
	att.SortOrder = 48
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mac10_mag"

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.25
	att.Override_ClipSize = 48
	att.Mult_ReloadTime = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mac10_stock_heavy.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mac10_stock_heavy")

	att.PrintName = "Heavy Stock"
	att.Icon = Material("entities/acwatt_go_mac10_stock_heavy.png", "mips smooth")
	att.Description = "Solid wooden carbine stock for the MAC-10. Improves recoil, at the cost of aim speed."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mac10_stock"

	att.Mult_SightTime = 1.25
	att.Mult_Recoil = 0.9
	att.Mult_MoveDispersion = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mac10_stock_in.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mac10_stock_in")

	att.PrintName = "Collapsed Stock"
	att.Icon = Material("entities/acwatt_go_mac10_stock_in.png", "mips smooth")
	att.Description = "Collapsing the stock improves handling but reduces recoil controllability."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mac10_stock"

	att.Free = true

	att.Mult_Recoil = 2
	att.Mult_SpeedMult = 1.25
	att.Mult_SightTime = 0.75

	att.NoStock = true
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mag7_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mag7_barrel_long")

	att.PrintName = "440mm MAG-7 Longsword Barrel"
	att.Icon = Material("entities/acwatt_go_mag7_barrel_long.png", "mips smooth")
	att.Description = "Lengthened MAG-7 shotgun barrel reduces spread, but at the cost of mobility."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mag7_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_MoveDispersion = 1.25
	att.Mult_SightTime = 1.15
	att.Mult_AccuracyMOA = 0.8
	att.Mult_ShootPitch = 0.95

	ArcCW.LoadAttachmentType(att)
end

------
-- go_mag7_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mag7_barrel_short")

	att.PrintName = "280mm MAG-7 Bodyguard Barrel"
	att.Icon = Material("entities/acwatt_go_mag7_barrel_short.png", "mips smooth")
	att.Description = "Compact MAG-7 barrel improves handling but increases spread."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mag7_barrel"

	att.Mult_MoveDispersion = 0.85
	att.Mult_SightTime = 0.85
	att.Mult_AccuracyMOA = 1.5
	att.Mult_ShootPitch = 1.1
	att.Mult_HipDispersion = 0.75

	ArcCW.LoadAttachmentType(att)
end

------
-- go_mag7_mag_3.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mag7_mag_3")

	att.PrintName = "3-Round 12-Gauge Mag"
	att.Icon = Material("entities/acwatt_go_mag7_mag_3.png", "mips smooth")
	att.Description = "Small magazine with lighter load. Improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 3
	att.AutoStats = true
	att.Slot = "go_mag7_mag"

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Override_ClipSize = 3
	att.Mult_ReloadTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mag7_mag_7.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mag7_mag_7")

	att.PrintName = "7-Round 12-Gauge Mag"
	att.Icon = Material("entities/acwatt_go_mag7_mag_7.png", "mips smooth")
	att.Description = "Extended magazine with 7-round capacity, bringing the MAG-7 to its namesake capacity. Try saying 'MAG-7 7 Round 12 Gauge Mag 7 times' seven times fast."
	att.SortOrder = 7
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mag7_mag"

	att.Mult_MoveSpeed = 0.98
	att.Mult_SightTime = 1.05
	att.Override_ClipSize = 7
	att.Mult_ReloadTime = 1.1

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_longmag"
	    elseif anim == "reload_empty" then
	        return "reload_longmag_empty"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mag7_stock_heavy.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mag7_stock_heavy")

	att.PrintName = "Longsword Stock"
	att.Icon = Material("entities/acwatt_go_mag7_stock_heavy.png", "mips smooth")
	att.Description = "Solid wooden carbine stock for the MAG-7. Improves moving accuracy but worsens handling. 'Give to me my longsword, ho!'"
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mag7_stock"

	att.Mult_SightTime = 1.25
	att.Mult_Recoil = 0.9
	att.Mult_MoveDispersion = 0.85
	att.Mult_MoveSpeed = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mp5_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mp5_barrel_long")

	att.PrintName = "500mm Carbine Barrel"
	att.Icon = Material("entities/acwatt_go_mp5_barrel_long.png", "mips smooth")
	att.Description = "Civilian long barrel for HK94 carbine. Good for long range engagements."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mp5_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.5
	att.Mult_AccuracyMOA = 0.75

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mp5_barrel_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mp5_barrel_sd")

	att.PrintName = "550mm Whisper Barrel"
	att.Icon = Material("entities/acwatt_go_mp5_barrel_sd.png", "mips smooth")
	att.Description = "MP5SD integral silencer. Reduces weapon report and improves weapon characteristics. Superior handling compared to a standalone suppressor. Subsonic rounds have invisible tracers."
	att.Desc_Pros = {
	    "pro.invistracers"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mp5_barrel"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Mult_ShootPitch = 0.9
	att.Mult_ShootVol = 0.75
	att.Mult_AccuracyMOA = 0.75
	att.Mult_Range = 1.25

	att.Mult_SightTime = 1.1

	att.Override_PhysTracerProfile = 7
	att.Override_TracerNum = 0
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mp5_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mp5_barrel_short")

	att.PrintName = "150mm Kurz Barrel"
	att.Icon = Material("entities/acwatt_go_mp5_barrel_short.png", "mips smooth")
	att.Description = "Shortened barrel for the MP5. Not actually an MP5K barrel."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mp5_barrel"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.85
	att.Mult_AccuracyMOA = 2

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mp5_mag_15.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mp5_mag_15")

	att.PrintName = "15-Round 9mm HK"
	att.Icon = Material("entities/acwatt_go_mp5_mag_15.png", "mips smooth")
	att.Description = "Small magazine with lighter load. Improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 15
	att.AutoStats = true
	att.Slot = "go_mp5_mag"

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Override_ClipSize = 15
	att.Mult_ReloadTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mp5_mag_40.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mp5_mag_40")

	att.PrintName = "40-Round 9mm HK Extended"
	att.Icon = Material("entities/acwatt_go_mp5_mag_40.png", "mips smooth")
	att.Description = "Extended magazine improves capacity at the cost of handling."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 40
	att.AutoStats = true
	att.Slot = "go_mp5_mag"

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.1
	att.Override_ClipSize = 40
	att.Mult_ReloadTime = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mp5_stock_heavy.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mp5_stock_heavy")

	att.PrintName = "Heavy Stock"
	att.Icon = Material("entities/acwatt_go_mp5_stock_heavy.png", "mips smooth")
	att.Description = "Classic-style heavy stock for the MP5. Improves recoil, at the cost of aim speed."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mp5_stock"

	att.Mult_SightTime = 1.25
	att.Mult_Recoil = 0.9
	att.Mult_MoveDispersion = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mp5_stock_in.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mp5_stock_in")

	att.PrintName = "Collapsed Stock"
	att.Icon = Material("entities/acwatt_go_mp5_stock_in.png", "mips smooth")
	att.Description = "Collapsing the stock improves handling but reduces recoil controllability."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mp5_stock"

	att.Free = true

	att.Mult_Recoil = 2
	att.Mult_SpeedMult = 1.25
	att.Mult_SightTime = 0.75

	att.NoStock = true
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mp7_irons.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mp7_irons")

	att.PrintName = "Alternative Irons"
	att.Icon = Material("entities/acwatt_go_optic_noscope.png", "mips smooth")
	att.Description = "Use the pistol irons included on the MP7."

	att.SortOrder = 1337

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mp7_irons"

	att.Free = true

	att.AdditionalSights = {
	    {
	        Pos = Vector(-5.25, -7, 1.87),
	        Ang = Angle(-1.5, 0, 0),
	        GlobalPos = true,
	        GlobalAng = false,
	        Magnification = 1.1,
	        IgnoreExtra = true,
	        CrosshairInSights = false,
	    },
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mp7_mag_20.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mp7_mag_20")

	att.PrintName = "20-Round 4.6mm MP7 Mag"
	att.Icon = Material("entities/acwatt_go_mp7_mag_20.png", "mips smooth")
	att.Description = "Small magazine with lighter load. Improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 20
	att.AutoStats = true
	att.Slot = "go_mp7_mag"

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Override_ClipSize = 20
	att.Mult_ReloadTime = 0.9

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_smallmag"
	    elseif anim == "reload_empty" then
	        return "reload_smallmag_empty"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mp7_mag_40.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mp7_mag_40")

	att.PrintName = "40-Round 4.6mm MP7 Mag"
	att.Icon = Material("entities/acwatt_go_mp7_mag_40.png", "mips smooth")
	att.Description = "Extended magazine with 40-round capacity. Good capacity, but slows handling."
	att.SortOrder = 40
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mp7_mag"

	att.Mult_MoveSpeed = 0.98
	att.Mult_SightTime = 1.05
	att.Override_ClipSize = 40
	att.Mult_ReloadTime = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mp7_stock_in.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mp7_stock_in")

	att.PrintName = "Collapsed Stock"
	att.Icon = Material("entities/acwatt_go_mp7_stock_in.png", "mips smooth")
	att.Description = "Collapsing the stock improves handling but reduces recoil controllability."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mp7_stock"

	att.Free = true

	att.Mult_Recoil = 2
	att.Mult_SpeedMult = 1.25
	att.Mult_SightTime = 0.75
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mp9_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mp9_barrel_long")

	att.PrintName = "350mm Carbine Barrel"
	att.Icon = Material("entities/acwatt_go_mp9_barrel_long.png", "mips smooth")
	att.Description = "Aftermarket extended barrel with covered RIS handguard. Good for long range engagements."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mp9_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.5
	att.Mult_AccuracyMOA = 0.75

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mp9_barrel_med.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mp9_barrel_med")

	att.PrintName = "210mm Plus Barrel"
	att.Icon = Material("entities/acwatt_go_mp9_barrel_med.png", "mips smooth")
	att.Description = "Medium-length extended barrel for the MP9."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mp9_barrel"

	att.Mult_Range = 1.15
	att.Mult_Recoil = 0.9
	att.Mult_SightTime = 1.15
	att.Mult_AccuracyMOA = 0.9

	att.Mult_ShootPitch = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mp9_mag_15.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mp9_mag_15")

	att.PrintName = "15-Round 9mm MP9"
	att.Icon = Material("entities/acwatt_go_mp5_mag_15.png", "mips smooth")
	att.Description = "Small magazine with lighter load. Improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 15
	att.AutoStats = true
	att.Slot = "go_mp9_mag"

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Override_ClipSize = 15
	att.Mult_ReloadTime = 0.9

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_smallmag"
	    elseif anim == "reload_empty" then
	        return "reload_smallmag_empty"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_mp9_stock_in.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_mp9_stock_in")

	att.PrintName = "Folded Stock"
	att.Icon = Material("entities/acwatt_go_mp9_stock_in.png", "mips smooth")
	att.Description = "Folding the stock improves handling but reduces recoil controllability."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_mp9_stock"

	att.Free = true

	att.Mult_Recoil = 2
	att.Mult_SpeedMult = 1.25
	att.Mult_SightTime = 0.75

	att.NoStock = true
	ArcCW.LoadAttachmentType(att)
end

------
-- go_muzz_bayonet.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_muzz_bayonet")

	att.PrintName = "Bayonet"
	att.Icon = Material("entities/acwatt_go_muzz_bayonet.png", "mips smooth")
	att.Description = "Universal barrel-mounted bayonet. Enhances the stabbing power of the weapon."

	att.SortOrder = 1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.Model = "models/weapons/arccw_go/atts/bayonet.mdl"
	att.OffsetAng = Angle(0, 0, -90)

	att.Add_BarrelLength = 3

	att.Mult_SightTime = 1.05

	att.Mult_MoveSpeed = 0.95

	att.Mult_MeleeDamage = 2

	att.Add_BarrelLength = 3

	att.Mult_MeleeTime = 0.9

	att.Add_MeleeRange = 16
	ArcCW.LoadAttachmentType(att)
end

------
-- go_muzz_booster.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_muzz_booster")

	att.PrintName = "Muzzle Booster"
	att.Icon = Material("entities/acwatt_go_muzz_booster.png", "mips smooth")
	att.Description = "Muzzle device that increases gas pressure, improving fire rate on automatic weapons at the cost of increased recoil. Does nothing on manual-action firearms."

	att.SortOrder = 1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.Model = "models/weapons/arccw_go/atts/booster.mdl"

	att.IsMuzzleDevice = true

	att.Add_BarrelLength = 3
	att.Mult_ShootPitch = 1.15
	att.Mult_SightTime = 1.1
	att.Mult_MoveSpeed = 0.9
	att.Mult_RPM = 1.15

	att.Mult_Recoil = 1.25
	att.Mult_RecoilSide = 1.2

	ArcCW.LoadAttachmentType(att)
end

------
-- go_muzz_brake.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_muzz_brake")

	att.PrintName = "Muzzle Brake"
	att.Icon = Material("entities/acwatt_go_muzz_brake.png", "mips smooth")
	att.Description = "Muzzle device that redirects firing gases to help stabilize recoil."

	att.SortOrder = 50

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.Model = "models/weapons/arccw_go/atts/brake.mdl"

	att.IsMuzzleDevice = true

	att.Mult_ShootPitch = 0.8
	att.Mult_SightTime = 1.15
	att.Mult_RecoilSide = 0.8
	att.Mult_Recoil = 0.75

	ArcCW.LoadAttachmentType(att)
end

------
-- go_muzz_flashhider.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_muzz_flashhider")

	att.PrintName = "Flash Hider"
	att.Icon = Material("entities/acwatt_go_muzz_flashhider.png", "mips smooth")
	att.Description = "Muzzle device which hides muzzle flash while improving hip fire characteristics."

	att.SortOrder = 1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.Model = "models/weapons/arccw_go/atts/flashhider.mdl"

	att.Override_MuzzleEffect = "muzzleflash_pistol"
	att.IsMuzzleDevice = true

	att.Mult_HipDispersion = 0.9

	att.Add_BarrelLength = 3

	att.Mult_ShootPitch = 1.05

	att.Mult_SightTime = 1.05

	att.Mult_MoveSpeed = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- go_negev_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_negev_barrel_long")

	att.PrintName = "510mm Heavy Barrel"
	att.Icon = Material("entities/acwatt_go_negev_barrel_long.png", "mips smooth")
	att.Description = "Long Negev barrel with increased twist. Good for long range engagements."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_negev_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.5
	att.Mult_AccuracyMOA = 0.75

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_negev_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_negev_barrel_short")

	att.PrintName = "330mm SF Barrel"
	att.Icon = Material("entities/acwatt_go_negev_barrel_short.png", "mips smooth")
	att.Description = "Shortened barrel for commando use."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_negev_barrel"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.85
	att.Mult_AccuracyMOA = 2

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_negev_belt_100.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_negev_belt_100")

	att.PrintName = "100-Round 5.56mm Negev"
	att.Icon = Material("entities/acwatt_go_negev_belt_100.png", "mips smooth")
	att.Description = "5.56mm conversion for the Negev LMG. Improves fire rate and capacity."
	att.SortOrder = 100
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_negev_belt"

	att.Override_ClipSize = 100

	att.Mult_Range = 0.75
	att.Mult_Penetration = 0.75
	att.Mult_Recoil = 0.65
	att.Mult_RPM = 1.45
	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 0.9

	att.Override_Ammo = "smg1"

	att.Override_Trivia_Calibre = "5.56x45mm NATO"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "arccw_go/negev/negev_04.wav" then return "arccw_go/negev/negev_clean_01.wav" end
	end

	att.Override_BulletBones = {
	    [1] = "v_weapon.bullet_18",
	    [2] = "v_weapon.bullet_17",
	    [3] = "v_weapon.bullet_16",
	    [4] = "v_weapon.bullet_15",
	    [5] = "v_weapon.bullet_14",
	    [6] = "v_weapon.bullet_13",
	    [7] = "v_weapon.bullet_12",
	    [8] = "v_weapon.bullet_11",
	    [9] = "v_weapon.bullet_10",
	    [10] = "v_weapon.bullet_09",
	    [11] = "v_weapon.bullet_08",
	    [12] = "v_weapon.bullet_07",
	    [13] = "v_weapon.bullet_06",
	    [14] = "v_weapon.bullet_05",
	    [15] = "v_weapon.bullet_04",
	    [16] = "v_weapon.bullet_03",
	    [17] = "v_weapon.bullet_02",
	    [18] = "v_weapon.bullet_01",
	    [19] = "v_weapon.bullet_00",
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- go_negev_stock_in.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_negev_stock_in")

	att.PrintName = "Folded Stock"
	att.Icon = Material("entities/acwatt_go_negev_stock_in.png", "mips smooth")
	att.Description = "Folding the stock improves handling but reduces recoil controllability."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_negev_stock"

	att.Free = true

	att.Mult_Recoil = 2
	att.Mult_SpeedMult = 1.25
	att.Mult_SightTime = 0.75

	att.NoStock = true
	ArcCW.LoadAttachmentType(att)
end

------
-- go_nova_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_nova_barrel_long")

	att.PrintName = "710mm Nova Barrel"
	att.Icon = Material("entities/acwatt_go_nova_barrel_long.png", "mips smooth")
	att.Description = "Lengthened Nova hunting shotgun barrel reduces spread, but at the cost of mobility."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_nova_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_MoveDispersion = 1.25
	att.Mult_SightTime = 1.15
	att.Mult_AccuracyMOA = 0.8
	att.Mult_ShootPitch = 0.95

	ArcCW.LoadAttachmentType(att)
end

------
-- go_nova_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_nova_barrel_short")

	att.PrintName = "300mm Nova Barrel"
	att.Icon = Material("entities/acwatt_go_nova_barrel_short.png", "mips smooth")
	att.Description = "Compact Nova tactical barrel improves handling but increases spread."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_nova_barrel"

	att.Mult_MoveDispersion = 0.85
	att.Mult_SightTime = 0.85
	att.Mult_AccuracyMOA = 1.5
	att.Mult_ShootPitch = 1.1

	ArcCW.LoadAttachmentType(att)
end

------
-- go_nova_mag_8.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_nova_mag_8")

	att.PrintName = "8-Round 12-Gauge Tube"
	att.Icon = Material("entities/acwatt_go_nova_mag_8.png", "mips smooth")
	att.Description = "Extended magazine with 8-round capacity."
	att.SortOrder = 7
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_nova_mag"

	att.Mult_MoveSpeed = 0.98
	att.Mult_SightTime = 1.05
	att.Override_ClipSize = 8
	att.Mult_ReloadTime = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_nova_stock_pistol.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_nova_stock_pistol")

	att.PrintName = "Pistol Grip"
	att.Icon = Material("entities/acwatt_go_nova_stock_pistol.png", "mips smooth")
	att.Description = "Pistol grip stock improves handling, at the cost of control."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"go_nova_stock", "go_870_stock"}

	att.Mult_Recoil = 2
	att.Mult_SpeedMult = 1.25
	att.Mult_SightTime = 0.75
	att.Mult_MoveDispersion = 1.25

	att.NoStock = true
	ArcCW.LoadAttachmentType(att)
end

------
-- go_nova_stock_sport.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_nova_stock_sport")

	att.PrintName = "Sport-TAC Stock"
	att.Icon = Material("entities/acwatt_go_nova_stock_sport.png", "mips smooth")
	att.Description = "Adjustable sporting stock for the SuperNova. Improves moving accuracy but worsens handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_nova_stock"

	att.Mult_SightTime = 1.25
	att.Mult_Recoil = 0.9
	att.Mult_MoveDispersion = 0.85
	att.Mult_MoveSpeed = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- go_optic_acog.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_optic_acog")

	att.PrintName = "ACOG TA01 (4x)"
	att.Icon = Material("entities/acwatt_go_optic_acog.png", "mips smooth")
	att.Description = "Magnified medium-range optic. ACOG stands for 'Advanced Combat Optical Gunsight'. Has a backup iron sight that can be used in a pinch."

	att.SortOrder = 4

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw_go/atts/acog.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 9, -1.292),
	        Ang = Angle(0, 0, 0),
	        Magnification = 2,
	        IgnoreExtra = true
	    },
	    {
	        Pos = Vector(0, 9, -2.508),
	        Ang = Angle(0.774, 0, 0),
	        Magnification = 1.1,
	        HolosightData = {
	            Holosight = false
	        }
	    },
	}

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/acog2_go.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 15
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw_go/atts/acog_hsp.mdl"
	att.Colorable = true

	att.HolosightBlackbox = true

	att.HolosightMagnification = 2

	att.Mult_SightTime = 1.1
	att.Mult_SpeedMult = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- go_optic_acog2.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_optic_acog2")

	att.PrintName = "ACOG TA50 (3x)"
	att.Icon = Material("entities/acwatt_go_optic_acog2.png", "mips smooth")
	att.Description = "Lower-magnification magnified gunsight. Lacks a backup iron sight."

	att.SortOrder = 3

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw_go/atts/acog2.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 7.5, -1.370),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.5,
	        IgnoreExtra = true
	    },
	}

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/acog_go.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 15
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw_go/atts/acog2_hsp.mdl"
	att.Colorable = true

	att.HolosightBlackbox = true

	att.HolosightMagnification = 2

	att.Mult_SightTime = 1.1
	att.Mult_SpeedMult = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- go_optic_awp.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_optic_awp")

	att.PrintName = "Arctic Warfare (10x)"
	att.Icon = Material("entities/acwatt_go_optic_awp.png", "mips smooth")
	att.Description = "Long-range optic used for military and police snipers in cold weather conditions."

	att.SortOrder = 10

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw_go/atts/awp.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 11, -1.58597),
	        Ang = Angle(0, 0, 0),
	        Magnification = 5,
	        IgnoreExtra = true
	    },
	}

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/ssr_go.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 20
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw_go/atts/awp_hsp.mdl"
	att.Colorable = true

	att.HolosightBlackbox = true

	att.HolosightMagnification = 2

	att.Mult_SightTime = 1.25
	att.Mult_SpeedMult = 0.925
	ArcCW.LoadAttachmentType(att)
end

------
-- go_optic_barska.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_optic_barska")

	att.PrintName = "Barska Red Dot (RDS)"
	att.Icon = Material("entities/acwatt_go_optic_barska.png", "mips smooth")
	att.Description = "Open red dot sight with circular reticle."

	att.SortOrder = 1

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw_go/atts/barska.mdl"
	att.ModelBodygroups = "00"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 10, -1.18694),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        IgnoreExtra = false
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("hud/holosight/go_barska.png", "mips smooth")
	att.HolosightSize = 1
	att.HolosightBone = "holosight"
	att.HolosightNoFlare = true

	att.Mult_SightTime = 1.01

	att.Colorable = true
	ArcCW.LoadAttachmentType(att)
end

------
-- go_optic_cmore.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_optic_cmore")

	att.PrintName = "C-More (RDS)"
	att.Icon = Material("entities/acwatt_go_optic_cmore.png", "mips smooth")
	att.Description = "Open multipurpose red dot sight."

	att.SortOrder = 1

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw_go/atts/cmore.mdl"

	att.ModelOffset = Vector(0, 0, 0.1)

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 10, -1.26295),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        IgnoreExtra = false
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("hud/holosight/go_cmore.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 2
	att.HolosightBone = "holosight"

	att.Mult_SightTime = 1.01

	att.Colorable = true
	ArcCW.LoadAttachmentType(att)
end

------
-- go_optic_compm4.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_optic_compm4")

	att.PrintName = "CompM4 (RDS)"
	att.Icon = Material("entities/acwatt_go_optic_compm4.png", "mips smooth")
	att.Description = "Tube-based red dot sight for rifles."

	att.SortOrder = 1

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw_go/atts/compm4.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(-0.018321, 10, -1.34972),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        IgnoreExtra = false
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("hud/holosight/go_aimpoint.png", "mips smooth")
	att.HolosightSize = 0.25
	att.HolosightBone = "holosight"

	att.Mult_SightTime = 1.01

	att.Colorable = true
	ArcCW.LoadAttachmentType(att)
end

