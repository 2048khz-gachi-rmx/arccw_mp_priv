local Material = ArcCW.AttachmentMat

------
-- dmi_mac10_sil.lua
------

do
	local att = {}
	ArcCW.SetShortName("dmi_mac10_sil")

	att.PrintName = "MAC-10 Suppressor"
	att.Icon = Material("entities/arccw_dmi_mac10sil.png")
	att.Description = "MAC-10 Standard suppressor."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true

	att.SortOrder = 100

	att.ActivateElements = {"mc10sd"}

	att.Slot = "dmi_muzzle_mac"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Mult_ShootPitch = 0.9
	att.Mult_ShootVol = 0.75
	att.Mult_AccuracyMOA = 0.95
	att.Mult_Range = 1.3

	att.Mult_SightTime = 1.1

	att.Mult_HipDispersion = 1.2

	att.Add_BarrelLength = 24

	att.Mult_RPM = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- dmi_mp5sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("dmi_mp5sd")

	att.PrintName = "MP5SD Conversion"
	att.Icon = Material("entities/arccw_dmi_mp5sd.png")
	att.Description = "Integrated suppressor."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true

	att.SortOrder = 100

	att.ActivateElements = {"mp5sd"}

	att.Slot = "dmi_muzzle_mp5"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Mult_ShootPitch = 0.9
	att.Mult_ShootVol = 0.75
	att.Mult_AccuracyMOA = 0.95
	att.Mult_Range = 1.3

	att.Mult_SightTime = 1.1

	att.Mult_HipDispersion = 1.2

	att.Add_BarrelLength = 24

	att.Mult_RPM = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- fcg_accelerator.lua
------

do
	local att = {}
	ArcCW.SetShortName("fcg_accelerator")

	att.PrintName = "Accelerator"
	att.Icon = Material("entities/acwatt_fcg_accelerator.png")
	att.Description = "Firemode conversion that increases fire rate the longer you shoot, up to 7 shots. Includes 14-round burst."
	att.Desc_Pros = {
	    "pro.fcg_accelerator",
	}
	att.Desc_Cons = {
	    "con.fcg_accelerator",
	}
	att.Slot = "fcg"

	att.Override_Firemodes = {
	    {
	        Mode = 2,
	    },
	    {
	        Mode = -14,
	        PrintName = "14BR"
	    },
	    {
	        Mode = 0
	    }
	}

	att.Hook_ModifyRPM = function(wep, delay)
	    local max = math.min(7, wep:GetCapacity())

	    local delta = wep:GetBurstCount() / max

	    local mult = Lerp(delta, 0.5, 1.25)

	    return delay / mult
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- fcg_auto.lua
------

