local Material = ArcCW.AttachmentMat

------
-- go_optic_elcan.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_optic_elcan")

	att.PrintName = "ELCAN C79 (3.5x)"
	att.Icon = Material("entities/acwatt_go_optic_elcan.png", "mips smooth")
	att.Description = "Magnified precision combat optic for light machine guns. Provides effective magnification."

	att.SortOrder = 3.5

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw_go/atts/elcan.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 9, -1.51577),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.75,
	        IgnoreExtra = true
	    },
	    {
	        Pos = Vector(0, 9, -2.75),
	        Magnification = 1.1,
	        HolosightData = {
	            Holosight = false
	        }
	    },
	}

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/elcan_go.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 11
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw_go/atts/elcan_hsp.mdl"
	att.Colorable = true

	att.HolosightBlackbox = true

	att.HolosightMagnification = 2

	att.Mult_SightTime = 1.1
	att.Mult_SpeedMult = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- go_optic_eotech.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_optic_eotech")

	att.PrintName = "EOTech 553 (RDS)"
	att.Icon = Material("entities/acwatt_go_optic_eotech.png", "mips smooth")
	att.Description = "Boxy holographic sight for long rifles."

	att.SortOrder = 1

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw_go/atts/eotech.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0.025, 10, -1.13633) * 1.25,
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        IgnoreExtra = false
	    }
	}

	att.ModelScale = Vector(1.25, 1.25, 1.25)
	att.ModelOffset = Vector(0, -0.05, 0)

	att.Holosight = true
	att.HolosightReticle = Material("hud/holosight/go_eotech.png", "mips smooth")
	att.HolosightSize = 1
	att.HolosightBone = "holosight"
	att.HolosightNoFlare = true

	att.Mult_SightTime = 1.01

	att.Colorable = true
	ArcCW.LoadAttachmentType(att)
end

------
-- go_optic_hamr.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_optic_hamr")

	att.PrintName = "Leupold HAMR (HYBR)"
	att.Icon = Material("entities/acwatt_go_optic_hamr.png", "mips smooth")
	att.Description = "Zoom scope with integrated red dot sight. Slightly heavier than similar scopes."

	att.SortOrder = 2.5

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}

	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw_go/atts/hamr.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 9, -1.56325),
	        Ang = Angle(0, 0, 0),
	        Magnification = 2,
	        ScopeMagnification = 3,
	        HolosightBone = "scope",
	        HolosightData = {
	            Holosight = true,
	            HolosightMagnification = 2,
	            HolosightReticle = Material("hud/scopes/hamr_go.png", "mips smooth"),
	            HolosightNoFlare = true,
	            HolosightSize = 12,
	            HolosightBlackbox = true,
	            Colorable = true,
	            HolosightPiece = "models/weapons/arccw/atts/hamr_hsp.mdl"
	        },
	        IgnoreExtra = true,
	    },
	    {
	        Pos = Vector(0, 10, -2.94738),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.5,
	        HolosightBone = "holosight",
	        HolosightData = {
	            Holosight = true,
	            HolosightReticle =  Material("hud/holosight/go_aimpoint.png", "mips smooth"),
	            HolosightSize = 0.25,
	            Colorable = true,
	            HolosightNoHSP = true
	        },
	        IgnoreExtra = true
	    },
	}

	att.Holosight = true
	att.HolosightPiece = "models/weapons/arccw_go/atts/hamr_hsp.mdl"

	att.Mult_SightTime = 1.15
	att.Mult_SpeedMult = 0.925
	ArcCW.LoadAttachmentType(att)
end

------
-- go_optic_hunter.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_optic_hunter")

	att.PrintName = "Hunter Compact (2.5x)"
	att.Icon = Material("entities/acwatt_go_optic_hunter.png", "mips smooth")
	att.Description = "Reduced size scope for pistols and light rifles."

	att.SortOrder = 2.5

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"optic", "optic_lp"}

	att.Model = "models/weapons/arccw_go/atts/hunter.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 12, -1.43061),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.25,
	        IgnoreExtra = true
	    },
	}

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/ssr_go.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 20
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw_go/atts/hunter_hsp.mdl"
	att.Colorable = true

	att.HolosightBlackbox = true

	att.HolosightMagnification = 2.5

	att.Mult_SightTime = 1.1
	att.Mult_SpeedMult = 0.975
	ArcCW.LoadAttachmentType(att)
end

------
-- go_optic_kobra.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_optic_kobra")

	att.PrintName = "EKP-8-18 Kobra (RDS)"
	att.Icon = Material("entities/acwatt_go_optic_kobra.png", "mips smooth")
	att.Description = "Russian reflex sight with open cross reticle. Also known as the 'Kobra'."

	att.SortOrder = 1

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw_go/atts/kobra.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 10, -0.965102),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        IgnoreExtra = false
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("hud/holosight/go_kobra.png", "mips smooth")
	att.HolosightSize = 1
	att.HolosightBone = "holosight"
	att.HolosightNoFlare = true

	att.Mult_SightTime = 1.01

	att.Colorable = true
	ArcCW.LoadAttachmentType(att)
end

------
-- go_optic_lp_rmr.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_optic_lp_rmr")

	att.PrintName = "Trijicon RMR (LP)"
	att.Icon = Material("entities/acwatt_go_optic_lp_rmr.png", "mips smooth")
	att.Description = "Low-profile red dot sight for pistols with a triangular reticle."

	att.SortOrder = 0

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic_lp"

	att.Model = "models/weapons/arccw_go/atts/rmr.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 10, -1.00037),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        IgnoreExtra = false
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("hud/holosight/go_delta.png", "mips smooth")
	att.HolosightSize = 0.5
	att.HolosightNoFlare = true
	att.HolosightBone = "holosight"

	att.Mult_SightTime = 1.01

	att.Colorable = true
	ArcCW.LoadAttachmentType(att)
end

------
-- go_optic_lp_t1.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_optic_lp_t1")

	att.PrintName = "Micro T1 (LP)"
	att.Icon = Material("entities/acwatt_go_optic_t1lp.png", "mips smooth")
	att.Description = "Low-profile red dot sight that provides an effective aiming dot, mounted on a low-profile rail."

	att.SortOrder = 0

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic_lp"

	att.Model = "models/weapons/arccw_go/atts/t1lp.mdl"

	att.InvAtt = "go_optic_t1"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 10, -0.815288),
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

------
-- go_optic_noscope.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_optic_noscope")

	att.PrintName = "No Scope"
	att.Icon = Material("entities/acwatt_go_optic_noscope.png", "mips smooth")
	att.Description = "Remove iron sights and aim down the rail. Could be useful in combination with laser sights."

	att.SortOrder = -1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.noscope"
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Free = true

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 15, -1),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.25,
	        IgnoreExtra = true
	    },
	}

	att.Mult_SightTime = 0.975
	ArcCW.LoadAttachmentType(att)
