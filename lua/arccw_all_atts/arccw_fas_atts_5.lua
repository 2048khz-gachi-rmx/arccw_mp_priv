local Material = ArcCW.AttachmentMat

------
-- mifl_fas2_optic_lmk4s.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_optic_lmk4s")

	att.PrintName = "Leupold Compact (3-5x)"
	att.Icon = Material("entities/arccw_mifl_fas2_optic_lmk4s.png", "smooth")
	att.Description = "Custom made adjustable compact scope for medium range use. It retains the same sight picture as the Mk 4, but has only two zoom options."

	att.SortOrder = 5

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"optic_lp", "optic"}

	att.Model = "models/weapons/arccw/mifl_atts/fas2_optic_lmk4s.mdl"
	att.HolosightPiece = "models/weapons/arccw/mifl_atts/fas2_optic_lmk4s_hsp.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 12, -1.6),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.5,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 1,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
	        IgnoreExtra = true,
	    },
	}
	att.Holosight = true
	att.HolosightMagnification = 3
	att.HolosightMagnificationMin = 3
	att.HolosightMagnificationMax = 5
	att.HolosightReticle = Material("mifl_fas2_reticle/mildot.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 11
	att.HolosightBone = "holosight"
	att.Colorable = false
	att.HolosightBlackbox = true

	att.Mult_SightTime = 1.2
	att.Mult_SpeedMult = 0.95

	att.Mult_VisualRecoilMult = 0.3

	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_optic_pso1.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_optic_pso1")

	att.PrintName = "PSO-1 (4x)"
	att.Icon = Material("entities/arccw_mifl_fas2_optic_pso1.png", "smooth")
	att.Description = "Russian combat optic on a picatinny rail adapter. It is slightly heavier than scopes of the same zoom level."

	att.SortOrder = 4

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw/mifl_atts/fas2_optic_pso1.mdl"
	att.HolosightPiece = "models/weapons/arccw/mifl_atts/fas2_optic_pso1_hsp.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 8.5, -1.6),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.2,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        IgnoreExtra = true,
	    },
	}
	att.Holosight = true
	att.HolosightMagnification = 4
	att.HolosightMagnificationMin = 4
	att.HolosightMagnificationMax = 4
	att.HolosightReticle = Material("mifl_fas2_reticle/pso1.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 15
	att.HolosightBone = "holosight"
	att.Colorable = true
	att.HolosightBlackbox = true

	att.Mult_SightTime = 1.08
	att.Mult_SpeedMult = 0.94

	att.Mult_VisualRecoilMult = 0.2


	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_optic_toyota.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_optic_toyota")

	att.PrintName = "Toyota Pickup Truck (Holo)"
	att.Icon = Material("entities/arccw_mifl_fas2_optic_toyota.png", "mips smooth")
	att.Description = "A very strange optic resembling a truck. Has a childlike drawing of a crosshair on the windshield. Its not very pretty, but insurgents have to make do."

	att.SortOrder = 0.5

	att.Desc_Pros = {
	    "Precision sight picture",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"optic"}

	att.Model = "models/weapons/arccw/mifl_atts/fas2/optic_toyota.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 7, -2),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.25,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("mifl_fas2_reticle/toyota.png")
	att.HolosightNoFlare = true
	att.HolosightSize = 4
	att.HolosightBone = "holosight"
	att.Colorable = true

	att.Mult_SightTime = 1.025
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_optic_xm25.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_optic_xm25")

	att.PrintName = "Xleris Scope(6x)"
	att.Icon = Material("entities/arccw_mifl_fas2_optic_xm25.png", "smooth")
	att.Description = "Compact thermal scope. Still bulkier than normal scope."

	att.SortOrder = 6

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw/mifl_atts/fas2_optic_xm25.mdl"
	att.HolosightPiece = "models/weapons/arccw/mifl_atts/fas2_optic_xm25_hsp.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 12, -2.5),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.2,
	        Thermal = true,
	        ThermalScopeColor = Color(255, 255, 255),
	        ThermalHighlightColor = Color(0, 255, 255),
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 1,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
	        IgnoreExtra = true,
		},
	}

	att.Holosight = true
	att.HolosightMagnification = 4
	att.HolosightMagnificationMin = 6
	att.HolosightMagnificationMax = 6
	att.HolosightNoFlare = true
	att.HolosightSize = 15
	att.HolosightBone = "holosight"
	att.HolosightBlackbox = true
	att.Colorable = true
	att.HolosightReticle = Material("mifl_fas2_reticle/xm25.png", "mips smooth")

	att.Mult_SightTime = 1.115
	att.Mult_SpeedMult = 0.9

	att.Mult_VisualRecoilMult = 0.05
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_p226_mag_357.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_p226_mag_357")

	att.PrintName = "12-Round .357 SIG"
	att.Icon = Material("entities/arccw_mifl_fas2_p226_mag_357.png", "mips smooth")
	att.Description = "Conversion to a heavier calibre type. Has heavier load and a good reputation for accuracy."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 12
	att.AutoStats = true
	att.Slot = "mifl_fas2_p226_mag"

	att.Override_ClipSize = 12

	att.Mult_Recoil = 1.2
	att.Mult_Damage = 1.1
	att.Mult_DamageMin = 1.2
	att.Mult_RPM = 0.9

	att.Mult_AccuracyMOA = 0.9
	att.Mult_HipDispersion = 1.2
	att.Mult_SightsDispersion = 1.1

	att.Override_Trivia_Calibre = "9×22mm"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_p226_mag_40.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_p226_mag_40")

	att.PrintName = "10-Round .40 S&W"
	att.Icon = Material("entities/arccw_mifl_fas2_p226_mag_40.png", "mips smooth")
	att.Description = "Conversion to a more beefy calibre type. A bit weaker than 10mm but sure packs a punch. The curve magazine allows for faster swapping."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 10
	att.AutoStats = true
	att.Slot = "mifl_fas2_p226_mag"

	att.Override_ClipSize = 10

	att.Mult_Recoil = 1.4
	att.Mult_Damage = 1.25
	att.Mult_DamageMin = 0.8
	att.Mult_RPM = 0.8
	att.Mult_ReloadTime = 0.95

	att.Mult_AccuracyMOA = 0.8
	att.Mult_HipDispersion = 1.5
	att.Mult_SightsDispersion = 0.9

	att.Override_Trivia_Calibre = ".40 S&W"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_p226_mag_45.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_p226_mag_45")

	att.PrintName = "25-Round .45ACP"
	att.Icon = Material("entities/arccw_mifl_fas2_p226_mag_45.png", "mips smooth")
	att.Description = "Conversion offers more fire power. Long sticks mag allows for more rounds to be loaded."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 25
	att.AutoStats = true
	att.Slot = "mifl_fas2_p226_mag"

	att.Override_ClipSize = 25

	att.Mult_Recoil = 1.2
	att.Mult_Damage = 1.05
	att.Mult_DamageMin = 0.95
	att.Mult_RPM = 1.05
	att.Mult_ReloadTime = 1.15

	att.Mult_AccuracyMOA = 1.5
	att.Mult_HipDispersion = 1.35
	att.Mult_SightsDispersion = 1.2

	att.Override_Trivia_Calibre = ".45ACP"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_p226_roni.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_p226_roni")

	att.PrintName = "UMP Kit"
	att.Icon = Material("entities/arccw_mifl_fas2_p226_ump.png", "mips smooth")
	att.Description = "Aftermarket modification kit that looks like a down-sized UMP, capable of firing in full-auto. Longer top rail allows the attachment of regular sized optics."
	att.SortOrder = 12
	att.Slot = {"mifl_fas2_p226_slide"}

	att.AutoStats = true

	att.ModelOffset = Vector(0.5, 0, -2)

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2_raptor_glock.mdl"

	att.ExcludeFlags = {""}

	att.ActivateElements = {"ump_roni"}

	att.Override_HoldtypeActive = "smg"

	att.Add_BarrelLength = 4

	att.Mult_Recoil = 0.5
	att.Mult_RecoilSide = 0.75
	att.Mult_SightTime = 1.75
	att.Mult_Range = 2
	att.Mult_HipDispersion = 1.25
	att.Mult_SpeedMult = 0.9
	att.Mult_SightedSpeedMult = 0.8
	att.Mult_DrawTime = 1.5
	att.Mult_HolsterTime = 1.5
	att.Mult_RPM = 1.5

	att.Mult_ReloadTime = 1.125

	att.Override_Firemodes = {
	    {
	        Mode = 2,
	    },
	    {
	        Mode = 1
	    },
	    {
	        Mode = 0
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_p226_slide_c.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_p226_slide_c")

	att.PrintName = "Compact Slide"
	att.Icon = Material("entities/arccw_mifl_fas2_p226_slide_c.png", "mips smooth")
	att.Description = "Shortened slide that improves firerate and handling."
	att.SortOrder = -2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_p226_slide"

	att.Mult_Range = 0.75
	att.Mult_SightTime = 0.75
	att.Mult_DrawTime = 0.75
	att.Mult_Recoil = 1.25

	att.Mult_RPM = 1.15

	att.Add_BarrelLength = -1
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_p226_slide_carbine.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_p226_slide_carbine")

	att.PrintName = "Carbine Slide"
	att.Icon = Material("entities/arccw_mifl_fas2_p226_slide_x2.png", "mips smooth")
	att.Description = "Very long barrel that improves range a lot, perhaps a bit too much."
	att.SortOrder = 10
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_p226_slide"

	att.Mult_Range = 2
	att.Mult_Recoil = 0.5
	att.Mult_SightTime = 1.5
	att.Mult_AccuracyMOA = 0.25
	att.Mult_DrawTime = 1.5
	att.Mult_HolsterTime = 1.5
	att.Mult_RPM = 0.75

	att.Add_BarrelLength = 8

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_p226_slide_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_p226_slide_long")

	att.PrintName = "Extended Slide"
	att.Icon = Material("entities/arccw_mifl_fas2_p226_slide_x.png", "mips smooth")
	att.Description = "Longer slide and barrel that improves range and accuracy considerably."
	att.SortOrder = 8
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_p226_slide"

	att.Mult_Range = 1.5
	att.Mult_SightTime = 1.25
	att.Mult_DrawTime = 1.25
	att.Mult_HolsterTime = 1.25
	att.Mult_Recoil = 0.75
	att.Mult_AccuracyMOA = 0.5
	att.Mult_RPM = 0.85

	att.Add_BarrelLength = 4
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_perk_nomen.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_perk_nomen")

	att.PrintName = "Proficiency"
	att.Icon = Material("entities/acwatt_fas2_generic.png", "smooth")
	att.Description = "Improves reloading speed and weapon handling."
	att.Desc_Pros = {
		"Faster reloads"
	}
	att.Desc_Cons = {
	}
	att.Slot = "perk_fas2"

	att.InvAtt = {"perk_fastreload", "go_perk_fastreload"}

	att.Mult_DrawTime = 0.8
	att.Mult_SightTime = 0.95

	att.Hook_SelectReloadAnimation = function(wep, anim)
		local thething = wep.Animations["reload_nomen"] and "_nomen" or ""
		local empty = wep:Clip1() == 0 and "_empty" or ""

		return "reload" .. thething .. empty
	end

	att.AutoStats = true

	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_r454_lbarrel.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_r454_lbarrel")

	att.PrintName = "Long Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_r454_b_long.png", "mips smooth")
	att.Description = "Longer than long barrel for long range engagements."
	att.SortOrder = 10
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_r454_barrel"

	att.ActivateElements = {"b_long"}

	att.Mult_MoveSpeed = 0.95

	att.Mult_Range = 2
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.5
	att.Mult_AccuracyMOA = 0.5
	att.Mult_RPM = 0.8

	att.Add_BarrelLength = 8

	att.Mult_ShootPitch = 0.8
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_r454_mag_300.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_r454_mag_300")

	att.PrintName = ".300 Winchester Cylinder"
	att.Icon = Material("entities/arccw_mifl_fas2_r454_mag_300.png", "mips smooth")
	att.Description = "Specialised cartidge that excel at long ranges."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 2
	att.AutoStats = true
	att.Slot = {"mifl_fas2_r454_mag"}

	att.Mult_Penetration = 1.2
	att.Mult_Recoil = 1.2
	att.Mult_RPM = 0.9
	att.Mult_Damage = 0.8
	att.Mult_DamageMin = 3
	att.Mult_ShootPitch = 0.8
	att.Mult_ShootVol = 1.2

	att.Override_Ammo = "ar2"
	att.Override_Trivia_Calibre = ".300 Winchester Magnum"
	att.AddSuffix = " 300"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2_custom/deagle/9.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2/p226/p226_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_r454_mag_410.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_r454_mag_410")

	att.PrintName = ".410 Cylinder"
	att.Icon = Material("entities/arccw_mifl_fas2_r454_mag_23.png", "mips smooth")
	att.Description = "Cylinder conversion that accepts miniature shotgun shell."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 1
	att.AutoStats = true
	att.Slot = {"mifl_fas2_r454_mag"}

	att.Mult_Recoil = 2
	att.Mult_RecoilSide = 1.5
	att.Mult_SightTime = 0.9
	att.Mult_ReloadTime = 0.95
	att.Mult_Range = 0.5
	att.Mult_Penetration = 0.1
	att.Mult_Damage = 1.5
	att.Mult_DamageMin = 0.85

	att.Override_Num = 9
	att.Override_Ammo = "buckshot"
	att.Override_Trivia_Calibre = "20 Gauge"
	att.Override_Trivia_Class = "Shotgun"
	att.Override_ShellModel = "models/shells/shell_12gauge.mdl"
	att.Override_IsShotgun = true

	att.Mult_AccuracyMOA = 10
	att.Mult_RPM = 2

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2_custom/asval/20g.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2/p226/p226_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_r454_mag_9.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_r454_mag_9")

	att.PrintName = "45.ACP Cylinder"
	att.Icon = Material("entities/arccw_mifl_fas2_r454_mag_9.png", "mips smooth")
	att.Description = "Conversion to a very weak calibre for first time user. Exelent handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 0
	att.AutoStats = true
	att.Slot = {"mifl_fas2_r454_mag"}

	att.Mult_Penetration = 0.5
	att.Mult_Recoil = 0.2
	att.Mult_RPM = 3
	att.Mult_Damage = 0.3
	att.Mult_DamageMin = 0.5
	att.Mult_ShootPitch = 1.2
	att.Mult_ShootVol = 0.8
	att.Mult_ReloadTime = 0.75

	att.Override_Ammo = "pistol"
	att.Override_Trivia_Calibre = "45. ACP"
	att.AddSuffix = " 45"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2_custom/deagle/9.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2/p226/p226_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_r454_sbarrel.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_r454_sbarrel")

	att.PrintName = "Short Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_r454_b_short.png", "mips smooth")
	att.Description = "Small but reasonable barrel increasing maneuverability."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_r454_barrel"

	att.ActivateElements = {"b_short"}

	att.Mult_Range = 0.7
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 1.3

	att.Mult_RPM = 1.5
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_r454_sniper.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_r454_sniper")

	att.PrintName = "Sniper Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_r454_b_long2.png", "mips smooth")
	att.Description = "Extremely long barrel complete with wooden foregrip. For real long range hunting."
	att.SortOrder = 12
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_r454_barrel"

	att.ActivateElements = {"b_snip"}

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 3
	att.Mult_Recoil = 0.5
	att.Mult_RecoilSide = 0.5
	att.Mult_SightTime = 1.5
	att.Mult_AccuracyMOA = 0.2
	att.Mult_RPM = 0.65
	att.Mult_HipDispersion = 1.5

	att.Add_BarrelLength = 10

	att.Mult_ShootPitch = 0.7

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_k.mdl"

	att.ModelOffset = Vector(2, 0, 0)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_r454_stock.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_r454_stock")

	att.PrintName = "Compact Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_r454_stock.png", "mips smooth")
	att.Description = "Small wooden stock that dampen recoil slightly."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"mifl_fas2_r454_stock"}

	att.Mult_MoveSpeed = 0.8
	att.Mult_SightedSpeedMult = 0.75
	att.Mult_SightTime = 1.05
	att.Mult_Recoil = 0.7
	att.Mult_MoveDispersion = 0.7
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_r454_whisper.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_r454_whisper")

	att.PrintName = "Whisper Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_r454_b_sd.png")
	att.Description = "Some gun nerds may claim \"revolvers can't be suppressed\", but three satanic rituals complete with blood sacrfices and a pact with the devil will make this revolver quieter than the fart you attempted to hide during class. And just like this revolver, everyone heard it anyways."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true

	att.SortOrder = 2

	att.ActivateElements = {"whisperer"}

	att.Slot = "mifl_fas2_r454_barrel"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Mult_ShootPitch = 1.8
	att.Mult_ShootVol = 0.7
	att.Mult_AccuracyMOA = 0.75
	att.Mult_Range = 1.5

	att.Mult_SightTime = 1.25

	att.Mult_HipDispersion = 1.25

	att.Add_BarrelLength = 4

	att.Mult_RPM = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_r454_xbarrel.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_r454_xbarrel")

	att.PrintName = "No Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_r454_b_xshort.png", "mips smooth")
	att.Description = "When you asked for a snub nose, you weren’t thinking about this, were you? I hope not."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_r454_barrel"

	att.ActivateElements = {"b_no"}

	att.Mult_MoveSpeed = 1.3
	att.Mult_SightedSpeedMult = 1.7

	att.Mult_Range = 0.45
	att.Mult_Recoil = 1.5
	att.Mult_SightTime = 0.4
	att.Mult_AccuracyMOA = 5
	att.Mult_HipDispersion = 2

	att.Mult_ShootPitch = 1.1

	att.Mult_RPM = 2
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_roni.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_roni")

	att.PrintName = "Roni Kit"
	att.Icon = Material("entities/arccw_mifl_roni_frame.png", "mips smooth")
	att.Description = "Aftermarket modification kit turning a pistol into some sort of short barrel carbine. Longer top rail allows the attachment of regular sized optics, and bump slide enables the use of unstable pseudo-automatic fire."
	att.SortOrder = 8
	att.Slot = {"mifl_roni_conv", "mifl_fas2_g20_slide"}

	att.AutoStats = true

	att.ModelOffset = Vector(0.5, 0, -2)

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2_roni.mdl"

	att.ExcludeFlags = {""}

	att.ActivateElements = {"roni"}

	att.Add_BarrelLength = 4

	att.Mult_Recoil = 0.75
	att.Mult_RecoilSide = 0.75
	att.Mult_SightTime = 1.35
	att.Mult_Range = 1.5
	att.Mult_AccuracyMOA = 0.5
	att.Mult_MoveDispersion = 0.5
	att.Mult_HipDispersion = 1.75
	att.Mult_SpeedMult = 0.85
	att.Mult_SightedSpeedMult = 0.75
	att.Mult_DrawTime = 1.35
	att.Mult_HolsterTime = 1.35
	att.Mult_RPM = 0.9

	att.Override_Firemodes = {
	    {
	        Mode = 2,
	        PrintName = "BUMP",
	        Mult_RecoilSide = 2
	    },
	    {
	        Mode = 1
	    },
	    {
	        Mode = 0
	    }
	}

	att.AddSuffix = " Roni"

	att.Override_HoldtypeActive = "smg"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_roni_foregrip.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_roni_foregrip")

	att.PrintName = "Roni Foregrip"
	att.Icon = Material("entities/arccw_mifl_roni_grip.png", "mips smooth")
	att.Description = "Folding foregrip from a RONI carbine kit. Provides limited recoil and hipfire control."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "foregrip"

	att.LHIK = true

	att.Model = "models/weapons/arccw/mifl_atts/fas2_roni_grip.mdl"

	att.Mult_Recoil = 0.9
	att.Mult_HipDispersion = 0.9
	att.Mult_SightTime = 1.1
	att.Mult_SightedSpeedMult = 0.85

	att.ModelOffset = Vector(-5.5, 0, -1.2)

	att.Override_HoldtypeActive = "smg"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_roni_foregrip2.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_roni_foregrip2")

	att.PrintName = "Roni Angled Foregrip"
	att.Icon = Material("entities/arccw_mifl_roni_grip2.png", "mips smooth")
	att.Description = "Half closed folding grip from a RONI carbine kit. Improves handling in a fashion similar to an AFG."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "foregrip"

	att.InvAtt = "mifl_fas2_roni_foregrip"
	att.LHIK = true

	att.Model = "models/weapons/arccw/mifl_atts/fas2_roni_marksman_grip.mdl"

	att.Mult_SightTime = 0.9
	att.Mult_Recoil = 0.9
	att.Mult_SightedSpeedMult = 0.85
	att.Mult_HipDispersion = 1.1

	att.ModelOffset = Vector(-5.5, 0, -1.2)

	att.Override_HoldtypeActive = "ar2"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_roni_marksman.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_roni_marksman")

	att.PrintName = "Roni Marksman Kit"
	att.Icon = Material("entities/arccw_mifl_roni_frame_l.png", "mips smooth")
	att.Description = "Custom modification kit turning a pistol into some sort of marksman rifle. Longer top rail allows the attachment of regular sized optics, and compensated barrel allows for damped recoil."
	att.SortOrder = 16
	att.Slot = {"mifl_roni_conv_2", "mifl_fas2_deagle_slide"}

	att.AutoStats = true

	att.ModelOffset = Vector(0.5, 0, -2)

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2_roni_marksman.mdl"

	att.ExcludeFlags = {""}

	att.ActivateElements = {"roni_dmr"}

	att.Add_BarrelLength = 4

	att.Mult_Recoil = 0.5
	att.Mult_RecoilSide = 0.5
	att.Mult_SightTime = 1.25
	att.Mult_Range = 2
	att.Mult_AccuracyMOA = 0.15
	att.Mult_MoveDispersion = 0.5
	att.Mult_HipDispersion = 2
	att.Mult_SpeedMult = 0.9
	att.Mult_SightedSpeedMult = 0.75
	att.Mult_DrawTime = 2
	att.Mult_HolsterTime = 2
	att.Mult_RPM = 0.75

	att.Override_HoldtypeActive = "ar2"

	att.AddSuffix = " Roni"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sg55x_barrel_550.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sg55x_barrel_550")

	att.PrintName = "550 Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_sg55x_550.png", "mips smooth")
	att.Description = "Switch in the longer barreled sniper form of the SG rifle, complete with anti-glare strap."
	att.SortOrder = 9
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.AutoStats = true
	att.Slot = "mifl_fas2_sg55x_hg"

	att.Mult_MoveSpeed = 0.85

	att.Mult_Range = 2.5
	att.Mult_Recoil = 0.5

	att.Mult_SightTime = 1.5
	att.Mult_HipDispersion = 2

	att.Mult_AccuracyMOA = 0.25
	att.Mult_RPM = 0.5

	att.Add_BarrelLength = 10
	att.Mult_ShootPitch = 0.75

	--[[]
	att.Override_Firemodes = {
	    {
	        Mode = -3
	    },
	    {
	        Mode = 1
	    },
	    {
	        Mode = 0
	    }
	}
	]]

	att.Hook_GetShootSound = function(wep, fsound)
	    local mag = wep.Attachments[7].Installed
	    if mag == "mifl_fas2_sg55x_mag_45" or mag == "mifl_fas2_sg55x_mag_45_64" then return end
	    if fsound == "weapons/arccw_mifl/fas2/sg55x/sg552_fire1.wav" then return "weapons/arccw_mifl/fas2/sg55x/sg550_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/sg55x/sg552_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/sg55x/sg550_suppressed_fire1.wav" end
	end

	att.Hook_AddShootSound = function(wep, fsound, volume, pitch)
	    wep:MyEmitSound("weapons/arccw_mifl/fas2/sg55x/sg550_boltforward.wav", 90, 100, 0.4, CHAN_WEAPON - 1)
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sg55x_barrel_551.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sg55x_barrel_551")

	att.PrintName = "551 Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_sg55x_551.png", "mips smooth")
	att.Description = "Intermediate lengthed SG551 barrel for when the 550 is too unwieldy but the 552 too compact."
	att.SortOrder = 10
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.AutoStats = true
	att.Slot = "mifl_fas2_sg55x_hg"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.75

	att.Mult_SightTime = 1.25
	att.Mult_HipDispersion = 1.5

	att.Mult_AccuracyMOA = 0.5
	att.Mult_RPM = 0.8

	att.Add_BarrelLength = 4
	att.Mult_ShootPitch = 0.9

	--[[]
	att.Override_Firemodes = {
	    {
	        Mode = 1
	    },
	    {
	        Mode = 0
	    }
	}
	]]

	att.Hook_GetShootSound = function(wep, fsound)
	    local mag = wep.Attachments[7].Installed
	    if mag == "mifl_fas2_sg55x_mag_45" or mag == "mifl_fas2_sg55x_mag_45_64" then return end
	    if fsound == "weapons/arccw_mifl/fas2/sg55x/sg552_fire1.wav" then return "weapons/arccw_mifl/fas2/sg55x/sg550_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/sg55x/sg552_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/sg55x/sg550_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sg55x_barrel_kompact.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sg55x_barrel_kompact")

	att.PrintName = "Nikov Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_sg55x_762.png", "mips smooth")
	att.Description = "The Swiss and the Russians devise a dastardly plan."
	att.SortOrder = 6
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_sg55x_hg"

	att.Mult_Range = 1.25
	att.Mult_Recoil = 0.9
	att.Mult_SightTime = 1.1
	att.Mult_AccuracyMOA = 1.2

	att.Mult_MoveDispersion = 1
	att.Mult_HipDispersion = 1

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sg55x_barrel_kompact2.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sg55x_barrel_kompact2")

	att.PrintName = "Compact Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_sg55x_kurz.png", "mips smooth")
	att.Description = "Considerably shorter barrel for navigating really tight corridors."
	att.SortOrder = 2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
		"con.fas2.ubgl"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_sg55x_hg"

	att.Mult_MoveSpeed = 1.1

	att.Mult_Range = 0.6
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.75
	att.Mult_AccuracyMOA = 1.4
	att.Mult_RPM = 1.15

	att.Mult_HipDispersion = 0.75

	att.Add_BarrelLength = -5
	att.Mult_ShootPitch = 1.2
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sg55x_barrel_no.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sg55x_barrel_no")

	att.PrintName = "No Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_sg55x_xbarrel.png", "mips smooth")
	att.Description = "\"Ok, not that short!\""
	att.SortOrder = 1
	att.Desc_Pros = {
		"pro.fas2.xs",
	}
	att.Desc_Cons = {
		"con.fas2.ubgl",
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_sg55x_hg"
	att.Override_ShootWhileSprint = true
	att.Mult_MoveDispersion = 3
	att.Mult_MoveSpeed = 1.2
	att.Mult_Range = 0.5
	att.Mult_Recoil = 1.5
	att.Mult_SightTime = 0.5
	att.Mult_AccuracyMOA = 2
	att.Mult_RPM = 1.25
	att.Mult_ReloadTime = 0.9

	att.Add_BarrelLength = -7

	att.ModelOffset = Vector(-5, -4.2, 1.2)

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_m4x.mdl"

	--att.Mult_MoveDispersion = 0.8
	att.Mult_HipDispersion = 1.5

	att.Mult_ShootPitch = 1.4
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sg55x_barrel_saf.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sg55x_barrel_saf")

	att.PrintName = "SAF Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_sg55x_saf.png", "mips smooth")
	att.Description = "Compact paratrooper handguard with recoil-trapping hyper-burst mechanism, allowing for low recoil burst fire."
	att.SortOrder = 3
	att.Desc_Pros = {
	    "pro.fas2.saf"
	}
	att.Desc_Cons = {
		"con.fas2.saf",
		"con.fas2.ubgl"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_sg55x_hg"

	att.Mult_Range = 0.8
	att.Mult_Recoil = 1.2
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 1.5

	att.Mult_HipDispersion = 0.8

	att.Add_BarrelLength = -5
	att.Mult_ShootPitch = 0.9

	att.Override_Firemodes = {
	    {
	        Mode = -3,
	        Mult_RPM = 1.5,
	        PostBurstDelay = 0.2,
	    },
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

	att.Hook_ModifyRecoil = function(wep)
	    local thing
	    if wep:GetBurstCount() >= wep:GetBurstLength() then
	        thing = wep:GetBurstCount()
	    else
	        thing = 0.6
	    end
	    return {
	        Recoil           = thing,
	        RecoilSide       = thing * 0.75,
	        VisualRecoilMult = 1,
	    }
	end

	att.Hook_AddShootSound = function(wep, fsound, volume, pitch)
	    if wep:GetBurstCount() >= wep:GetBurstLength() then
	        wep:MyEmitSound("weapons/arccw_mifl/fas2/sg55x/sg550_stock.wav", 70, 100, 1, CHAN_ITEM)
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sg55x_barrel_saf2.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sg55x_barrel_saf2")

	att.PrintName = "SAF Mod. 0 Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_sg55x_m249.png", "mips smooth")
	att.Description = "Full-length handguard making full use of the recoil-trappping hyper-burst mechanism, extending burst duration to 5 rounds instead of 3."
	att.SortOrder = 3
	att.Desc_Pros = {
	    "pro.fas2.saf"
	}
	att.Desc_Cons = {
		"con.fas2.saf"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_sg55x_hg"

	att.Mult_MoveSpeed = 0.95
	att.Mult_Recoil = 1.1
	att.Mult_AccuracyMOA = 1.25

	att.Mult_ShootPitch = 0.9

	att.Override_Firemodes = {
	    {
	        Mode = -5,
	        Mult_RPM = 1.5,
	        PostBurstDelay = 0.25,
	    },
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
	att.Hook_FiremodeBars = function(wep)
	    if wep:GetCurrentFiremode().Mode == -5 then
	        local gbc = wep:GetBurstCount()
	        local ourreturn = ""

	        ourreturn = ourreturn .. ((gbc >= 1 and "-") or "_")
	        ourreturn = ourreturn .. ((gbc >= 2 and "-") or "_")
	        ourreturn = ourreturn .. ((gbc >= 3 and "-") or "_")
	        ourreturn = ourreturn .. ((gbc >= 4 and "-") or "_")

	        if gbc >= 5 then
	            ourreturn = "!!!!!"
	        else ourreturn = ourreturn .. "!" end

	        return ourreturn
	    end
	end

	att.Hook_ModifyRecoil = function(wep)
	    local thing
	    if wep:GetBurstCount() >= wep:GetBurstLength() then
	        thing = wep:GetBurstCount()
	    else
	        thing = 0.63
	    end
	    return {
	        Recoil           = thing,
	        RecoilSide       = thing * 0.85,
	        VisualRecoilMult = 0.8,
	    }
	end

	att.Hook_AddShootSound = function(wep, fsound, volume, pitch)
	    if wep:GetBurstCount() >= wep:GetBurstLength() then
	        wep:MyEmitSound("weapons/arccw_mifl/fas2/sg55x/sg550_stock.wav", 70, 100, 1, CHAN_ITEM)
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sg55x_barrel_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sg55x_barrel_sd")

	att.PrintName = "Whisper Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_sg55x_sd.png", "mips smooth")
	att.Description = "Integral supressor for stealth operations."
	att.SortOrder = 8
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true

	att.ActivateElements = {"whisperer"}
	att.GivesFlags = {"mifl_fas2_sg55x_barrel_sd"}

	att.Slot = "mifl_fas2_sg55x_hg"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Mult_ShootPitch = 1.5
	att.Mult_ShootVol = 0.75
	att.Mult_AccuracyMOA = 0.9
	att.Mult_Range = 1.2

	att.Mult_SightTime = 1.1

	att.Mult_HipDispersion = 1.2

	att.Add_BarrelLength = 6

	att.Override_PhysTracerProfile = 5

	att.Mult_RPM = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sg55x_mag_45.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sg55x_mag_45")

	att.PrintName = "32-Round .45ACP"
	att.Icon = Material("entities/arccw_mifl_fas2_sg55x_m_45.png", "mips smooth")
	att.Description = ".45 ACP conversion turning the rifle into a pistol caliber carbine. An odd choice for a precision rifle, but it does fire faster and with less recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	--    "con.magcap"
	}
	att.SortOrder = 32
	att.AutoStats = true
	att.Slot = "mifl_fas2_sg55x_mag"

	att.ActivateElements = {"32"}

	att.Mult_Recoil = 0.6
	att.Mult_RPM = 1.25
	att.Mult_Range = 0.75
	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 0.8
	att.Mult_Penetration = 0.7

	att.Override_ClipSize = 32
	att.Mult_ReloadTime = 0.9

	att.Override_Ammo = "pistol"
	att.Override_ShellModel = "models/shells/shell_9mm.mdl"
	att.Override_Trivia_Class = "Submachine Gun"
	att.Override_Trivia_Calibre = ".45 ACP"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2_custom/sg552/45.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2_custom/sg552/45sd.wav" end
	end

	att.InvAtt = {"mifl_fas2_g36_mag_9mm_15", "mifl_fas2_g20_mag_17_9", "mifl_fas2_m4a1_mag_9mm_21", "mifl_fas2_m11_mag_16", "mifl_fas2_m24_mag_9mm", "mifl_fas2_mp5_mag_15", "mifl_fas2_famas_mag_9mm_25"}

	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sg55x_mag_45_64.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sg55x_mag_45_64")

	att.PrintName = "58-Round .45ACP"
	att.Icon = Material("entities/arccw_mifl_fas2_sg55x_m_45.png", "mips smooth")
	att.Description = "Large magazine for the .45 ACP conversion. An odd choice for a precision rifle, but it does fire faster and with less recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	--    "con.magcap"
	}
	att.SortOrder = 58
	att.AutoStats = true
	att.Slot = "mifl_fas2_sg55x_mag"

	att.ActivateElements = {"58"}

	att.Mult_Recoil = 0.6
	att.Mult_RPM = 1.25
	att.Mult_Range = 0.75
	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 0.8
	att.Mult_Penetration = 0.7

	att.Override_ClipSize = 58
	att.Mult_SightTime = 1.25
	att.Mult_ReloadTime = 1.15
	att.Mult_SpeedMult = 0.95

	att.Override_Ammo = "pistol"
	att.Override_ShellModel = "models/shells/shell_9mm.mdl"
	att.Override_Trivia_Class = "Submachine Gun"
	att.Override_Trivia_Calibre = ".45 ACP"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2_custom/sg552/45.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2_custom/sg552/45sd.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sg55x_mag_762.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sg55x_mag_762")

	att.PrintName = "30-Round 7.62mm"
	att.Icon = Material("entities/arccw_mifl_fas2_sg55x_m_762.png", "mips smooth")
	att.Description = "7.62x39mm conversion for the SG rifle. It's hard to imagine what the geniuses in Switzerland were thinking when they made this possible, but it does make for a more potent cartridge."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	--    "con.magcap"
	}
	att.SortOrder = 30
	att.AutoStats = true
	att.Slot = "mifl_fas2_sg55x_mag"

	att.ActivateElements = {"30"}

	att.Mult_Recoil = 1.4
	att.Mult_RecoilSide = 1.25

	att.Mult_RPM = 0.85
	att.Mult_Damage = 1.25
	att.Mult_DamageMin = 1.25
	att.Mult_Range = 1.25
	att.Mult_Penetration = 1.5

	att.Override_ClipSize = 30
	att.Mult_ReloadTime = 1.15

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2_custom/sg552/ak.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2_custom/sg552/aksd.wav" end
	end

	att.Override_Trivia_Calibre = "7.62x39mm Soviet"
	att.Override_Ammo = "ar2"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sg55x_mag_762_15.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sg55x_mag_762_15")

	att.PrintName = "15-Round 7.62mm"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_mag_762s.png", "mips smooth")
	att.Description = "Reduced 7.62x39mm round magazine. It's hard to imagine what the geniuses in Switzerland were thinking when they made this possible, but it does make for a more potent cartridge."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	--    "con.magcap"
	}
	att.SortOrder = 15
	att.AutoStats = true
	att.Slot = "mifl_fas2_sg55x_mag"

	att.ActivateElements = {"15"}

	att.Mult_Recoil = 1.4
	att.Mult_RecoilSide = 1.25

	att.Mult_RPM = 0.85
	att.Mult_Damage = 1.25
	att.Mult_DamageMin = 1.25
	att.Mult_Range = 1.25
	att.Mult_Penetration = 1.5

	att.Override_ClipSize = 15

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2_custom/sg552/ak.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2_custom/sg552/aksd.wav" end
	end

	att.Override_Trivia_Calibre = "7.62x39mm Soviet"
	att.Override_Ammo = "ar2"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sg55x_stock_sniper.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sg55x_stock_sniper")

	att.PrintName = "Sniper Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_sg55x_s_550.png", "mips smooth")
	att.Description = "Expensive and fine-tuned sniper stock designed for the SG550-1, known to be very comfortable to shoot with."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_sg55x_stock"

	att.Mult_SightTime = 1.25

	att.Mult_SightedSpeedMult = 0.5
	att.Mult_Recoil = 0.85
	att.Mult_RecoilSide = 0.5
	att.Mult_MoveDispersion = 0.25
	att.Mult_HipDispersion = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sg55x_stock_soviet.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sg55x_stock_soviet")

	att.PrintName = "Soviet Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_sg55x_s_762.png", "mips smooth")
	att.Description = "Solid wood stock ripped from an AKM, probably the outcome of some bored Russian's pasttime."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_sg55x_stock"

	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.25
	att.Mult_SpeedMult = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sr25_barrel_ak.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sr25_barrel_ak")

	att.PrintName = "SR-25 Ukoro Handguard"
	att.Icon =  Material("entities/arccw_mifl_fas2_sr25_hg_ak.png", "mips smooth")
	att.Description = "An unholy handguard from the deepest depths of the USSR."
	att.SortOrder = 8
	att.Desc_Pros = {
	    "pro.fullauto",
	}
	att.Desc_Cons = {
	    "con.fas2.ubgl",
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_sr25_hg"

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
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_sd.mdl"

	att.ModelOffset = Vector(0, 0.5, 0)

	att.Mult_Range = 0.5
	att.Mult_SightTime = 0.8
	att.Mult_HipDispersion = 0.8
	att.Mult_Recoil = 1.1
	att.Mult_AccuracyMOA = 3

	att.Mult_MoveDispersion = 1.5

	att.Add_BarrelLength = -4
	att.Mult_ShootPitch = 0.9

	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sr25_barrel_auto.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sr25_barrel_auto")

	att.PrintName = "SR-25 Auto Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_sr25_hg_auto.png", "mips smooth")
	att.Description = "Shortened barrel and handguard combined with an auto sear kit. In case you needed that marksmanship at a ten-meter distance, very quickly."
	att.SortOrder = 10
	att.Desc_Pros = {
	    "pro.fullauto",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_sr25_hg"

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

	att.Mult_Range = 0.75
	att.Mult_AccuracyMOA = 2
	att.Mult_Recoil = 1.25

	att.Add_BarrelLength = -2
	att.Mult_ShootPitch = 1.05
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sr25_barrel_c.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sr25_barrel_c")

	att.PrintName = "SR-25 Commando Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_sr25_hg_c.png", "mips smooth")
	att.Description = "Make your AR more like an AR with a M4 pattern handguard and carry handle. The fixed carbine barrel really hurts performance though."
	att.SortOrder = 9
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
		"con.fas2.ubgl",
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_sr25_hg"

	att.Mult_Range = 0.5
	att.Mult_SightTime = 0.75
	att.Mult_HipDispersion = 0.8
	att.Mult_Recoil = 1.25
	att.Mult_AccuracyMOA = 3

	att.Add_BarrelLength = -4
	att.Mult_ShootPitch = 1.1

	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sr25_barrel_k.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sr25_barrel_k")

	att.PrintName = "SR-25 Kurz Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_sr25_hg_k.png", "mips smooth")
	att.Description = "The removal of the barrel means this gun is neither for marksmanship or a rifle. So what is it really now...?"
	att.SortOrder = 4
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
		"con.fas2.ubgl",
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_sr25_hg"
	att.ModelOffset = Vector(-7, -4.8, 1.2)

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_m4x.mdl"

	att.Mult_MoveSpeed = 1.15
	att.Mult_SightedMoveSpeed = 1.3

	att.Mult_ShootPitch = 1.5

	att.Add_BarrelLength = -12
	att.Mult_SightTime = 0.5
	att.Mult_Recoil = 2
	att.Mult_RPM = 1.25
	att.Mult_Range = 0.5
	att.Mult_AccuracyMOA = 10
	att.Mult_ReloadTime = 0.85

	att.Mult_DrawSpeeed = 1.5
	att.Mult_HolsterSpeed = 1.5

	--att.Override_ShootWhileSprint = true
	att.Mult_MoveDispersion = 2
	--att.Mult_HipDispersion = 1
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sr25_barrel_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sr25_barrel_sd")

	att.PrintName = "SR-25 Whisper Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_sr25_hg_sd.png", "mips smooth")
	att.Description = "Lengthy integrated suppressor optimized for marksman use. Those Iraqi civilians will never hear you coming."
	att.SortOrder = 20
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_sr25_hg"


	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Mult_ShootPitch = 1.4
	att.Mult_ShootVol = 0.7
	att.Mult_Range = 1.25
	att.Mult_SightTime = 1.25
	att.Mult_HipDispersion = 1.5
	att.Mult_AccuracyMOA = 0.5
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sr25_mag_556_20.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sr25_mag_556_20")

	att.PrintName = "20-Round 5.56mm SR-25"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_ammo_20.png", "mips smooth")
	att.Description = "Small AR-15 magazine for the 5.56mm SR-25 conversion."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 20 + 100
	att.AutoStats = true
	att.Slot = {"mifl_fas2_sr25_mag"}

	att.Override_ClipSize = 20

	att.Mult_AccuracyMOA = 3
	att.Mult_RPM = 1.1

	att.Mult_Damage = 0.8
	att.Mult_DamageMin = 0.7

	att.Mult_Recoil = 0.6
	att.Mult_RecoilSide = 0.5
	att.Mult_VisualRecoilMult = 0.8

	att.Mult_ReloadTime = 0.9
	att.Mult_SightTime = 0.9
	att.Mult_SpeedMult = 1.05

	att.Override_Ammo = "smg1"
	att.Override_Trivia_Calibre = "Assault Rifle"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2/m4a1/m4_fire1.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2/m4a1/m4_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sr25_mag_556_30.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sr25_mag_556_30")

	att.PrintName = "30-Round 5.56mm SR-25"
	att.Icon = Material("entities/arccw_mifl_fas2_g3_mag_556_30.png", "mips smooth")
	att.Description = "Convert the rifle to fire intermediate cartridges. It's what Stoner would've wanted."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 30 + 100
	att.AutoStats = true
	att.Slot = {"mifl_fas2_sr25_mag"}

	att.Override_ClipSize = 30

	att.Mult_AccuracyMOA = 3
	att.Mult_RPM = 1.1

	att.Mult_Damage = 0.8
	att.Mult_DamageMin = 0.7

	att.Mult_Recoil = 0.6
	att.Mult_RecoilSide = 0.5
	att.Mult_VisualRecoilMult = 0.8

	att.Override_Ammo = "smg1"
	att.Override_Trivia_Calibre = "Assault Rifle"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2/m4a1/m4_fire1.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2/m4a1/m4_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sr25_mag_556_60.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sr25_mag_556_60")

	att.PrintName = "60-Round 5.56mm SR-25"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_ammo_60.png", "mips smooth")
	att.Description = "Quad stack magazine in a lower calibre."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 60 + 100
	att.AutoStats = true
	att.Slot = {"mifl_fas2_sr25_mag"}

	att.Override_ClipSize = 60

	att.Mult_AccuracyMOA = 3
	att.Mult_RPM = 1.1

	att.Mult_Damage = 0.8
	att.Mult_DamageMin = 0.7

	att.Mult_Recoil = 0.6
	att.Mult_RecoilSide = 0.5
	att.Mult_VisualRecoilMult = 0.8

	att.Mult_Recoil = 0.8
	att.Mult_RecoilSide = 0.4
	att.Mult_VisualRecoilMult = 0.8

	att.Override_Ammo = "smg1"
	att.Override_Trivia_Calibre = "Assault Rifle"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2/m4a1/m4_fire1.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2/m4a1/m4_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sr25_mag_762_20.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sr25_mag_762_20")

	att.PrintName = "20-Round 7.62x51mm SR-25"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_ammo_20.png", "mips smooth")
	att.Description = "Marginally larger magazine for increased capacity."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 20 + 1000
	att.AutoStats = true
	att.Slot = {"mifl_fas2_sr25_mag"}

	att.Override_ClipSize = 20

	att.Mult_MoveSpeed = 0.98
	att.Mult_SightTime = 1.08
	att.Mult_ReloadTime = 1.08

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_fire1.wav" then return "weapons/arccw_mifl/fas2/m4a1/m16a2_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/m4a1/m16a2_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sr25_mag_762_30.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sr25_mag_762_30")

	att.PrintName = "30-Round 7.62x51mm SR-25"
	att.Icon = Material("entities/arccw_mifl_fas2_sg55x_m_762.png", "mips smooth")
	att.Description = "Curved AK magazine that got converted for 7.62x51mm use. The sight of this on the weapon is concerning, but what's a little Russian flavor on an American gun?"
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 30 + 1000
	att.AutoStats = true
	att.Slot = {"mifl_fas2_sr25_mag"}

	att.Override_ClipSize = 30

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.1
	att.Mult_ReloadTime = 1.15

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_fire1.wav" then return "weapons/arccw_mifl/fas2/m4a1/m16a2_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/m4a1/m16a2_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sr25_mag_9mm_25.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sr25_mag_9mm_25")

	att.PrintName = "25-Round 9mm SR-25"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_ammo_21.png", "mips smooth")
	att.Description = "Convert the marksman rifle to fire pistol caliber cartridges. It ain't an AR-15 if you can't make it shoot nine mil."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 25 + 50
	att.AutoStats = true
	att.Slot = {"mifl_fas2_sr25_mag"}

	att.Override_ClipSize = 25

	att.Mult_Damage = 0.6
	att.Mult_DamageMin = 0.4
	att.Mult_Penetration = 0.25
	att.Mult_Recoil = 0.25
	att.Mult_RecoilSide = 0.2
	att.Mult_VisualRecoilMult = 0.75
	att.Mult_RPM = 1.3
	att.Mult_AccuracyMOA = 6
	att.Mult_ShootPitch = 1.2

	att.Override_Ammo = "pistol"
	att.Override_ShellModel = "models/shells/shell_9mm.mdl"
	att.Override_Trivia_Class = "Submachine Gun"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"
	att.AddSuffix = " 9mm"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2/mp5/mp5k_fire1.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2/mp5/mp5k_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sr25_mag_9mm_32.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sr25_mag_9mm_32")

	att.PrintName = "32-Round 9mm SR-25"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_ammo_32.png", "mips smooth")
	att.Description = "Convert the marksman rifle to fire pistol caliber cartridges, packed in a long stick mag."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 32 + 50
	att.AutoStats = true
	att.Slot = {"mifl_fas2_sr25_mag"}

	att.Mult_SightTime = 1.1
	att.Mult_ReloadTime = 1.1
	att.Mult_SpeedMult = 0.95
	att.Override_ClipSize = 32

	att.Mult_Damage = 0.6
	att.Mult_DamageMin = 0.4
	att.Mult_Penetration = 0.25
	att.Mult_Recoil = 0.25
	att.Mult_RecoilSide = 0.2
	att.Mult_VisualRecoilMult = 0.75
	att.Mult_RPM = 1.3
	att.Mult_AccuracyMOA = 6
	att.Mult_ShootPitch = 1.2

	att.Override_Ammo = "pistol"
	att.Override_ShellModel = "models/shells/shell_9mm.mdl"
	att.Override_Trivia_Class = "Submachine Gun"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"
	att.AddSuffix = " 9mm"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2/mp5/mp5k_fire1.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2/mp5/mp5k_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_sr25_mag_9mm_50.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_sr25_mag_9mm_50")

	att.PrintName = "50-Round 9mm SR-25"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_ammo_50.png", "mips smooth")
	att.Description = "9mm drum magazine for a converted SR-25. By conversion, we mean in a religious sense, not in a mechanical sense. This SR-25 is a new man now. Or new gun, I dunno."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 50 + 50
	att.AutoStats = true
	att.Slot = {"mifl_fas2_sr25_mag"}

	att.Mult_SightTime = 1.15
	att.Mult_ReloadTime = 1.25
	att.Mult_SpeedMult = 0.9
	att.Override_ClipSize = 50

	att.Mult_Damage = 0.6
	att.Mult_DamageMin = 0.4
	att.Mult_Penetration = 0.25
	att.Mult_Recoil = 0.25
	att.Mult_RecoilSide = 0.2
	att.Mult_VisualRecoilMult = 0.75
	att.Mult_RPM = 1.3
	att.Mult_AccuracyMOA = 6
	att.Mult_ShootPitch = 1.2

	att.Override_Ammo = "pistol"
	att.Override_ShellModel = "models/shells/shell_9mm.mdl"
	att.Override_Trivia_Class = "Submachine Gun"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"
	att.AddSuffix = " 9mm"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2/mp5/mp5k_fire1.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2/mp5/mp5k_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_toz34_mag_300.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_toz34_mag_300")

	att.PrintName = "TOZ-34 .300 Winchester Magnum"
	att.Icon = Material("entities/arccw_mifl_fas2_toz_300.png", "mips smooth")
	att.Description = "Hunting cartridge that somehow made its way to a shotgun. Has impressive long-range performance, but overpenetrates up close."
	att.Desc_Pros = {
	    "pro.fas2.pen.18"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 2
	att.AutoStats = true
	att.Slot = {"mifl_fas2_toz34_mag"}

	att.Mult_Damage = 0.5
	att.Mult_DamageMin = 1.8
	att.Mult_Recoil = 1.4
	att.Override_Penetration = 18
	att.Mult_AccuracyMOA = 0.25

	att.Override_IsShotgun_Priority = 1000
	att.Override_Num = 1
	att.Override_Ammo = "ar2"
	att.Override_Trivia_Calibre = ".300 Winchester Magnum"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2/m24/m24_fire1.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2/m24/m24_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_toz34_mag_50.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_toz34_mag_50")

	att.PrintName = "TOZ-34 .50 BMG"
	att.Icon = Material("entities/arccw_mifl_fas2_r454_mag_300.png", "mips smooth")
	att.Description = "If God did not want you to put .50 BMG in a shotgun, he would not have made them the same diameter. Actually, considering the fact that your gun can even fire this at all, you probably have his explicit approval."
	att.Desc_Pros = {
	    "pro.fas2.pen.25"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 5
	att.AutoStats = true
	att.Slot = {"mifl_fas2_toz34_mag"}

	att.Mult_RPM = 0.5
	att.Mult_Damage = 2
	att.Mult_Range = 2
	att.Mult_Recoil = 3
	att.Mult_RecoilSide = 2
	att.Override_Penetration = 25
	att.Mult_AccuracyMOA = 0.6

	att.Override_IsShotgun = false
	att.Override_IsShotgun_Priority = 1000
	att.Override_Num = 1
	att.Override_Ammo = "SniperPenetratedRound"
	att.Override_Trivia_Calibre = ".50 BMG"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2/m82/m82_fire1.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2/m82/m82_whisper.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_toz34_mag_762.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_toz34_mag_762")

	att.PrintName = "TOZ-34 7.62x39mm AP"
	att.Icon = Material("entities/arccw_mifl_fas2_toz_762.png", "mips smooth")
	att.Description = "Load tiny (by comparison) armor piercing rifle rounds into this shotgun. Damage isn't too impressive, but it shoots straight and that's what matters."
	att.Desc_Pros = {
	    "pro.fas2.pen.12"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 1
	att.AutoStats = true
	att.Slot = {"mifl_fas2_toz34_mag"}

	att.Mult_RPM = 1.25

	att.Mult_Damage = 0.6
	att.Mult_DamageMin = 0.6
	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.6
	att.Mult_RecoilSide = 0.5
	att.Override_Penetration = 12
	att.Mult_AccuracyMOA = 0.15
	att.Override_Num = 1
	att.Override_Ammo = "ar2"
	att.Override_IsShotgun = false
	att.Override_IsShotgun_Priority = 1000

	att.Override_Trivia_Calibre = "7.62x39mm Soviet"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2_custom/sg552/ak.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2_custom/sg552/aksd.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_toz_bar_1x_l.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_toz_bar_1x_l")

	att.PrintName = "Marksman Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_toz_1.png", "mips smooth")
	att.Description = "Use a single more accurate barrel instead of 2 barrels. The removal of the bottom barrel also improves weapon agility."
	att.SortOrder = 1
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_toz34_bar"

	att.Override_ClipSize = 1

	att.Mult_AccuracyMOA = 0.8
	att.Mult_ReloadTime = 0.95
	att.Mult_SightTime = 0.8
	att.Mult_SpeedMult = 1.05
	att.Mult_SightedSpeedMult = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_toz_bar_1x_s.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_toz_bar_1x_s")

	att.PrintName = "Obrez Marksman Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_toz_1s.png", "mips smooth")
	att.Description = "A single shortened barrel. Slightly more agile and accurate than obrez barrels."
	att.SortOrder = 0
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_toz34_bar"

	att.Override_ClipSize = 1

	att.Mult_SpeedMult = 1.15
	att.Mult_SightedSpeedMult = 1.3

	att.Mult_ReloadTime = 0.8
	att.Mult_SightTime = 0.7
	att.Mult_HipDispersion = 0.5
	att.Mult_DrawTime = 0.75
	att.Mult_HolsterTime = 0.75

	att.Mult_Range = 0.3
	att.Mult_AccuracyMOA = 2
	att.Mult_Recoil = 1.25
	att.Mult_MoveDispersion = 2

	att.Mult_ShootPitch = 1.5
	att.Add_BarrelLength = -10
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_toz_bar_1x_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_toz_bar_1x_sd")

	att.PrintName = "Valkyrie Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_toz_1sd.png", "mips smooth")
	att.Description = "A single obrez barrel with a long integrated suppressor. Very quiet, but not as agile as other obrez barrels."
	att.SortOrder = 2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_toz34_bar"

	att.Override_ClipSize = 1

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Mult_ShootPitch = 1.5
	att.Mult_ShootVol = 0.65

	att.Mult_SpeedMult = 1.05
	att.Mult_SightedSpeedMult = 1.1

	att.Mult_ReloadTime = 0.9

	att.Mult_Recoil = 1.2
	att.Mult_MoveDispersion = 1.5
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_toz_bar_2x_s.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_toz_bar_2x_s")

	att.PrintName = "Obrez Barrels"
	att.Icon = Material("entities/arccw_mifl_fas2_toz_2s.png", "mips smooth")
	att.Description = "Cut down barrel that improves agility considerably, at the cost of range."
	att.SortOrder = 3
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_toz34_bar"

	att.Mult_SpeedMult = 1.1
	att.Mult_SightedSpeedMult = 1.2

	att.Mult_ReloadTime = 0.85
	att.Mult_SightTime = 0.75
	att.Mult_HipDispersion = 0.5
	att.Mult_DrawTime = 0.75
	att.Mult_HolsterTime = 0.75

	att.Mult_Range = 0.3
	att.Mult_AccuracyMOA = 3
	att.Mult_Recoil = 1.25
	att.Mult_MoveDispersion = 2

	att.Mult_ShootPitch = 1.5
	att.Add_BarrelLength = -10
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ubw_870.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ubw_870")

	att.PrintName = "R870 (BUCK)"
	att.Icon = Material("entities/arccw_mifl_fas2_ubw_r870.png", "smooth")
	att.Description = "Underslung shotgun used as a breaching device. The masterkey to any door."
	att.Desc_Pros = {
	    "Selectable underbarrel shotgun",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "Double tap +ZOOM to toggle underbarrel",
	}
	att.AutoStats = true
	att.Slot = {"ubgl"}

	att.LHIK = true
	att.LHIK_Animation = true
	att.LHIK_GunDriver = nil ---"UBGL_Frame"
	att.MountPositionOverride = 0

	att.Model = "models/weapons/arccw/mifl_atts/fas2/ubgl_m870.mdl"

	att.ModelOffset = Vector(-4.5, 0, -1.5)

	att.UBGL = true

	att.UBGL_PrintName = "UB (BUCK)"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_m3"
	att.UBGL_ClipSize = 4
	att.UBGL_Ammo = "buckshot"
	att.UBGL_RPM = 60
	att.UBGL_Recoil = 2
	att.UBGL_Capacity = 4

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("buckshot")
	end

	att.Hook_LHIK_TranslateAnimation = function(wep, key)
	    if key == "idle" then
	        if wep:GetInUBGL() then
	            return "idle"
	        else
	            return "pose"
	        end
	    end
	end

	att.Hook_OnSelectUBGL = function(wep)
	    wep:DoLHIKAnimation("in", 20/60)
	    wep:PlaySoundTable({
	        {s = "Arccw_FAS2_Generic.Cloth_Movement" ,		t = 0},
	    })
	end

	att.Hook_OnDeselectUBGL = function(wep)
	    wep:DoLHIKAnimation("out", 20/60)
	    wep:PlaySoundTable({
	        {s = "Arccw_FAS2_Generic.Cloth_Movement" ,		t = 0},
	    })
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:GetNWBool("FAS2Masterkey_Reloading", false) then
	        FAS2Masterkey_ReloadFinish(wep)
	        return
	    end
	    if wep:Clip2() <= 0 then return end

	    wep:DoLHIKAnimation("fire", 1)
	    wep:SetWeaponOpDelay(CurTime() + 1)

	    wep.Owner:FireBullets({
	        Src = wep.Owner:EyePos(),
	        Num = 15,
	        Damage = 25,
	        Force = 2,
	        Attacker = wep.Owner,
	        Dir = wep.Owner:EyeAngles():Forward(),
	        Spread = Vector(0.05, 0.075, 0.075),
	        Callback = function(_, tr, dmg)
	            local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

	            local dmgmax = 25
	            local dmgmin = 4

	            local delta = dist / 1750 * 0.025

	            delta = math.Clamp(delta, 0, 1)

	            local amt = Lerp(delta, dmgmax, dmgmin)

	            dmg:SetDamage(amt)
	        end
	    })

	    wep:EmitSound("weapons/arccw_mifl/fas2/rem870/rem870_fire1.wav", 100)

	    wep:PlaySoundTable({
	        {s = "weapons/arccw_mifl/fas2/rem870/rem870_pump_back.wav" ,		t = 20/60},
	        {s = "weapons/arccw_mifl/fas2/rem870/rem870_pump_forward.wav" ,		t = 32/60},
	    })

	    wep:SetClip2(wep:Clip2() - 1)

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    if wep:Clip2() >= 4 then return end
	    if Ammo(wep) <= 0 then return end
	    if wep:GetNWBool("FAS2Masterkey_Reloading", false) then return end

	    FAS2Masterkey_ReloadStart(wep)
	    wep:SetNWBool("FAS2Masterkey_Reloading", true)
	end

	att.Hook_Think = function(wep)
	    if wep:GetNWBool("FAS2Masterkey_Reloading", false) and wep:GetNWBool("FAS2Masterkey_ReloadingTimer", false) < CurTime() then
	        if wep:Clip2() >= 4 then
	            FAS2Masterkey_ReloadFinish(wep)
	        elseif wep:Clip2() < 4 then
	            FAS2Masterkey_ReloadLoop(wep)
	        end
	    end
	end

	function FAS2Masterkey_ReloadStart(wep)
	    wep:DoLHIKAnimation("reload1", 26/60)

	    wep:PlaySoundTable({
	        {s = "Arccw_FAS2_Generic.Cloth_Movement" ,		t = 0},
	    })

	    wep:SetNWFloat("FAS2Masterkey_ReloadingTimer", CurTime() + 26/60)
	    wep:SetReloading(CurTime() + 26/60)
	end

	function FAS2Masterkey_ReloadLoop(wep)
	    wep:DoLHIKAnimation("reload2", 49/60)

	    wep:SetNWFloat("FAS2Masterkey_ReloadingTimer", CurTime() + 49/60)
	    wep:SetReloading(CurTime() + 49/60)

	    wep:PlaySoundTable({
	        {s = "Arccw_FAS2_Generic.Cloth_Movement" ,		t = 0},
	        {s = "weapons/arccw_mifl/fas2/rem870/rem870_insert1.wav" ,		t = 12/60},
	    })

	    FAS2Masterkey_InsertShell(wep)
	end

	function FAS2Masterkey_ReloadFinish(wep)
	    wep:DoLHIKAnimation("reload3", 23/60)

	    wep:PlaySoundTable({
	        {s = "Arccw_FAS2_Generic.Cloth_Movement" ,		t = 0},
	    })

	    wep:SetNWBool("FAS2Masterkey_Reloading", false)
	    wep:SetReloading(CurTime() + 23/60)
	end

	function FAS2Masterkey_InsertShell(wep)
	    wep.Owner:RemoveAmmo(1, "buckshot")
	    wep:SetClip2(wep:Clip2() + 1)
	end

	att.Mult_SightTime = 1.15
	att.Mult_SpeedMult = 0.85
	att.Mult_SightedSpeedMult = 0.9
	ArcCW.LoadAttachmentType(att)
end