do
	local att = {}
	ArcCW.SetShortName("fcg_auto")

	att.PrintName = "Automatic"
	att.Icon = Material("entities/acwatt_fcg_auto.png")
	att.Description = "Firemode conversion allowing for full-auto and semi-auto fire modes."
	att.Desc_Pros = {
	    "pro.auto",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "fcg"

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

	att.Hook_Compatible = function(wep)
	    -- Search for any non-full auto firemodes. If there are none, this isn't applicable
	    for i, v in pairs(wep.Firemodes) do
	        if !v then continue end
	        if v.Mode == 2 then
	            return false
	        end
	    end

	    return
	end

	att.Mult_Recoil = 1.15
	att.Mult_RPM = 0.85
	ArcCW.LoadAttachmentType(att)
end

------
-- fcg_burst.lua
------

do
	local att = {}
	ArcCW.SetShortName("fcg_burst")

	att.PrintName = "Burst"
	att.Icon = Material("entities/acwatt_fcg_burst.png")
	att.Description = "Firemode conversion allowing for 3-round burst and semi-auto fire modes."
	att.Desc_Pros = {
	    "pro.burst"
	}
	att.Desc_Cons = {
	    "con.burstdelay"
	}
	att.AutoStats = true
	att.Slot = "fcg"

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
	    local auto = false
	    for i, v in pairs(wep.Firemodes) do
	        if v.Mode and v.Mode == -3 then
	            auto = true
	            break
	        end
	    end
	    if auto then return false end
	end

	att.Mult_RPM = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- fcg_double.lua
------

do
	local att = {}
	ArcCW.SetShortName("fcg_double")

	att.PrintName = "Double Stuff"
	att.Icon = Material("entities/acwatt_fcg_double.png")
	att.Description = "Fire system that can fit one extra round in the chamber at a time through esoteric mechanical magic."
	att.Desc_Pros = {
	    "+ +2",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "fcg"

	att.Override_ChamberSize = 2

	att.Mult_ReloadTime = 1.05

	att.Hook_Compatible = function(wep, compat)
	    if wep.ChamberSize == 1 then
	        return
	    else
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- fcg_hyper.lua
------

do
	local att = {}
	ArcCW.SetShortName("fcg_hyper")

	att.PrintName = "Hyper-Burst"
	att.Icon = Material("entities/acwatt_fcg_hyper.png")
	att.Description = "Firemode conversion allowing for a rapid two-round 'hyper burst' mode that fires both bullets in extremely rapid succession. Extra mechanical complexity increases weight and reduces effective precision."
	att.Desc_Pros = {
	    "pro.hyper",
	    "pro.hyper2"
	}
	att.Desc_Cons = {
	    "con.burstdelay2",
	}
	att.AutoStats = true
	att.Slot = "fcg"

	att.Override_Firemodes = {
	    {
	        Mode = -2,
	        Mult_RPM = 3,
	        Mult_AccuracyMOA = 1.5,
	        RunawayBurst = true,
	        PostBurstDelay = 0.25,
	        Override_ShotRecoilTable = {
	            [1] = 0.25
	        }
	    },
	    {
	        Mode = 0
	    }
	}

	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 1.2
	ArcCW.LoadAttachmentType(att)
end

------
-- fcg_regulator.lua
------

do
	local att = {}
	ArcCW.SetShortName("fcg_regulator")

	att.PrintName = "Regulator"
	att.Icon = Material("entities/acwatt_fcg_regulator.png")
	att.Description = "Fire control device that allows the selection of varying fire rates."
	att.Desc_Pros = {
	    "pro.regulator",
	}
	att.Desc_Cons = {
	    "con.regulator"
	}
	att.Slot = "fcg"

	att.Override_Firemodes = {
	    {
	        Mode = 2,
	        PrintName = "80%",
	        Mult_RPM = 0.8
	    },
	    {
	        Mode = 2,
	        PrintName = "60%",
	        Mult_RPM = 0.60,
	    },
	    {
	        Mode = 2,
	        PrintName = "40%",
	        Mult_RPM = 0.4
	    },
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- fcg_semi.lua
------

do
	local att = {}
	ArcCW.SetShortName("fcg_semi")

	att.PrintName = "Semi"
	att.Icon = Material("entities/acwatt_fcg_semi.png")
	att.Description = "Firemode conversion which allows only semi-auto fire."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.semi"
	}
	att.AutoStats = true
	att.Slot = "fcg"

	att.Override_Firemodes = {
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}

	att.Hook_Compatible = function(wep)
	    -- Search for any non-semi firemodes. If there are none, this isn't applicable
	    for i, v in pairs(wep.Firemodes) do
	        if !v then continue end
	        if v.Mode and v.Mode != 1 and v.Mode != 0 then
	            return
	        end
	    end

	    return false
	end

	att.Mult_AccuracyMOA = 0.75
	ArcCW.LoadAttachmentType(att)
end

------
-- fcg_sputter.lua
------

do
	local att = {}
	ArcCW.SetShortName("fcg_sputter")

	att.PrintName = "Sputter"
	att.Icon = Material("entities/acwatt_fcg_sputter.png")
	att.Description = "Firemode conversion designed to circumvent early machine gun regulations by making the gun fire continuously until empty."
	att.Desc_Pros = {
	    "pro.sputter",
	}
	att.Desc_Cons = {
	    "con.sputter",
	    "con.sputter2",
	}
	att.AutoStats = true
	att.Slot = "fcg"

	att.Override_Firemodes = {
	    {
	        Mode = -1000,
	        RunawayBurst = true,
	        PrintName = "SPUT"
	    }
	}

	att.Mult_RPM = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- fml_fas1_famas_giat.lua
------

do
	local att = {}
	ArcCW.SetShortName("fml_fas1_famas_giat")

	att.PrintName = "GIAT Grenadier"
	att.Icon = Material("entities/arccw_fml_fas1_famas_rocket.png")
	att.Description = "Anti armoured vehicle rifle grenade."
	att.Desc_Pros = {
	    "+ Selectable grenade launcher",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "fas1_famas_grenadier"

	att.UBGL = true
	att.SortOrder = 2000

	att.ExcludeFlags = {"ubgl"}

	att.UBGL_BaseAnims = true

	att.UBGL_PrintName = "UB (AT)"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_m79"
	att.UBGL_ClipSize = 1
	att.UBGL_Ammo = "smg1_grenade"
	att.UBGL_RPM = 1200
	att.UBGL_Recoil = 2
	att.UBGL_Capacity = 1

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("smg1_grenade")
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if (wep:Clip2() <= 0 or wep:Clip1() <= 0) then return end

	    wep:PlayAnimation("fire")

	    wep:FireRocket("arccw_gl_rocket", 30000)

	    wep:EmitSound("weapons/grenade_launcher1.wav", 100)

	    wep:SetClip2(wep:Clip2() - 1)
	    wep:SetClip1(wep:Clip1() - 1)	

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    if wep:Clip2() >= 1 then return end

	    if Ammo(wep) <= 0 then return end

	    wep:SetNextSecondaryFire(CurTime() + 120/60)

	    wep:PlayAnimation("enter_ubgl2")

	    local reserve = Ammo(wep)

	    reserve = reserve + wep:Clip2()

	    local clip = 1

	    local load = math.Clamp(clip, 0, reserve)

	    wep.Owner:SetAmmo(reserve - load, "smg1_grenade")

	    wep:SetClip2(load)
	end

	att.Mult_SightTime = 1.1
	att.Mult_SpeedMult = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- fml_fas1_felin_fcg.lua
------

do
	local att = {}
	ArcCW.SetShortName("fml_fas1_felin_fcg")

	att.PrintName = "Felin Conversion"
	att.Icon = Material("entities/arccw_fml_fas1_felin.png")
	att.Description = "Conversion allowing for a rapid three-round burst in rapid succession."
	att.Desc_Pros = {
	    "+3 Round Burst",
	}

	att.SortOrder = 1000

	att.Desc_Cons = {
	    "-Burst delay",
	}

	att.Slot = {"fas1_felin"}

	att.AutoStats = true

	att.ActivateElements = {"felin_cum"}  

	att.Override_Firemodes = {
	    {
	        Mode = -3,
	        Mult_RPM = 1.85,
	        Mult_AccuracyMOA = 1.275,
	        RunawayBurst = true,
	        PostBurstDelay = 0.175
	    },
	    {
	        Mode = 1,
	    },	
	    {
	        Mode = 0
	    }
	}

	att.Mult_Recoil = 0.925
	att.Mult_SightTime = 1.15

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload_empty" then
	        return "reload_empty_felin"
	    elseif anim == "reload_empty_soh" then
	        return "reload_empty_soh_felin"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- fml_fas1_machete.lua
------

do
	local att = {}
	ArcCW.SetShortName("fml_fas1_machete")

	att.PrintName = "Machete"
	att.Icon = Material("entities/arccw_fml_fas1_machete.png")

	att.Description = "A Machete for all your slashing need. For pistols and SMGs"

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}

	att.Slot = {"foregrip_pistol","style_pistol", "fas1_machete"}

	att.LHIK = true

	att.Mult_MoveDispersion = 1.4
	att.AutoStats = true
	att.Mult_Recoil = 1.3
	att.Mult_RecoilSide = 1.3

	att.Model = "models/weapons/arccw/fml_atts/fas1_machete.mdl"
	att.ModelOffset = Vector(0,0,-4)

	att.DrawFunc = function(wep, element, wm)

	if wep.InProcBash and CLIENT then --Hook_Think machine broke so I'm doing this here
	wep:DoLHIKAnimation("stab") wep.InProcBash=false
	end

	if wm then element.NoDraw=true end
	end

	att.Mult_MeleeTime = 1.35
	att.Mult_MeleeDamage = 4.1
	att.Add_MeleeRange = 34
	att.Mult_MeleeAttackTime = 0.25
	att.Mult_ReloadTime = 1.15

	att.CQC_KnifeLastReload=0

	local reloads={"reload","sgreload_start","sgreload_insert","sgreload_finish","reload_empty","cycle", "sgreload_start_empty", "sgreload_finish_empty"}
	att.Hook_TranslateAnimation = function(wep,anim)

	if !att.CQC_KnifeLastReload then att.CQC_KnifeLastReload=0 end
	if table.HasValue(reloads,anim) and CLIENT and wep.LHIKAnimation!=3 then
		att.CQC_KnifeLastReload=CurTime()+0.25
		wep:DoLHIKAnimation("holster")
	elseif anim=="bash" then
		wep:DoLHIKAnimation("stab",0.509) --NEEDS the float serverside for some reason
		return false
	end

	end

	att.Hook_LHIK_TranslateAnimation  = function(wep,anim)

	if !att.CQC_KnifeLastReload then att.CQC_KnifeLastReload=0 end
	if anim=="idle" and (wep:GetNWBool("reloading") or wep:GetNWBool("cycle") or CurTime()<att.CQC_KnifeLastReload) and CLIENT then
		return "holsteridle"
	elseif anim=="idle" then timer.Simple(0,function() wep.LHIKAnimationTime=7.2727270126343 end) return "idlelong" --im sorry for that float
	end

	end

	ArcCW.LoadAttachmentType(att)
end

------
-- fml_fas1_mp5k.lua
------

do
	local att = {}
	ArcCW.SetShortName("fml_fas1_mp5k")

	att.PrintName = "MP5K Conversion"
	att.Icon = Material("entities/arccw_fml_fas1_mp5k.png")
	att.Description = "Conversion allowing for an extra compact MP5."

	att.Slot = "fas1_mp5k"

	att.SortOrder = 1000

	att.AutoStats = true

	att.MountPositionOverride = 0

	att.ModelOffset = Vector(2, 0, 0)

	att.LHIK = true

	att.Model = "models/weapons/arccw/fml_atts/fas1_grip_mp5k.mdl"

	att.ActivateElements = {"kurz_cum"}  

	att.Mult_Recoil = 0.775
	att.Mult_SightTime = 0.9

	att.Mult_Damage = 0.95
	att.Mult_DamageMin = 0.8

	att.Mult_AccuracyMOA = 1.1
	att.Mult_HipDispersion = 0.8

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload_empty" then
	        return "reload_kurz_empty"
	    elseif anim == "reload_empty_soh" then
	        return "reload_empty_kurz_soh"
	    elseif anim == "reload" then
	        return "reload_kurz"	
	    elseif anim == "reload_soh" then
	        return "reload_kurz_soh"			
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- fml_fas1_mp5sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("fml_fas1_mp5sd")

	att.PrintName = "MP5SD Conversion"
	att.Icon = Material("entities/acwatt_muzz_mp5sd.png")
	att.Description = "Integrated suppressor. Can not be used with MP5K Conversion."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true

	att.SortOrder = 100

	att.ActivateElements = {"mp5sd"}

	att.Slot = "fas1_mp5sd"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Mult_ShootPitch = 0.9
	att.Mult_ShootVol = 0.75
	att.Mult_AccuracyMOA = 0.95
	att.Mult_Range = 1.3

	att.Mult_SightTime = 1.1

	att.Mult_HipDispersion = 1.2

	att.Add_BarrelLength = 24

	att.Mult_RPM = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- fml_fas1_muzz_bayo.lua
------

do
	local att = {}
	ArcCW.SetShortName("fml_fas1_muzz_bayo")

	att.PrintName = "Bayonet"
	att.Icon = Material("entities/arccw_fml_fas1_bayo.png")
	att.Description = "Sharp blade attached to the muzzle"

	att.Slot = {"muzzle", "muzzle_shotgun"}

	att.Model = "models/weapons/arccw/fml_atts/fas1/muzz_bayonet.mdl"

	att.IsMuzzleDevice = true

	att.AutoStats = true

	att.Mult_MeleeDamage = 3

	att.Mult_MoveSpeed = 0.8

	att.Mult_SightTime = 1.15

	att.Add_BarrelLength = 20

	att.Add_MeleeRange = 15

	att.Mult_MeleeTime = 0.9

	att.Mult_MeleeAttackTime = 1.5
	ArcCW.LoadAttachmentType(att)
end

------
-- fml_fas1_muzz_bayo_quad.lua
------

do
	local att = {}
	ArcCW.SetShortName("fml_fas1_muzz_bayo_quad")

	att.PrintName = "Bayonet (Quad Stack)"
	att.Icon = Material("entities/arccw_fml_fas1_bayo_quad.png")
	att.Description = "Sharp blades attached to the muzzle"

	att.Slot = {"muzzle", "muzzle_shotgun"}

	att.AutoStats = true

	att.Model = "models/weapons/arccw/fml_atts/fas1/muzz_bayonet_4x.mdl"

	att.IsMuzzleDevice = true

	att.Mult_MeleeDamage = 8

	att.Mult_MoveSpeed = 0.6

	att.Mult_SightTime = 1.35

	att.Add_BarrelLength = 20

	att.Add_MeleeRange = 15

	att.Mult_MeleeTime = 1.5

	att.Mult_MeleeAttackTime = 2.2
	ArcCW.LoadAttachmentType(att)
end

------
-- fml_fas1_optic_aimpoint.lua
------

do
	local att = {}
	ArcCW.SetShortName("fml_fas1_optic_aimpoint")

	att.PrintName = "FAS1 Aimpoint (RDS)"
	att.Icon = Material("entities/arrcw_fml_fas1_aimpoint.png")
	att.Description = "Reflex sight designed for rifles."
	att.Desc_Pros = {
	    "+Precision sight picture",
	}
	att.Desc_Cons = {
	}
	att.Slot = "optic"

	att.AutoStats = true

	att.Model = "models/weapons/arccw/fml_atts/fas1/optic_eotech.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 5, -1.35),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}

	att.AutoStats = true

	att.Holosight = true
	att.HolosightReticle = Material("holosights/mw_kobra.png")
	att.HolosightNoFlare = true
	att.HolosightSize = 1
	att.HolosightBone = "holosight"

	att.Mult_SightTime = 1.07

	att.Colorable = false

	att.HolosightColor = Color(168, 255, 101)
	ArcCW.LoadAttachmentType(att)
end

------
-- fml_fas1_optic_g36.lua
------

do
	local att = {}
	ArcCW.SetShortName("fml_fas1_optic_g36")

	att.PrintName = "Integrated Scope (2-4x)"
	att.Icon = Material("entities/arccw_fml_fas1_g36_scope.png")
	att.Description = "G36 Optic. Switch between irons and optic with 2x +USE"

	att.SortOrder = 200

	att.Desc_Pros = {
	    "+ Poop",
	    "+ Why are you reading this",	
	}
	att.Desc_Cons = {
	    "- Arctic very gay",
	}
	att.Slot = "optic_fas1_g36"

	att.AutoStats = true

	att.Model = "models/weapons/arccw/fml_atts/fas1_zf_fake.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 9, -0.5),
	        Magnification = 1.25,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 3,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
	        HolosightBone = "holosight",
	        HolosightData = {
	            Holosight = true,
	            HolosightMagnification = 2.7,
	            HolosightReticle = Material("holosights/g36c.png"),
	            HolosightNoFlare = true,
	            HolosightSize = 5,
	            HolosightBlackbox = true,
	            Colorable = true,
	            HolosightPiece = "models/weapons/arccw/fml_atts/fas1_zf_hsp.mdl"
		      },
	        IgnoreExtra = true		  
	    },
	    {
	        Pos = Vector(0, 7.5, -1.5),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.25,
	        HolosightBone = "holosight",
	        HolosightData = {
	            Holosight = true,
	            HolosightReticle =  Material("holosights/dot.png"),
	            HolosightSize = 0.75,
	            Colorable = true,
	            HolosightNoHSP = false
	        }
	    },
	}

	att.ScopeGlint = true

	att.Holosight = true
	att.HolosightPiece = "models/weapons/arccw/fml_atts/fas1_zf_hsp.mdl"
	att.ActivateElements = {"scope_u"}

	att.Mult_SightTime = 1.15
	att.Mult_SightedSpeedMult = 0.85
	att.Mult_SpeedMult = 0.98

	att.ColorOptionsTable = {
	    Color(255, 50, 50),
	    Color(50, 255, 50)
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- fml_fas1_optic_m4a1.lua
------

do
	local att = {}
	ArcCW.SetShortName("fml_fas1_optic_m4a1")

	att.PrintName = "M4A1 (Carry Handle)"
	att.Icon = Material("entities/arccw_fml_fas1_m4a1.png")
	att.Description = "M4A1 carry handle for ultra gamer precision."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "+Good luck hitting anything beyond 20m",
	}
	att.Slot = "optic"

	att.AutoStats = true

	att.ModelOffset = Vector(1.5, 0, 0)

	att.Model = "models/weapons/arccw/fml_atts/fas1/optic_m4a1.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 4, -1.625),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}

	att.AutoStats = true

	att.Holosight = true

	att.Mult_SightTime = 0.98
	ArcCW.LoadAttachmentType(att)