end

------
-- go_optic_pvs4.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_optic_pvs4")

	att.PrintName = "PVS-4 (2xIR)"
	att.Icon = Material("entities/acwatt_go_optic_pvs4.png", "mips smooth")
	att.Description = "Bulky, low-zoom night vision image intensifying optic that picks up infrared light as yellow, highlighting hot targets."

	att.SortOrder = 102

	att.Desc_Pros = {
	    "autostat.thermal",
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw_go/atts/pvs4.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 12, -1.70029),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.25,
	        IgnoreExtra = true,
	        Thermal = true,
	        ThermalScopeColor = Color(0, 255, 0),
	        ThermalHighlightColor = Color(255, 255, 0),
	    },
	}

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/pvs4_go.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 10
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw_go/atts/pvs4_hsp.mdl"
	att.Colorable = false
	att.HolosightColor = Color(0, 255, 0)

	att.HolosightBlackbox = true

	att.HolosightMagnification = 2

	att.Mult_SightTime = 1.5
	att.Mult_SpeedMult = 0.875
	ArcCW.LoadAttachmentType(att)
end

------
-- go_optic_schmidt.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_optic_schmidt")

	att.PrintName = "PM-II (7x)"
	att.Icon = Material("entities/acwatt_go_optic_schmidt.png", "mips smooth")
	att.Description = "Medium-long range sniper optic. Popular among hunters."

	att.SortOrder = 7

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw_go/atts/schmidt.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 12, -1.43061),
	        Ang = Angle(0, 0, 0),
	        Magnification = 3.5,
	        IgnoreExtra = true
	    },
	}

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/schmidt_go.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 20
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw_go/atts/schmidt_hsp.mdl"
	att.Colorable = true

	att.HolosightBlackbox = true

	att.HolosightMagnification = 2

	att.Mult_SightTime = 1.2
	att.Mult_SpeedMult = 0.925
	ArcCW.LoadAttachmentType(att)
end

------
-- go_optic_sg1.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_optic_sg1")

	att.PrintName = "SG1 Scope (6x)"
	att.Icon = Material("entities/acwatt_go_optic_sg1.png", "mips smooth")
	att.Description = "Long range optic designed specifically for the G3SG1 rifle."

	att.SortOrder = 100

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_g3_scope"

	att.Model = "models/weapons/arccw_go/atts/sg1.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0.025, -2, -8.667),
	        Ang = Angle(0, 0, 0),
	        Magnification = 3,
	        IgnoreExtra = true
	    },
	}

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/triple_go.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 15
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw_go/atts/sg1_hsp.mdl"
	att.Colorable = true

	att.HolosightBlackbox = true

	att.HolosightMagnification = 2

	att.Mult_SightTime = 1.15
	att.Mult_SpeedMult = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- go_optic_ssr.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_optic_ssr")

	att.PrintName = "LPVO Scope (8x)"
	att.Icon = Material("entities/acwatt_go_optic_ssr.png", "mips smooth")
	att.Description = "Low Power Variable Optic with the ability to adjust its zoom level depending on the situation."

	att.SortOrder = 8

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw_go/atts/ssr.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 12, -1.95),
	        Ang = Angle(0, 0, 0),
	        Magnification = 4,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        IgnoreExtra = true,
	        ZoomLevels = 6,
	        ZoomSound = "arccw_go/fiveseven/fiveseven_slideback.wav",
	    },
	}

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/ssr_go.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 20
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw_go/atts/ssr_hsp.mdl"
	att.Colorable = true

	att.HolosightBlackbox = true

	att.HolosightMagnification = 2
	att.HolosightMagnificationMin = 1.01
	att.HolosightMagnificationMax = 2

	att.Mult_SightTime = 1.2
	att.Mult_SpeedMult = 0.925
	ArcCW.LoadAttachmentType(att)
end

------
-- go_optic_t1.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_optic_t1")

	att.PrintName = "Micro T1 (RDS)"
	att.Icon = Material("entities/acwatt_go_optic_t1.png", "mips smooth")
	att.Description = "Low-profile red dot sight that provides an effective aiming dot. Mounted on a riser to improve clearance."

	att.SortOrder = 1

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw_go/atts/t1.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 10, -1.21455),
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

------
-- go_p2000_mag_24.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_p2000_mag_24")

	att.PrintName = "24-Round 9mm P2000"
	att.Icon = Material("entities/acwatt_go_p2000_mag_24.png", "mips smooth")
	att.Description = "Extended magazine for the P2000 pistol. Medium length balances increased capacity with increased weight."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 24
	att.AutoStats = true
	att.Slot = "go_p2000_mag"

	att.Override_ClipSize = 24

	att.Mult_MoveSpeed = 0.99
	att.Mult_SightTime = 1.05
	att.Mult_ReloadTime = 1.05

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
-- go_p2000_slide_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_p2000_slide_long")

	att.PrintName = "120mm P2000L Slide"
	att.Icon = Material("entities/acwatt_go_p2000_slide_long.png", "mips smooth")
	att.Description = "Long P2000 slide that improves range but also adds weight."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_p2000_slide"

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
-- go_p2000_slide_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_p2000_slide_short")

	att.PrintName = "80mm P2000SK Slide"
	att.Icon = Material("entities/acwatt_go_p2000_slide_short.png", "mips smooth")
	att.Description = "Compact slide that improves weapon handling and trigger response."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_p2000_slide"

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
-- go_p250_mag_13_40sw.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_p250_mag_13_40sw")

	att.PrintName = "13-Round .40 S&W P250"
	att.Icon = Material("entities/acwatt_go_p250_mag_regular.png", "mips smooth")
	att.Description = "Barrel and magazine kit converting to .40 S&W. It performs slightly better at range than the .357 SIG."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 4.5
	att.AutoStats = true
	att.Slot = "go_p250_mag"
	att.Override_Trivia_Calibre = ".40 S&W"

	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 1.1
	att.Mult_Range = 1.2
	--att.Mult_ShootPitch = 1.1

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return "arccw_go/usp/usp_unsilenced_01.wav" end
	end
	--[[att.Hook_GetDistantShootSound = function(wep, sound)
	    if snd == wep.DistantShootSound then return "arccw_go/usp/usp_unsil-1-distant.wav" end
	end]]
	ArcCW.LoadAttachmentType(att)
end

