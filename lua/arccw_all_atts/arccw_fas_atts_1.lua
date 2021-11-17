local Material = ArcCW.AttachmentMat

------
-- fes_fas2_optic_compm4.lua
------

do
	local att = {}
	ArcCW.SetShortName("fes_fas2_optic_compm4")

	att.PrintName = "CompM4 (RDS)"
	att.Icon = Material("entities/fes_fas2_optic_compm4.png", "smooth")
	att.Description = "Large tube-style optic provides a bright red reticle to ease aiming."

	att.SortOrder = 1

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw/mifl_atts/compm4.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 5, -2.04),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.2,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	    },
	}
	att.Holosight = true
	att.HolosightReticle = Material("mifl_fas2_reticle/dot.png" , "mips smooth")
	att.HolosightFlare = Material("mifl_fas2_reticle/dot_flare.png" , "mips smooth")
	att.HolosightSize = 2
	att.HolosightBone = "holosight"

	att.Mult_SightTime = 1.01

	att.Colorable = true
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_hg_12.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_hg_12")

	att.PrintName = "Ratnik Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_hg_12.png", "mips smooth")
	att.Description = "Modernized fifth-generation AK handguard and barrel that is slightly longer and heavier, offering better ranged performance."
	att.SortOrder = 0.2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"mifl_fas2_ak_hg", "mifl_fas2_rpk_hg"}

	att.Mult_Range = 1.25
	att.Mult_HipDispersion = 1.1
	att.Mult_SightTime = 1.1
	att.Mult_Recoil = 0.9
	att.Mult_AccuracyMOA = 0.85

	att.Add_BarrelLength = 2
	att.Mult_ShootPitch = 1.05
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_hg_12u.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_hg_12u")

	att.PrintName = "Ratnukz Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_hg_12u.png", "mips smooth")
	att.Description = "Modern fifth-generation handguard with shorter barrel. Better handling and hip-firing, but worse range."
	att.SortOrder = -0.5
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
		"con.fas2.ubgl"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_ak_hg"

	att.Mult_Range = 0.75
	att.Mult_SightTime = 0.85
	att.Mult_HipDispersion = 0.9
	att.Mult_Recoil = 1.15
	att.Mult_MoveSpeed = 0.95
	att.Mult_RPM = 1.2

	att.Add_BarrelLength = -4
	att.Mult_ShootPitch = 1.05

	att.GivesFlags = {"ubgl_no"}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_hg_an94.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_hg_an94")

	att.PrintName = "Sputnik Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_hg_spuk.png", "mips smooth")
	att.Description = "Floating barrel and handguard of the experimental hyper-burst AN-94, capable of dampening the first two shots fired. How it still functions without half its mechanisms is a mystery."
	att.SortOrder = 0.5
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"mifl_fas2_ak_hg", "mifl_fas2_rpk_hg"}

	att.ActivateElements = {"sputnik_br"}

	att.Mult_Range = 1.3
	att.Mult_SightTime = 1.15
	att.Mult_HipDispersion = 1.15
	att.Mult_AccuracyMOA = 0.75
	att.Mult_Recoil = 0.95

	att.Add_BarrelLength = 4
	att.Mult_ShootPitch = 1
	att.Mult_RPM = 1 / 1.1

	att.Override_Firemodes = {
	    {
	        Mode = 2,
	        Override_ShotRecoilTable = {
	            [0] = 0.7,
	            [1] = 0.9
	        }
	    },
	    {
	        Mode = -2,
	        Override_ShotRecoilTable = {
	            [0] = 0.1
	        },
	        Mult_RPM = 3,
	        RunawayBurst = true,
	        PostBurstDelay = 0.15
	    },
	    {
	        Mode = 0,
	    }
	}

	---- first shot hyperburst ----
	att.Hook_ModifyRPM = function(wep, delay)
	    if wep:GetCurrentFiremode().Mode == 2 and wep:GetBurstCount() == 0 then
	        return 60 / 1800
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_hg_k.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_hg_k")

	att.PrintName = "Kompak Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_hg_k.png", "mips smooth")
	att.Description = "Shortened handguard for better CQB engagements."
	att.SortOrder = -2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
		"con.fas2.ubgl"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_ak_hg"

	att.Mult_Range = 0.8
	att.Mult_Recoil = 1.2
	att.Mult_SightTime = 0.9
	att.Mult_DrawTime = 0.9
	att.Mult_AccuracyMOA = 1.3
	att.Mult_RPM = 1.2
	att.Mult_ReloadTime = 0.95

	att.Add_BarrelLength = -4

	att.Mult_HipDispersion = 0.8

	att.GivesFlags = {"ubgl_no"}

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_k.mdl"

	att.ModelOffset = Vector(0, 0, 0)

	att.GivesFlags = {"ubgl_no"}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_hg_overlord.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_hg_overlord")

	att.PrintName = "Overlord Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_hg_volk.png", "mips smooth")
	att.Description = "A makeshift but futuristic handguard that electrifies the bullet as it leaves the chamber, shocking targets near the point of impact. It is quite bulky and unreliable, however."
	att.SortOrder = 0
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"mifl_fas2_ak_hg", "mifl_fas2_rpk_hg"}

	att.Mult_Damage = 1.25
	att.Mult_DamageMin = 1.25

	att.Mult_HipDispersion = 1.25
	att.Mult_SightTime = 1.4
	att.Mult_MoveSpeed = 0.95

	att.Mult_ShootPitch = 1

	att.Override_MuzzleEffect = "ar2_muzzle"
	att.Override_Tracer = "GaussTracer"
	att.Override_NeverPhysBullet = true
	att.Override_TracerNum = 1

	att.Override_DamageType = DMG_SHOCK + DMG_BULLET

	--[[]
	att.Hook_BulletHit = function(wep, data)
	    for _, ent in pairs(ents.FindInSphere(data.tr.HitPos, 256)) do
	        if !ent:IsNPC() and !ent:IsPlayer() then continue end
	        if (math.random() > 0.2) then continue end
	        local eff = EffectData()
	        eff:SetOrigin(ent:WorldSpaceCenter())
	        eff:SetStart(data.tr.HitPos)
	        eff:SetEntity(wep)
	        eff:SetScale(1)
	        util.Effect("AirboatGunHeavyTracer", eff)
	        local dmg = DamageInfo()
	        dmg:SetAttacker(wep:GetOwner())
	        dmg:SetInflictor(wep)
	        dmg:SetDamage(wep:GetDamage(data.range) * (math.random() * 0.2 + 0.1))
	        dmg:SetDamageType(DMG_SHOCK)
	        ent:TakeDamageInfo(dmg)
	    end
	end
	]]
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_hg_rpk.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_hg_rpk")

	att.PrintName = "Pulemyot Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_hg_rpk.png", "mips smooth")
	att.Description = "Long barrel with integrated bipod used in the RPK. More stable and shootes further, but somewhat unwieldy."
	att.SortOrder = 5
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_ak_hg"

	att.Mult_Range = 1.4
	att.Mult_SightTime = 1.1
	att.Mult_HipDispersion = 1.25
	att.Mult_MoveDispersion = 1.5

	att.Mult_MoveSpeed = 0.95
	att.Mult_Recoil = 0.7
	att.Mult_AccuracyMOA = 0.7

	att.Add_BarrelLength = 6
	att.Mult_ShootPitch = 1
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_hg_rpk_k.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_hg_rpk_k")

	att.PrintName = "Ukoro Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_rpk_hg_ak.png", "mips smooth")
	att.Description = "Shortened handguard for better CQB engagements."
	att.SortOrder = -2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
		"con.fas2.ubgl"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_rpk_hg"

	att.Mult_Range = 0.8
	att.Mult_Recoil = 1.2
	att.Mult_SightTime = 0.9
	att.Mult_DrawTime = 0.9
	att.Mult_AccuracyMOA = 1.3
	att.Mult_RPM = 1.2
	att.Mult_ReloadTime = 0.95

	att.Add_BarrelLength = -4

	att.Mult_HipDispersion = 0.8

	att.GivesFlags = {"ubgl_no"}

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_sd.mdl"

	att.ModelOffset = Vector(2, 0.5, 1)

	att.GivesFlags = {"ubgl_no"}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_hg_rpk_kkk.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_hg_rpk_kkk")

	att.PrintName = "Obrez Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_rpk_hg_ak2.png", "mips smooth")
	att.Description = "The lightest of machinegun."
	att.SortOrder = -2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
		"con.fas2.ubgl"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_rpk_hg"

	att.Mult_Range = 0.5
	att.Mult_Recoil = 1.5
	att.Mult_SightTime = 0.65
	att.Mult_DrawTime = 0.65
	att.Mult_AccuracyMOA = 1.5
	att.Mult_RPM = 1.5
	att.Mult_ReloadTime = 0.85

	att.Add_BarrelLength = -6

	att.Mult_HipDispersion = 0.8

	att.GivesFlags = {"ubgl_no"}

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_sd.mdl"

	att.ModelOffset = Vector(0, 0.5, 1)

	att.GivesFlags = {"ubgl_no"}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_hg_saiga.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_hg_saiga")

	att.PrintName = "Saiga Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_hg_saiga.png", "mips smooth")
	att.Description = "Modern handguard configuration with shorter barrel. Better handling and hip-firing, but worse range."
	att.SortOrder = -0.5
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
		"con.fas2.ubgl"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_ak_hg"

	att.Mult_Range = 0.8
	att.Mult_SightTime = 0.9
	att.Mult_HipDispersion = 0.8
	att.Mult_Recoil = 1.15
	att.Mult_MoveSpeed = 0.95

	att.Add_BarrelLength = -2
	att.Mult_ShootPitch = 1.05

	att.GivesFlags = {"ubgl_no"}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_hg_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_hg_sd")

	att.PrintName = "Glushitel Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_hg_sd.png", "mips smooth")
	att.Description = "Integrated suppressor and handguard of the AS Val and VSS Vintorez. Fast firing and accurate. While it is designed to be used with subsonic 9x39mm ammunition, it can fit any caliber with some Russian ingenuity."
	att.SortOrder = 3
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"mifl_fas2_ak_hg", "mifl_fas2_rpk_hg"}

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Mult_ShootPitch = 1.4
	att.Mult_ShootVol = 0.7
	att.Mult_Range = 0.9
	att.Mult_SightTime = 1.2
	att.Mult_HipDispersion = 1.3
	att.Mult_AccuracyMOA = 0.4

	att.Mult_RPM = 1.3

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_k.mdl"

	att.ModelOffset = Vector(0, 0, 0)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_hg_sdk.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_hg_sdk")

	att.PrintName = "Shaft Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_hg_sdk.png", "mips smooth")
	att.Description = "Snub nosed AS Val. The short barrel and suppressor is insufficient for fully dampening the weapon sound, but it handles better and fires faster."
	att.SortOrder = -1
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
		"con.fas2.ubgl"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_ak_hg"

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightedMoveSpeed = 1.2

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Mult_ShootPitch = 1.4
	att.Mult_ShootVol = 0.85
	att.Mult_Range = 0.5
	att.Mult_SightTime = 0.7
	att.Mult_RPM = 1.4
	att.Mult_Recoil = 1.3
	att.Mult_AccuracyMOA = 2
	att.Mult_DrawSpeeed = 1.5
	att.Mult_HolsterSpeed = 1.5

	att.Mult_HipDispersion = 0.9

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_k.mdl"

	att.ModelOffset = Vector(0, 0, 0)

	att.GivesFlags = {"ubgl_no"}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_hg_svd.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_hg_svd")

	att.PrintName = "Snayper Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_hg_svd.png", "mips smooth")
	att.Description = "Very long barrel and handguard ripped from a Dragunov sniper rifle, allowing the AK to perform a DMR role."
	att.SortOrder = 12
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_ak_hg"

	att.Mult_Range = 2
	att.Mult_SightTime = 1.5

	att.Mult_MoveSpeed = 0.9
	att.Mult_SightedMoveSpeed = 0.8

	att.Add_BarrelLength = 12
	att.Mult_ShootPitch = 0.8

	att.Mult_Recoil = 0.8
	att.Mult_AccuracyMOA = 0.25
	att.Mult_HipDispersion = 1.5
	att.Mult_MoveDispersion = 0.7
	att.Mult_RPM = 0.6
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_hg_u.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_hg_u")

	att.PrintName = "Ukoro Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_hg_u.png", "mips smooth")
	att.Description = "Not so authentic shorten barrel."
	att.SortOrder = -0.8
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
		"con.fas2.ubgl"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_ak_hg"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.85
	att.Mult_DrawTime = 0.85
	att.Mult_AccuracyMOA = 1.2
	att.Mult_RPM = 1.2
	att.Mult_ReloadTime = 0.975

	att.Add_BarrelLength = -4

	att.Mult_HipDispersion = 0.8

	att.GivesFlags = {"ubgl_no"}

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_k.mdl"

	att.ModelOffset = Vector(2, 0, -0.25)

	att.GivesFlags = {"ubgl_no"}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_hg_xs.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_hg_xs")

	att.PrintName = "No Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_hg_xs.png", "mips smooth")
	att.Description = "The most compact comrade around."
	att.SortOrder = -10
	att.Desc_Pros = {
		"pro.fas2.xs",
	}
	att.Desc_Cons = {
		"con.fas2.ubgl"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_ak_hg"
	att.Override_ShootWhileSprint = true
	att.ModelOffset = Vector(-5, -4.5, -1)
	att.Mult_MoveDispersion = 3
	att.Mult_HipDispersion = 1.5
	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_m4x.mdl"

	att.Mult_MoveSpeed = 1.15
	att.Mult_SightedMoveSpeed = 1.3

	att.Mult_ShootPitch = 1.5

	att.Add_BarrelLength = -8
	att.Mult_SightTime = 0.5
	att.Mult_Recoil = 2
	att.Mult_RPM = 1.3
	att.Mult_Range = 0.5
	att.Mult_AccuracyMOA = 2
	att.Mult_ReloadTime = 0.9

	att.Mult_DrawSpeeed = 1.5
	att.Mult_HolsterSpeed = 1.5



	att.GivesFlags = {"ubgl_no"}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_mag_20g.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_mag_20g")

	att.PrintName = "12-Round 20G"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_mag_12g.png", "mips smooth")
	att.Description = "Small box magazine loaded with 20 Gauge shells, turning the weapon into a semi-automatic shotgun."
	att.Desc_Pros = {}
	att.Desc_Cons = {"con.magcap"}
	att.SortOrder = 12 - 700
	att.AutoStats = true
	att.Slot = {"mifl_fas2_ak_mag", "mifl_fas2_rpk_mag"}
	att.ActivateElements = {"12_20g"}
	att.Override_ClipSize = 12

	att.Mult_Recoil = 2
	att.Mult_RecoilSide = 1.5
	att.Mult_SightTime = 0.9
	att.Mult_ReloadTime = 0.95
	att.Mult_Range = 0.5
	att.Mult_Penetration = 0.1
	att.Mult_Damage = 2.2
	att.Mult_DamageMin = 1.375

	att.Override_Num = 9
	att.Override_Ammo = "buckshot"
	att.Override_Trivia_Calibre = "20 Gauge"
	att.Override_Trivia_Class = "Shotgun"
	att.Override_ShellModel = "models/shells/shell_12gauge.mdl"
	att.Override_IsShotgun = true

	att.Mult_AccuracyMOA = 10
	att.Mult_RPM = 0.5

	att.Override_Firemodes_Priority = 1
	att.Override_Firemodes = {
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/20g.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/rem870/sd_fire.wav" end

	    if fsound == "weapons/arccw_mifl/fas2/rpk47/rpk47_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/20g.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/rpk47/rpk47_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/rem870/sd_fire.wav" end	
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_mag_545.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_mag_545")

	att.PrintName = "30-Round 5.45mm"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_mag_545.png", "mips smooth")
	att.Description = "Convert the weapon into the modern AK-74, firing an intermediate cartridge."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 30 + 200
	att.AutoStats = true
	att.Slot = "mifl_fas2_ak_mag"

	att.ActivateElements = {"30_545", "5.45x39mm"}

	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 0.9
	att.Mult_Penetration = 0.8
	att.Mult_Range = 0.8
	att.Mult_Recoil = 0.8
	att.Mult_RPM = 1.1

	att.Override_Trivia_Calibre = "5.45x39mm"
	att.Override_Ammo = "smg1"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_fire1.wav" then return "weapons/arccw_mifl/fas2/ak74/ak74_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/sd.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_mag_545_45.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_mag_545_45")

	att.PrintName = "45-Round 5.45mm"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_mag_545.png", "mips smooth")
	att.Description = "Convert the weapon into the modern AK-74, firing an intermediate cartridge in a larger stack."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 45 + 200
	att.AutoStats = true
	att.Slot = "mifl_fas2_ak_mag"

	att.ActivateElements = {"45_545", "5.45x39mm"}
	att.Override_ClipSize = 45

	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 0.9
	att.Mult_Penetration = 0.8
	att.Mult_Range = 0.8
	att.Mult_Recoil = 0.8
	att.Mult_RPM = 1.1

	att.Mult_ReloadTime = 1.1
	att.Mult_DrawTime = 1.1
	att.Mult_SightTime = 1.1
	att.Mult_MoveSpeed = 0.95

	att.Override_Trivia_Calibre = "5.45x39mm"
	att.Override_Ammo = "smg1"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_fire1.wav" then return "weapons/arccw_mifl/fas2/ak74/ak74_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/sd.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_mag_556.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_mag_556")

	att.PrintName = "30-Round 5.56mm"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_mag_556.png", "mips smooth")
	att.Description = "Convert the weapon to fire the western 5.56x45mm NATO cartridges, which have slightly less recoil and damage compared to the Russian intermediate cartridge."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 30 + 220
	att.AutoStats = true
	att.Slot = {"mifl_fas2_ak_mag", "mifl_fas2_rpk_mag"}

	att.ActivateElements = {"30_556", "5.56x45mm"}

	att.Override_ClipSize = 30

	att.Mult_Damage = 0.85
	att.Mult_DamageMin = 0.85
	att.Mult_Penetration = 0.8
	att.Mult_Range = 0.8
	att.Mult_Recoil = 0.7
	att.Mult_RecoilSide = 0.5
	att.Mult_RPM = 1.35

	att.Override_Ammo = "smg1"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/556.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/556sd.wav" end

	    if fsound == "weapons/arccw_mifl/fas2/rpk47/rpk47_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/556.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/rpk47/rpk47_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/556sd.wav" end

	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_mag_556_60.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_mag_556_60")

	att.PrintName = "60-Round 5.56mm"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_mag_556.png", "mips smooth")
	att.Description = "Convert the weapon to fire the western 5.56x45mm NATO cartridges in a wider quad stack casket."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 60 + 220
	att.AutoStats = true
	att.Slot = {"mifl_fas2_rpk_mag"}

	att.ActivateElements = {"60_556", "5.56x45mm"}

	att.Override_ClipSize = 60

	att.Mult_Damage = 0.85
	att.Mult_DamageMin = 0.85
	att.Mult_Penetration = 0.8
	att.Mult_Range = 0.8
	att.Mult_Recoil = 0.7
	att.Mult_RecoilSide = 0.5
	att.Mult_RPM = 1.35

	att.Mult_ReloadTime = 1.1
	att.Mult_DrawTime = 1.1
	att.Mult_SightTime = 1.1
	att.Mult_MoveSpeed = 0.95

	att.Override_Ammo = "smg1"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/556.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/556sd.wav" end

	    if fsound == "weapons/arccw_mifl/fas2/rpk47/rpk47_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/556.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/rpk47/rpk47_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/556sd.wav" end

	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_mag_762_15.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_mag_762_15")

	att.PrintName = "15-Round 7.62mm"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_mag_762s.png", "mips smooth")
	att.Description = "Small magazine with lighter load. Improves handling."
	att.Desc_Pros = {}
	att.Desc_Cons = {"con.magcap"}
	att.SortOrder = 10 + 3000
	att.AutoStats = true
	att.Slot = "mifl_fas2_ak_mag"
	att.ActivateElements = {"15_762"}
	att.Override_ClipSize = 15

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Mult_ReloadTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_mag_762_30.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_mag_762_30")

	att.PrintName = "30-Round 7.62mm"
	att.Icon = Material("entities/arccw_mifl_fas2_sg55x_m_762.png", "mips smooth")
	att.Description = "Small magazine with lighter load. Improves handling."
	att.Desc_Pros = {}
	att.Desc_Cons = {"con.magcap"}
	att.SortOrder = 30 + 3000
	att.AutoStats = true
	att.Slot = "mifl_fas2_rpk_mag"
	att.ActivateElements = {"30_762"}
	att.Override_ClipSize = 30

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Mult_ReloadTime = 0.85
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_mag_762_45.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_mag_762_45")

	att.PrintName = "45-Round 7.62mm"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_mag_762l.png", "mips smooth")
	att.Description = "Extended magazine used by the RPK in a support weapon role."
	att.Desc_Pros = {
		"pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 45 + 3000
	att.AutoStats = true
	att.Slot = "mifl_fas2_ak_mag"

	att.ActivateElements = {"45_762"}
	att.Override_ClipSize = 45

	att.Mult_MoveSpeed = 0.9
	att.Mult_SightTime = 1.15
	att.Mult_ReloadTime = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_mag_762_inf.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_mag_762_inf")

	att.PrintName = "200-Round 7.62mm"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_mag_762l.png", "mips smooth")
	att.Description = "Very long magazine that loops for enternity. Very very very heavy"
	att.Desc_Pros = {
		"pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 200 + 3000
	att.AutoStats = true
	att.Slot = "mifl_fas2_ak_mag"

	att.ActivateElements = {"200_762"}
	att.Override_ClipSize = 200

	att.Mult_MoveSpeed = 0.4
	att.Mult_SightTime = 1.5
	att.Mult_ReloadTime = 1.3
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_mag_82.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_mag_82")

	att.PrintName = "10-Round 9x53mm"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_mag_82.png", "mips smooth")
	att.Description = "Load 9x53mmR, an obscure but powerful hunting cartridge, into the gun. Lots of stopping power, not very much control. Due to the immense stress this cartridge puts on the gun, it cannot fire in full auto."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 10 - 800
	att.AutoStats = true
	att.Slot = "mifl_fas2_ak_mag"

	att.ActivateElements = {"10_953"}

	att.Mult_Recoil = 2
	att.Mult_RecoilSide = 1.5

	att.Mult_RPM = 0.7
	att.Mult_Damage = 1.5
	att.Mult_DamageMin = 1.8
	att.Mult_Range = 1.2
	att.Mult_Penetration = 1.5
	att.Override_ClipSize = 10

	att.Mult_AccuracyMOA = 0.7

	att.Override_Trivia_Class = "Desginated Marksman Rifle"
	att.Override_Trivia_Calibre = "9x53mmR"

	att.Override_Firemodes_Priority = 10
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
-- mifl_fas2_ak_mag_919_30.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_mag_919_30")

	att.PrintName = "30-Round 9x19mm"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_mag_9mm.png", "mips smooth")
	att.Description = "Magwell and receiver conversion that uses 9x19mm, turning the weapon into a submachine gun. Great rate of fire and recoil, unimpressive damage."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.SortOrder = 30
	att.AutoStats = true
	att.Slot = "mifl_fas2_ak_mag"
	att.ActivateElements = {"30_919", "9x19mm"}
	att.Mult_RecoilSide = 0.9
	att.Mult_VisualRecoilMult = 0.8
	att.Mult_Penetration = 0.4
	att.Mult_MuzzleVelocity = 0.7
	att.Mult_ReloadTime = 0.9
	att.Override_ClipSize = 30

	-- 7.62mm -> 9x19mm
	att.Mult_Recoil = 0.5
	att.Mult_RPM = 1.4
	att.Mult_Damage = 0.6
	att.Mult_DamageMin = 0.6
	att.Mult_Range = 0.5

	att.Mult_ShootPitch = 0.8
	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_fire1.wav" then return "weapons/arccw_mifl/fas2/mp5/mp5_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/mp5/mp5k_suppressed_fire1.wav" end
	end
	att.Override_Ammo = "pistol"
	att.Override_ShellModel = "models/shells/shell_9mm.mdl"
	att.Override_Trivia_Class = "Submachine Gun"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_mag_919_50.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_mag_919_50")

	att.PrintName = "50-Round 9x19mm"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_mag_9mm.png", "mips smooth")
	att.Description = "Extended magazine for the 9x19mm conversion. Heavy, but may be worth the extra ammo."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 50
	att.AutoStats = true
	att.Slot = "mifl_fas2_ak_mag"

	att.ActivateElements = {"50_919", "9x19mm"}

	-- 50rnd
	att.Override_ClipSize = 50
	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.1
	att.Mult_RecoilSide = 0.9
	att.Mult_VisualRecoilMult = 0.8
	att.Mult_Penetration = 0.4
	att.Mult_MuzzleVelocity = 0.7
	att.Mult_ReloadTime = 0.9

	-- 7.62mm -> 9x19mm
	att.Mult_Recoil = 0.5
	att.Mult_RPM = 1.4
	att.Mult_Damage = 0.6
	att.Mult_DamageMin = 0.6
	att.Mult_Range = 0.5

	att.Mult_ShootPitch = 0.8
	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_fire1.wav" then return "weapons/arccw_mifl/fas2/mp5/mp5_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/mp5/mp5k_suppressed_fire1.wav" end
	end
	att.Override_Ammo = "pistol"
	att.Override_ShellModel = "models/shells/shell_9mm.mdl"
	att.Override_Trivia_Class = "Submachine Gun"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_mag_939_10.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_mag_939_10")

	att.PrintName = "10-Round 9x39mm SPP"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_mag_asval3.png", "mips smooth")
	att.Description = "Load 9x39mm cartridges with increased penetration and damage over distance, designed for subsonic velocities in suppressed weapons. Lighter magazine improves handling."
	att.Desc_Pros = {
	    "pro.invistracers"
	}
	att.Desc_Cons = {"con.magcap"}
	att.SortOrder = 10 + 100
	att.AutoStats = true
	att.Slot = "mifl_fas2_ak_mag"

	-- 10rnd stats
	att.ActivateElements = {"10_939", "9x39mm"}
	att.Override_ClipSize = 10
	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Mult_ReloadTime = 0.9

	-- 7.62x39 -> 9x39mm stats
	att.Mult_Damage = 0.95
	att.Mult_DamageMin = 3.5
	att.Mult_Recoil = 1.2
	att.Mult_ShootVol = 0.85
	att.Mult_Range = 3
	att.Mult_RPM = 0.8

	att.Override_Ammo = "smg1"
	att.Override_PhysTracerProfile = 5
	att.Override_TracerNum = 0

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/556.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/sd.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_mag_939_20.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_mag_939_20")

	att.PrintName = "20-Round 9x39mm"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_mag_asval.png", "mips smooth")
	att.Description = "Load 9x39mm cartridges, designed for subsonic velocities in suppressed weapons."
	att.Desc_Pros = {
	    "pro.invistracers"
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 20 + 100
	att.AutoStats = true
	att.Slot = "mifl_fas2_ak_mag"

	-- 20rnd stats
	att.ActivateElements = {"20_939", "9x39mm"}
	att.Override_ClipSize = 20

	-- 7.62x39 -> 9x39mm stats
	att.Mult_Damage = 0.75
	att.Mult_DamageMin = 0.9
	att.Mult_Recoil = 0.7
	att.Mult_ShootVol = 0.85
	att.Mult_RPM = 1.2
	att.Mult_Range = 0.9

	att.Override_Ammo = "smg1"
	att.Override_PhysTracerProfile = 5
	att.Override_TracerNum = 0

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/556.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/sd.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_mag_939_40.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_mag_939_40")

	att.PrintName = "40-Round 9x39mm"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_mag_asval2.png", "mips smooth")
	att.Description = "Load 9x39mm cartridges, designed for subsonic velocities in suppressed weapons. Extended magazine gives extra ammo at the cost of slight increase in weight."
	att.Desc_Pros = {
	    "pro.invistracers"
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 40 + 100
	att.AutoStats = true
	att.Slot = {"mifl_fas2_ak_mag", "mifl_fas2_rpk_mag"}

	-- 40rnd
	att.ActivateElements = {"40_939", "9x39mm"}
	att.Override_ClipSize = 40
	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.1
	att.Mult_ReloadTime = 1.1

	-- 7.62x39 -> 9x39mm stats
	att.Mult_Damage = 0.75
	att.Mult_DamageMin = 0.9
	att.Mult_Recoil = 0.7
	att.Mult_ShootVol = 0.85
	att.Mult_RPM = 1.2
	att.Mult_Range = 0.9

	att.Override_Ammo = "smg1"
	att.Override_PhysTracerProfile = 5
	att.Override_TracerNum = 0

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/556.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/sd.wav" end

	    if fsound == "weapons/arccw_mifl/fas2/rpk47/rpk47_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/556.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/rpk47/rpk47_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/sd.wav" end	
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_mag_939_60.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_mag_939_60")

	att.PrintName = "60-Round 9x39mm"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_mag_asval2.png", "mips smooth")
	att.Description = "Load 9x39mm cartridges, designed for subsonic velocities in suppressed weapons. Heavy magazine increases load, but gives extra ammo."
	att.Desc_Pros = {
	    "pro.invistracers"
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 60 + 100
	att.AutoStats = true
	att.Slot = "mifl_fas2_ak_mag"

	-- 60rnd
	att.ActivateElements = {"60_939", "9x39mm"}
	att.Override_ClipSize = 60
	att.Mult_MoveSpeed = 0.85
	att.Mult_SightTime = 1.25
	att.Override_ClipSize = 60
	att.Mult_ReloadTime = 1.25

	-- 7.62x39 -> 9x39mm stats
	att.Mult_Damage = 0.75
	att.Mult_DamageMin = 0.9
	att.Mult_Recoil = 0.7
	att.Mult_ShootVol = 0.85
	att.Mult_RPM = 1.2
	att.Mult_Range = 0.9

	att.Override_Ammo = "smg1"
	att.Override_PhysTracerProfile = 5
	att.Override_TracerNum = 0

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/556.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/sd.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_mag_drum.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_mag_drum")

	att.PrintName = "75-Round 7.62mm"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_mag_drum.png", "mips smooth")
	att.Description = "Cumbersome drum magazine that increases capacity."
	att.Desc_Pros = {
		"pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 75 + 3000
	att.AutoStats = true
	att.Slot = "mifl_fas2_rpk_mag"

	att.ActivateElements = {"75_762"}
	att.Override_ClipSize = 75

	att.Mult_Recoil = 0.95

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 0.9
	att.Mult_ReloadTime = 1.1

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_fire1.wav" then return "weapons/arccw_mifl/fas2/ak74/ak74_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/ak47/ak47_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/sd.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_mag_helix.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_mag_helix")

	att.PrintName = "64-Round 5.7mm"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_mag_helix.png", "mips smooth")
	att.Description = "Strange Helix magazine packed with a proprietary cartridge designed for PDWs. Its length negates the ability to use foregrip."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 64
	att.AutoStats = true
	att.Slot = "mifl_fas2_rpk_mag"

	att.ActivateElements = {"64_57"}
	att.Override_ClipSize = 64
	att.ExcludeFlags = {"fg_no"}
	att.GivesFlags = {"helix_no"}

	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 0.9
	att.Mult_Penetration = 0.8
	att.Mult_Range = 0.8
	att.Mult_Recoil = 0.8
	att.Mult_RPM = 1.1

	att.Override_Trivia_Calibre = "5.45x39mm"
	att.Override_Ammo = "smg1"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/rpk47/rpk47_fire1.wav" then return "weapons/arccw_mifl/fas2/ak74/ak74_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/rpk47/rpk47_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/asval/sd.wav" end
	end

	att.LHIK = true
	att.LHIK_Priority = 20000

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_k.mdl"

	att.ModelOffset = Vector(1, -0.25, 0.5)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_stock_fold.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_stock_fold")

	att.PrintName = "Folding Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_stock_folding.png", "mips smooth")
	att.Description = "A lightweight modern foldable stock that has excellent hipfire performance."
	att.SortOrder = 11
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"mifl_fas2_ak47_stock", "mifl_fas2_rpk_stock"}

	att.Mult_SightTime = 0.9
	att.Mult_SightedSpeedMult = 0.7
	att.Mult_HipDispersion = 0.85
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_stock_no.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_stock_no")

	att.PrintName = "Stub Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_stock_stub.png", "mips smooth")
	att.Description = "A pitiful chub of a stock that is entirely useless in recoil reduction."
	att.SortOrder = 10
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_ak47_stock"

	att.Mult_Recoil = 1.8
	att.Mult_RecoilSide = 1.5
	att.Mult_SightTime = 0.75
	att.Mult_MoveDispersion = 0.75

	att.Mult_SightedSpeedMult = 1.25
	att.Mult_MoveSpeed = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_stock_rpk.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_stock_rpk")

	att.PrintName = "Heavy Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_stock_heavy.png", "mips smooth")
	att.Description = "Lengthened and solid wood stock used by the RPK. Reduces recoil considerably, but more difficult to manuver."
	att.SortOrder = 12
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"mifl_fas2_ak47_stock", "mifl_fas2_m11_stock"}

	att.Mult_SightTime = 1.2
	att.Mult_Recoil = 0.75
	att.Mult_RecoilSide = 0.5
	att.Mult_SightedSpeedMult = 0.8
	--att.Mult_MoveDispersion = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_stock_ske.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_stock_ske")

	att.PrintName = "Skeleton Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_stock_ske.png", "mips smooth")
	att.Description = "A lightweight foldable stock used in many paratrooper and compact variants of the AK."
	att.SortOrder = 11
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"mifl_fas2_ak47_stock", "mifl_fas2_m11_stock", "mifl_fas2_rpk_stock"}

	att.Mult_SightTime = 0.9
	att.Mult_SightedSpeedMult = 1.2
	att.Mult_Recoil = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ak_stock_svd.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ak_stock_svd")

	att.PrintName = "Sniper Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_stock_svd.png", "mips smooth")
	att.Description = "Lengthened and solid wood stock used by the SVD. Reduces recoil considerably, but more difficult to manuver."
	att.SortOrder = 15
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"mifl_fas2_ak47_stock", "mifl_fas2_rpk_stock"}

	att.Mult_SightTime = 1.25
	att.Mult_Recoil = 0.65
	att.Mult_RecoilSide = 0.75
	att.Mult_SightedSpeedMult = 0.7
	--att.Mult_MoveDispersion = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_akimbo_deagle.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_akimbo_deagle")

	att.PrintName = "Deagle"
	att.Icon = Material("entities/arccw_mifl_fas2_akimbo_deagle.png", "smooth")
	att.Description = "Become the American Action Hero."
	att.Hidden = false
	att.Desc_Pros = {
	    "pro.fas2.akimbo",
	}
	att.Desc_Cons = {
	    "con.fas2.akimbo"
	}
	att.AutoStats = true
	att.Mult_HipDispersion = 2
	att.Slot = "mifl_fas2_akimbo"
	att.NotForNPCs = true
	att.ModelOffset = Vector(1, -0.5, 0)

	att.GivesFlags = {"handlocked"}

	att.ModelScale = Vector(1, 1, 1)

	att.SortOrder = 700 + 70

	att.AddSuffix = " + Deagle"

	att.MountPositionOverride = 0
	att.Override_NoHideLeftHandInCustomization = true

	att.Model = "models/weapons/arccw/mifl_atts/fas2/c_deagle.mdl"

	att.LHIK = true
	att.LHIK_Animation = true
	att.LHIK_MovementMult = 0

	att.UBGL = true

	att.UBGL_PrintName = "AKIMBO"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_pistol"
	att.UBGL_ClipSize = 7
	att.UBGL_Ammo = "357"
	att.UBGL_RPM = 300
	att.UBGL_Recoil = 1.5
	att.UBGL_RecoilSide = 0.8
	att.UBGL_RecoilRise = 1.2
	att.UBGL_Capacity = 7

	att.Hook_ShouldNotSight = function(wep)
	    return true
	end

	att.Hook_Think = function(wep)
	    if !IsFirstTimePredicted() then return end
	    if wep:GetOwner():KeyPressed(IN_RELOAD) then
	        wep:SetInUBGL(false)
	        wep:ReloadUBGL()
	        --wep:Reload()
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK) then
	        wep:SetInUBGL(false)
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK2) then
	        wep:SetInUBGL(true)
	        wep:ShootUBGL()
	    end
	end

	att.Hook_LHIK_TranslateAnimation = function(wep, anim)
	    if anim == "idle" and wep:Clip2() <= 0 then
	        return "idle_empty"
	    end
	end

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("357") -- att.UBGL_Ammo
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    -- this bitch
	    local fixedcone = wep:GetDispersion() / 170 / 60

	    wep.Owner:FireBullets({
			Src = wep.Owner:EyePos(),
			Num = 1,
			Damage = 70,
			Force = 1,
			Attacker = wep.Owner,
			Dir = wep.Owner:EyeAngles():Forward(),
			Spread = Vector(fixedcone, fixedcone, 0),
			Callback = function(_, tr, dmg)
				local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

				local dmgmax = 70
				local dmgmin = 35

				local delta = dist / 40

				delta = math.Clamp(delta, 0, 1)

				local amt = Lerp(delta, dmgmax, dmgmin)

				dmg:SetDamage(amt)
			end
		})
	    wep:EmitSound("weapons/arccw_mifl/fas2/deserteagle/de_fire1.wav", 110, 100 * math.Rand(1 - 0.05, 1 + 0.05))
	                            -- This is kinda important
	                                            -- Wep volume
	                                                    -- Weapon pitch (along with the pitch randomizer)
	    wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/deserteagle/de_distance_fire1.wav",			t = 0},
		})													
	    wep:SetClip2(wep:Clip2() - 1)
	    
	    if wep:Clip2() > 0 then
	        wep:DoLHIKAnimation("fire", 25/60)
	    else
	        wep:DoLHIKAnimation("last", 25/60)
	    end

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    wep:Reload()

	    local clip = 7 + 1

	    if wep:Clip2() >= clip then return end -- att.UBGL_Capacity

	    if Ammo(wep) <= 0 then return end

	    if wep:Clip2() <= 0 then
	        wep:DoLHIKAnimation("dry", 155/60)
	        wep:SetNextSecondaryFire(CurTime() + 155/60)
	        wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/deserteagle/de_magout_empty.wav", 	t = 10/60},
	            {s = "weapons/arccw_mifl/fas2/deserteagle/de_magin.wav", 	    t = 62/60},
	            {s = "weapons/arccw_mifl/fas2/1911/1911_sliderelease.wav", 	t = 108/60},
	        })
	    else
	        wep:DoLHIKAnimation("wet", 120/60)
	        wep:SetNextSecondaryFire(CurTime() + 120/60)
	        wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/deserteagle/de_magout_empty.wav", 	t = 10/60},
	            {s = "weapons/arccw_mifl/fas2/deserteagle/de_magin.wav", 	    t = 62/60},
	        })
	    end

	    local reserve = Ammo(wep)

	    reserve = reserve + wep:Clip2()

	    local load = math.Clamp(clip, 0, reserve)

	    wep.Owner:SetAmmo(reserve - load, "357") -- att.UBGL_Ammo

	    wep:SetClip2(load)
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_akimbo_g18.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_akimbo_g18")

	att.PrintName = "G18"
	att.Icon = Material("entities/arccw_mifl_fas2_akimbo_g18.png", "smooth")
	att.Description = "Incase 1000 RPM isn't enough."
	att.Desc_Pros = {
	    "pro.fas2.akimbo",
	}
	att.Desc_Cons = {
	    "con.fas2.akimbo"
	}
	att.AutoStats = true
	att.Mult_HipDispersion = 2
	att.Slot = "mifl_fas2_akimbo"
	att.NotForNPCs = true
	att.ModelOffset = Vector(1, -0.5, 0)

	att.GivesFlags = {"handlocked"}

	att.ModelScale = Vector(1, 1, 1)

	att.SortOrder = 700 + 30*0.85

	att.AddSuffix = " + G18"

	att.MountPositionOverride = 0
	att.Override_NoHideLeftHandInCustomization = true

	att.Model = "models/weapons/arccw/mifl_atts/fas2/c_g20.mdl"
	att.ModelBodygroups = "011"

	att.LHIK = true
	att.LHIK_Animation = true
	att.LHIK_MovementMult = 0

	att.UBGL = true

	att.UBGL_PrintName = "AKIMBO"
	att.UBGL_Automatic = true
	att.UBGL_MuzzleEffect = "muzzleflash_pistol"
	att.UBGL_ClipSize = 33
	att.UBGL_Ammo = "pistol"
	att.UBGL_RPM = 1035
	att.UBGL_Recoil = .65
	att.UBGL_RecoilSide = .45
	att.UBGL_RecoilRise = .8
	att.UBGL_Capacity = 33

	att.Hook_ShouldNotSight = function(wep)
	    return true
	end

	att.Hook_Think = function(wep)
	    if !IsFirstTimePredicted() then return end
	    if wep:GetOwner():KeyPressed(IN_RELOAD) then
	        wep:SetInUBGL(false)
	        wep:ReloadUBGL()
	        --wep:Reload()
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK) then
	        wep:SetInUBGL(false)
		elseif wep:GetOwner():KeyDown(IN_ATTACK2) then -- Wake me up when Arctic picks up an interest in akimbo (I will die of oversleep!)
	        wep:SetInUBGL(true)
	        wep:ShootUBGL()
	    end
	end

	att.Hook_LHIK_TranslateAnimation = function(wep, anim)
	    if anim == "idle" and wep:Clip2() <= 0 then
	        return "idle_empty"
	    end
	end

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("pistol") -- att.UBGL_Ammo
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    -- this bitch
	    local fixedcone = wep:GetDispersion() / 170 / 60

	    wep.Owner:FireBullets({
			Src = wep.Owner:EyePos(),
			Num = 1,
			Damage = 30*0.85,
			Force = 1,
			Attacker = wep.Owner,
			Dir = wep.Owner:EyeAngles():Forward(),
			Spread = Vector(fixedcone, fixedcone, 0),
			Callback = function(_, tr, dmg)
				local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

				local dmgmax = 30*0.85
				local dmgmin = 24*0.85

				local delta = dist / 35

				delta = math.Clamp(delta, 0, 1)

				local amt = Lerp(delta, dmgmax, dmgmin)

				dmg:SetDamage(amt)
			end
		})
	    wep:EmitSound("weapons/arccw_mifl/fas2/glock20/glock20_fire1.wav", 110, 100 * math.Rand(1 - 0.05, 1 + 0.05))
	                            -- This is kinda important
	                                            -- Wep volume
	                                                    -- Weapon pitch (along with the pitch randomizer)
	    wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/glock20/glock20_distance_fire1.wav",			t = 0},
		})													
	    wep:SetClip2(wep:Clip2() - 1)
	    
	    if wep:Clip2() > 0 then
	        wep:DoLHIKAnimation("fire", 12/60)
	    else
	        wep:DoLHIKAnimation("last", 12/60)
	    end

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    wep:Reload()

	    local clip = 33 + 1

	    if wep:Clip2() >= clip then return end -- att.UBGL_Capacity

	    if Ammo(wep) <= 0 then return end

	    if wep:Clip2() <= 0 then
	        wep:DoLHIKAnimation("dry", (127/60)*1.15)
	        wep:SetNextSecondaryFire(CurTime() + (127/60)*1.15)
	        wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/glock20/glock20_magout_empty.wav", 	t = (10/60)*1.15},
	            {s = "weapons/arccw_mifl/fas2/glock20/glock20_magin.wav", 	    t = (55/60)*1.15},
	            {s = "weapons/arccw_mifl/fas2/glock20/glock20_sliderelease.wav", 	t = (60/60)*1.15},
	        })
	    else
	        wep:DoLHIKAnimation("wet", (105/60)*1.15)
	        wep:SetNextSecondaryFire(CurTime() + (105/60)*1.15)
	        wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/glock20/glock20_magout_empty.wav", 	t = (12/60)*1.15},
	            {s = "weapons/arccw_mifl/fas2/glock20/glock20_magin.wav", 	    t = (55/60)*1.15},
	        })
	    end

	    local reserve = Ammo(wep)

	    reserve = reserve + wep:Clip2()

	    local load = math.Clamp(clip, 0, reserve)

	    wep.Owner:SetAmmo(reserve - load, "pistol") -- att.UBGL_Ammo

	    wep:SetClip2(load)
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_akimbo_g20.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_akimbo_g20")

	att.PrintName = "G20"
	att.Icon = Material("entities/arccw_mifl_fas2_akimbo_g20.png", "smooth")
	att.Description = "There's a saying that polymers are light but they sure don't refer about use it with one hand."
	att.Desc_Pros = {
	    "pro.fas2.akimbo",
	}
	att.Desc_Cons = {
	    "con.fas2.akimbo"
	}
	att.AutoStats = true
	att.Mult_HipDispersion = 2
	att.Slot = "mifl_fas2_akimbo"
	att.NotForNPCs = true
	att.ModelOffset = Vector(1, -0.5, 0)

	att.GivesFlags = {"handlocked"}

	att.ModelScale = Vector(1, 1, 1)

	att.SortOrder = 700 + 30

	att.AddSuffix = " + G20"

	att.MountPositionOverride = 0
	att.Override_NoHideLeftHandInCustomization = true

	att.Model = "models/weapons/arccw/mifl_atts/fas2/c_g20.mdl"

	att.LHIK = true
	att.LHIK_Animation = true
	att.LHIK_MovementMult = 0

	att.UBGL = true

	att.UBGL_PrintName = "AKIMBO"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_pistol"
	att.UBGL_ClipSize = 15
	att.UBGL_Ammo = "pistol"
	att.UBGL_RPM = 600
	att.UBGL_Recoil = .75
	att.UBGL_RecoilSide = .5
	att.UBGL_RecoilRise = .4
	att.UBGL_Capacity = 15

	att.Hook_ShouldNotSight = function(wep)
	    return true
	end

	att.Hook_Think = function(wep)
	    if !IsFirstTimePredicted() then return end
	    if wep:GetOwner():KeyPressed(IN_RELOAD) then
	        wep:SetInUBGL(false)
	        wep:ReloadUBGL()
	        --wep:Reload()
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK) then
	        wep:SetInUBGL(false)
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK2) then
	        wep:SetInUBGL(true)
	        wep:ShootUBGL()
	    end
	end

	att.Hook_LHIK_TranslateAnimation = function(wep, anim)
	    if anim == "idle" and wep:Clip2() <= 0 then
	        return "idle_empty"
	    end
	end

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("pistol") -- att.UBGL_Ammo
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    -- this bitch
	    local fixedcone = wep:GetDispersion() / 170 / 60

	    wep.Owner:FireBullets({
			Src = wep.Owner:EyePos(),
			Num = 1,
			Damage = 30,
			Force = 1,
			Attacker = wep.Owner,
			Dir = wep.Owner:EyeAngles():Forward(),
			Spread = Vector(fixedcone, fixedcone, 0),
			Callback = function(_, tr, dmg)
				local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

				local dmgmax = 30
				local dmgmin = 24

				local delta = dist / 35

				delta = math.Clamp(delta, 0, 1)

				local amt = Lerp(delta, dmgmax, dmgmin)

				dmg:SetDamage(amt)
			end
		})
	    wep:EmitSound("weapons/arccw_mifl/fas2/glock20/glock20_fire1.wav", 110, 100 * math.Rand(1 - 0.05, 1 + 0.05))
	                            -- This is kinda important
	                                            -- Wep volume
	                                                    -- Weapon pitch (along with the pitch randomizer)
	    wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/glock20/glock20_distance_fire1.wav",			t = 0},
		})													
	    wep:SetClip2(wep:Clip2() - 1)
	    
	    if wep:Clip2() > 0 then
	        wep:DoLHIKAnimation("fire", 15/60)
	    else
	        wep:DoLHIKAnimation("last", 15/60)
	    end

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    wep:Reload()

	    local clip = 15 + 1

	    if wep:Clip2() >= clip then return end -- att.UBGL_Capacity

	    if Ammo(wep) <= 0 then return end

	    if wep:Clip2() <= 0 then
	        wep:DoLHIKAnimation("dry", 127/60)
	        wep:SetNextSecondaryFire(CurTime() + 127/60)
	        wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/glock20/glock20_magout_empty.wav", 	t = 10/60},
	            {s = "weapons/arccw_mifl/fas2/glock20/glock20_magin.wav", 	    t = 55/60},
	            {s = "weapons/arccw_mifl/fas2/glock20/glock20_sliderelease.wav", 	t = 60/60},
	        })
	    else
	        wep:DoLHIKAnimation("wet", 105/60)
	        wep:SetNextSecondaryFire(CurTime() + 105/60)
	        wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/glock20/glock20_magout_empty.wav", 	t = 12/60},
	            {s = "weapons/arccw_mifl/fas2/glock20/glock20_magin.wav", 	    t = 55/60},
	        })
	    end

	    local reserve = Ammo(wep)

	    reserve = reserve + wep:Clip2()

	    local load = math.Clamp(clip, 0, reserve)

	    wep.Owner:SetAmmo(reserve - load, "pistol") -- att.UBGL_Ammo

	    wep:SetClip2(load)
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_akimbo_m1911.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_akimbo_m1911")

	att.PrintName = "M1911"
	att.Icon = Material("entities/arccw_mifl_fas2_akimbo_1911.png", "smooth")
	att.Description = "You shoot pistols one-handed because you use one for each hand, no?"
	att.Hidden = false
	att.Desc_Pros = {
	    "pro.fas2.akimbo",
	}
	att.Desc_Cons = {
	    "con.fas2.akimbo"
	}
	att.AutoStats = true
	att.Mult_HipDispersion = 2
	att.Slot = "mifl_fas2_akimbo"
	att.NotForNPCs = true
	att.ModelOffset = Vector(1, -0.5, 0)

	att.GivesFlags = {"handlocked"}

	att.ModelScale = Vector(1, 1, 1)

	att.SortOrder = 700 + 35

	att.AddSuffix = " + M1911"

	att.MountPositionOverride = 0
	att.Override_NoHideLeftHandInCustomization = true

	att.Model = "models/weapons/arccw/mifl_atts/fas2/c_m1911.mdl"

	att.LHIK = true
	att.LHIK_Animation = true
	att.LHIK_MovementMult = 0

	att.UBGL = true

	att.UBGL_PrintName = "AKIMBO"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_pistol"
	att.UBGL_ClipSize = 7
	att.UBGL_Ammo = "pistol"
	att.UBGL_RPM = 600
	att.UBGL_Recoil = .75
	att.UBGL_RecoilSide = .5
	att.UBGL_RecoilRise = .4
	att.UBGL_Capacity = 7

	att.Hook_ShouldNotSight = function(wep)
	    return true
	end

	att.Hook_Think = function(wep)
	    if !IsFirstTimePredicted() then return end
	    if wep:GetOwner():KeyPressed(IN_RELOAD) then
	        wep:SetInUBGL(false)
	        wep:ReloadUBGL()
	        --wep:Reload()
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK) then
	        wep:SetInUBGL(false)
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK2) then
	        wep:SetInUBGL(true)
	        wep:ShootUBGL()
	    end
	end

	att.Hook_LHIK_TranslateAnimation = function(wep, anim)
	    if anim == "idle" and wep:Clip2() <= 0 then
	        return "idle_empty"
	    end
	end

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("pistol") -- att.UBGL_Ammo
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    -- this bitch
	    local fixedcone = wep:GetDispersion() / 170 / 60

	    wep.Owner:FireBullets({
			Src = wep.Owner:EyePos(),
			Num = 1,
			Damage = 35,
			Force = 1,
			Attacker = wep.Owner,
			Dir = wep.Owner:EyeAngles():Forward(),
			Spread = Vector(fixedcone, fixedcone, 0),
			Callback = function(_, tr, dmg)
				local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

				local dmgmax = 35
				local dmgmin = 17

				local delta = dist / 50

				delta = math.Clamp(delta, 0, 1)

				local amt = Lerp(delta, dmgmax, dmgmin)

				dmg:SetDamage(amt)
			end
		})
	    wep:EmitSound("weapons/arccw_mifl/fas2/1911/1911_fire1.wav", 110, 100 * math.Rand(1 - 0.05, 1 + 0.05))
	                            -- This is kinda important
	                                            -- Wep volume
	                                                    -- Weapon pitch (along with the pitch randomizer)
	    wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/1911/1911_distance_fire1.wav",			t = 0},
		})													
	    wep:SetClip2(wep:Clip2() - 1)
	    
	    if wep:Clip2() > 0 then
	        wep:DoLHIKAnimation("fire", 20/60)
	    else
	        wep:DoLHIKAnimation("last", 20/60)
	    end

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    wep:Reload()

	    local clip = 7 + 1

	    if wep:Clip2() >= clip then return end -- att.UBGL_Capacity

	    if Ammo(wep) <= 0 then return end

	    if wep:Clip2() <= 0 then
	        wep:DoLHIKAnimation("dry", 112/60)
	        wep:SetNextSecondaryFire(CurTime() + 112/60)
	        wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/1911/1911_magout_empty.wav", 	t = 10/60},
	            {s = "weapons/arccw_mifl/fas2/1911/1911_magin.wav", 	    t = 55/60},
	            {s = "weapons/arccw_mifl/fas2/1911/1911_sliderelease.wav", 	t = 84/60},
	        })
	    else
	        wep:DoLHIKAnimation("wet", 90/60)
	        wep:SetNextSecondaryFire(CurTime() + 90/60)
	        wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/1911/1911_magout_empty.wav", 	t = 10/60},
	            {s = "weapons/arccw_mifl/fas2/1911/1911_magin.wav", 	    t = 55/60},
	        })
	    end

	    local reserve = Ammo(wep)

	    reserve = reserve + wep:Clip2()

	    local load = math.Clamp(clip, 0, reserve)

	    wep.Owner:SetAmmo(reserve - load, "pistol") -- att.UBGL_Ammo

	    wep:SetClip2(load)
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_akimbo_m79.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_akimbo_m79")

	att.PrintName = "M79 Pirate Gun"
	att.Icon = Material("entities/arccw_mifl_fas2_akimbo_m79.png", "smooth")
	att.Description = "Sawn off M79 grenade launcher for one-hand use, loaded with HE rounds. A pirate accent is required when using this."
	att.Hidden = false
	att.Desc_Pros = {
	    "pro.fas2.akimbo",
	}
	att.Desc_Cons = {
	    "con.fas2.akimbo"
	}
	att.AutoStats = true
	att.Mult_HipDispersion = 2
	att.Slot = "mifl_fas2_akimbo"
	att.NotForNPCs = true
	att.ModelOffset = Vector(-2, 0, 0)

	att.GivesFlags = {"handlocked"}

	att.ModelScale = Vector(1, 1, 1)

	att.SortOrder = 700 + 250

	att.AddSuffix = " + M79"

	att.MountPositionOverride = 0
	att.Override_NoHideLeftHandInCustomization = true

	att.Model = "models/weapons/arccw/mifl_atts/fas2/c_m79.mdl"

	att.LHIK = true
	att.LHIK_Animation = true
	att.LHIK_MovementMult = 0

	att.UBGL = true

	att.UBGL_PrintName = "AKIMBO"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_pistol"
	att.UBGL_ClipSize = 7
	att.UBGL_Ammo = "smg1_grenade"
	att.UBGL_RPM = 600
	att.UBGL_Recoil = 3 -- Should be like 8 in theory but UBGL recoil seems to be different?
	att.UBGL_RecoilSide = 1.5
	att.UBGL_RecoilRise = 1.2
	att.UBGL_Capacity = 1

	att.Hook_ShouldNotSight = function(wep)
	    return true
	end

	att.Hook_Think = function(wep)
	    if !IsFirstTimePredicted() then return end
	    if wep:GetOwner():KeyPressed(IN_RELOAD) then
	        wep:SetInUBGL(false)
	        wep:ReloadUBGL()
	        --wep:Reload()
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK) then
	        wep:SetInUBGL(false)
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK2) then
	        wep:SetInUBGL(true)
	        wep:ShootUBGL()
	    end
	end

	att.Hook_LHIK_TranslateAnimation = function(wep, anim)
	    if anim == "idle" and wep:Clip2() <= 0 then
	        return "idle_empty"
	    end
	end


	local function AmmoType(wep)
	    return "smg1_grenade"
	end

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount(AmmoType(wep))
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() < 1 then return end

	    wep:FireRocket("arccw_gl_m79_he", 1500 * ArcCW.HUToM)
	    wep:EmitSound("weapons/arccw_mifl/fas2/explosive_m79/m79_fire1.wav", 110, 100 * math.Rand(1 - 0.05, 1 + 0.05))
	    wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/explosive_m79/m79_distance_fire1.wav", t = 0},
	    })

	    wep:SetClip2(0)

	    wep:DoLHIKAnimation("fire", 25 / 60)

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    wep:Reload()

	    local clip = 1

	    if wep:Clip2() >= clip then return end

	    if Ammo(wep) + wep:Clip2() < clip then return end

	    wep:DoLHIKAnimation("reload", 3.25)
	    wep:SetNextSecondaryFire(CurTime() + 3.25)
	    wep:PlaySoundTable({
	        {s = "weapons/arccw_mifl/fas2/explosive_m79/m79_open.wav", 	    t = 15/60},
	        {s = "weapons/arccw_mifl/fas2/explosive_m79/m79_remove.wav", 	t = 50/60},
	        {s = "weapons/arccw_mifl/fas2/explosive_m79/m79_insert.wav", 	t = 100/60},
	        {s = "weapons/arccw_mifl/fas2/explosive_m79/m79_close.wav", 	t = 155/60},
	    })

	    local reserve = Ammo(wep)
	    reserve = reserve + wep:Clip2()

	    local load = math.Clamp(clip, 0, reserve)
	    wep.Owner:SetAmmo(reserve - load, AmmoType(wep))

	    wep:SetClip2(load)
	end
	ArcCW.LoadAttachmentType(att)
end