end

------
-- fml_fas1_optic_m82.lua
------

do
	local att = {}
	ArcCW.SetShortName("fml_fas1_optic_m82")

	att.PrintName = "High Power Scope (2-8x)"
	att.Icon = Material("entities/arrcw_fml_fas1_m82s.png")
	att.Description = "Sniper rifle optic with the ability to be adjusted between long and medium range magnification options."

	att.SortOrder = 2000
	att.Ignore = true

	att.Desc_Pros = {
	    "+ Precision sight picture",
	    "+ Zoom",
	}
	att.Desc_Cons = {
	    "- Visible scope glint",
	}

	att.ModelOffset = Vector(-1.5, 0, 0)

	att.AutoStats = true
	att.Slot = "optic_fas1_m82"

	att.Model = "models/weapons/arccw/fml_atts/fas1/optic_m82.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 20, -1.25),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.5,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 8,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
	        IgnoreExtra = true
	    }
	}

	att.ScopeGlint = true

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/rangefinder.png")
	att.HolosightNoFlare = true
	att.HolosightSize = 3.2
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw/fml_atts/fas1/optic_m82_hsp.mdl"
	att.Colorable = true

	att.HolosightMagnification = 3
	att.HolosightBlackbox = true

	att.HolosightMagnificationMin = 2
	att.HolosightMagnificationMax = 8

	att.Mult_SightTime = 1
	att.Mult_SightedSpeedMult = 0.7
	att.Mult_SpeedMult = 0.94
	ArcCW.LoadAttachmentType(att)
end

------
-- fml_fas1_perk_drum_mag.lua
------

do
	local att = {}
	ArcCW.SetShortName("fml_fas1_perk_drum_mag")

	att.PrintName = "Extended Mags"
	att.Icon = Material("entities/arccw_fml_fas1_exmag.png")
	att.Description = "Did you really expect anything else ?"
	att.Desc_Pros = {
	    "+More bullets per mag",
	}
	att.Desc_Cons = {	
	}

	att.AutoStats = true

	att.Slot = "perk_fas_extended"
	att.MagExtender = true

	att.Mult_SightTime = 1.175
	att.Mult_AccuracyMOA = 1.125
	att.Mult_HipDispersion = 1.125
	att.Mult_SpeedMult = 0.85
	att.Mult_SightedSpeedMult = 0.8
	att.Mult_DrawTime = 1.45

	att.ActivateElements = {"drum_mag"}

	att.Hook_TranslateAnimation = function(wep, anim)
	    if anim == "reload_empty" then
	        return "reload_empty_drum"
	    elseif anim == "reload" then
	        return "reload_drum"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- fml_fas1_perk_m870_mag.lua
------