------
-- go_p250_mag_15_45acp.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_p250_mag_15_45acp")

	att.PrintName = "15-Round .45 ACP P250"
	att.Icon = Material("entities/acwatt_go_p250_mag_21.png", "mips smooth")
	att.Description = "Extended magazine for the .45 ACP conversion."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 5
	att.AutoStats = true
	att.Slot = "go_p250_mag"
	att.Override_Trivia_Calibre = ".45 ACP"

	att.ActivateElements = {"go_p250_mag_21"}
	att.Override_ClipSize_Priority = 2
	att.Override_ClipSize = 15
	att.Mult_SpeedMult = 0.975
	att.Mult_SightTime = 1.1
	att.Mult_ReloadTime = 1.2

	att.Mult_Damage = 1.1
	att.Mult_DamageMin = 0.9
	att.Mult_Recoil = 0.9


	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return "arccw_go/usp/usp_unsilenced_01.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_p250_mag_15_9mm.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_p250_mag_15_9mm")

	att.PrintName = "15-Round 9mm P250"
	att.Icon = Material("entities/acwatt_go_p250_mag_regular.png", "mips smooth")
	att.Description = "Barrel and magazine kit converting to 9mm. While it has less stopping power, more rounds can be loaded."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 3.5
	att.AutoStats = true
	att.Slot = "go_p250_mag"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"
	att.Hook_GetCapacity = function(wep, cap)
	    if wep.Attachments[3].Installed == "go_p250_slide_short" then
	        return 12
	    else
	        return 15
	    end
	end

	att.Mult_RPM = 1.2
	att.Mult_Damage = 0.7
	att.Mult_DamageMin = 0.9
	att.Mult_Recoil = 0.5
	att.Mult_RecoilSide = 0.7
	--att.Mult_ShootPitch = 1.1

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return "arccw_go/hkp2000/hkp2000-1.wav" end
	end
	--[[att.Hook_GetDistantShootSound = function(wep, sound)
	    if snd == wep.DistantShootSound then return "arccw_go/usp/usp_unsil-1-distant.wav" end
	end]]
	ArcCW.LoadAttachmentType(att)
end

------
-- go_p250_mag_20_22lr.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_p250_mag_20_22lr")

	att.PrintName = "20-Round .22 LR P250"
	att.Icon = Material("entities/acwatt_go_p250_mag_regular.png", "mips smooth")
	att.Description = "Barrel and magazine kit converting to .22 LR. As a plinking cartridge, it does very little damage, but simplified internals allows for better performance."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 2.5
	att.AutoStats = true
	att.Slot = "go_p250_mag"
	att.Override_Trivia_Calibre = ".22 Long Rifle"
	att.Override_Trivia_Mechanism = "Blowback"

	att.Hook_GetCapacity = function(wep, cap)
	    if wep.Attachments[3].Installed == "go_p250_slide_short" then
	        return 12
	    else
	        return 20
	    end
	end

	att.Mult_RPM = 1.4
	att.Mult_Damage = 0.35
	att.Mult_DamageMin = 0.35
	att.Mult_Recoil = 0.25
	att.Mult_RecoilSide = 0.25
	att.Mult_ShootPitch = 0.9
	att.Mult_AccuracyMOA = 0.5

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return "arccw_go/22lr.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_p250_mag_21.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_p250_mag_21")

	att.PrintName = "21-Round .357 P250"
	att.Icon = Material("entities/acwatt_go_p250_mag_21.png", "mips smooth")
	att.Description = "Extended magazine for the P250 pistol. Medium length balances increased capacity with increased weight."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 21
	att.AutoStats = true
	att.Slot = "go_p250_mag"

	att.Override_ClipSize_Priority = 2
	att.Override_ClipSize = 21

	att.Mult_MoveSpeed = 0.99
	att.Mult_SightTime = 1.05
	att.Mult_ReloadTime = 1.05

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
-- go_p250_mag_21_40sw.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_p250_mag_21_40sw")

	att.PrintName = "21-Round .40 S&W P250"
	att.Icon = Material("entities/acwatt_go_p250_mag_21.png", "mips smooth")
	att.Description = "Extended magazine for the .40 S&W conversion."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 4
	att.AutoStats = true
	att.Slot = "go_p250_mag"
	att.Override_Trivia_Calibre = ".40 S&W"

	att.ActivateElements = {"go_p250_mag_21"}
	att.Override_ClipSize_Priority = 2
	att.Override_ClipSize = 21
	att.Mult_SpeedMult = 0.975
	att.Mult_SightTime = 1.1
	att.Mult_ReloadTime = 1.2

	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 1.1
	att.Mult_Range = 1.2

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return "arccw_go/usp/usp_unsilenced_01.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_p250_mag_24_9mm.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_p250_mag_24_9mm")

	att.PrintName = "24-Round 9mm P250"
	att.Icon = Material("entities/acwatt_go_p250_mag_21.png", "mips smooth")
	att.Description = "Extended magazine for the 9mm conversion."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 3
	att.AutoStats = true
	att.Slot = "go_p250_mag"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"

	att.ActivateElements = {"go_p250_mag_21"}
	att.Override_ClipSize_Priority = 2
	att.Override_ClipSize = 24
	att.Mult_SpeedMult = 0.975
	att.Mult_SightTime = 1.1
	att.Mult_ReloadTime = 1.2

	att.Mult_RPM = 1.2
	att.Mult_Damage = 0.7
	att.Mult_DamageMin = 0.9
	att.Mult_Recoil = 0.5
	att.Mult_RecoilSide = 0.7
	--att.Mult_ShootPitch = 1.1

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return "arccw_go/hkp2000/hkp2000-1.wav" end
	end
	--[[att.Hook_GetDistantShootSound = function(wep, sound)
	    if snd == wep.DistantShootSound then return "arccw_go/usp/usp_unsil-1-distant.wav" end
	end]]
	ArcCW.LoadAttachmentType(att)
end

------
-- go_p250_mag_35_22lr.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_p250_mag_35_22lr")

	att.PrintName = "35-Round .22 LR P250"
	att.Icon = Material("entities/acwatt_go_p250_mag_21.png", "mips smooth")
	att.Description = "Extended magazine for the .22 LR conversion."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 2
	att.AutoStats = true
	att.Slot = "go_p250_mag"
	att.Override_Trivia_Calibre = ".22 Long Rifle"
	att.Override_Trivia_Mechanism = "Blowback"

	att.ActivateElements = {"go_p250_mag_21"}
	att.Override_ClipSize_Priority = 2
	att.Override_ClipSize = 35
	att.Mult_SpeedMult = 0.975
	att.Mult_SightTime = 1.1
	att.Mult_ReloadTime = 1.2

	att.Mult_RPM = 1.4
	att.Mult_Damage = 0.35
	att.Mult_DamageMin = 0.35
	att.Mult_Recoil = 0.25
	att.Mult_RecoilSide = 0.25
	att.Mult_ShootPitch = 0.9
	att.Mult_AccuracyMOA = 0.5

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return "arccw_go/22lr.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_p250_mag_9_45acp.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_p250_mag_9_45acp")

	att.PrintName = "9-Round .45 ACP P250"
	att.Icon = Material("entities/acwatt_go_p250_mag_regular.png", "mips smooth")
	att.Description = "Barrel and magazine kit converting to .45 ACP. It is more powerful up close, but loads much less due to its size."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 5.5
	att.AutoStats = true
	att.Slot = "go_p250_mag"
	att.Override_Trivia_Calibre = ".45 ACP"
	att.Hook_GetCapacity = function(wep, cap)
	    if wep.Attachments[3].Installed == "go_p250_slide_short" then
	        return 6
	    else
	        return 9
	    end
	end

	att.Mult_Damage = 1.1
	att.Mult_DamageMin = 0.9
	att.Mult_Recoil = 0.9

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return "arccw_go/usp/usp_unsilenced_01.wav" end
	end
	--[[att.Hook_GetDistantShootSound = function(wep, sound)
	    if snd == wep.DistantShootSound then return "arccw_go/usp/usp_unsil-1-distant.wav" end
	end]]
	ArcCW.LoadAttachmentType(att)
