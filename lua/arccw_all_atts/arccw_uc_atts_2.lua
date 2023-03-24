local Material = ArcCW.AttachmentMat

------
-- uc_muzzle_supressor_pbs4.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_muzzle_supressor_pbs4")

	att.PrintName = "PBS-4 Suppressor"
	att.Icon = Material("entities/att/pbs4.png", "mips smooth")
	att.Description = "Traps propellant gases from the muzzle, hiding muzzle flash and reducing volume significantly.\nRussian-made. Stats are temporary."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.AutoStats = true
	att.Slot = {"ur_ak_muzzle"}
	att.SortOrder = 149
	att.Model = "models/weapons/arccw/atts/uc_pbs4.mdl"
	att.ModelOffset = Vector(1.25, 0, 0)
	att.ModelScale = Vector(1.3, 1.3, 1.3)
	att.OffsetAng = Angle(0, 0, 0)
	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true
	att.Mult_ShootPitch = 1.1
	att.Mult_ShootVol = 0.75
	att.Mult_Range = 0.85
	att.Mult_RangeMin = 1.25
	att.Add_BarrelLength = 5
	att.Mult_SightTime = 1.15
	att.Mult_Sway = 1.15
	att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
	att.Hook_Compatible = function(wep)
	    if !(wep.Primary.Ammo == "smg1" and table.HasValue(wep:GetWeaponFlags(),"barrel_carbine")) then
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_muzzle_supressor_salvo.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_muzzle_supressor_salvo")

	att.PrintName = "Salvo 12 Suppressor"
	att.Icon = Material("entities/att/acwatt_uc_supressor_salvo.png", "mips smooth")
	att.Description = "Shotgun muzzle device that traps propellant gases, hiding muzzle flash and reducing firing volume. Low profile and relatively lightweight, with no negative ballistic impact."
	att.Desc_Neutrals = {"uc.muzzleblocking"}
	att.AutoStats = true
	att.Slot = {"muzzle_shotgun","muzzle"}
	att.GivesFlags = {"muzzleblocking"}
	att.ExcludeFlags = {"nomuzzleblocking"}
	att.SortOrder = 150
	att.Model = "models/weapons/arccw/atts/ud_silencer_salvo.mdl"
	att.ModelOffset = Vector(-1, 0, -0.12)
	att.OffsetAng = Angle(0, 0, 0)
	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true
	att.Mult_ShootPitch = 1.05
	att.Mult_ShootVol = 0.8
	att.Add_BarrelLength = 8
	att.Mult_SightTime = 1.15
	att.Mult_HipDispersion = 1.1
	att.Mult_Sway = 1.25
	att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_muzzle_supressor_tac.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_muzzle_supressor_tac")

	att.PrintName = "Mountain Armory Tactical Suppressor" -- fictional
	att.AbbrevName = "Tactical Suppressor"
	att.Icon = Material("entities/att/acwatt_uc_supressor_tactical.png", "mips smooth")
	att.Description = "Traps propellant gases from the muzzle, hiding muzzle flash and reducing volume significantly.\nLow-profile and enhances ballistics, but slightly cumbersome."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.AutoStats = true
	att.Slot = {"muzzle"}
	att.SortOrder = 150
	att.Model = "models/weapons/arccw/atts/ud_silencer_tactical.mdl"
	att.ModelOffset = Vector(1.65, 0, 0)
	att.OffsetAng = Angle(0, 0, 0)
	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true
	att.Mult_ShootPitch = 1.1
	att.Mult_ShootVol = 0.75
	att.Mult_Range = 1.1
	att.Add_BarrelLength = 4
	att.Mult_SightTime = 1.2
	att.Mult_Sway = 1.25
	att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
	att.Hook_Compatible = function(wep,data)
	    if !(ArcCW.UC.RifleAmmoTypes[wep.Primary.Ammo]) then
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_muzzle_supressor_tgpa.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_muzzle_supressor_tgpa")

	att.PrintName = "TGP-A Suppressor"
	att.Icon = Material("entities/att/tgpa.png", "mips smooth")
	att.Description = "Traps propellant gases from the muzzle, hiding muzzle flash and reducing volume significantly.\nRussian-made. Stats are temporary."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.AutoStats = true
	att.Slot = {"ur_ak_muzzle"}
	att.SortOrder = 149
	att.Model = "models/weapons/arccw/atts/uc_tgpa.mdl"
	att.ModelOffset = Vector(1.5, 0, 0)
	att.ModelScale = Vector(1.15, 1.15, 1.15)
	att.OffsetAng = Angle(0, 0, 0)
	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true
	att.Mult_ShootPitch = 1.1
	att.Mult_ShootVol = 0.75
	att.Mult_Range = 0.85
	att.Mult_RangeMin = 1.25
	att.Add_BarrelLength = 5
	att.Mult_SightTime = 1.15
	att.Mult_Sway = 1.15
	att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
	att.Hook_Compatible = function(wep)
	    if wep.Primary.Ammo != "ar2" then
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_optic_acog.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_optic_acog")

	att.PrintName = "Trijicon Advanced Combat Optical Gunsight (4x)"
	att.AbbrevName = "ACOG (4x)"
	att.Icon = Material("entities/att/acwatt_uc_optic_acog.png", "mips smooth")
	att.Description = "Medium range combat scope for improved precision at longer ranges.\nEquipped with backup iron sights for use in emergencies."
	att.SortOrder = 4
	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Neutrals = {"uc.bus"}
	att.AutoStats = true
	att.Slot = {"optic", "ud_optic", "ud_acog"}
	att.Model = "models/weapons/arccw/atts/ud_acog.mdl"
	att.ModelOffset = Vector(0, 0, 0)
	att.ModelScale = Vector(1.15, 1.15, 1.15)
	att.OffsetAng = Angle(0, 0, 0)
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 9, -1.48),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.25,
	        IgnoreExtra = true,
	        CrosshairInSights = false,
	        HolosightBone = "holosight",
	        HolosightData = {
	            Holosight = true,
	            HolosightReticle = Material("hud/scopes/uc_acog_reticle.png", "mips smooth"),
	            HolosightNoFlare = true,
	            HolosightSize = 9.5,
	            HolosightPiece = "models/weapons/arccw/atts/ud_acog_hsp.mdl",
	            HolosightBlackbox = true,
	            HolosightMagnification = 4,
	            Colorable = true,
	        },
	    },
	    {
	        Pos = Vector(-0.005, 11, -2.632),
	        Ang = Angle(-1, 0, 0),
	        Magnification = 1.1,
	        IgnoreExtra = true,
	        HolosightData = {
	            Holosight = false,
	        },
	    },
	}
	att.Colorable = true
	att.HolosightPiece = "models/weapons/arccw/atts/ud_acog_hsp.mdl"
	att.Mult_SightedSpeedMult = 0.75
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_optic_annihilator.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_optic_annihilator")

	att.PrintName = "Annihilator Handcannon Laser"
	att.AbbrevName = "Annihilator Laser"
	--att.Icon = Material("entities/att/acwatt_uc_tac_flashlight1.png", "mips smooth")
	att.Description = "Oversized laser module with iron sights, attached on the upper rail."
	att.Desc_Cons = {
	    "con.beam"
	}
	att.AutoStats = true
	att.Slot = {"ur_deagle_tritium"} -- Deagle exclusive until we figure out the problem with the model
	att.SortOrder = 998 -- Remove when att becomes universal
	att.Model = "models/weapons/arccw/atts/ur_annihilator_laser.mdl"
	att.ModelOffset = Vector(-6,0,-3.8) -- Will need to change when the model recompiles
	att.Mult_Sway = 1.5
	att.Mult_SightTime = 1.25
	att.Mult_SpeedMult = 0.975
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 20, -1.73),
	        Ang = Angle(-.2, 0, 0),
	        Magnification = 1,
	    }
	}
	att.LaserStrength = 2
	att.ToggleStats = {
	    {
	        PrintName = "On",
	        Laser = true,
	        LaserBone = "laser",
	        LaserColor = Color(50, 255, 50),
	        Mult_HipDispersion = 0.75,
	        Mult_MoveDispersion = 0.6,
	        Mult_SightTime = 0.85
	    },
	    {
	        PrintName = "Off",
	        Laser = false,
	    },
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_optic_eotech.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_optic_eotech")

	att.PrintName = "EOTech XPS3-0 (HOLO)"
	att.AbbrevName = "EOTech (HOLO)"
	att.Icon = Material("entities/att/acwatt_uc_optic_eotech.png", "mips smooth")
	att.Description = "Close range holographic sight that improves sighted visibility and assists target acquisition."
	att.SortOrder = 1
	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"
	att.Model = "models/weapons/arccw/atts/ud_eotech.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 10, -1.25),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        IgnoreExtra = false
	    }
	}
	--[[att.ModelScale = Vector(1.25, 1.25, 1.25)
	att.ModelOffset = Vector(0, -0.05, 0)]]
	att.Holosight = true
	att.HolosightReticle = Material("hud/reticles/uc_holo.png", "mips smooth")
	att.HolosightSize = 1
	att.HolosightBone = "holosight"
	att.HolosightNoFlare = true
	att.Colorable = true
	att.Ignore = true
	att.Mult_SightedSpeedMult = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_optic_kobra.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_optic_kobra")

	att.PrintName = "Kobra EKP-8-16 Reflex Sight (RDS)"
	att.AbbrevName = "Kobra (RDS)"
	att.Icon = Material("entities/att/kobra.png", "mips smooth")
	att.Description = "Improves sighted visibility with a red-dot targeting reticle, while adding minimal extra weight.\nExclusive to the \"Warsaw Pact\" optic mount."
	att.SortOrder = 299
	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "Double-tap +USE to toggle reticles"
	}
	att.AutoStats = true
	att.Slot = {"ur_ak_optic"}
	att.Model = "models/weapons/arccw/atts/ur_kobra.mdl"
	att.ModelOffset = Vector(-2, 0, -4.55)
	local R1, R2, R3, R4 = Material("hud/reticles/uc_kobra1.png", "mips smooth"), Material("hud/reticles/uc_kobra2.png", "mips smooth"), Material("hud/reticles/uc_kobra3.png", "mips smooth"), Material("hud/reticles/uc_kobra4.png", "mips smooth")
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 13, -1.3),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        
	        HolosightData = {
	            HolosightReticle = R1,
	            HolosightPiece = "models/weapons/arccw/atts/ur_kobra_hsp.mdl",
	            HolosightNoFlare = true,
	            HolosightSize = 1.5,
	            HolosightBone = "holosight",
	            Colorable = true
	        }
	    },
	    {
	        Pos = Vector(0, 13, -1.3),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        
	        HolosightData = {
	            HolosightReticle = R2,
	            HolosightPiece = "models/weapons/arccw/atts/ur_kobra_hsp.mdl",
	            HolosightNoFlare = true,
	            HolosightSize = 2,
	            HolosightBone = "holosight",
	            Colorable = true
	        }
	    },
	    {
	        Pos = Vector(0, 13, -1.3),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        
	        HolosightData = {
	            HolosightReticle = R3,
	            HolosightPiece = "models/weapons/arccw/atts/ur_kobra_hsp.mdl",
	            HolosightNoFlare = true,
	            HolosightSize = 2,
	            HolosightBone = "holosight",
	            Colorable = true
	        }
	    },
	    {
	        Pos = Vector(0, 13, -1.3),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        
	        HolosightData = {
	            HolosightReticle = R4,
	            HolosightPiece = "models/weapons/arccw/atts/ur_kobra_hsp.mdl",
	            HolosightNoFlare = true,
	            HolosightSize = 2,
	            HolosightBone = "holosight",
	            Colorable = true
	        }
	    },
	}
	att.Holosight = true
	att.HolosightPiece = "models/weapons/arccw/atts/ur_kobra_hsp.mdl"
	att.Mult_SightedSpeedMult = .9
	att.ExcludeFlags = {"ak_norail","cover_rail"}
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_optic_leupold_dppro.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_optic_leupold_dppro")

	att.PrintName = "Leupold DeltaPoint Pro Reflex Sight (LP)"
	att.AbbrevName = "DP-Pro (LP)"
	att.Icon = Material("entities/att/dppro.png", "mips smooth")
	att.Description = "Low-profile reflex sight. While its lens isn't as wide as other reflex sights, it's significantly lighter and small enough to use on pistols."
	att.SortOrder = 0.5
	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"optic", "optic_lp"}
	att.Model = "models/weapons/arccw/atts/uc_leupold_dppro.mdl"
	att.ModelScale = Vector(1.32, 1.56, 1.2)
	att.ModelOffset = Vector(0, -0.05, 0.15)
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 12, -0.85),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}
	att.Holosight = true
	att.HolosightReticle = Material("hud/reticles/uc_reddot.png", "mips smooth")
	att.HolosightPiece = "models/weapons/arccw/atts/uc_leupold_dppro_hsp.mdl"
	att.HolosightNoFlare = true
	att.HolosightSize = 2.5
	att.HolosightBone = "holosight"
	att.Colorable = true
	att.Mult_SightedSpeedMult = .99
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_optic_micro_t1.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_optic_micro_t1")

	att.PrintName = "AIMPOINT Micro T-1 Red Dot Reflex Sight (RDS)"
	att.AbbrevName = "Micro T-1 (RDS)"
	att.Icon = Material("entities/att/t1.png", "mips smooth")
	att.Description = "Improves sighted visibility with a red-dot targeting reticle, while adding minimal extra weight."
	att.SortOrder = 1
	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"optic"}
	att.Model = "models/weapons/arccw/atts/uc_mirco_t1.mdl"
	att.ModelOffset = Vector(0,0,0.2)
	att.ModelScale = Vector(1.2,1.2,1.2)
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 12, -1.59),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}
	att.Holosight = true
	att.HolosightReticle = Material("hud/reticles/uc_reddot.png", "mips smooth")
	att.HolosightPiece = "models/weapons/arccw/atts/uc_mirco_t1_hsp.mdl"
	att.HolosightNoFlare = true
	att.HolosightSize = 1
	att.HolosightBone = "holosight"
	att.Colorable = true
	att.Mult_SightedSpeedMult = .9
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_optic_nvis.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_optic_nvis")

	att.PrintName = "N-Vision HALO-LR Thermal Scope (3.5-6.5x)"
	att.AbbrevName = "HALO-LR (3.5-6.5x)"
	att.Icon = Material("entities/att/nvis.png", "mips smooth")
	att.Description = "Cutting-edge night vision optic that highlights targets via infrared imaging. The complicated electronics result in a massive weight gain for the base weapon."
	att.SortOrder = 6.5
	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	    "autostat.thermal"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "Double-tap +USE to toggle imaging modes"
	}
	att.AutoStats = true
	att.Slot = {"optic"}
	att.Model = "models/weapons/arccw/atts/uc_nvis.mdl"
	att.ModelOffset = Vector(0, 0, 0.18)
	att.AdditionalSights = {
	    {
	        Pos = Vector(-0.035, 7, -1.25),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ScopeMagnificationMin = 3.5,
	        ScopeMagnificationMax = 6.5,
	        ZoomLevels = 3,
	        ScopeMagnification = 5,
	        Thermal = true,
	        ThermalScopeColor = Color(255, 255, 255),
	        ThermalHighlightColor = Color(255, 255, 255),
	        ThermalFullColor = false,
	        ThermalScopeSimple = false,
	        ThermalNoCC = false,
	        ThermalBHOT = false,
	        IgnoreExtra = true,
	        Contrast = 0.51,
	        Brightness = 0.1,
	        ForceLowRes = true,
	        FPSLock = 42,
	        -- SpecialScopeFunction = function(screen)
	            -- render.PushRenderTarget(screen)
	            
	            -- DrawBloom(0,0.3,5,5,3,0.5,1,1,1)
	            -- DrawSharpen(1,1.65)
	            -- DrawMotionBlur(0.45,1,1/45)
	            -- render.PopRenderTarget()
	        -- end,
	    },
	    {
	        Pos = Vector(-0.035, 7, -1.25),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ScopeMagnificationMin = 3.5,
	        ScopeMagnificationMax = 6.5,
	        ZoomLevels = 3,
	        ScopeMagnification = 5,
	        Thermal = true,
	        ThermalScopeColor = Color(255, 255, 255),
	        ThermalHighlightColor = Color(0, 0, 0),
	        ThermalFullColor = false,
	        ThermalScopeSimple = false,
	        ThermalNoCC = false,
	        ThermalBHOT = false,
	        IgnoreExtra = true,
	        Contrast = 0.7,
	        Brightness = 0.5,
	        ForceLowRes = true,
	        FPSLock = 42,
	        -- SpecialScopeFunction = function(screen)
	            -- render.PushRenderTarget(screen)
	            
	            -- DrawBloom(0, 0.3, 5, 5, 3, 0.5, 1, 1, 1)
	            -- DrawSharpen(1, 1.65)
	            -- DrawMotionBlur(0.45, 1, 1/45)
	            -- render.PopRenderTarget()
	        -- end,
	    },
	}
	att.ScopeGlint = true
	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/uc_nvis_reticle1grid.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 9
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw/atts/uc_nvis_hsp.mdl"
	att.Colorable = false
	att.HolosightBlackbox = true
	att.HolosightMagnification = 5
	att.Mult_SightTime = 1.25
	att.Mult_SightedSpeedMult = 0.65
	att.Mult_SpeedMult = 0.9
	att.Mult_Sway = 1.5
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_optic_pso1.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_optic_pso1")

	att.PrintName = "PSO-1 (4x)"
	att.AbbrevName = "PSO-1 (4x)"
	att.Icon = Material("entities/att/pso1.png", "mips smooth")
	att.Description = "Medium range combat scope for improved precision at longer ranges.\nExclusive to the \"Warsaw Pact\" optic mount."
	att.SortOrder = 300
	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"ur_ak_optic"}
	att.Model = "models/weapons/arccw/atts/ur_pso1.mdl"
	att.ModelOffset = Vector(-2, 0, -4.55)
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 13, -1.5),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.25,
	        HolosightData = {
	            Holosight = true,
	            HolosightReticle = Material("hud/scopes/uc_pso.png", "mips smooth"),
	            HolosightNoFlare = true,
	            HolosightSize = 10.5,
	            HolosightPiece = "models/weapons/arccw/atts/ur_pso1_hsp.mdl",
	            HolosightBlackbox = true,
	            HolosightMagnification = 4,
	            Colorable = true,
	        },
	    }
	}
	-- att.Holosight = true
	-- att.HolosightReticle = Material("mifl_tarkov_reticle/dot.png", "mips smooth")
	att.HolosightPiece = "models/weapons/arccw/atts/ur_pso1_hsp.mdl"
	-- att.HolosightNoFlare = true
	-- att.HolosightSize = 1
	-- att.HolosightBone = "holosight"
	att.Colorable = true
	att.Mult_SightedSpeedMult = .8
	att.ExcludeFlags = {"ak_norail","cover_rail"}
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_optic_sureshot.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_optic_sureshot")

	att.PrintName = "Sightmark Sure Shot Reflex Sight (RDS)"
	att.AbbrevName = "Sure Shot (RDS)"
	att.Icon = Material("entities/att/sureshot.png", "mips smooth")
	att.Description = "Improves sighted visibility with a red-dot targeting reticle, while adding minimal extra weight."
	att.SortOrder = 1
	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"optic"}
	att.Model = "models/weapons/arccw/atts/uc_sureshot.mdl"
	att.ModelOffset = Vector(0,0,.2)
	att.ModelScale = Vector(1.1,1.1,1.1)
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 12, -1.7),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}
	att.Holosight = true
	att.HolosightReticle = Material("hud/reticles/uc_reddot.png", "mips smooth")
	att.HolosightPiece = "models/weapons/arccw/atts/uc_sureshot_hsp.mdl"
	att.HolosightNoFlare = true
	att.HolosightSize = 1
	att.HolosightBone = "holosight"
	att.Colorable = true
	att.Mult_SightedSpeedMult = .9
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_optic_trijicon_tars.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_optic_trijicon_tars")

	att.PrintName = "Trijicon Tactical Advanced Riflescope (3-15x)"
	att.AbbrevName = "TARS (3-15x)"
	att.Icon = Material("entities/att/tars.png", "mips smooth")
	att.Description = "Variable power scope, adjustable for a very wide range of magnifications."
	att.SortOrder = 15
	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"optic"}
	att.Model = "models/weapons/arccw/atts/uc_trijicon_tars.mdl"
	att.ModelOffset = Vector(0, 0, 0.1)
	att.ModelScale = Vector(1.05,1.05,1.05)
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 12, -1.55),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ScopeMagnificationMin = 3,
	        ScopeMagnificationMax = 15,
	        ScopeMagnification = 8,
	        HolosightData = {
	            Holosight = true,
	            HolosightReticle = Material("hud/scopes/uc_tars_reticle.png", "mips smooth"),
	            HolosightNoFlare = true,
	            HolosightSize = 10.2,
	            HolosightPiece = "models/weapons/arccw/atts/uc_trijicon_tars_hsp.mdl",
	            HolosightBlackbox = true,
	            HolosightMagnification = 8,
	            Colorable = true,
	            SpecialScopeFunction = function(screen)
	                render.PushRenderTarget(screen)
	                DrawBloom(0,0.3,5,5,3,0.5,1,1,1)
	                DrawSharpen(1,1.65)
	                DrawMotionBlur(0.45,1,1/45)
	                render.PopRenderTarget()
	            end,
	        },
	    }
	}
	-- att.Holosight = true
	-- att.HolosightReticle = Material("mifl_tarkov_reticle/dot.png", "mips smooth")
	att.HolosightPiece = "models/weapons/arccw/atts/uc_trijicon_tars_hsp.mdl"
	-- att.HolosightNoFlare = true
	-- att.HolosightSize = 1
	-- att.HolosightBone = "holosight"
	att.Colorable = true
	att.Mult_SightedSpeedMult = .7
	att.Mult_SightTime = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_optic_vortex_3x.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_optic_vortex_3x")

	att.PrintName = "Vortex SPITFIRE 3X PRISM SCOPE (1.5x-3x)"
	att.AbbrevName = "Spitfire (1.5x-3x)"
	att.Icon = Material("entities/att/vortex.png", "mips smooth")
	att.Description = "Short to medium range combat scope that allows a more versatile engagement range."
	att.SortOrder = 3
	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"optic"}
	att.Model = "models/weapons/arccw/atts/uc_vortex3x.mdl"
	att.ModelOffset = Vector(0, 0, 0.18)
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 12, -1.6),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ScopeMagnificationMin = 1.5,
	        ScopeMagnificationMax = 3,
	        ScopeMagnification = 3,
	        HolosightData = {
	            Holosight = true,
	            HolosightReticle = Material("hud/scopes/uc_vortex_reticle.png", "mips smooth"),
	            HolosightNoFlare = true,
	            HolosightSize = 7,
	            HolosightPiece = "models/weapons/arccw/atts/uc_vortex3x_hsp.mdl",
	            HolosightBlackbox = true,
	            HolosightMagnification = 3,
	            Colorable = true,
	        },
	    }
	}
	-- att.Holosight = true
	-- att.HolosightReticle = Material("mifl_tarkov_reticle/dot.png", "mips smooth")
	att.HolosightPiece = "models/weapons/arccw/atts/uc_vortex3x_hsp.mdl"
	-- att.HolosightNoFlare = true
	-- att.HolosightSize = 1
	-- att.HolosightBone = "holosight"
	att.Colorable = true
	att.Mult_SightedSpeedMult = .8
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_powder_high.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_powder_high")

	att.PrintName = "Increased Load"
	att.SortOrder = 19
	att.Icon = Material("entities/att/acwatt_uc_powder_high.png", "smooth mips")
	att.Description = "Ammunition loaded with a higher amount of powder, slightly increasing ballistic performance."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_powder"
	att.AutoStats = true
	att.Mult_Recoil = 1.15
	att.Mult_Range = 1.2
	att.Mult_ShootVol = 1.15
	att.Mult_RPM = 1.04
	--att.Mult_ShootPitch = 0.95 please don't
	att.Mult_MalfunctionMean = 0.85
	att.Mult_PhysBulletMuzzleVelocity = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_powder_low.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_powder_low")

	att.PrintName = "Reduced Load"
	att.SortOrder = 18
	att.Icon = Material("entities/att/acwatt_uc_powder_low.png", "smooth mips")
	att.Description = "Underpressured ammunition places less strain on the weapon, but lowers muzzle velocity and cyclic rate."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_powder"
	att.AutoStats = true
	att.Mult_Recoil = 0.85
	att.Mult_Range = 0.8
	att.Mult_RPM = 0.95
	att.Mult_ShootVol = 0.9
	--att.Mult_ShootPitch = 1.05 please don't
	att.Mult_MalfunctionMean = 1.15
	att.Mult_PhysBulletMuzzleVelocity = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_powder_overpressure.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_powder_overpressure")

	att.PrintName = "Overpressured"
	att.SortOrder = 20
	att.Icon = Material("entities/att/acwatt_uc_powder_overpressure.png", "smooth mips")
	att.Description = "Higher pressure ammunition allows for higher muzzle velocity at the cost of stronger knockback. Such immense pressure increases the likelihood of extraction failures."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_powder"
	att.AutoStats = true
	att.Mult_RecoilSide = 1.25
	att.Mult_Recoil = 1.2
	att.Mult_RangeMin = 1.25
	att.Mult_Range = 1.3
	att.Mult_RPM = 1.08
	att.Mult_ShootVol = 1.25
	--att.Mult_ShootPitch = 0.9 please don't
	att.Mult_MalfunctionMean = 0.7
	att.Mult_PhysBulletMuzzleVelocity = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_powder_subsonic.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_powder_subsonic")

	att.PrintName = "Subsonic"
	att.SortOrder = 17
	att.Icon = Material("entities/att/acwatt_uc_powder_subsonic.png", "smooth mips")
	att.Description = [[Powder load low enough to make the bullet travel slower than the speed of sound. This reduces range significantly, but makes gunfire very comfortable and quiet (comparatively speaking).
	The sonic boom typical of the round is eliminated, rendering it even more silent than usual with a suppressed firearm.]]
	att.Desc_Pros = {
	    "pro.invistracers",
	    "uc.subsonic"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_powder"
	att.AutoStats = true
	att.Mult_RecoilSide = 0.75
	att.Mult_Recoil = 0.8
	att.Mult_RangeMin = 0.75
	att.Mult_Range = 0.7
	att.Mult_RPM = 0.89
	att.Mult_ShootVol = 0.7
	--att.Mult_ShootPitch = 1.1 please don't
	att.Override_PhysTracerProfile = 7
	att.Override_TracerNum = 0
	att.Mult_MalfunctionMean = 1.3
	att.Mult_PhysBulletMuzzleVelocity = 0.75
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSoundSilenced then
	        return false
	    end
	end
	att.GivesFlags = {"powder_subsonic"}
	att.ExcludeFlags = {"cal_subsonic"}
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tac_anpeq16a.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tac_anpeq16a")

	att.PrintName = "Insight Technologies MIPIM AN/PEQ-16A"
	att.AbbrevName = "AN/PEQ-16A"
	att.Icon = Material("entities/att/anpeq16a.png", "mips smooth")
	att.Description = "Low-profile flashlight and laser module for rifles. The laser increases accuracy without the use of sights.\nThe laser and flashlight can be toggled individually."
	att.Desc_Pros = {
	    "uc.light"
	}
	att.Desc_Cons = {
	    "con.light"
	}
	att.Desc_Neutrals = {}
	att.AutoStats = true
	att.Slot = {"tac"}
	att.SortOrder = .9
	att.Model = "models/weapons/arccw/atts/uc_anpeq16a.mdl"
	att.ModelOffset = Vector(0, 0.1, 0.25)
	att.OffsetAng = Angle(0, 0,180)
	att.ModelScale = Vector(1.2, 1.2, 1.2)
	att.ModelSkin = 1
	att.Laser = false
	att.LaserStrength = 2 / 5
	att.LaserBone = "laser"
	att.ColorOptionsTable = {Color(255, 0, 0, 150)}
	att.Mult_SightTime = 1.05
	att.Mult_SightedSpeedMult = 0.95
	att.Mult_MoveSpeed = 1
	att.Flashlight = false
	att.FlashlightFOV = 50
	att.FlashlightFarZ = 512 -- how far it goes
	att.FlashlightNearZ = 1 -- how far away it starts
	att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR -- LINEAR, CONSTANT, QUADRATIC are available
	att.FlashlightColor = Color(255, 235, 229)
	att.FlashlightTexture = "effects/flashlight001"
	att.FlashlightBrightness = 2
	att.FlashlightBone = "laser"
	att.ToggleStats = {
	    {
	        PrintName = "Laser",
	        Laser = true,
	        Mult_HipDispersion = 0.8,
	        Mult_MoveDispersion = 0.8
	    },
	    {
	        PrintName = "Both",
	        Laser = true,
	        Flashlight = true,
	        Mult_HipDispersion = 0.8,
	        Mult_MoveDispersion = 0.8
	    },
	    {
	        PrintName = "Light",
	        Flashlight = true,
	    },
	    {
	        PrintName = "Off",
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tac_anpeq16a_tan.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tac_anpeq16a_tan")

	att.PrintName = "Insight Technologies MIPIM AN/PEQ-16A (Tan)"
	att.AbbrevName = "AN/PEQ-16A (Tan)"
	att.Icon = Material("entities/att/anpeq16a_tan.png", "mips smooth")
	att.Description = "Low-profile flashlight and laser module for rifles. The laser increases accuracy without the use of sights.\nThe laser and flashlight can be toggled individually. This unit is cosmetically colored tan."
	att.Desc_Pros = {
	    "uc.light"
	}
	att.Desc_Cons = {
	    "con.light"
	}
	att.Desc_Neutrals = {}
	att.AutoStats = true
	att.Slot = {"tac"}
	att.SortOrder = .9
	att.Model = "models/weapons/arccw/atts/uc_anpeq16a.mdl"
	att.ModelOffset = Vector(0, 0.1, 0.25)
	att.OffsetAng = Angle(0, 0,180)
	att.ModelScale = Vector(1.2, 1.2, 1.2)
	att.Laser = false
	att.LaserStrength = 2 / 5
	att.LaserBone = "laser"
	att.ColorOptionsTable = {Color(255, 0, 0, 150)}
	att.Mult_SightTime = 1.05
	att.Mult_SightedSpeedMult = 0.95
	att.Mult_MoveSpeed = 1
	att.Flashlight = false
	att.FlashlightFOV = 50
	att.FlashlightFarZ = 512 -- how far it goes
	att.FlashlightNearZ = 1 -- how far away it starts
	att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR -- LINEAR, CONSTANT, QUADRATIC are available
	att.FlashlightColor = Color(255, 235, 229)
	att.FlashlightTexture = "effects/flashlight001"
	att.FlashlightBrightness = 2
	att.FlashlightBone = "laser"
	att.ToggleStats = {
	    {
	        PrintName = "Laser",
	        Laser = true,
	        Mult_HipDispersion = 0.8,
	        Mult_MoveDispersion = 0.8
	    },
	    {
	        PrintName = "Both",
	        Laser = true,
	        Flashlight = true,
	        Mult_HipDispersion = 0.8,
	        Mult_MoveDispersion = 0.8
	    },
	    {
	        PrintName = "Light",
	        Flashlight = true,
	    },
	    {
	        PrintName = "Off",
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tac_anpeq2.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tac_anpeq2")

	att.PrintName = "Insight Technologies ATPIAL AN/PEQ-2"
	att.AbbrevName = "AN/PEQ-2"
	att.Icon = Material("entities/att/anpeq2.png", "mips smooth")
	att.Description = "Large flashlight and laser module for rifles, with a stronger, more effective laser that also aids target acquisition.\nThe laser and flashlight can be toggled individually."
	att.Desc_Pros = {
	    "uc.light"
	}
	att.Desc_Cons = {
	    "con.light"
	}
	att.Desc_Neutrals = {}
	att.AutoStats = true
	att.Slot = {"tac"}
	att.SortOrder = .9
	att.Model = "models/weapons/arccw/atts/uc_anpeq2.mdl"
	att.ModelOffset = Vector(0, 0.01, 0.35)
	att.OffsetAng = Angle(0, 0,180)
	att.ModelScale = Vector(1.2, 1.2, 1.2)
	att.ModelSkin = 1
	att.Laser = false
	att.LaserStrength = 3.5 / 5
	att.LaserBone = "laser"
	att.ColorOptionsTable = {Color(255, 0, 0, 150)}
	att.Mult_SightTime = 1.1
	att.Mult_SightedSpeedMult = 0.9
	att.Mult_MoveSpeed = 1
	att.Flashlight = false
	att.FlashlightFOV = 50
	att.FlashlightFarZ = 512 -- how far it goes
	att.FlashlightNearZ = 1 -- how far away it starts
	att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR -- LINEAR, CONSTANT, QUADRATIC are available
	att.FlashlightColor = Color(255, 235, 229)
	att.FlashlightTexture = "effects/flashlight001"
	att.FlashlightBrightness = 2
	att.FlashlightBone = "laser"
	att.ToggleStats = {
	    {
	        PrintName = "Laser",
	        Laser = true,
	        Mult_HipDispersion = 0.7,
	        Mult_MoveDispersion = 0.8,
	        Mult_SightTime = .9,
	        Mult_SightedSpeedMult = .75
	    },
	    {
	        PrintName = "Both",
	        Laser = true,
	        Flashlight = true,
	        Mult_HipDispersion = 0.7,
	        Mult_MoveDispersion = 0.8,
	        Mult_SightTime = .9,
	        Mult_SightedSpeedMult = .75
	    },
	    {
	        PrintName = "Light",
	        Flashlight = true,
	    },
	    {
	        PrintName = "Off",
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tac_anpeq2_tan.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tac_anpeq2_tan")

	att.PrintName = "Insight Technologies ATPIAL AN/PEQ-2 (Tan)"
	att.AbbrevName = "AN/PEQ-2 (Tan)"
	att.Icon = Material("entities/att/anpeq2_tan.png", "mips smooth")
	att.Description = "Large flashlight and laser module for rifles, with a stronger, more effective laser that also aids target acquisition.\nThe laser and flashlight can be toggled individually. This unit is cosmetically colored tan."
	att.Desc_Pros = {
	    "uc.light"
	}
	att.Desc_Cons = {
	    "con.light"
	}
	att.Desc_Neutrals = {}
	att.AutoStats = true
	att.Slot = {"tac"}
	att.SortOrder = .9
	att.Model = "models/weapons/arccw/atts/uc_anpeq2.mdl"
	att.ModelOffset = Vector(0, 0.01, 0.35)
	att.OffsetAng = Angle(0, 0,180)
	att.ModelScale = Vector(1.2, 1.2, 1.2)
	att.Laser = false
	att.LaserStrength = 3.5 / 5
	att.LaserBone = "laser"
	att.ColorOptionsTable = {Color(255, 0, 0, 150)}
	att.Mult_SightTime = 1.1
	att.Mult_SightedSpeedMult = 0.9
	att.Mult_MoveSpeed = 1
	att.Flashlight = false
	att.FlashlightFOV = 50
	att.FlashlightFarZ = 512 -- how far it goes
	att.FlashlightNearZ = 1 -- how far away it starts
	att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR -- LINEAR, CONSTANT, QUADRATIC are available
	att.FlashlightColor = Color(255, 235, 229)
	att.FlashlightTexture = "effects/flashlight001"
	att.FlashlightBrightness = 2
	att.FlashlightBone = "laser"
	att.ToggleStats = {
	    {
	        PrintName = "Laser",
	        Laser = true,
	        Mult_HipDispersion = 0.7,
	        Mult_MoveDispersion = 0.8,
	        Mult_SightTime = .9,
	        Mult_SightedSpeedMult = .75
	    },
	    {
	        PrintName = "Both",
	        Laser = true,
	        Flashlight = true,
	        Mult_HipDispersion = 0.7,
	        Mult_MoveDispersion = 0.8,
	        Mult_SightTime = .9,
	        Mult_SightedSpeedMult = .75
	    },
	    {
	        PrintName = "Light",
	        Flashlight = true,
	    },
	    {
	        PrintName = "Off",
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tac_flashlight1.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tac_flashlight1")

	att.PrintName = "Civilian Rail-Mounted Flashlight"
	att.AbbrevName = "Civilian Flashlight"
	att.Icon = Material("entities/att/acwatt_uc_tac_flashlight1.png", "mips smooth")
	att.Description = "Illuminates dark areas in front of the muzzle.\nCan be adjusted for a wide light."
	att.Desc_Pros = {
	    "uc.light"
	}
	att.Desc_Cons = {
	    "con.light"
	}
	att.Desc_Neutrals = {}
	att.AutoStats = true
	att.Slot = {"tac","tac_pistol"}
	att.SortOrder = .9
	att.Model = "models/weapons/arccw/atts/ud_flashlight_1.mdl"
	att.ModelOffset = Vector(0,0,.1)
	att.OffsetAng = Angle(0,0,180)
	att.ModelScale = Vector(1.2,1.2,1.2)
	att.Flashlight = false
	att.FlashlightFOV = 50
	att.FlashlightFarZ = 1024 -- how far it goes
	att.FlashlightNearZ = 1 -- how far away it starts
	att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR -- LINEAR, CONSTANT, QUADRATIC are available
	att.FlashlightColor = Color(255, 242, 229)
	att.FlashlightTexture = "effects/flashlight001"
	att.FlashlightBrightness = 3
	att.FlashlightBone = "light"
	att.ToggleStats = {
	    {
	        PrintName = "On",
	        Flashlight = true
	    },
	    {
	        PrintName = "Wide",
	        Flashlight = true,
	        FlashlightFOV = 80,
	        FlashlightFarZ = 768,
	        FlashlightBrightness = 1
	    },
	    {
	        PrintName = "Off",
	        Flashlight = false,
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tac_flashlight2.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tac_flashlight2")

	att.PrintName = "Tactical Rail-Mounted Flashlight"
	att.AbbrevName = "Tactical Flashlight"
	att.Icon = Material("entities/att/acwatt_uc_tac_flashlight2.png", "mips smooth")
	att.Description = "Illuminates dark areas in front of the muzzle.\nCan be adjusted for a focused light."
	att.Desc_Pros = {
	    "uc.light"
	}
	att.Desc_Cons = {
	    "con.light"
	}
	att.Desc_Neutrals = {}
	att.AutoStats = true
	att.Slot = {"tac","tac_pistol"}
	att.SortOrder = 1
	att.Model = "models/weapons/arccw/atts/ud_flashlight_2.mdl"
	att.ModelOffset = Vector(0,0,-.15)
	att.Flashlight = false
	att.FlashlightFOV = 50
	att.FlashlightFarZ = 1024 -- how far it goes
	att.FlashlightNearZ = 1 -- how far away it starts
	att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR -- LINEAR, CONSTANT, QUADRATIC are available
	att.FlashlightColor = Color(255, 255, 255)
	att.FlashlightTexture = "effects/flashlight001"
	att.FlashlightBrightness = 3
	att.FlashlightBone = "light"
	att.ToggleStats = {
	    {
	        PrintName = "On",
	        Flashlight = true
	    },
	    {
	        PrintName = "Tight",
	        Flashlight = true,
	        FlashlightFOV = 30,
	        FlashlightFarZ = 1536,
	        FlashlightBrightness = 5
	    },
	    {
	        PrintName = "Off",
	        Flashlight = false,
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tac_flashlight3.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tac_flashlight3")

	att.PrintName = "High-Power Rail-Mounted Flashlight"
	att.AbbrevName = "High-Power Flashlight"
	att.Icon = Material("entities/att/flashlight.png", "mips smooth")
	att.Description = "Illuminates dark areas in front of the muzzle.\nEmits a strong, orange-tinted light."
	att.Desc_Pros = {
	    "uc.light"
	}
	att.Desc_Cons = {
	    "con.light"
	}
	att.Desc_Neutrals = {}
	att.AutoStats = true
	att.Slot = {"tac"}
	att.SortOrder = .9
	att.Model = "models/weapons/arccw/atts/uc_flashlight.mdl"
	att.ModelOffset = Vector(0.5,0,-0.07)
	att.OffsetAng = Angle(0,0,0)
	att.ModelScale = Vector(0.75,0.75,0.75)
	att.Flashlight = false
	att.FlashlightFOV = 40
	att.FlashlightFarZ = 1536 -- how far it goes
	att.FlashlightNearZ = 1 -- how far away it starts
	att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR -- LINEAR, CONSTANT, QUADRATIC are available
	att.FlashlightColor = Color(255, 229, 200)
	att.FlashlightTexture = "effects/flashlight001"
	att.FlashlightBrightness = 4
	att.FlashlightBone = "flashlight"
	att.ToggleStats = {
	    {
	        PrintName = "On",
	        Flashlight = true
	    },
	    {
	        PrintName = "Off",
	        Flashlight = false,
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tac_tlr2hl.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tac_tlr2hl")

	att.PrintName = "TLR-2 HL Pistol Flashlight"
	att.AbbrevName = "TLR-2 HL"
	att.Icon = Material("entities/att/pistolflashlight.png", "mips smooth")
	att.Description = "A combined flashlight and laser module for pistols.\nThe laser and flashlight can be toggled individually."
	att.Desc_Pros = {
	    "uc.light"
	}
	att.Desc_Cons = {
	    "con.light"
	}
	att.Desc_Neutrals = {}
	att.AutoStats = true
	att.Slot = {"tac","tac_pistol"}
	att.SortOrder = .9
	att.Model = "models/weapons/arccw/atts/uc_tlr2hl.mdl"
	att.ModelOffset = Vector(0.75,0,0)
	att.OffsetAng = Angle(0,0,0)
	att.ModelScale = Vector(0.75, 0.75, 0.75)
	att.Laser = false
	att.LaserStrength = 2 / 5
	att.LaserBone = "laser"
	att.ColorOptionsTable = {Color(255, 0, 0, 150)}
	att.Mult_SightTime = 1.05
	att.Mult_SightedSpeedMult = 0.95
	att.Mult_MoveSpeed = 1
	att.Flashlight = false
	att.FlashlightFOV = 50
	att.FlashlightFarZ = 512 -- how far it goes
	att.FlashlightNearZ = 1 -- how far away it starts
	att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR -- LINEAR, CONSTANT, QUADRATIC are available
	att.FlashlightColor = Color(255, 235, 229)
	att.FlashlightTexture = "effects/flashlight001"
	att.FlashlightBrightness = 2
	att.FlashlightBone = "laser"
	att.ToggleStats = {
	    {
	        PrintName = "Laser",
	        Laser = true,
	        Mult_HipDispersion = 0.8,
	        Mult_MoveDispersion = 0.8
	    },
	    {
	        PrintName = "Both",
	        Laser = true,
	        Flashlight = true,
	        Mult_HipDispersion = 0.8,
	        Mult_MoveDispersion = 0.8
	    },
	    {
	        PrintName = "Light",
	        Flashlight = true,
	    },
	    {
	        PrintName = "Off",
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_bruiser.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_bruiser")

	att.PrintName = "Bruiser"
	att.Icon = Material("entities/att/arccw_uc_tp_bruiser.png", "smooth mips")
	att.Description = "With the proper technique and upper body strength, you can more quickly and effectively use your weapon as a bludgeon."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 19
	att.Mult_MeleeDamage = 1.35
	att.Mult_MeleeTime = .67
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_dropshot.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_dropshot")

	att.PrintName = "Dropshot"
	att.Icon = Material("entities/att/arccw_uc_tp_dropshot.png", "smooth mips")
	att.Description = "Expert training in high-verticality maneuvers, allowing for pinpoint shooting while descending from heights or jumping."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 18
	att.Mult_JumpDispersion = 0
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_fastreload.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_fastreload")

	att.PrintName = "Loading Drills"
	att.Icon = Material("entities/att/arccw_uc_tp_loading_drills.png", "smooth mips")
	att.Description = "Every second counts in the heat of battle. Repeated training drills allow you to reload your weapon more quickly."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 13
	att.Mult_ReloadTime = 0.9
	-- CS/GSO rapid reload OP
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_fastspeed.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_fastspeed")

	att.PrintName = "Endurance"
	att.Icon = Material("entities/att/arccw_uc_tp_endurance.png", "smooth mips")
	att.Description = "Long courses of physical training allow you to bear more weight, reducing the influence of your weapon's bulk on your walking and running speed."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 17
	att.Mult_MoveSpeed = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_firmgrip.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_firmgrip")

	att.PrintName = "Firm Grip"
	att.Icon = Material("entities/att/arccw_uc_tp_firm_grip.png", "smooth mips")
	att.Description = "Long hours spent training to control the recoil of your weapon have paid off - you are less affected by your weapon's kick and can stay on target for longer."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 16
	att.Mult_Recoil = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_fullstroke.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_fullstroke")

	att.PrintName = "Full Stroke"
	att.Icon = Material("entities/att/arccw_uc_full_stroke.png", "smooth mips")
	att.Description = "Specialist training and a little extra gun oil allow you to cycle the action more quickly after a shot, improving your rate of fire."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 15
	att.Mult_CycleTime = .9
	att.Hook_Compatible = function(wep)
	    if !wep:GetBuff_Override("Override_ManualAction", wep.ManualAction) then
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_gang.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_gang")

	att.PrintName = "Homeboy"
	-- BANDIT STYLE IS BACK, BABY
	att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
	att.Description = "GANGSTAS ROLL UP IN DA HOOD, POP POP POP POP POP [-----], I BALL HARD STICK A GLOCK UP IN YOUR FACE [-----], DROP DROP DROP DROP DROP GO YOUR HOMIES [-----]"
	att.Desc_Pros = {
	    "uc.homeboy"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 14
	att.Mult_HipDispersion = 0.5
	att.Mult_RecoilSide = 1.25
	att.Mult_SightTime = 1.75
	att.Mult_Sway = 1.5
	att.LHIK = true
	att.LHIKHide = true
	att.Override_ActivePos = Vector(1, 0, 1)
	att.Override_ActiveAng = Angle(0, 0, -60)
	att.Override_RecoilDirection = Angle(0.707, -0.707, 0)
	att.Override_RecoilDirectionSide = Angle(0.707, 0.707, 0)
	att.Override_AddSightRoll = -45
	att.Hook_Compatible = function(wep, data)
	    if wep:GetIsManualAction() and wep:GetBuff("HoldtypeActive") ~= "pistol" and wep:GetBuff("HoldtypeActive") ~= "revolver" then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_gong.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_gong")

	att.PrintName = "Action Hero"
	att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
	att.Description = "Operate the firearm using only one hand. This improves weapon mobility, but accurate fire becomes difficult at best and near impossible at worst.\nBecause accuracy is already out the window, practictioners of this style also opt to shoot while sprinting at full speed."
	att.Desc_Pros = {
	    --"+6% Coolness"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 20
	att.Override_ShootWhileSprint = true
	att.Mult_HipDispersion = 0.75
	att.Mult_ReloadTime = .9
	att.Mult_Recoil = 1.5
	att.Mult_RecoilSide = 2.5
	att.Mult_SightTime = 1.5
	att.Mult_Sway = 2
	--att.Mult_MoveDispersion = 2
	att.Mult_MoveSpeed = .95
	att.LHIK = true
	att.LHIKHide = true
	att.Override_HoldtypeActive = "pistol"
	att.Override_HoltypeActive_Priority = 999
	att.Override_HoldtypeSights = "pistol"
	att.Override_HoltypeSights_Priority = 999
	att.Override_HoldtypeHolstered = "normal"
	att.Hook_Compatible = function(wep, data)
	    if wep:GetIsManualAction() and wep:GetBuff("HoldtypeActive") ~= "pistol" and wep:GetBuff("HoldtypeActive") ~= "revolver" then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_maneuver.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_maneuver")

	att.PrintName = "Maneuver"
	att.Icon = Material("entities/att/arccw_uc_tp_manuever.png", "smooth mips")
	att.Description = "Drills in confined spaces allow you to more effectively handle long weapons in close quarters."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 12
	att.Add_BarrelLength = -10
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_neverflinch.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_neverflinch")

	att.PrintName = "Never Flinch"
	att.Icon = Material("entities/att/arccw_uc_tp_never_flinch.png", "smooth mips")
	att.Description = "Like the linesmen of World War One, you have practiced to shoot while walking towards the enemy. When firing, you can walk at your normal speed."
	att.Desc_Pros = {
	    "uc.neverflinch"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 10
	att.Override_ShootSpeedMult = 1
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_operator.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_operator")

	att.PrintName = "Operator"
	att.Icon = Material("entities/att/arccw_uc_tp_operator.png", "smooth mips")
	att.Description = "Extensive live fire operations have made your reactions to firearm recoil much less disorienting."
	att.Desc_Pros = {
	    "uc.operator"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 9
	att.Mult_VisualRecoilMult = 0.2
	att.Mult_RecoilSide = 0.8
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_overload.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_overload")

	att.PrintName = "Overload"
	att.Icon = Material("entities/att/arccw_uc_tp_overload.png", "smooth mips")
	att.Description = "With a little well-placed grease and some physical force, most magazines can be made to accept an extra round."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 8
	att.Add_ClipSize = 1
	att.Hook_Compatible = function(wep)
	    if wep:GetCapacity() == 1 then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_pointman.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_pointman")

	att.PrintName = "Pointman"
	att.Icon = Material("entities/att/arccw_uc_tp_pointman.png", "smooth mips")
	att.Description = "Firearms and dexterity training for quick response in breaching situations.\nThe pointman is always the first to enter, and the first to identify and disable threats."
	att.Desc_Pros = {
	    "uc.pointman"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 7
	att.M_Hook_Mult_RPM = function(wep, data)
	    if wep:GetCurrentFiremode().Mode == 1 then
	        data.mult = data.mult * 1.15
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_pointshoot.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_pointshoot")

	att.PrintName = "Point Shooting"
	att.Icon = Material("entities/att/arccw_uc_tp_point_shooting.png", "smooth mips")
	att.Description = "Dedicated practice at shooting without using the sights has given you the ability to fire from the hip more effectively. If John Rambo can do it, so can you."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 6
	att.Mult_HipDispersion = .75
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_quickdraw.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_quickdraw")

	att.PrintName = "Quick Draw"
	att.Icon = Material("entities/att/arccw_uc_tp_quickdraw.png", "smooth mips")
	att.Description = "Like the fastest guns in the Old West, you can draw and shoot in the blink of an eye.\n\nTexas Red had not cleared leather 'fore a bullet fairly ripped, and the Ranger's aim was deadly with the big iron on his hip."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 5
	att.Mult_DrawTime = 0.5
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_runandgun.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_runandgun")

	att.PrintName = "Run and Gun"
	att.Icon = Material("entities/att/arccw_uc_tp_run_and_gun.png", "smooth mips")
	att.Description = "Moving-while-shooting drills allow you to aim more steadily even while moving between cover or across open ground."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 4
	att.Mult_MoveDispersion = .5
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_snapshot.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_snapshot")

	att.PrintName = "Snapshot"
	att.Icon = Material("entities/att/arccw_uc_tp_snapshot.png", "smooth mips")
	att.Description = "Your experience with reflex drills allow you to aim down the sights of your weapon more quickly."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 3
	att.Mult_SightTime = 0.85
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_strafe.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_strafe")

	att.PrintName = "Strafe"
	att.Icon = Material("entities/att/arccw_uc_tp_strafe.png", "smooth mips")
	att.Description = "Active experience in simulated combat drills allows you to move more quickly while staying on target."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 2
	att.Mult_SightedSpeedMult = 1.2
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_sway.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_sway")

	att.PrintName = "Nerves of Steel"
	att.Icon = Material("entities/att/arccw_uc_tp_nerves_of_steel.png", "smooth mips")
	att.Description = "A series of carefully honed concentration and nerve techniques, plus a good helping of Diazepam, reduce hand jitter while aiming."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 11
	att.Mult_Sway = .5
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_technician.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_technician")

	att.PrintName = "Technician"
	--att.Icon = Material("entities/att/arccw_uc_tp_never_flinch.png", "smooth mips") Todo
	att.Description = "Life around this particular firearm has given you a solid understanding of its mechanism. When it malfunctions, you can clear the jam with enough speed to stay in the fight."
	att.Desc_Pros = {
	    "uc.technician"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 1.5
	att.Mult_MalfunctionFixTime = .65
	att.Ignore = true -- MalfunctionFixTime currently only works visually (8z fix pls)
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_tp_underload.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_tp_underload")

	att.PrintName = "Underload"
	att.Icon = Material("entities/att/arccw_uc_tp_underload.png", "smooth mips")
	att.Description = "Just because it fits, does not mean you have to fill it. Partially filled magazines reduces follower stress and improves feeding rate."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.underload"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_tp"
	att.AutoStats = true
	att.SortOrder = 1
	function att.Hook_GetCapacity(wep, cap)
	    return math.max(math.floor(cap * (1 - 0.14)), 1)
	end
	att.Hook_Compatible = function(wep)
	    if wep:GetCapacity() == 1 then return false end
	end
	att.Mult_MalfunctionMean = 1.25
	att.Mult_HeatCapacity = 1.25
	att.Mult_RPM = 1.05
	att.Mult_ReloadTime = 0.95
	att.GivesFlags = {"ud_underload"}
	att.ExcludeFlags = {"ud_loosesprings"}
	ArcCW.LoadAttachmentType(att)
end