do
	local att = {}
	ArcCW.SetShortName("fml_fas1_perk_m870_mag")

	att.PrintName = "Mag-Fed"
	att.Icon = Material("entities/arccw_fml_fas1_magfed_m870.png")
	att.Description = "Turn the gun into a mag-fed weapon."
	att.Desc_Pros = {
	    "+ Reload all shell",
	}
	att.Desc_Cons = {
	    "- ADS speed",	
	    "- Draw speed",		
	}
	att.Slot = "perk_fas_mag_fed"

	att.AutoStats = true

	att.Override_ShotgunReload = false

	att.ActivateElements = {"mag_cum"}  

	att.Mult_DrawTime = 1.2
	att.Mult_SightTime = 1.15
	att.Mult_HipDispersion = 1.5
	ArcCW.LoadAttachmentType(att)
end

------
-- fml_fas1_perk_shotgun_semi_auto.lua
------

do
	local att = {}
	ArcCW.SetShortName("fml_fas1_perk_shotgun_semi_auto")

	att.PrintName = "Semi-Auto"
	att.Icon = Material("entities/arccw_fml_fas1_semi.png")
	att.Description = "How."
	att.Desc_Pros = {
	"Pumping no more."
	}
	att.Desc_Cons = {
	}

	att.Ignore = true

	att.Slot = "perk_fas_shotgun"

	att.Override_Firemodes = {
	    {
	        PrintName = "Semi",	
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}

	att.Override_ManualAction = false

	att.Mult_DrawTime = 1.2
	att.Mult_SightTime = 1.2
	att.Mult_ReloadTime = 47/37
	att.Mult_RPM = 0.8
	att.Mult_AccuracyMOA = 1.8
	att.Mult_HipDispersion = 1.85
	att.Mult_MoveDispersion = 2.2

	att.AutoStats = true

	ArcCW.LoadAttachmentType(att)
end

------
-- fml_fas1_perk_soh.lua
------

do
	local att = {}
	ArcCW.SetShortName("fml_fas1_perk_soh")

	att.PrintName = "Sleight Of Hand"
	att.Icon = Material("entities/arccw_fml_fas1_soh.png")
	att.Description = "Improves reloading speed "
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Slot = "perk_fas"

	att.InvAtt = "perk_fastreload"

	att.Mult_DrawTime = 0.8
	att.Mult_SightTime = 0.95

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload_empty" then
	        return "reload_empty_soh"
	    elseif anim == "reload" then
	        return "reload_soh"
	    end
	end

	att.AutoStats = true

	ArcCW.LoadAttachmentType(att)
end

------
-- fml_fas1_perk_soh_bolt.lua
------

do
	local att = {}
	ArcCW.SetShortName("fml_fas1_perk_soh_bolt")

	att.PrintName = "Sleight Of Hand"
	att.Icon = Material("entities/arccw_fml_fas1_slam2.png")
	att.Description = "Improves cycling and reloading speed."
	att.Desc_Pros = {
	    "+Faster Cycling",
	}
	att.Desc_Cons = {
	}
	att.Slot = "perk_fas_bolt"

	att.InvAtt = "perk_fastreload"

	att.Mult_DrawTime = 0.8
	att.Mult_SightTime = 0.95
	att.Mult_ReloadTime = 0.9
	att.Mult_RPM = 1.2

	att.Hook_SelectCycleAnimationon = function(wep, anim)
	    if anim == "cycle" then
	        return "slam"
	    end
	end

	att.AutoStats = true

	ArcCW.LoadAttachmentType(att)
end

------
-- fml_fas1_perk_soh_shotgun.lua
------

do
	local att = {}
	ArcCW.SetShortName("fml_fas1_perk_soh_shotgun")

	att.PrintName = "Sleight Of Hand"
	att.Icon = Material("entities/arccw_fml_fas1_slam.png")
	att.Description = "Improves pumping and reloading speed."
	att.Desc_Pros = {
	    "+ Faster Pumping",
	}
	att.Desc_Cons = {
	}
	att.Slot = "perk_fas_shotgun"

	att.InvAtt = "perk_fastreload"

	att.Mult_DrawTime = 0.8
	att.Mult_SightTime = 0.95
	att.Mult_ReloadTime = 0.9
	att.Mult_RPM = 1.2

	att.Hook_SelectCycleAnimation = function(wep, anim)
	    if anim == "cycle" then
	        return "slam"
	    end
	end

	att.AutoStats = true

	ArcCW.LoadAttachmentType(att)
end

------
-- fml_fas1_ubgl_m24.lua
------

do
	local att = {}
	ArcCW.SetShortName("fml_fas1_ubgl_m24")

	att.PrintName = "M24-K (FMJ)"
	att.Icon = Material("entities/arccw_fml_fas1_ubgl_m24.png")
	att.Description = "Obrez bolt-action underbarrel snipe rifle. Decent accuracy and range. Double tap +ZOOM to equip/dequip."
	att.Desc_Pros = {
	    "+ Selectable underbarrel sniper rifle",
	}
	att.Desc_Cons = {
	}

	att.Slot = "ubgl"

	att.AutoStats = true

	att.LHIK = true
	att.LHIK_Animation = true

	att.MountPositionOverride = 0

	att.Model = "models/weapons/arccw/fml/fas1/atts/ubgl_m24.mdl"

	att.UBGL = true

	att.UBGL_PrintName = "UB (M24)"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_m3"
	att.UBGL_ClipSize = 1
	att.UBGL_Ammo = "357"
	att.UBGL_RPM = 60
	att.UBGL_Recoil = 3
	att.UBGL_Capacity = 1

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("357")
	end


	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    wep:DoLHIKAnimation("fire", 1)

	    wep.Owner:FireBullets({
	        Src = wep.Owner:EyePos(),
	        Num = 1,
	        Damage = 120,
	        Force = 2,
	        Attacker = wep.Owner,
	        Dir = wep.Owner:EyeAngles():Forward(),
	        Spread = Vector(0.008, 0.008, 0.008),
	        Callback = function(_, tr, dmg)
	            local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

	            local dmgmax = 120
	            local dmgmin = 40

	            local delta = dist / 100

	            delta = math.Clamp(delta, 0, 1)

	            local amt = Lerp(delta, dmgmax, dmgmin)

	            dmg:SetDamage(amt)
	        end
	    })

	    wep:EmitSound("weapons/arccw_fml/sniper_m24/m24_fire1.wav", 120)

	    wep:SetClip2(wep:Clip2() - 1)

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    if wep:Clip2() >= 1 then return end

	    if Ammo(wep) <= 0 then return end

	    wep:DoLHIKAnimation("reload", 2.5)

	    wep:SetNextSecondaryFire(CurTime() + 2.5)

	    wep:PlaySoundTable({
	        {s = "weapons/arccw_fml/sniper_m24/m24_bolt_up.wav", t = 20/60},
	        {s = "weapons/arccw_fml/sniper_m24/m24_bolt_back.wav", t = 35/60},
	        {s = "weapons/arccw_fml/sniper_m24/m24_load1.wav", t = 87/60},		
	        {s = "weapons/arccw_fml/sniper_m24/m24_bolt_forward.wav", t = 120/60},
	        {s = "weapons/arccw_fml/sniper_m24/m24_bolt_down.wav", t = 131/60},		
	    })

	    local reserve = Ammo(wep)

	    reserve = reserve + wep:Clip2()

	    local clip = 1

	    local load = math.Clamp(clip, 0, reserve)

	    wep.Owner:SetAmmo(reserve - load, "357")

	    wep:SetClip2(load)
	end

	att.Mult_SightTime = 1.15
	att.Mult_MoveSpeed = 0.8
	att.Mult_SightedSpeedMult = 0.75
	ArcCW.LoadAttachmentType(att)
end

------
-- fml_fas1_ubgl_m3_fed.lua
------

do
	local att = {}
	ArcCW.SetShortName("fml_fas1_ubgl_m3_fed")

	att.PrintName = "Mag-fed M3 (BUCK)"
	att.Icon = Material("entities/arccw_fml_fas1_ubgl_m3.png")
	att.Description = "Magazine-fed semi-auto 12 gauge underbarrel shotgun. Double tap +ZOOM to equip/dequip."
	att.Desc_Pros = {
	    "+ Selectable underbarrel shotgun",
	}
	att.Desc_Cons = {
	}

	att.Slot = "ubgl"

	att.AutoStats = true

	att.LHIK = true
	att.LHIK_Animation = true

	att.MountPositionOverride = 0

	att.Model = "models/weapons/arccw/fml/fas1/atts/ubgl_m3_fed.mdl"

	att.UBGL = true

	att.UBGL_PrintName = "UB (BUCK)"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_m3"
	att.UBGL_ClipSize = 3
	att.UBGL_Ammo = "buckshot"
	att.UBGL_RPM = 150
	att.UBGL_Recoil = 2
	att.UBGL_Capacity = 3

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("buckshot")
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    wep:DoLHIKAnimation("fire", 1)

	    wep.Owner:FireBullets({
	        Src = wep.Owner:EyePos(),
	        Num = 12,
	        Damage = 15,
	        Force = 1,
	        Attacker = wep.Owner,
	        Dir = wep.Owner:EyeAngles():Forward(),
	        Spread = Vector(0.065, 0.065, 0.065),
	        Callback = function(_, tr, dmg)
	            local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

	            local dmgmax = 15
	            local dmgmin = 0

	            local delta = dist / 40

	            delta = math.Clamp(delta, 0, 1)

	            local amt = Lerp(delta, dmgmax, dmgmin)

	            dmg:SetDamage(amt)
	        end
	    })

	    wep:EmitSound("weapons/arccw_fml/shotgun_m3s90p/m3s90_fire1.wav", 120)

	    wep:SetClip2(wep:Clip2() - 1)

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    if wep:Clip2() >= 3 then return end
	    if Ammo(wep) <= 0 then return end

	    if wep:Clip2() == 0 then

	        wep:DoLHIKAnimation("reload", 130/50)

	        wep:SetNextSecondaryFire(CurTime() + 130/50)

	        wep:PlaySoundTable({
	            {s = "weapons/arccw/mag7/mag7_clipout.wav", t = 15/50},
	            {s = "weapons/arccw/mag7/mag7_clipin.wav", t = 55/50},
	            {s = "weapons/arccw/mag7/mag7_pump_back.wav", t = 91/50},
	            {s = "weapons/arccw/mag7/mag7_pump_forward.wav", t = 105/50},
	        })

	    else

	        wep:DoLHIKAnimation("reload_part", 90/50)

	        wep:SetNextSecondaryFire(CurTime() + 90/50)

	        wep:PlaySoundTable({
	            {s = "weapons/arccw/mag7/mag7_clipout.wav", t = 15/50},
	            {s = "weapons/arccw/mag7/mag7_clipin.wav", t = 55/50},
	        })

	    end

	    local reserve = Ammo(wep)

	    reserve = reserve + wep:Clip2()

	    local clip = 3

	    local load = math.Clamp(clip, 0, reserve)

	    wep.Owner:SetAmmo(reserve - load, "buckshot")

	    wep:SetClip2(load)
	end

	att.Mult_SightTime = 1.35
	att.Mult_MoveSpeed = 0.75
	att.Mult_SightedSpeedMult = 0.675
	ArcCW.LoadAttachmentType(att)
end

------
-- foregrip_angled.lua
------

do
	local att = {}
	ArcCW.SetShortName("foregrip_angled")

	att.PrintName = "Angled Foregrip"
	att.Icon = Material("entities/acwatt_foregrip_angled.png")
	att.Description = "Angled foregrip which enables superior agility, at the cost of recoil control due to a harder-to-grip surface."

	att.SortOrder = 1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "foregrip"

	att.LHIK = true
	att.MountPositionOverride = 1

	att.Model = "models/weapons/arccw/atts/foregrip_angled.mdl"

	att.Mult_Recoil = 1.1

	att.Mult_SightTime = 0.9
	att.Mult_SpeedMult = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- foregrip_cqc.lua
------

do
	local att = {}
	ArcCW.SetShortName("foregrip_cqc")

	att.PrintName = "CQC Foregrip"
	att.Icon = Material("entities/acwatt_foregrip_cqc.png")
	att.Description = "Foregrip allowing for superior strafe speed and hip fire accuracy at the cost of recoil control and sight speed."

	att.SortOrder = 1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "foregrip"

	att.LHIK = true

	att.ModelOffset = Vector(1, 0, 0)

	att.Model = "models/weapons/arccw/atts/foregrip_cqc.mdl"

	att.Mult_Recoil = 1.15

	att.Mult_SightTime = 1.15
	att.Mult_HipDispersion = 0.75
	att.Mult_SightedMoveSpeed = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- foregrip_exclusive.lua
------

do
	local att = {}
	ArcCW.SetShortName("foregrip_exclusive")

	att.PrintName = "Exclusive Foregrip"
	att.Icon = Material("entities/acwatt_foregrip_mp5k_exclusive.png", "smooth"
	)
	att.Description = "Weapon-exclusive foregrip with its own unique animations."
	att.AutoStats = true
	att.SortOrder = 1738 - 10
	att.MountPositionOverride = 0.69 -- xd
	att.Ignore = false
	att.Slot = "foregrip_mw2exclusive"

	att.ActivateElements = {"grip"}


	att.Mult_Recoil = 0.8

	att.Mult_SightTime = 1.1
	att.Mult_HipDispersion = 1.1
	att.Mult_SpeedMult = 0.95

	att.AddSuffix = " Grip"
	ArcCW.LoadAttachmentType(att)
end

------
-- foregrip_pistol.lua
------

do
	local att = {}
	ArcCW.SetShortName("foregrip_pistol")

	att.PrintName = "Light Foregrip"
	att.Icon = Material("entities/acwatt_foregrip_pistol.png")
	att.Description = "Lightweight pistol-style foregrip. Improves recoil marginally."

	att.SortOrder = 1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"foregrip", "foregrip_pistol"}

	att.LHIK = true

	att.Model = "models/weapons/arccw/atts/foregrip_pistol.mdl"

	att.Mult_Recoil = 0.875

	att.Mult_SightTime = 1.05
	att.Mult_HipDispersion = 1.1
	att.Mult_SpeedMult = 0.98
	ArcCW.LoadAttachmentType(att)
