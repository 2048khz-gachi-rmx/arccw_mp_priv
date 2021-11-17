local Material = ArcCW.AttachmentMat

------
-- mifl_fas2_ubw_gp25.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ubw_gp25")

	att.PrintName = "Kastet (40mm)"
	att.Icon = Material("entities/arccw_mifl_fas2_ubw_kastet.png")
	att.Description = "Soviet explosive ordnance launcher. Has more AOE damage compare to its NATO counterpart."
	att.Desc_Pros = {
	    "Selectable underbarrel grenade launcher",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "Double tap +ZOOM to equip/dequip",
	}
	att.AutoStats = true
	att.Slot = {"ubgl"}

	att.LHIK = true
	att.LHIK_Animation = true

	att.MountPositionOverride = 0

	att.Model = "models/weapons/arccw/mifl_atts/fas2/ubgl_kastet.mdl"

	att.ModelOffset = Vector(5.5, 0, 0.25)

	att.UBGL = true

	att.UBGL_PrintName = "UB (40mm)"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_m3"
	att.UBGL_ClipSize = 1
	att.UBGL_Ammo = "smg1_grenade"
	att.UBGL_RPM = 120
	att.UBGL_Recoil = 3
	att.UBGL_Capacity = 1

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("smg1_grenade")
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
	    wep:DoLHIKAnimation("in", 25/60)
	    wep:PlaySoundTable({
	        {s = "Arccw_FAS2_Generic.Cloth_Movement" ,		t = 0},
	    })
	end

	att.Hook_OnDeselectUBGL = function(wep)
	    wep:DoLHIKAnimation("out", 25/60)
	    wep:PlaySoundTable({
	        {s = "Arccw_FAS2_Generic.Cloth_Movement" ,		t = 0},
	    })
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    wep:DoLHIKAnimation("fire", 10/60)

	    wep:FireRocket("arccw_mifl_fas2_gp25", 21000)

	    wep:EmitSound("weapons/arccw_mifl/fas2/explosive_m79/m79_fire1.wav", 100)

	    wep:SetClip2(wep:Clip2() - 1)

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    if wep:Clip2() >= 1 then return end

	    if wep:Clip2() == 0 then

	        wep:DoLHIKAnimation("reload", 90/60)

	        wep:SetNextSecondaryFire(CurTime() + 90/60)

	        wep:PlaySoundTable({
	            {s = "Arccw_FAS2_Generic.Cloth_Movement" ,		t = 0},
	            {s = "weapons/arccw_mifl/fas2/famas/famas_magin.wav", t = 50/60},
	            {s = "Arccw_FAS2_Generic.Cloth_Movement" ,		t = 80/60},
	        })
	    end

	    local reserve = Ammo(wep)

	    reserve = reserve + wep:Clip2()

	    local clip = 1

	    local load = math.Clamp(clip, 0, reserve)

	    wep.Owner:SetAmmo(reserve - load, "smg1_grenade")

	    wep:SetClip2(load)
	end


	att.Mult_SightTime = 1.1
	att.Mult_SpeedMult = 0.95
	att.Mult_SightedSpeedMult = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ubw_m203.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ubw_m203")

	att.PrintName = "M203 (40mm)"
	att.Icon = Material("entities/arccw_mifl_fas2_ubw_m203.png")
	att.Description = "Explosive ordnance launcher."
	att.Desc_Pros = {
	    "Selectable underbarrel grenade launcher",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "Double tap +ZOOM to equip/dequip",
	}
	att.AutoStats = true
	att.Slot = {"ubgl"}

	att.LHIK = true
	att.LHIK_Animation = true

	att.MountPositionOverride = 0

	att.Model = "models/weapons/arccw/mifl_atts/fas2/ubgl_m203.mdl"

	att.ModelOffset = Vector(5.5, 0, 0.25)

	att.UBGL = true

	att.UBGL_PrintName = "UB (40mm)"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_m3"
	att.UBGL_ClipSize = 1
	att.UBGL_Ammo = "smg1_grenade"
	att.UBGL_RPM = 120
	att.UBGL_Recoil = 3
	att.UBGL_Capacity = 1

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("smg1_grenade")
	end

	att.Hook_LHIK_TranslateAnimation = function(wep, key)
	    if key == "idle" then
	        if wep:GetInUBGL() then
	            return "pose"
	        else
	            return "idle"
	        end
	    end
	end

	att.Hook_OnSelectUBGL = function(wep)
	    wep:DoLHIKAnimation("in", 25/60)
	    wep:PlaySoundTable({
	        {s = "Arccw_FAS2_Generic.Cloth_Movement" ,		t = 0},
	    })
	end

	att.Hook_OnDeselectUBGL = function(wep)
	    wep:DoLHIKAnimation("out", 25/60)
	    wep:PlaySoundTable({
	        {s = "Arccw_FAS2_Generic.Cloth_Movement" ,		t = 0},
	    })
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    wep:DoLHIKAnimation("fire", 10/60)

	    wep:FireRocket("arccw_mifl_fas2_m203", 30000)

	    wep:EmitSound("weapons/arccw_mifl/fas2/explosive_m79/m79_fire1.wav", 100)

	    wep:SetClip2(wep:Clip2() - 1)

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    if wep:Clip2() >= 1 then return end

	    if wep:Clip2() == 0 then

	        wep:DoLHIKAnimation("reload", 130/60)

	        wep:SetNextSecondaryFire(CurTime() + 130/60)

	        wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/famas/famas_magout_empty.wav", t = 17/60},
	            {s = "weapons/arccw_mifl/fas2/famas/famas_magin.wav", t = 67/60},
	            {s = "weapons/arccw_mifl/fas2/g3/g3_magin.wav",		t = 102/60},
	        })
	    end

	    local reserve = Ammo(wep)

	    reserve = reserve + wep:Clip2()

	    local clip = 1

	    local load = math.Clamp(clip, 0, reserve)

	    wep.Owner:SetAmmo(reserve - load, "smg1_grenade")

	    wep:SetClip2(load)
	end

	att.Mult_SightTime = 1.15
	att.Mult_SpeedMult = 0.9
	att.Mult_SightedSpeedMult = 0.92
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ubw_mass26.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ubw_mass26")

	att.PrintName = "MASS-26 (BUCK)"
	att.Icon = Material("entities/arccw_mifl_fas2_ubw_mass26.png")
	att.Description = "Magazine-fed pump-action 12 gauge underbarrel shotgun."
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

	att.Model = "models/weapons/arccw/mifl_atts/fas2/ubgl_mass26.mdl"

	att.ModelOffset = Vector(3.2, 0, -2)

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
		wep:DoLHIKAnimation("in", 0.5)
	    wep:PlaySoundTable({
	        {s = "Arccw_FAS2_Generic.Cloth_Movement" ,		t = 0},
	    })
	end

	att.Hook_OnDeselectUBGL = function(wep)
		wep:DoLHIKAnimation("out", 0.7)
	    wep:PlaySoundTable({
	        {s = "Arccw_FAS2_Generic.Cloth_Movement" ,		t = 0},
	        {s = "weapons/arccw_mifl/fas2/m3s90/m3s90_Boltcatch.wav",		t = 0.3},
	        {s = "Arccw_FAS2_Generic.Cloth_Movement" ,		t = 0.4},
	    })
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end
		
	    wep.Owner:FireBullets({
	        Src = wep.Owner:EyePos(),
	        Num = 12,
	        Damage = 21,
	        Force = 1.5,
	        Attacker = wep.Owner,
	        Dir = wep.Owner:EyeAngles():Forward(),
	        Spread = Vector(0.075, 0.075, 0.075),
	        Callback = function(_, tr, dmg)
	            local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

	            local dmgmax = 21
	            local dmgmin = 2

	            local delta = dist / 42

	            delta = math.Clamp(delta, 0, 1)

	            local amt = Lerp(delta, dmgmax, dmgmin)

	            dmg:SetDamage(amt)
	        end
	    })

	    wep:EmitSound("weapons/arccw_mifl/fas2_custom/mass/fire.wav", 120)

	    wep:SetClip2(wep:Clip2() - 1)

	    if wep:Clip2() > 0 then
	        wep:DoLHIKAnimation("fire", 80/60)
	        wep:SetNextSecondaryFire( CurTime() + (60 / 60) )
	        wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/sg55x/sg550_magout.wav",			t = 0.1},
	            {s = "weapons/arccw_mifl/fas2_custom/mass/pump.wav",		t = 0.45},
	            {s = "weapons/arccw_mifl/fas2/handling/generic_magpouch1.wav",		t = 0.9},
	        })
	    end

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    local clip = 4 + 1
		
	    if wep:Clip2() >= clip then return end
	    if Ammo(wep) <= 0 then return end

	    if wep:Clip2() == 0 then

	        wep:DoLHIKAnimation("dry", 150/60)

	        wep:SetNextSecondaryFire(CurTime() + 150/60)

	        wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/famas/famas_magout_empty.wav", t = 0.25},
	            {s = "weapons/arccw_mifl/fas2/famas/famas_magin.wav", t = 1.05},
				{s = "weapons/arccw_mifl/fas2/sg55x/sg550_magout.wav",			t = 1.2 + 0.1},
				{s = "weapons/arccw_mifl/fas2_custom/mass/pump.wav",		t = 1.2 + 0.45},
				{s = "weapons/arccw_mifl/fas2/handling/generic_magpouch1.wav",		t = 1.2 + 0.9},
	        })

	    else

	        wep:DoLHIKAnimation("wet", 113/60)

	        wep:SetNextSecondaryFire(CurTime() + 113/60)

	        wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/famas/famas_magout.wav", t = 0.25},
	            {s = "weapons/arccw_mifl/fas2/famas/famas_magin.wav", t = 1.05},
	        })

	    end

	    local reserve = Ammo(wep)

	    reserve = reserve + wep:Clip2()

	    local load = math.Clamp(clip, 0, reserve)

	    wep.Owner:SetAmmo(reserve - load, "buckshot")

	    wep:SetClip2(load)
	end

	att.Mult_SightTime = 1.15
	att.Mult_SpeedMult = 0.9
	att.Mult_SightedSpeedMult = 0.92
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_uni_rif_nostock.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_uni_rif_nostock")

	att.PrintName = "No Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_no_grip.png", "mips smooth")
	---att.Description = "Removing the stock decreases controllability but increases speed significantly."
	att.Description = "Sometimes you just need a little less stock."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_uni_stock"
	att.ActivateElements = {"mifl_fas2_sg55x_stock_sd"}
	att.Free = true

	att.Mult_Recoil = 1.8
	att.Mult_RecoilSide = 1.5
	att.Mult_SightTime = 0.75
	att.Mult_DrawTime = 0.75
	att.Mult_HolsterTime = 0.75

	att.Mult_SightedSpeedMult = 1.5
	att.Mult_MoveSpeed = 1.25
	ArcCW.LoadAttachmentType(att)
end