end

------
-- go_p250_slide_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_p250_slide_long")

	att.PrintName = "140mm Full Size Slide"
	att.Icon = Material("entities/acwatt_go_p250_slide_long.png", "mips smooth")
	att.Description = "Long P250 slide that improves range but also adds weight."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_p250_slide"

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
-- go_p250_slide_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_p250_slide_short")

	att.PrintName = "90mm Subcompact Slide"
	att.Icon = Material("entities/acwatt_go_p250_slide_short.png", "mips smooth")
	att.Description = "Compact slide that improves weapon handling and trigger response. Without an underbarrel rail, it is impossible to mount an optic or LAM."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_p250_slide"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 1.5
	att.Mult_DrawTime = 0.75

	att.Override_ClipSize_Priority = 0.5
	att.Override_ClipSize = 10

	att.Mult_RPM = 1.15

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_p90_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_p90_barrel_long")

	att.PrintName = "800mm Devolution Barrel"
	att.Icon = Material("entities/acwatt_go_p90_barrel_long.png", "mips smooth")
	att.Description = "Ridiculous extended P90 barrel with shroud. Good for long range engagements."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_p90_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 2
	att.Mult_Recoil = 0.65
	att.Mult_SightTime = 2
	att.Mult_AccuracyMOA = 0.25

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_p90_barrel_med.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_p90_barrel_med")

	att.PrintName = "410mm PS90 Barrel"
	att.Icon = Material("entities/acwatt_go_p90_barrel_med.png", "mips smooth")
	att.Description = "Medium-length barrel used on the PS90 carbine."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_p90_barrel"

	att.Mult_Range = 1.15
	att.Mult_Recoil = 0.9
	att.Mult_SightTime = 1.1
	att.Mult_AccuracyMOA = 0.9

	att.Mult_ShootPitch = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- go_p90_mag_30.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_p90_mag_30")

	att.PrintName = "30-Round 5.7mm PS90"
	att.Icon = Material("entities/acwatt_go_p90_mag_30.png", "mips smooth")
	att.Description = "Small magazine with lighter load. Improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 30
	att.AutoStats = true
	att.Slot = "go_p90_mag"

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Override_ClipSize = 30
	att.Mult_ReloadTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_perk_bolt.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_perk_bolt")

	att.PrintName = "Deft Hands"
	att.Icon = Material("entities/acwatt_go_perk_bolt.png", "mips smooth")
	att.Description = "Cycling the weapon is 25% faster."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"


	att.Mult_CycleTime = 0.75

	att.Hook_Compatible = function(wep)
	    if !wep.ManualAction then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_perk_burst.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_perk_burst")

	att.PrintName = "Enhanced Burst"
	att.Icon = Material("entities/acwatt_go_perk_burst.png", "mips smooth")
	att.Description = "Alters weapon fire group to support 3-burst and semi-automatic fire instead. Enhances effective fire rate."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"

	att.Override_Firemodes_Priority = 10
	att.Override_Firemodes = {
	    {
	        Mode = -3,
	        PostBurstDelay = 0.1
	    },
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}

	att.Hook_Compatible = function(wep)
	    if wep.ManualAction then return false end
	    local auto = false
	    for i, v in pairs(wep.Firemodes) do
	        if v.Mode and v.Mode == -3 then
	            auto = true
	            break
	        end
	    end
	    if auto then return false end
	end

	att.Mult_RPM = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- go_perk_cowboy.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_perk_cowboy")

	att.PrintName = "Cowboy"
	att.Icon = Material("entities/acwatt_go_perk_cowboy.png", "mips smooth")
	att.Description = "Special technique allows for shooting while sprinting using only one hand."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk_pistol"


	att.Override_ShootWhileSprint = true

	att.LHIK = true
	att.LHIKHide = true
	ArcCW.LoadAttachmentType(att)
end

------
-- go_perk_diver.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_perk_diver")

	att.PrintName = "Deep Sea"
	att.Icon = Material("entities/acwatt_go_perk_diver.png", "mips smooth")
	att.Description = "Enables the weapon to keep firing while underwater with specially sealed internal parts."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"


	att.Override_CanFireUnderwater = true

	att.Hook_Compatible = function(wep)
	    if wep.CanFireUnderwater then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_perk_fastreload.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_perk_fastreload")

	att.PrintName = "Rapid Reload"
	att.Icon = Material("entities/acwatt_go_perk_fastreload.png", "mips smooth")
	att.Description = "Improves reload time."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"


	att.Mult_ReloadTime = 0.85
	ArcCW.LoadAttachmentType(att)
end