end

------
-- foregrip_stubby.lua
------

do
	local att = {}
	ArcCW.SetShortName("foregrip_stubby")

	att.PrintName = "Stubby Foregrip"
	att.Icon = Material("entities/acwatt_foregrip_stubby.png")
	att.Description = "Short foregrip which provides good stability while moving as well as helping stabilize recoil."

	att.SortOrder = 1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "foregrip"

	att.LHIK = true

	att.Model = "models/weapons/arccw/atts/foregrip_stubby.mdl"

	att.Mult_MoveDispersion = 0.5

	att.Mult_RecoilSide = 0.85

	att.Mult_SightTime = 1.15

	att.Mult_SpeedMult = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- foregrip_vertical.lua
------

do
	local att = {}
	ArcCW.SetShortName("foregrip_vertical")

	att.PrintName = "Vertical Foregrip"
	att.Icon = Material("entities/acwatt_foregrip_vertical.png")
	att.Description = "Attachable foregrip for long guns."

	att.SortOrder = 1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "foregrip"

	att.LHIK = true

	att.Model = "models/weapons/arccw/atts/foregrip_vertical.mdl"

	att.Mult_Recoil = 0.75

	att.Mult_SightTime = 1.2
	att.Mult_HipDispersion = 1.2
	att.Mult_SpeedMult = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- go_556_ammo_60round.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_556_ammo_60round")

	att.PrintName = "50-Round 5.56mm Quad"
	att.Icon = Material("entities/acwatt_go_556_ammo_60round.png", "mips smooth")
	att.Description = "Quad-stack casket magazine with a 50-round capacity. Good capacity, but slows handling."
	att.SortOrder = 50
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo_556_60"

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.15
	att.Override_ClipSize = 50
	att.Mult_ReloadTime = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- go_870_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_870_barrel_long")

	att.PrintName = "750mm 870 Barrel"
	att.Icon = Material("entities/acwatt_go_870_barrel_long.png", "mips smooth")
	att.Description = "Long Model 870 hunting barrel with ventilated rib improves ranged performance, but at the cost of mobility."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_870_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_MoveDispersion = 1.25
	att.Mult_SightTime = 1.15
	att.Mult_AccuracyMOA = 0.8
	att.Mult_ShootPitch = 0.95

	ArcCW.LoadAttachmentType(att)
end

------
-- go_870_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_870_barrel_short")

	att.PrintName = "350mm 870 Barrel"
	att.Icon = Material("entities/acwatt_go_870_barrel_short.png", "mips smooth")
	att.Description = "Sawn-off barrel improves handling but increases spread."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_870_barrel"

	att.Mult_MoveDispersion = 0.85
	att.Mult_SightTime = 0.85
	att.Mult_AccuracyMOA = 1.5
	att.Mult_ShootPitch = 1.1
	att.Mult_HipDispersion = 0.75

	ArcCW.LoadAttachmentType(att)
end

------
-- go_870_mag_4.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_870_mag_4")

	att.PrintName = "4-Round 870 Tube"
	att.Icon = Material("entities/acwatt_go_870_mag_4.png", "mips smooth")
	att.Description = "Small tube with lighter load. Improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 4
	att.AutoStats = true
	att.Slot = "go_870_mag"

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Override_ClipSize = 4
	att.Mult_ReloadTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_870_mag_8.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_870_mag_8")

	att.PrintName = "8-Round 870 Tube"
	att.Icon = Material("entities/acwatt_go_870_mag_8.png", "mips smooth")
	att.Description = "Extended magazine with 8-round capacity."
	att.SortOrder = 8
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_870_mag"

	att.Mult_MoveSpeed = 0.98
	att.Mult_SightTime = 1.05
	att.Override_ClipSize = 8
	att.Mult_ReloadTime = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_870_stock_sawnoff.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_870_stock_sawnoff")

	att.PrintName = "Sawn-Off Stock"
	att.Icon = Material("entities/acwatt_go_870_stock_sawnoff.png", "mips smooth")
	att.Description = "The bank robber's choice of stock is concealable and improves mobility, albeit at the cost of handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_870_stock"

	att.Mult_Recoil = 2
	att.Mult_SpeedMult = 1.25
	att.Mult_SightTime = 0.75
	att.Mult_MoveDispersion = 1.25

	att.NoStock = true
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ace_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ace_barrel_long")

	att.PrintName = "510mm SAW Barrel"
	att.Icon = Material("entities/acwatt_go_ace_barrel_long.png", "mips smooth")
	att.Description = "Long Galil barrel used for suppressive fire. Good for long range engagements."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ace_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.3
	att.Mult_AccuracyMOA = 0.75

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ace_barrel_med.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ace_barrel_med")

	att.PrintName = "409mm Carbine Barrel"
	att.Icon = Material("entities/acwatt_go_ace_barrel_med.png", "mips smooth")
	att.Description = "Medium-length barrel for the Galil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ace_barrel"

	att.Mult_Range = 1.15
	att.Mult_Recoil = 0.9
	att.Mult_SightTime = 1.1
	att.Mult_AccuracyMOA = 0.9

	att.Mult_ShootPitch = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ace_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ace_barrel_short")

	att.PrintName = "216mm Navy Barrel"
	att.Icon = Material("entities/acwatt_go_ace_barrel_short.png", "mips smooth")
	att.Description = "Short length Galil barrel for special forces. Offers superior handling at the cost of performance."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ace_barrel"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 2

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ace_mag_10_762.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ace_mag_10_762")

	att.PrintName = "10-Round 7.62mm Poly"
	att.Icon = Material("entities/acwatt_go_ak_mag_10.png", "mips smooth")
	att.Description = "7.62mm conversion turning rifle into Galil ACE 34. Superior range and damage at the cost of recoil. Reduced capacity magazine improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 10
	att.AutoStats = true
	att.Slot = "go_ace_mag"

	att.InvAtt = "go_ak_mag_10"

	att.Override_Ammo = "ar2"

	att.Override_ClipSize = 10
	att.Mult_Range = 1.25
	att.Mult_Damage = 1.1
	att.Mult_DamageMin = 1.1
	att.Mult_Recoil = 1.5
	att.Mult_RPM = 0.75

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Mult_ReloadTime = 0.9

	att.Override_Trivia_Calibre = "7.62x39mm Soviet"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "arccw_go/galilar/galil_03.wav" then return "arccw_go/galilar/galil_02.wav" end
	    if fsound == "arccw_go/galilar/galil_04.wav" then return "arccw_go/galilar/galil_02.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ace_mag_20.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ace_mag_20")

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
	att.Slot = "go_ace_mag"

	att.InvAtt = "go_m4_mag_20"

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Override_ClipSize = 20
	att.Mult_ReloadTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ace_mag_30_762.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ace_mag_30_762")

	att.PrintName = "30-Round 7.62mm Poly"
	att.Icon = Material("entities/acwatt_go_ak_mag_30.png", "mips smooth")
	att.Description = "7.62mm conversion turning rifle into Galil ACE 34. Superior range and damage at the cost of recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 30
	att.AutoStats = true
	att.Slot = "go_ace_mag"

	att.InvAtt = "go_ak_mag_30"

	att.Override_Ammo = "ar2"

	att.Override_ClipSize = 30
	att.Mult_Range = 1.25
	att.Mult_Damage = 1.1
	att.Mult_DamageMin = 1.1
	att.Mult_Recoil = 1.5
	att.Mult_RPM = 0.75

	att.Override_Trivia_Calibre = "7.62x39mm Soviet"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "arccw_go/galilar/galil_03.wav" then return "arccw_go/galilar/galil_02.wav" end
	    if fsound == "arccw_go/galilar/galil_04.wav" then return "arccw_go/galilar/galil_02.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ace_mag_40_762.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ace_mag_40_762")

	att.PrintName = "40-Round 7.62mm Poly"
	att.Icon = Material("entities/acwatt_go_ak_mag_40.png", "mips smooth")
	att.Description = "7.62mm conversion turning rifle into Galil ACE 34. Superior range and damage at the cost of recoil. Large magazine has inferior handling."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 40
	att.AutoStats = true
	att.Slot = "go_ace_mag"

	att.InvAtt = "go_ak_mag_40"

	att.Override_Ammo = "ar2"

	att.Override_ClipSize = 40
	att.Mult_Range = 1.25
	att.Mult_Damage = 1.1
	att.Mult_DamageMin = 1.1
	att.Mult_Recoil = 1.5
	att.Mult_RPM = 0.75

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.1
	att.Mult_ReloadTime = 1.1

	att.Override_Trivia_Calibre = "7.62x39mm Soviet"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "arccw_go/galilar/galil_03.wav" then return "arccw_go/galilar/galil_02.wav" end
	    if fsound == "arccw_go/galilar/galil_04.wav" then return "arccw_go/galilar/galil_02.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ak_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ak_barrel_long")

	att.PrintName = "590mm RPK Barrel"
	att.Icon = Material("entities/acwatt_go_ak_barrel_long.png", "mips smooth")
	att.Description = "AKM SAW barrel, effectively converting it into an RPK."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ak47_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 1.25
	att.Mult_Recoil = 0.85
	att.Mult_SightTime = 1.3
	att.Mult_AccuracyMOA = 0.75

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ak_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ak_barrel_short")

	att.PrintName = "314mm Ukorochenniy Barrel"
	att.Icon = Material("entities/acwatt_go_ak_barrel_short.png", "mips smooth")
	att.Description = "Compact barrel intended for close-range battle."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ak47_barrel"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 2

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ak_barrel_tac.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ak_barrel_tac")

	att.PrintName = "415mm Spetsnaz Barrel"
	att.Icon = Material("entities/acwatt_go_ak_barrel_tac.png", "mips smooth")
	att.Description = "Tactical handguard with attachment rails for additional coolness. Reduced weight compared to standard barrel."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ak47_barrel"

	att.Mult_Recoil = 1.1
	att.Mult_SightTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ak_grip_tactical.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ak_grip_tactical")

	att.PrintName = "Tactical Grip"
	att.Icon = Material("entities/acwatt_go_ak_grip_tactical.png", "mips smooth")
	att.Description = "Rubberized grip for the AK. Improves recoil at the cost of aim time."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ak47_grip"

	att.Mult_Recoil = 0.9
	att.Mult_SightTime = 1.1
	att.Mult_MoveSpeed = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ak_mag_10.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ak_mag_10")

	att.PrintName = "10-Round 7.62mm Poly"
	att.Icon = Material("entities/acwatt_go_ak_mag_10.png", "mips smooth")
	att.Description = "Small civilian magazine with lighter load. Improves weapon handling."
	att.SortOrder = 10
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.AutoStats = true
	att.Slot = "go_ammo_ak47"

	att.Mult_MoveSpeed = 1.15
	att.Mult_SightTime = 0.75
	att.Override_ClipSize = 10
	att.Mult_ReloadTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ak_mag_10_steel.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ak_mag_10_steel")

	att.PrintName = "10-Round 7.62mm Steel"
	att.Icon = Material("entities/acwatt_go_ak_mag_10_steel.png", "mips smooth")
	att.Description = "Small civilian magazine with lighter load. Improves weapon handling."
	att.SortOrder = 10
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.AutoStats = true
	att.Slot = "go_ammo_ak47"

	att.Mult_MoveSpeed = 1.15
	att.Mult_SightTime = 0.75
	att.Override_ClipSize = 10
	att.Mult_ReloadTime = 0.925
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ak_mag_15_545.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ak_mag_15_545")

	att.PrintName = "15-Round 5.45mm Poly"
	att.Icon = Material("entities/acwatt_go_ak_mag_15_545.png", "mips smooth")
	att.Description = "AK-74 conversion for the AKM. Reduced-capacity magazine has better handling."
	att.SortOrder = 15
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.AutoStats = true
	att.Slot = "go_ammo_ak74"

	att.Mult_MoveSpeed = 1.15
	att.Mult_SightTime = 0.75
	att.Mult_ReloadTime = 0.9
	att.Override_ClipSize = 15

	att.Mult_Range = 0.8
	att.Mult_Penetration = 0.8
	att.Mult_Recoil = 0.85
	att.Mult_RPM = 1.15
	att.Mult_AccuracyMOA = 0.8
	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 0.9

	att.Override_Ammo = "smg1"

	att.Override_Trivia_Calibre = "5.45x39mm Soviet"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "arccw_go/ak47/ak47_01.wav" then return "arccw_go/ak74/ak74_fp.wav"
	    elseif fsound == "arccw_go/m4a1/m4a1_silencer_01.wav" then return "arccw_go/ak74/ak74_suppressed_fp.wav"
	    elseif fsound == "arccw_go/ak47/ak47-1-distant.wav" then return "arccw_go/ak74/ak74_dist.wav"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ak_mag_30.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ak_mag_30")

	att.PrintName = "30-Round 7.62mm Poly"
	att.Icon = Material("entities/acwatt_go_ak_mag_30.png", "mips smooth")
	att.Description = "Alternative slab-side polymer magazine."
	att.SortOrder = 30
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo_ak47"
	att.Mult_ReloadTime = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ak_mag_30_545.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ak_mag_30_545")

	att.PrintName = "30-Round 5.45mm Poly"
	att.Icon = Material("entities/acwatt_go_ak_mag_30_545.png", "mips smooth")
	att.Description = "AK-74 conversion for the AKM. Lighter weight and with better recoil, though at the cost of overall range and damage."
	att.SortOrder = 30
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo_ak74"

	att.Mult_MoveSpeed = 1.05
	att.Mult_SightTime = 0.95
	att.Override_ClipSize = 30

	att.Mult_Range = 0.8
	att.Mult_Penetration = 0.8
	att.Mult_Recoil = 0.85
	att.Mult_RPM = 1.15
	att.Mult_AccuracyMOA = 0.8
	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 0.9

	att.Override_Ammo = "smg1"

	att.Override_Trivia_Calibre = "5.45x39mm Soviet"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "arccw_go/ak47/ak47_01.wav" then return "arccw_go/ak74/ak74_fp.wav"
	    elseif fsound == "arccw_go/m4a1/m4a1_silencer_01.wav" then return "arccw_go/ak74/ak74_suppressed_fp.wav"
	    elseif fsound == "arccw_go/ak47/ak47-1-distant.wav" then return "arccw_go/ak74/ak74_dist.wav"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ak_mag_40.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ak_mag_40")

	att.PrintName = "40-Round 7.62mm Poly"
	att.Icon = Material("entities/acwatt_go_ak_mag_40.png", "mips smooth")
	att.Description = "Large-capacity RPK magazine. Used for squad support weapons. Fiberglass construction."
	att.SortOrder = 40
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo_ak47"

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.1
	att.Override_ClipSize = 40
	att.Mult_ReloadTime = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ak_mag_40_steel.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ak_mag_40_steel")

	att.PrintName = "40-Round 7.62mm Steel"
	att.Icon = Material("entities/acwatt_go_ak_mag_40_steel.png", "mips smooth")
	att.Description = "Large-capacity RPK magazine. Used for squad support weapons."
	att.SortOrder = 40
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo_ak47"

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.1
	att.Override_ClipSize = 40
	att.Mult_ReloadTime = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ak_mag_45_545.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ak_mag_45_545")

	att.PrintName = "45-Round 5.45mm Poly"
	att.Icon = Material("entities/acwatt_go_ak_mag_45_545.png", "mips smooth")
	att.Description = "AK-74 conversion for the AKM. A large magazine intended for SAWs such as the RPK-74, though compatible with standard weapons."
	att.SortOrder = 45
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo_ak74"

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.1
	att.Override_ClipSize = 45
	att.Mult_ReloadTime = 1.1

	att.Mult_Range = 0.8
	att.Mult_Penetration = 0.8
	att.Mult_Recoil = 0.85
	att.Mult_RPM = 1.15
	att.Mult_AccuracyMOA = 0.8
	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 0.9

	att.Override_Ammo = "smg1"

	att.Override_Trivia_Calibre = "5.45x39mm Soviet"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "arccw_go/ak47/ak47_01.wav" then return "arccw_go/ak74/ak74_fp.wav"
	    elseif fsound == "arccw_go/m4a1/m4a1_silencer_01.wav" then return "arccw_go/ak74/ak74_suppressed_fp.wav"
	    elseif fsound == "arccw_go/ak47/ak47-1-distant.wav" then return "arccw_go/ak74/ak74_dist.wav"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ak_mag_60_545.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ak_mag_60_545")

	att.PrintName = "60-Round 5.45mm Poly"
	att.Icon = Material("entities/acwatt_go_ak_mag_60_545.png", "mips smooth")
	att.Description = "AK-74 conversion for the AKM. Huge casket magazine that can hold 60 rounds, though very cumbersome."
	att.SortOrder = 60
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo_ak74"

	att.Mult_MoveSpeed = 0.85
	att.Mult_SightTime = 1.25
	att.Override_ClipSize = 60
	att.Mult_ReloadTime = 1.25

	att.Mult_Range = 0.8
	att.Mult_Penetration = 0.8
	att.Mult_Recoil = 0.85
	att.Mult_RPM = 1.15
	att.Mult_AccuracyMOA = 0.8
	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 0.9

	att.Override_Ammo = "smg1"

	att.Override_Trivia_Calibre = "5.45x39mm Soviet"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "arccw_go/ak47/ak47_01.wav" then return "arccw_go/ak74/ak74_fp.wav"
	    elseif fsound == "arccw_go/m4a1/m4a1_silencer_01.wav" then return "arccw_go/ak74/ak74_suppressed_fp.wav"
	    elseif fsound == "arccw_go/ak47/ak47-1-distant.wav" then return "arccw_go/ak74/ak74_dist.wav"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ak_stock_heavy.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ak_stock_heavy")

	att.PrintName = "RPK Stock"
	att.Icon = Material("entities/acwatt_go_ak_stock_heavy.png", "mips smooth")
	att.Description = "Heavy SAW stock for the AK. Improves recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ak47_stock_heavy"

	att.Mult_SightTime = 1.25
	att.Mult_Recoil = 0.9
	att.Mult_MoveDispersion = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ak_stock_skeleton.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ak_stock_skeleton")

	att.PrintName = "Skeleton Stock"
	att.Icon = Material("entities/acwatt_go_ak_stock_skeleton.png", "mips smooth")
	att.Description = "Lightweight stock for the AK. Improves ADS speed at the cost of recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ak47_stock"

	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.75
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ammo_airsoft.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ammo_airsoft")

	att.PrintName = "Airsoft"
	att.Icon = Material("entities/acwatt_go_ammo_airsoft.png", "smooth mips")
	att.Description = "Replace weapon internals to fire tiny plastic BB pellets, effectively making the gun a toy. While the projectile does minimal damage, the weapon can load a lot more pellets and handles incredibly well.\nRemember, no full auto in the buildings!"
	att.Desc_Pros = {
	    "Shoot BB pellets",
	    "Large magazine capacity",
	    "Great handling and no recoil"
	}
	att.Desc_Cons = {
	    "Minimal damage"
	}
	att.Desc_Neutrals = {
	    "Uses BB Pellets ammo",
	    "Airsoft users instakill each other"
	}
	att.Slot = "go_ammo"

	att.AutoStats = false

	att.Mult_Penetration = 0
	att.Mult_Recoil = 0.1
	att.Mult_HipDispersion = 0.5
	att.Mult_MoveDispersion = 0.5
	att.Mult_Damage = 0.1
	att.Mult_DamageMin = 0.1
	att.Mult_RPM = 1.3
	att.Mult_CycleSpeed = 1.3
	att.Mult_HeatCapacity = 2
	att.Mult_HeatDissipation = 4
	att.Mult_AccuracyMOA = 3

	att.Override_AlwaysPhysBullet = true
	att.O_Hook_Override_PhysBulletMuzzleVelocity = function(wep, data)
	    local r = wep:GetBuff("Range")
	    data.current = math.Clamp(math.sqrt(r * (wep.DamageMin > wep.Damage and r or 1)), 7, 40) * 15
	    return data
	end
	att.Mult_PhysBulletGravity = 2
	att.Override_PhysTracerProfile = 0
	att.NoRandom = true

	att.Override_Ammo = "airsoft"
	att.Override_Ammo_Priority = 10000

	att.AddPrefix = "Airsoft "

	att.Hook_GetCapacity = function(wep, cap)
	    if wep.ShotgunReload or wep.RevolverReload or cap <= 2 then
	        return cap
	    else
	        return cap * 2
	    end
	end

	att.Hook_SelectInsertAnimation = function(wep, data)
	    data.count = data.count * 2
	    return data
	end

	att.Hook_PreDoEffects = function(wep, fx)
	    return true
	end

	att.Hook_GetShootSound_Priority = 100
	att.Hook_GetShootSound = function(wep, sound)
	    return "arccw_go/airsoft2.wav"
	end
	att.Hook_GetDistantShootSound_Priority = 100
	att.Hook_GetDistantShootSound = function(wep, sound)
	    return false
	end

	att.Override_PhysBulletImpact = false
	att.Hook_PhysBulletHit = function(wep, data)
	    if SERVER then
	        local ent = data.tr.Entity
	        local bullet = data.bullet
	        local wep2 = IsValid(ent) and ent.GetActiveWeapon and ent:GetActiveWeapon()
	        if (ent:IsNPC() or ent:IsPlayer()) and IsValid(wep2)
	                and wep2.ArcCW and wep2.Primary.Ammo == "airsoft" then
	            ent:TakeDamage(9999, wep:GetOwner(), wep)
	        else
	            ent:TakeDamage(wep:GetDamage(bullet.Travelled * ArcCW.HUToM, true), wep:GetOwner(), wep)
	        end
	        local breakeffect = ents.Create( "info_particle_system" )
	        breakeffect:SetKeyValue( "effect_name", "bb_impact_break" )
	        breakeffect:SetOwner( wep )
	        breakeffect:SetPos( data.tr.HitPos )
	        breakeffect:Spawn()
	        breakeffect:Activate()
	        breakeffect:Fire( "start", "", 0 )
	        breakeffect:Fire( "kill", "", 3 )
	    end
	    return true
	end

	game.AddAmmoType({
	    name = "airsoft"
	})

	if CLIENT then
	    language.Add("airsoft_ammo", "BB Pellets")
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ammo_api.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ammo_api")

	att.PrintName = "AP/I Rounds"
	att.Icon = Material("entities/acwatt_go_ammo_api.png", "mips smooth")
	att.Description = "Armor-piercing incendiary rounds which ignite targets and improves range and long range damage, though at the cost of reduced damage overall."
	att.Desc_Pros = {
	    "pro.ignite"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo_bullet"


	att.Mult_Range = 1.5

	att.Mult_Damage = 0.85
	att.Mult_DamageMin = 1.1

	att.Override_DamageType = DMG_BURN

	att.Override_PhysTracerProfile = 1

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ammo_blanks.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ammo_blanks")

	att.PrintName = "Blank Rounds"
	att.Icon = Material("entities/acwatt_go_ammo_blanks.png", "mips smooth")
	att.Description = "Rounds that contain no bullet, only powder and a wad. Incapable of doing harm. Might come in useful, somehow?"
	att.Desc_Pros = {
	    "pro.ammo_blank",
	}
	att.Desc_Cons = {
	    "con.ammo_blank",
	}
	att.AutoStats = true
	att.Slot = "go_ammo"

	att.Override_Num = 0
	att.Mult_Num = 0

	att.Mult_Recoil = 0.25

	att.NotForNPCs = true
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ammo_jhp.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ammo_jhp")

	att.PrintName = "JHP Rounds"
	att.Icon = Material("entities/acwatt_go_ammo_jhp.png", "mips smooth")
	att.Description = "Rounds with a hollow tip, improving effective close range damage at the cost of range and penetration."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo"


	att.Mult_Penetration = 0.5

	att.Mult_Damage = 1.1
	att.Mult_DamageMin = 0.9

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ammo_magnum.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ammo_magnum")

	att.PrintName = "Magnum Rounds"
	att.Icon = Material("entities/acwatt_go_ammo_magnum.png")
	att.Description = "Load cartridges with a dangerous amount of powder, exchanging ballistics for raw close-up power.\nCannot be used with suppressors."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo"

	att.Mult_Sway = 1
	att.Mult_Damage = 1.2
	att.Mult_AccuracyMOA = 2
	att.Mult_Recoil = 1.5
	att.Mult_RecoilSide = 1.5
	att.Mult_Range = 0.75
	att.Mult_ShootVol = 1.15

	att.Hook_Compatible = function(wep)
	    if wep.Primary.Ammo ~= "pistol" or wep.Damage > 35 or wep:GetBuff_Override("Silencer") then return false end
	end

	--att.Override_Jamming = true
	--att.Override_HeatLockout = true
	--[[]
	att.O_Hook_Override_HeatDelayTime = function(wep, data)
	    local cfm = wep:GetCurrentFiremode()
	    local t = 1
	    if cfm.Mode == 1 then
	        mult = 1.5
	    elseif cfm.Mode < 0 then
	        mult = (cfm.PostBurstDelay or 0.1) * 10
	    end
	    data.current = t
	end
	]]
	--[[]
	att.Override_HeatDelayTime = 0.75
	att.O_Hook_Override_HeatDissipation = function(wep, data)
	    data.current = (wep.RegularClipSize or wep.Primary.ClipSize) * (wep:GetReloading() and 0.25 or 1) * (wep:GetHeatLocked() and 0.25 or 0.75)
	end
	att.O_Hook_Override_HeatCapacity = function(wep, data)
	    data.current = (wep.RegularClipSize or wep.Primary.ClipSize) * 0.6
	end
	att.Hook_Overheat = function(wep, heat)
	    wep:EmitSound("physics/metal/metal_barrel_impact_hard6.wav", 90, 150)
	    wep:EmitSound("physics/metal/metal_box_break1.wav", 80, 130, 0.5)
	end

	att.Hook_Compatible = function(wep)
	    if wep.Jamming or (wep:GetBuff_Override("Override_ManualAction") or wep.ManualAction) or wep:GetIsShotgun() then return false end
	end
	]]
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ammo_match.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ammo_match")

	att.PrintName = "Match Rounds"
	att.Icon = Material("entities/acwatt_go_ammo_match.png", "mips smooth")
	att.Description = "Precision-tooled rounds with extra powder which significantly improve weapon accuracy and range, at the cost of recoil and close-range damage."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo"


	att.Mult_AccuracyMOA = 0.6
	att.Mult_Recoil = 1.15
	att.Mult_Damage = 0.85
	att.Mult_Range = 1.5

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