------
-- go_perk_hairtrigger.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_perk_hairtrigger")

	att.PrintName = "Hair Trigger"
	att.Icon = Material("entities/acwatt_go_perk_hairtrigger.png", "smooth mips")
	att.Description = "Lightweight and fine-tuned trigger allows for a much shorter trigger delay."
	att.Desc_Pros = {
	    "pro.gsoe.hairtrigger"
	}
	att.Desc_Cons = {
	}
	att.Slot = "go_perk"

	att.AutoStats = true
	att.Mult_TriggerDelayTime = 0.4

	att.Hook_Compatible = function(wep)
	    if !wep.TriggerDelay and !wep:GetBuff_Override("Override_TriggerDelay") then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_perk_headshot.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_perk_headshot")

	att.PrintName = "Surgical Shot"
	att.Icon = Material("entities/acwatt_go_perk_headshot.png", "mips smooth")
	att.Description = "Further triples headshot damage."
	att.Desc_Pros = {
	    "pro.headshotdamage"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"


	att.Hook_BulletHit = function(wep, data)
	    if CLIENT then return end

	    if data.tr.HitGroup == HITGROUP_HEAD then
	        data.damage = data.damage * 3
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_perk_hyper.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_perk_hyper")

	att.PrintName = "Double Tapper"
	att.Icon = Material("entities/acwatt_go_perk_hyper.png")
	att.Description = "Firemode conversion allowing for a rapid two-round burst and semi-automatic fire. Due to the high firerate, the first shot's recoil will be reduced."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"

	att.Override_Firemodes_Priority = 100
	att.Override_Firemodes = {
	    {
	        Mode = -2,
	        Mult_RPM = 2,
	        RunawayBurst = true,
	        PostBurstDelay = 0.15,
	        Override_ShotRecoilTable = {
	            [0] = 0.1
	        }
	    },
	    {
	        Mode = 1
	    },
	    {
	        Mode = 0
	    }
	}

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() or wep.ManualAction or wep.TriggerDelay or wep:GetBuff_Override("Override_TriggerDelay") then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_perk_johnwick.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_perk_johnwick")

	att.PrintName = "John Wick"
	att.Icon = Material("entities/acwatt_go_perk_johnwick.png", "mips smooth")
	att.Description = "u kill my dog"
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = false
	att.Slot = "go_perk"
	att.JohnWick = true

	att.Ignore = false
	att.NoRandom = true

	att.Mult_MeleeDamage = 2
	att.Mult_MeleeAttackTime = 0.5
	att.Mult_MeleeTime = 0.5
	att.Mult_CycleTime = 0.5
	att.Mult_ReloadTime = 0.75
	att.Mult_MoveDispersion = 0.1
	att.Mult_SightedSpeedMult = 2

	att.Hook_BulletHit = function(wep, data)
	    if CLIENT then return end

	    if data.tr.HitGroup == HITGROUP_HEAD then
	        data.damage = data.damage * 3
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_perk_last.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_perk_last")

	att.PrintName = "Last One Out"
	att.Icon = Material("entities/acwatt_go_perk_last.png", "mips smooth")
	att.Description = "Last round has 25% greater damage."
	att.Desc_Pros = {
	    "pro.last"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"


	att.M_Hook_Mult_Damage = function(wep, data)
	    if wep:Clip1() == 1 then
	        data.mult = data.mult * 1.25
	    end

	    return data
	end

	att.M_Hook_Mult_DamageMin = function(wep, data)
	    if wep:Clip1() == 1 then
	        data.mult = data.mult * 1.25
	    end

	    return data
	end

	att.Hook_BulletHit = function(wep, data)
	    if CLIENT then return end

	    if wep:Clip1() == 1 then
	        wep.Owner:EmitSound("arccw_go/fx/rics/legacy_ric_conc-1.wav", 100, 100, 1, CHAN_VOICE2)
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_perk_light.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_perk_light")

	att.PrintName = "Light Internals"
	att.Icon = Material("entities/acwatt_go_perk_light.png", "mips smooth")
	att.Description = "Lightened internal parts allow faster movement while the gun is equipped."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"


	att.Mult_SpeedMult = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_perk_og.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_perk_og")

	att.PrintName = "O.G."
	att.Icon = Material("entities/acwatt_go_perk_ace.png", "mips smooth")
	att.Description = "Converts perk slot to use CS+ attachments."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"

	att.Ignore = true

	att.Max = 1

	att.SubSlots = {
	    {
	        PrintName = "Perk",
	        Slot = "perk",
	    },
	    {
	        PrintName = "Perk",
	        Slot = "go_perk",
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- go_perk_quickdraw.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_perk_quickdraw")

	att.PrintName = "Quickdraw"
	att.Icon = Material("entities/acwatt_go_perk_quickdraw.png", "mips smooth")
	att.Description = "Draw and holster weapon more quickly."
	att.Desc_Pros = {
	    "pro.quickdraw"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"


	att.Mult_DrawTime = 0.5
	att.Mult_HolsterTime = 0.5
	ArcCW.LoadAttachmentType(att)
end

------
-- go_perk_rapidfire.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_perk_rapidfire")

	att.PrintName = "Frantic Firing Frenzy"
	att.Icon = Material("entities/acwatt_go_perk_rapidfire.png", "mips smooth")
	att.Description = "Slightly improves rate of fire."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"


	att.Mult_RPM = 1.05

	att.Hook_Compatible = function(wep)
	    if wep.ManualAction then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_perk_refund.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_perk_refund")

	att.PrintName = "Head Hunt"
	att.Icon = Material("entities/acwatt_go_perk_refund.png", "mips smooth")
	att.Description = "Headshots load one bullet from reserve straight into the magazine."
	att.Desc_Pros = {
	    "pro.refund"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"


	att.Hook_BulletHit = function(wep, data)
	    if CLIENT then return end

	    if data.tr.HitGroup == HITGROUP_HEAD then
	        wep:RestoreAmmo(1)
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_perk_runandgun.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_perk_runandgun")

	att.PrintName = "Run and Gun"
	att.Ignore = true
	att.Icon = Material("entities/acwatt_go_perk_onehand.png", "mips smooth")
	att.Description = "Special technique allows for shooting while sprinting."
	att.Desc_Pros = {
	    "pro.runandgun"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"


	att.Override_ShootWhileSprint = true
	ArcCW.LoadAttachmentType(att)
end

------
-- go_perk_semi.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_perk_semi")

	att.PrintName = "Marksman Trigger"
	att.Icon = Material("entities/acwatt_go_perk_semi.png")
	att.Description = "Switch for a semi-automatic only firing group and trigger capable of very high accuracy and very stable firing."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"

	att.Override_Firemodes_Priority = 100
	att.Override_Firemodes = {
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() or wep.ManualAction or wep.TriggerDelay or wep:GetBuff_Override("Override_TriggerDelay") then return false end
	end

	att.Mult_AccuracyMOA = 0.6
	att.Mult_MoveDispersion = 0.6
	ArcCW.LoadAttachmentType(att)
end

------
-- go_r8_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_r8_barrel_long")

	att.PrintName = "200mm Cowboy Barrel"
	att.Icon = Material("entities/acwatt_go_r8_barrel_long.png", "mips smooth")
	att.Description = "Long barrel that improves range but also adds weight."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_r8_barrel"

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
-- go_r8_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_r8_barrel_short")

	att.PrintName = "90mm Guard Barrel"
	att.Icon = Material("entities/acwatt_go_r8_barrel_short.png", "mips smooth")
	att.Description = "Compact barrel that improves weapon handling and trigger response."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_r8_barrel"

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
-- go_scar_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_scar_barrel_long")

	att.PrintName = "510mm SSR Barrel"
	att.Icon = Material("entities/acwatt_go_scar_barrel_long.png", "mips smooth")
	att.Description = "Sniper-class SCAR SSR barrel. Good for long range engagements."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_scar_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.3
	att.Mult_AccuracyMOA = 0.75

	att.Mult_RPM = 0.5

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_scar_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_scar_barrel_short")

	att.PrintName = "330mm CQC Barrel"
	att.Icon = Material("entities/acwatt_go_scar_barrel_short.png", "mips smooth")
	att.Description = "Compact barrel for carbine use. Improves handling, though offers much worse range and accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_scar_barrel"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 2

	att.Mult_RPM = 1.1

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_scar_barrel_stub.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_scar_barrel_stub")

	att.PrintName = "250mm PDW Barrel"
	att.Icon = Material("entities/acwatt_go_scar_barrel_stub.png", "mips smooth")
	att.Description = "Extremely short barrel for use in the SCAR PDW. Very bad recoil, but improves handling significantly."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_scar_barrel"

	att.Mult_Range = 0.6
	att.Mult_Recoil = 1.75
	att.Mult_SightTime = 0.65
	att.Mult_AccuracyMOA = 3

	att.Mult_RPM = 1.25

	att.Mult_ShootPitch = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- go_scar_mag_10.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_scar_mag_10")

	att.PrintName = "10-Round 7.62mm SCAR"
	att.Icon = Material("entities/acwatt_go_scar_mag_10.png", "mips smooth")
	att.Description = "Small magazine with lighter load. Improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 10
	att.AutoStats = true
	att.Slot = "go_scar_mag"

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Override_ClipSize = 10
	att.Mult_ReloadTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_scar_mag_20_556.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_scar_mag_20_556")

	att.PrintName = "20-Round 5.56mm USGI"
	att.Icon = Material("entities/acwatt_go_m4_mag_20.png", "mips smooth")
	att.Description = "5.56mm conversion makes gun effectively into an HK33 pattern, improving fire rate and recoil at the cost of damage. Reduced capacity magazine improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 20
	att.AutoStats = true
	att.Slot = "go_scar_mag"

	att.InvAtt = "go_m4_mag_20"

	att.Override_Ammo = "smg1"

	att.Override_ClipSize = 20
	att.Mult_Damage = 0.6
	att.Mult_DamageMin = 0.9
	att.Mult_Range = 0.8
	att.Mult_Recoil = 0.35

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Mult_ReloadTime = 0.9

	att.Override_Trivia_Class = "Assault Rifle"
	att.Override_Trivia_Calibre = "5.56x45mm NATO"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "arccw_go/scar20/scar20_02.wav" then return "arccw_go/m4a1/m4a1_us_04.wav" end
	    if fsound == "arccw_go/scar20/scar20_01.wav" then return "arccw_go/m4a1/m4a1_us_02.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_scar_mag_30.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_scar_mag_30")

	att.PrintName = "30-Round 7.62mm SCAR"
	att.Icon = Material("entities/acwatt_go_scar_mag_30.png", "mips smooth")
	att.Description = "Extended magazine improves capacity at the cost of handling."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 30
	att.AutoStats = true
	att.Slot = "go_scar_mag"

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.1
	att.Override_ClipSize = 30
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
-- go_scar_mag_30_556.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_scar_mag_30_556")

	att.PrintName = "30-Round 5.56mm STANAG"
	att.Icon = Material("entities/acwatt_go_scar_mag_30.png", "mips smooth")
	att.Description = "5.56mm conversion makes gun effectively into a SCAR-L pattern, improving fire rate and recoil at the cost of damage. Reduced capacity magazine improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 30
	att.AutoStats = true
	att.Slot = "go_scar_mag"

	att.InvAtt = "go_g3_mag_30"

	att.Override_Ammo = "smg1"

	att.Override_ClipSize = 30
	att.Mult_Damage = 0.6
	att.Mult_DamageMin = 0.9
	att.Mult_Range = 0.8
	att.Mult_Recoil = 0.35

	att.Override_Trivia_Class = "Assault Rifle"
	att.Override_Trivia_Calibre = "5.56x45mm NATO"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "arccw_go/scar20/scar20_02.wav" then return "arccw_go/m4a1/m4a1_us_04.wav" end
	    if fsound == "arccw_go/scar20/scar20_01.wav" then return "arccw_go/m4a1/m4a1_us_02.wav" end
	end

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
-- go_scar_mag_60_556.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_scar_mag_60_556")

	att.PrintName = "50-Round 5.56mm Quad"
	att.Icon = Material("entities/acwatt_go_556_ammo_60round.png", "mips smooth")
	att.Description = "5.56mm conversion makes gun effectively into an HK33 pattern, improving fire rate and recoil at the cost of damage. Quad stack magazine improves capacity."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 50
	att.AutoStats = true
	att.Slot = "go_scar_mag"

	att.Override_Ammo = "smg1"

	att.InvAtt = "go_556_ammo_60round"

	att.Override_Ammo = "smg1"

	att.Override_ClipSize = 50
	att.Mult_Damage = 0.6
	att.Mult_DamageMin = 0.9
	att.Mult_Range = 0.8
	att.Mult_Recoil = 0.35

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.15
	att.Mult_ReloadTime = 1.25

	att.Override_Trivia_Class = "Assault Rifle"
	att.Override_Trivia_Calibre = "5.56x45mm NATO"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "arccw_go/scar20/scar20_02.wav" then return "arccw_go/m4a1/m4a1_us_04.wav" end
	    if fsound == "arccw_go/scar20/scar20_01.wav" then return "arccw_go/m4a1/m4a1_us_02.wav" end
	end

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
-- go_scar_stock_sniper.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_scar_stock_sniper")

	att.PrintName = "Sniper Stock"
	att.Icon = Material("entities/acwatt_go_scar_stock_sniper.png", "mips smooth")
	att.Description = "Precision sniper stock for the SCAR-20 DMR. Improves recoil, at the cost of aim speed."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_scar_stock"

	att.Mult_SightTime = 1.25
	att.Mult_Recoil = 0.9
	att.Mult_MoveDispersion = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- go_sg_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_sg_barrel_long")

	att.PrintName = "650mm Sniper Barrel"
	att.Icon = Material("entities/acwatt_go_sg_barrel_long.png", "mips smooth")
	att.Description = "Sniper barrel for the SG556. Improves long range performance."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_sg_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 1.25
	att.Mult_Recoil = 0.85
	att.Mult_SightTime = 1.3
	att.Mult_AccuracyMOA = 0.75

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_sg_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_sg_barrel_short")

	att.PrintName = "390mm Compact Barrel"
	att.Icon = Material("entities/acwatt_go_sg_barrel_short.png", "mips smooth")
	att.Description = "Short length SIG SG barrel used in the Commando variant of the rifle. Improves handling, though offers much worse range and accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_sg_barrel"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 2

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_sg_mag_20.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_sg_mag_20")

	att.PrintName = "20-Round 5.56mm SIG"
	att.Icon = Material("entities/acwatt_go_sg_mag_20.png", "mips smooth")
	att.Description = "Small magazine with lighter load. Improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 20
	att.AutoStats = true
	att.Slot = "go_sg_mag"

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Override_ClipSize = 20
	att.Mult_ReloadTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ssg08_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ssg08_barrel_long")

	att.PrintName = "610mm Sniper Barrel"
	att.Icon = Material("entities/acwatt_go_ssg08_barrel_long.png", "mips smooth")
	att.Description = "Fitted maximum-length barrel for the SSG08. Improves long range performance."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ssg08_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 1.25
	att.Mult_Recoil = 0.95
	att.Mult_SightTime = 1.35
	att.Mult_AccuracyMOA = 0.75

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ssg08_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ssg08_barrel_short")

	att.PrintName = "310mm Custom Barrel"
	att.Icon = Material("entities/acwatt_go_ssg08_barrel_short.png", "mips smooth")
	att.Description = "Short length custom barrel. Improves handling, though offers much worse range and accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ssg08_barrel"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 2

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ssg08_mag_10.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ssg08_mag_10")

	att.PrintName = "15-Round .308 SSG"
	att.Icon = Material("entities/acwatt_go_ssg08_mag_10.png", "mips smooth")
	att.Description = "Extended magazine improves capacity at the cost of handling."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 15
	att.AutoStats = true
	att.Slot = "go_ssg08_mag"

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.1
	att.Override_ClipSize = 15
	att.Mult_ReloadTime = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ssg08_mag_10_762.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ssg08_mag_10_762")

	att.PrintName = "10-Round 7.62x51mm NATO"
	att.Icon = Material("entities/acwatt_go_ssg08_mag_10.png", "mips smooth")
	att.Description = "A home-made magazine and barrel kit that modifies the weapon to fire 7.62x51 NATO rounds. Has considerably less power, but is easier to handle."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 5
	att.AutoStats = true
	att.Slot = "go_ssg08_mag"

	att.Override_ClipSize = 10

	att.Mult_Damage = 0.7
	att.Mult_DamageMin = 0.7
	att.Mult_Recoil = 0.6

	att.Mult_MoveSpeed = 1.05
	att.Mult_ReloadTime = 0.9
	att.Mult_SightTime = 0.9

	att.Override_Ammo = "ar2"
	att.Override_Trivia_Calibre = "7.62x51mm NATO"
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ssg08_mag_5_338.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ssg08_mag_5_338")

	att.PrintName = "5-Round .338 SSG"
	att.Icon = Material("entities/acwatt_go_ssg08_mag_5_338.png", "mips smooth")
	att.Description = "Modification to use .338 Lapua Magnum rounds, which are more powerful over long range."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 5
	att.AutoStats = true
	att.Slot = "go_ssg08_mag"

	att.Override_ClipSize = 5

	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 1.25
	att.Mult_Recoil = 2.5

	att.Override_Trivia_Calibre = ".338 Lapua Magnum"
	ArcCW.LoadAttachmentType(att)
end

------
-- go_stock_basilisk.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_stock_basilisk")

	att.PrintName = "Basilisk Stock"
	att.Icon = Material("entities/acwatt_go_stock_basilisk.png", "mips smooth")
	att.Description = "Modular crane stock. Improves moving accuracy and strafe performance at the cost of recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_stock"

	att.Model = "models/weapons/arccw_go/atts/stock_basilisk.mdl"

	att.ActivateElements = {"buftube"}

	att.Mult_Recoil = 1.15
	att.Mult_MoveDispersion = 0.75
	att.Mult_SightedMoveSpeed = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- go_stock_bizon.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_stock_bizon")

	att.PrintName = "Paratrooper Stock"
	att.Icon = Material("entities/acwatt_go_stock_bizon.png", "mips smooth")
	att.Description = "Lightweight aluminium stock commonly used on paratrooper weapons. Provides great mobility but worsens recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_stock"

	att.Model = "models/weapons/arccw_go/atts/stock_bizon.mdl"

	att.ActivateElements = {"buftube"}
	--att.ActivateElements = {"go_stock_none"}
	att.ModelOffset = Vector(-1, 0, 0)

	att.Mult_SpeedMult = 1.15
	att.Mult_SightedSpeedMult = 1.15
	att.Mult_SightTime = 0.8
	att.Mult_DrawTime = 0.75
	att.Mult_Recoil = 1.5
	ArcCW.LoadAttachmentType(att)
end

------
-- go_stock_contractor.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_stock_contractor")

	att.PrintName = "Contractor Stock"
	att.Icon = Material("entities/acwatt_go_stock_contractor.png", "mips smooth")
	att.Description = "Adjustable modular stock. Improves hip fire accuracy, at the cost of aim speed."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_stock"

	att.Model = "models/weapons/arccw_go/atts/stock_contractor.mdl"

	att.ActivateElements = {"buftube"}

	att.Mult_SightTime = 1.15
	att.Mult_HipDispersion = 0.75
	ArcCW.LoadAttachmentType(att)
end

------
-- go_stock_ergo.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_stock_ergo")

	att.PrintName = "Ergonomic Stock"
	att.Icon = Material("entities/acwatt_go_stock_ergo.png", "mips smooth")
	att.Description = "Lightweight modular stock. Improves ADS speed at the cost of recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_stock"

	att.Model = "models/weapons/arccw_go/atts/stock_ergo.mdl"

	att.ActivateElements = {"buftube"}

	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.75
	ArcCW.LoadAttachmentType(att)
end

------
-- go_stock_m249.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_stock_m249")

	att.PrintName = "SAW Stock"
	att.Icon = Material("entities/acwatt_go_stock_m249.png", "mips smooth")
	att.Description = "Long and solid stock that can be held in the hip easily. Allows for controllable hipfiring, but is really heavy."
	att.Desc_Pros = {
	    "pro.gsoe.stock_m249"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_stock"

	att.Model = "models/weapons/arccw_go/atts/stock_m249.mdl"
	att.ModelOffset = Vector(0, 0, -0.3)

	att.ActivateElements = {"go_stock_none"}

	att.Mult_SightedSpeedMult = 0.5
	att.Mult_HipDispersion = 0.8
	att.Mult_SightTime = 1.5

	att.Hook_ModifyRecoil = function(wep, tbl)
	    tbl.Recoil = tbl.Recoil * (0.7 + ( 0.3 * ( 1 - wep:GetSightDelta() ) ))
	end

	att.Ignore = true
	ArcCW.LoadAttachmentType(att)
end

------
-- go_stock_moe.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_stock_moe")

	att.PrintName = "MOE Stock"
	att.Icon = Material("entities/acwatt_go_stock_moe.png", "mips smooth")
	att.Description = "Modular stock produced by Magpul. Improves recoil at the cost of handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_stock"

	att.Model = "models/weapons/arccw_go/atts/stock_moe.mdl"

	att.ActivateElements = {"buftube"}

	att.Mult_SightTime = 1.25
	att.Mult_Recoil = 0.9
	att.Mult_MoveDispersion = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- go_stock_mp5.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_stock_mp5")

	att.PrintName = "Flibbertigibbet Stock"
	att.Icon = Material("entities/acwatt_go_stock_mp5.png", "mips smooth")
	att.Description = "Sliding stock from the MP5. It's faster to handle, somehow."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_stock"

	att.Model = "models/weapons/arccw_go/atts/stock_mp5.mdl"
	att.ModelOffset = Vector(-0.5, 0, -0.25)

	att.ActivateElements = {"buftube"}

	att.Mult_JumpDispersion = 0.5
	att.Mult_SightTime = 0.9
	att.Mult_RecoilSide = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- go_stock_none.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_stock_none")

	att.PrintName = "No Stock"
	att.Icon = Material("entities/acwatt_go_stock_none.png", "mips smooth")
	att.Description = "Removed stock. Awful handling, though it should allow for very fast movement."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_stock_none"

	att.Free = true

	att.Mult_Recoil = 2
	att.Mult_SpeedMult = 1.25
	att.Mult_SightTime = 0.75

	att.NoStock = true
	ArcCW.LoadAttachmentType(att)
end

------
-- go_stock_pistol_bt.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_stock_pistol_bt")

	att.PrintName = "BT-2 Pistol Stock"
	att.Icon = Material("entities/acwatt_go_stock_pistol_bt.png", "mips smooth")
	att.Description = "Stock for pistols, to be attached above the grip."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_stock_pistol_bt"

	att.Model = "models/weapons/arccw_go/atts/pistol_stock_bt.mdl"

	att.Mult_SightTime = 1.5
	att.Mult_Recoil = 0.9
	att.Mult_MoveDispersion = 0.85
	att.Mult_MoveSpeed = 0.95
	att.Mult_DrawSpeed = 1.5
	ArcCW.LoadAttachmentType(att)
end

------
-- go_stock_pistol_wire.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_stock_pistol_wire")

	att.PrintName = "Kirov Wire Stock"
	att.Icon = Material("entities/acwatt_go_stock_pistol_wire.png", "mips smooth")
	att.Description = "Wire stock for the Bizon repurposed for pistol use. Much lighter than a proper pistol stock, and doesn't reduce as much recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_stock_pistol_bt"

	att.Model = "models/weapons/arccw_go/atts/pistol_stock_wire.mdl"
	att.ModelOffset = Vector(-0.5, 0, -0.5)

	att.Mult_SightTime = 1.25
	att.Mult_DrawSpeed = 1.25
	att.Mult_HolsterSpeed = 1.25

	att.Mult_Recoil = 0.95
	att.Mult_MoveDispersion = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_stock_ump.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_stock_ump")

	att.PrintName = "Police Stock"
	att.Icon = Material("entities/acwatt_go_stock_ump.png", "mips smooth")
	att.Description = "Stock adapted from the UMP. Effectively reduces horizontal recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_stock"

	att.Model = "models/weapons/arccw_go/atts/stock_ump.mdl"
	att.ModelOffset = Vector(-1.2, 0, -0.25)

	att.ActivateElements = {"go_stock_none"}

	att.Mult_SightTime = 1.1
	att.Mult_MoveDispersion = 1.05
	att.Mult_RecoilSide = 0.7
	ArcCW.LoadAttachmentType(att)
end

------
-- go_supp_monolith.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_supp_monolith")

	att.PrintName = "Monolith Suppressor"
	att.Icon = Material("entities/acwatt_go_supp_monolith.png", "mips smooth")
	att.Description = "Huge suppressor that makes shots whisper-quiet and enhances muzzle velocity. However, it is very bulky. Can be used on shotguns."

	att.SortOrder = 3

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.SortOrder = 15

	att.Model = "models/weapons/arccw_go/atts/supp_monolith.mdl"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true

	att.Mult_ShootPitch = 0.9
	att.Mult_ShootVol = 0.75
	att.Mult_AccuracyMOA = 0.75
	att.Mult_Range = 1.25

	att.Mult_SightTime = 1.25
	att.Mult_HipDispersion = 1.5

	att.Add_BarrelLength = 16

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_supp_monolith_shot.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_supp_monolith_shot")

	att.PrintName = "Monolith Suppressor"
	att.Icon = Material("entities/acwatt_go_supp_monolith.png", "mips smooth")
	att.Description = "Huge suppressor that makes shots whisper-quiet and enhances muzzle velocity. However, it is very bulky. Can be used on shotguns."

	att.SortOrder = 3

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.InvAtt = "go_supp_monolith"

	att.SortOrder = 15

	att.Model = "models/weapons/arccw_go/atts/supp_monolith.mdl"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true

	att.Mult_ShootPitch = 0.9
	att.Mult_ShootVol = 0.75
	att.Mult_SightTime = 1.15

	att.Add_BarrelLength = 16

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_supp_monster.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_supp_monster")

	att.PrintName = "Monster2 Suppressor"
	att.Icon = Material("entities/acwatt_go_supp_monster.png", "mips smooth")
	att.Description = "Large sound suppressor with ballistic-enhancing qualities. Somewhat cumbersome. Can be used on shotguns."

	att.SortOrder = 2

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.SortOrder = 16

	att.Model = "models/weapons/arccw_go/atts/supp_monster.mdl"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true

	-- better handling, worse ballistics than pbs
	-- better for mobile

	att.Mult_ShootPitch = 1
	att.Mult_ShootVol = 0.75
	att.Mult_AccuracyMOA = 0.85
	att.Mult_Range = 1.15
	att.Mult_Recoil = 0.75
	att.Mult_MoveDispersion = 1.1

	att.Mult_SightTime = 1.15
	att.Mult_HipDispersion = 1.1

	att.Add_BarrelLength = 8

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_supp_monster_shot.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_supp_monster_shot")

	att.PrintName = "Monster2 Suppressor"
	att.Icon = Material("entities/acwatt_go_supp_monster.png", "mips smooth")
	att.Description = "Large sound suppressor with ballistic-enhancing qualities. Somewhat cumbersome. Can be used on shotguns."

	att.SortOrder = 2

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.InvAtt = "go_supp_monster"

	att.SortOrder = 15

	att.Model = "models/weapons/arccw_go/atts/supp_monster.mdl"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true

	att.Mult_ShootPitch = 0.9
	att.Mult_ShootVol = 0.75
	att.Mult_SightTime = 1.15

	att.Add_BarrelLength = 16

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

