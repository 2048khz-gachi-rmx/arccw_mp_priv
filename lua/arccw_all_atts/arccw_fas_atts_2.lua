local Material = ArcCW.AttachmentMat

------
-- mifl_fas2_akimbo_m79_alt.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_akimbo_m79_alt")

	att.PrintName = "M79 Pirate Gun (Alt.)"
	att.Icon = Material("entities/arccw_mifl_fas2_akimbo_m79.png", "smooth")
	att.Description = "Sawn off M79 grenade launcher for one-hand use. A pirate accent is required when using this.\n\nThis variant will fire whatever projectile the main weapon uses."
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

	att.Hook_Compatible = function(wep, slot)
	    if wep:GetClass() != "arccw_mifl_fas2_m79" then return false end
	end

	att.InvAtt = "mifl_fas2_akimbo_m79"

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
	    return wep:GetClass() == "arccw_mifl_fas2_m79" and wep:GetBuff("Ammo") or "smg1_grenade"
	end

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount(AmmoType(wep))
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() < (wep:GetClass() == "arccw_mifl_fas2_m79" and wep:GetCapacity() or 1) then return end

	    local proj = "arccw_gl_m79_he"
	    if wep:GetClass() == "arccw_mifl_fas2_m79" then proj = wep:GetBuff("ShootEntity", true) end
	    if proj then
	        wep:FireRocket(proj, 1500 * ArcCW.HUToM)
	        if AmmoType(wep) == "AR2AltFire" then
	            wep:EmitSound("weapons/irifle/irifle_fire2.wav", 110, 100 * math.Rand(1 - 0.05, 1 + 0.05))
	        else
	            wep:EmitSound("weapons/arccw_mifl/fas2/explosive_m79/m79_fire1.wav", 110, 100 * math.Rand(1 - 0.05, 1 + 0.05))
	        end
	        wep:PlaySoundTable({
	                {s = "weapons/arccw_mifl/fas2/explosive_m79/m79_distance_fire1.wav", t = 0},
	        })
	    else
	        local ammo = AmmoType(wep)
	        local tbl = {}
	        if ammo == "pistol" then
	            tbl = {
	                Src = wep.Owner:EyePos(),
	                Num = 18,
	                Damage = 10,
	                Force = 2,
	                Attacker = wep.Owner,
	                Dir = wep.Owner:EyeAngles():Forward(),
	                Spread = Vector(80 * ArcCW.MOAToAcc, 80 * ArcCW.MOAToAcc, 80 * ArcCW.MOAToAcc),
	                Callback = function(_, tr, dmg)
	                    local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

	                    local dmgmax = 10
	                    local dmgmin = 0.5

	                    local delta = dist / 60

	                    delta = math.Clamp(delta, 0, 1)

	                    local amt = Lerp(delta, dmgmax, dmgmin)

	                    dmg:SetDamage(amt)
	                end
	            }
	        elseif ammo == "buckshot" then
	            tbl = {
	                Src = wep.Owner:EyePos(),
	                Num = 30,
	                Damage = 10,
	                Force = 2,
	                Attacker = wep.Owner,
	                Dir = wep.Owner:EyeAngles():Forward(),
	                Spread = Vector(200 * ArcCW.MOAToAcc, 200 * ArcCW.MOAToAcc, 200 * ArcCW.MOAToAcc),
	                Callback = function(_, tr, dmg)
	                    local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

	                    local dmgmax = 10
	                    local dmgmin = 1

	                    local delta = dist / 30

	                    delta = math.Clamp(delta, 0, 1)

	                    local amt = Lerp(delta, dmgmax, dmgmin)

	                    dmg:SetDamage(amt)
	                end
	            }
	        end
	        wep:GetOwner():FireBullets(tbl)
	        wep:EmitSound("weapons/arccw_mifl/fas2/ks23/ks23_fire1.wav", 110, 100 * math.Rand(1 - 0.05, 1 + 0.05))
	        wep:PlaySoundTable({
	                {s = "weapons/arccw_mifl/fas2/explosive_m79/m79_distance_fire1.wav", t = 0},
	        })
	    end

	    wep:SetClip2(0)

	    wep:DoLHIKAnimation("fire", 25 / 60)

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    wep:Reload()

	    local clip = wep:GetClass() == "arccw_mifl_fas2_m79" and wep:GetCapacity() or 1

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

------
-- mifl_fas2_akimbo_mp5k.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_akimbo_mp5k")

	att.PrintName = "MP5K"
	att.Icon = Material("entities/arccw_mifl_fas2_akimbo_mp5k.png", "smooth")
	att.Description = "Oh, aren't you a big fella? Straight out of Hollywood."
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
	att.ModelOffset = Vector(0.2, -0.8, 0)

	att.GivesFlags = {"handlocked"}

	att.ModelScale = Vector(1, 1, 1)

	att.SortOrder = 700 + 21

	att.AddSuffix = " + MP5K"

	att.MountPositionOverride = 0
	att.Override_NoHideLeftHandInCustomization = true

	att.Model = "models/weapons/arccw/mifl_atts/fas2/c_mp5k.mdl"

	att.LHIK = true
	att.LHIK_Animation = true
	att.LHIK_MovementMult = 0

	att.UBGL = true

	att.UBGL_PrintName = "AKIMBO"
	att.UBGL_Automatic = true
	att.UBGL_MuzzleEffect = "muzzleflash_mp5"
	att.UBGL_ClipSize = 30
	att.UBGL_Ammo = "pistol"
	att.UBGL_RPM = 900
	att.UBGL_Recoil = 1.5939*0.65
	att.UBGL_RecoilSide = 0.1035*0.5
	att.UBGL_RecoilRise = 0.92
	att.UBGL_Capacity = 30
	att.Mult_MoveDispersion = 0.8625*0.75

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
	    --[[elseif wep:GetOwner():KeyPressed(IN_ATTACK2) then
	        wep:SetInUBGL(true)
	        wep:ShootUBGL()]]
	    end
	end

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("pistol") -- att.UBGL_Ammo
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    -- this bitch
	    local fixedcone = wep:GetDispersion() / 110 / 60

	    wep.Owner:FireBullets({
			Src = wep.Owner:EyePos(),
			Num = 1,
			Damage = 21,
			Force = 1,
			Attacker = wep.Owner,
			Dir = wep.Owner:EyeAngles():Forward(),
			Spread = Vector(fixedcone, fixedcone, 0),
			Callback = function(_, tr, dmg)
				local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

				local dmgmax = 21
				local dmgmin = 12

				local delta = dist / 40

				delta = math.Clamp(delta, 0, 1)

				local amt = Lerp(delta, dmgmax, dmgmin)

				dmg:SetDamage(amt)
			end
		})
	    wep:EmitSound("weapons/arccw_mifl/fas2/mp5/mp5_fire1.wav", 110, 100 * math.Rand(1 - 0.05, 1 + 0.05))
	                            -- This is kinda important
	                                            -- Wep volume
	                                                    -- Weapon pitch (along with the pitch randomizer)
	    wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/mp5/mp5_distance_fire1.wav",			t = 0},
		})													
	    wep:SetClip2(wep:Clip2() - 1)
	    
	    if wep:Clip2() > 0 then
	        wep:DoLHIKAnimation("fire", 30/60)
	    end

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    wep:Reload()

	    local clip = 30 + 1

	    if wep:Clip2() >= clip then return end -- att.UBGL_Capacity

	    if Ammo(wep) <= 0 then return end

	    if wep:Clip2() <= 0 then
	        wep:DoLHIKAnimation("dry", 150/60)
	        wep:SetNextSecondaryFire(CurTime() + 150/60)
	        wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/mp5/mp5_magout_empty.wav", 	t = 11/60},
	            {s = "weapons/arccw_mifl/fas2/mp5/mp5_magin.wav", 	    	t = 65/60},
	            {s = "weapons/arccw_mifl/fas2/mp5/mp5_boltpull.wav", 	t = 85/60},		
	        })
	    else
	        wep:DoLHIKAnimation("wet", 130/60)
	        wep:SetNextSecondaryFire(CurTime() + 130/60)
	        wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/mp5/mp5_magout_empty.wav", 	t = 11/60},
	            {s = "weapons/arccw_mifl/fas2/mp5/mp5_magin.wav", 	    	t = 65/60},
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
-- mifl_fas2_akimbo_mp5k_test.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_akimbo_mp5k_test")

	att.PrintName = "MP5K (test)"
	att.Icon = Material("entities/arccw_mifl_fas2_akimbo_mp5k.png", "smooth")
	att.Description = "the most gamer of them all"
	att.Ignore = true
	att.Desc_Pros = {
	    "pro.fas2.akimbo",
	}
	att.Desc_Cons = {
	    "con.fas2.akimbo"
	}
	att.AutoStats = true
	att.Mult_HipDispersion = 1.5
	att.Slot = "mifl_fas2_akimbo"
	att.NotForNPCs = true
	att.ModelOffset = Vector(0.2, -0.8, 0)

	att.GivesFlags = {"handlocked"}

	att.ModelScale = Vector(1, 1, 1)

	att.SortOrder = 700 + 21

	att.AddSuffix = " + MP5K"

	att.MountPositionOverride = 0
	att.Override_NoHideLeftHandInCustomization = true

	att.Model = "models/weapons/arccw/mifl_atts/fas2/c_mp5k.mdl"

	att.LHIK = true
	att.LHIK_Animation = true
	att.LHIK_MovementMult = 0

	att.Akimbo = true
	att.Akimbo_PrintName = "MP5K"
	att.Akimbo_TrueName = "MP5K"
	att.Akimbo_Automatic = true
	att.Akimbo_MuzzleEffect = "muzzleflash_mp5"
	att.Akimbo_ClipSize = 30
	att.Akimbo_Ammo = "pistol"
	att.Akimbo_RPM = 900
	att.Akimbo_Recoil = 0.3
	att.Akimbo_RecoilSide = 0.3
	att.Akimbo_RecoilRise = 0.92
	att.Akimbo_Capacity = 30
	att.Akimbo_AccuracyMOA = 15
	att.Akimbo_ShootSound = "weapons/arccw_mifl/fas2/mp5/mp5_fire1.wav"
	att.Akimbo_ShootSoundVol = 110
	att.Akimbo_DistantShootSound = "weapons/arccw_mifl/fas2/mp5/mp5_distance_fire1.wav"

	att.Akimbo_Animations = {
	    ["reload"] = {
	        Source = "wet",
	        Time = 130 / 60,
	        SoundTable = {
	            {s = "weapons/arccw_mifl/fas2/mp5/mp5_magout_empty.wav", 	t = 11 / 60},
	            {s = "weapons/arccw_mifl/fas2/mp5/mp5_magin.wav", 	    	t = 65 / 60},
	        }
	    },
	    ["reload_empty"] = {
	        Source = "dry",
	        Time = 150 / 60,
	        SoundTable = {
	            {s = "weapons/arccw_mifl/fas2/mp5/mp5_magout_empty.wav", 	t = 11 / 60},
	            {s = "weapons/arccw_mifl/fas2/mp5/mp5_magin.wav", 	    	t = 65 / 60},
	            {s = "weapons/arccw_mifl/fas2/mp5/mp5_boltpull.wav", 	    t = 85 / 60},
	        }
	    },
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_akimbo_p226.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_akimbo_p226")

	att.PrintName = "P226"
	att.Icon = Material("entities/arccw_mifl_fas2_akimbo_p226.png", "smooth")
	att.Description = "Widely use pistol. So widely used that it is useable on both hands."
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

	att.SortOrder = 700 + 25

	att.AddSuffix = " + P226"

	att.MountPositionOverride = 0
	att.Override_NoHideLeftHandInCustomization = true

	att.Model = "models/weapons/arccw/mifl_atts/fas2/c_p226.mdl"

	att.LHIK = true
	att.LHIK_Animation = true
	att.LHIK_MovementMult = 0

	att.UBGL = true

	att.UBGL_PrintName = "AKIMBO"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_pistol"
	att.UBGL_ClipSize = 13
	att.UBGL_Ammo = "pistol"
	att.UBGL_RPM = 600
	att.UBGL_Recoil = .6
	att.UBGL_RecoilSide = .8
	att.UBGL_RecoilRise = .8
	att.UBGL_Capacity = 13

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
			Damage = 25,
			Force = 1,
			Attacker = wep.Owner,
			Dir = wep.Owner:EyeAngles():Forward(),
			Spread = Vector(fixedcone, fixedcone, 0),
			Callback = function(_, tr, dmg)
				local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

				local dmgmax = 25
				local dmgmin = 18

				local delta = dist / 40

				delta = math.Clamp(delta, 0, 1)

				local amt = Lerp(delta, dmgmax, dmgmin)

				dmg:SetDamage(amt)
			end
		})
	    wep:EmitSound("weapons/arccw_mifl/fas2/p226/p226_fire1.wav", 110, 100 * math.Rand(1 - 0.05, 1 + 0.05))
	                            -- This is kinda important
	                                            -- Wep volume
	                                                    -- Weapon pitch (along with the pitch randomizer)
	    wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/p226/p226_distance_fire1.wav",			t = 0},
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

	    local clip = 13 + 1

	    if wep:Clip2() >= clip then return end -- att.UBGL_Capacity

	    if Ammo(wep) <= 0 then return end

	    if wep:Clip2() <= 0 then
	        wep:DoLHIKAnimation("dry", 120/60)
	        wep:SetNextSecondaryFire(CurTime() + 120/60)
	        wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/p226/p226_magout_empty.wav", 	t = 18/60},
	            {s = "weapons/arccw_mifl/fas2/p226/p226_magin.wav", 	    t = 60/60},
	            {s = "weapons/arccw_mifl/fas2/p226/p226_sliderelease.wav", 	t = 96/60},
	        })
	    else
	        wep:DoLHIKAnimation("wet", 105/60)
	        wep:SetNextSecondaryFire(CurTime() + 105/60)
	        wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/p226/p226_magout_empty.wav", 	t = 18/60},
	            {s = "weapons/arccw_mifl/fas2/p226/p226_magin.wav", 	    t = 60/60},
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
-- mifl_fas2_akimbo_ragbul.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_akimbo_ragbul")

	att.PrintName = "Raging Bull"
	att.Icon = Material("entities/arccw_mifl_fas2_akimbo_ragbul.png", "smooth")
	att.Description = "Strong grip you got there mate. Only for the most ambidestrous of desperados."
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
	att.ModelOffset = Vector(1.2, -0.5, 0)

	att.GivesFlags = {"handlocked"}

	att.ModelScale = Vector(1, 1, 1)

	att.SortOrder = 700 + 120

	att.AddSuffix = " + Raging Bull"
	att.Override_NoHideLeftHandInCustomization = true

	att.MountPositionOverride = 0

	att.Model = "models/weapons/arccw/mifl_atts/fas2/c_revolver.mdl"

	att.LHIK = true
	att.LHIK_Animation = true
	att.LHIK_MovementMult = 0

	att.UBGL = true

	att.UBGL_PrintName = "AKIMBO"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_pistol"
	att.UBGL_ClipSize = 5
	att.UBGL_Ammo = "357"
	att.UBGL_RPM = 350
	att.UBGL_Recoil = 1.8
	att.UBGL_RecoilSide = 1.2
	att.UBGL_RecoilRise = 0.4
	att.UBGL_Capacity = 5

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

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("357") -- att.UBGL_Ammo
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    -- this bitch
	    local fixedcone = wep:GetDispersion() / 180 / 60

	    wep.Owner:FireBullets({
			Src = wep.Owner:EyePos(),
			Num = 1,
			Damage = 120,
			Force = 1,
			Attacker = wep.Owner,
			Dir = wep.Owner:EyeAngles():Forward(),
			Spread = Vector(fixedcone, fixedcone, 0),
			Callback = function(_, tr, dmg)
				local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

				local dmgmax = 120
				local dmgmin = 49

				local delta = dist / 30

				delta = math.Clamp(delta, 0, 1)

				local amt = Lerp(delta, dmgmax, dmgmin)

				dmg:SetDamage(amt)
			end
		})
	    wep:EmitSound("weapons/arccw_mifl/fas2/ragingbull/ragingbull_fire1.wav", 110, 100 * math.Rand(1 - 0.05, 1 + 0.05))
	                            -- This is kinda important
	                                            -- Wep volume
	                                                    -- Weapon pitch (along with the pitch randomizer)
	    wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/ragingbull/ragingbull_distance_fire1.wav",			t = 0},
		})														
	    wep:SetClip2(wep:Clip2() - 1)
	    
	    if wep:Clip2() > 0 then
	        wep:DoLHIKAnimation("fire", 30/60)
	    end

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    wep:Reload()

	    local clip = 5

	    if wep:Clip2() >= clip then return end -- att.UBGL_Capacity

	    if Ammo(wep) <= 0 then return end

	    if wep:Clip2() <= 0 then
	        wep:DoLHIKAnimation("dry", 150/60)
	        wep:SetNextSecondaryFire(CurTime() + 150/60)
	        wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2_custom/revolver/revolver_open_chamber.wav", 			t = 15/60},			
	            {s = "weapons/arccw_mifl/fas2_custom/revolver/revolver_dump_rounds_01.wav", 	t = 49/60},
	            {s = "weapons/arccw_mifl/fas2_custom/revolver/revolver_speed_loader_insert_01.wav", 	t = 80/60},
	            {s = "weapons/arccw_mifl/fas2_custom/revolver/revolver_close_chamber.wav", 	t = 116/60},			
	        })
		else 
	        wep:DoLHIKAnimation("dry", 150/60)
	        wep:SetNextSecondaryFire(CurTime() + 150/60)
	        wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2_custom/revolver/revolver_open_chamber.wav", 			t = 15/60},			
	            {s = "weapons/arccw_mifl/fas2_custom/revolver/revolver_dump_rounds_01.wav", 	t = 49/60},
	            {s = "weapons/arccw_mifl/fas2_custom/revolver/revolver_speed_loader_insert_01.wav", 	t = 80/60},
	            {s = "weapons/arccw_mifl/fas2_custom/revolver/revolver_close_chamber.wav", 	t = 116/60},			
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
-- mifl_fas2_deagle_mag_357_12.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_deagle_mag_357_12")

	att.PrintName = "12-Round .357 Magnum"
	att.Icon = Material("entities/arccw_mifl_fas2_deagle_mag_357.png", "mips smooth")
	att.Description = "Extended magazine for the .357 caliber option."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 3
	att.AutoStats = true
	att.Slot = {"mifl_fas2_deagle_mag"}

	att.Override_ClipSize = 12
	att.Mult_ReloadTime = 1.15
	att.Mult_SightTime = 1.2

	att.Mult_Recoil = 0.6
	att.Mult_Damage = 0.8
	att.Mult_DamageMin = 0.8
	att.Mult_RPM = 1.2

	att.Mult_ShootPitch = 1.1

	--att.Override_ShellModel = "models/shells/shell_9mm.mdl"

	att.Override_Trivia_Calibre = ".357 Magnum"
	att.AddSuffix = " .357"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2_custom/deagle/357.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_deagle_mag_357_9.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_deagle_mag_357_9")

	att.PrintName = "9-Round .357 Magnum"
	att.Icon = Material("entities/arccw_mifl_fas2_deagle_mag_357.png", "mips smooth")
	att.Description = "Alternative caliber option with much less recoil and damage."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 3.5
	att.AutoStats = true
	att.Slot = {"mifl_fas2_deagle_mag"}

	att.Override_ClipSize = 9

	att.Mult_Recoil = 0.6
	att.Mult_Damage = 0.8
	att.Mult_DamageMin = 0.8
	att.Mult_RPM = 1.2

	att.Mult_ShootPitch = 1.1

	--att.Override_ShellModel = "models/shells/shell_9mm.mdl"

	att.Override_Trivia_Calibre = ".357 Magnum"
	att.AddSuffix = " .357"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2_custom/deagle/357.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_deagle_mag_44_11.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_deagle_mag_44_11")

	att.PrintName = "11-Round .44 Magnum"
	att.Icon = Material("entities/arccw_mifl_fas2_deagle_mag_44.png", "mips smooth")
	att.Description = "Extended magazine for the .44 caliber option."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 5
	att.AutoStats = true
	att.Slot = {"mifl_fas2_deagle_mag"}

	att.Override_ClipSize = 11
	att.Mult_ReloadTime = 1.15
	att.Mult_SightTime = 1.2

	att.Mult_Recoil = 0.8
	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 0.9
	att.Mult_RPM = 1.1

	att.Mult_ShootPitch = 0.8


	--att.Override_ShellModel = "models/shells/shell_9mm.mdl"

	att.Override_Trivia_Calibre = ".44 Magnum"
	att.AddSuffix = " .44"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2_custom/deagle/44.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_deagle_mag_44_8.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_deagle_mag_44_8")

	att.PrintName = "8-Round .44 Magnum"
	att.Icon = Material("entities/arccw_mifl_fas2_deagle_mag_44.png", "mips smooth")
	att.Description = "Alternative caliber option with less recoil and damage."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 5.5
	att.AutoStats = true
	att.Slot = {"mifl_fas2_deagle_mag"}

	att.Override_ClipSize = 8

	att.Mult_Recoil = 0.8
	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 0.9
	att.Mult_RPM = 1.1

	att.Mult_ShootPitch = 0.8


	--att.Override_ShellModel = "models/shells/shell_9mm.mdl"

	att.Override_Trivia_Calibre = ".44 Magnum"
	att.AddSuffix = " .44"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2_custom/deagle/44.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_deagle_mag_9_18.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_deagle_mag_9_18")

	att.PrintName = "18-Round 9mm"
	att.Icon = Material("entities/arccw_mifl_fas2_g20_8.png", "mips smooth")
	att.Description = "What if you want the intimidating look of the .50 pistol but the reliability and ease of use of a double-stack 9mm pistol? Well... this. It ain't pretty."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 1
	att.AutoStats = true
	att.Slot = {"mifl_fas2_deagle_mag"}

	att.Override_ClipSize = 18

	att.Mult_Penetration = 0.5
	att.Mult_Recoil = 0.2
	att.Mult_RPM = 2
	att.Mult_Damage = 0.3
	att.Mult_DamageMin = 0.5
	att.Mult_ShootPitch = 1.2
	att.Mult_ShootVol = 0.8

	att.Override_ShellModel = "models/shells/shell_9mm.mdl"

	att.Override_Ammo = "pistol"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"
	att.AddSuffix = " 9mm"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2_custom/deagle/9.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2/p226/p226_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_deagle_slide_2x.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_deagle_slide_2x")

	att.PrintName = "Double Slide"
	att.Icon = Material("entities/arccw_mifl_fas2_deagle_slide_2x.png", "mips smooth")
	att.Description = "Twice the barrel for twice the fun. Tremendously harm the gun's performace."
	att.Desc_Pros = {
	    "pro.fas2.double_barrel"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 1
	att.AutoStats = true
	att.Slot = {"mifl_fas2_deagle_slide"}

	att.Mult_Damage = 2
	att.Mult_DamageMin = 2
	att.Mult_Recoil = 2.5
	att.Mult_RecoilSide = 1.7
	att.Mult_VisualRecoilMult = 1.8
	att.Mult_SightTime = 1.35
	att.Mult_AccuracyMOA = 2
	att.Mult_DrawTime = 1.5
	att.Mult_HipDispersion = 1.5
	att.Mult_RPM = 0.75

	att.Mult_ShootPitch = 0.7

	att.Override_Num = 2
	att.Override_AmmoPerShot = 2
	att.Override_ChamberSize = 2

	att.Override_ClipSize = 14
	att.Override_ClipSize_Priority = 0.1
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_deagle_slide_c.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_deagle_slide_c")

	att.PrintName = "Compact Slide"
	att.Icon = Material("entities/arccw_mifl_fas2_deagle_slide_s.png", "mips smooth")
	att.Description = "Adorable snub slide and receiver for improved handling but more wrist-breaking recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 0.5
	att.AutoStats = true

	att.Slot = {"mifl_fas2_deagle_slide"}

	att.Mult_Range = 0.75
	att.Mult_SightTime = 0.75
	att.Mult_DrawTime = 0.75
	att.Mult_Recoil = 1.25

	att.Mult_RPM = 1.15

	att.Add_BarrelLength = -1
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_deagle_slide_l.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_deagle_slide_l")

	att.PrintName = "Marksman Slide"
	att.Icon = Material("entities/arccw_mifl_fas2_deagle_slide_l.png", "mips smooth")
	att.Description = "Very lengthy barrel for long range shooting. Even more cumbersome than the regular slide."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 12
	att.AutoStats = true

	att.Slot = {"mifl_fas2_deagle_slide"}

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
-- mifl_fas2_deagle_slide_r.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_deagle_slide_r")

	att.PrintName = "Raptor Slide"
	att.Icon = Material("entities/arccw_mifl_fas2_deagle_slide_r.png", "mips smooth")
	att.Description = "Vented slide, foregrip and compensator allows this magnum pistol to fire controllably in a relatively fast three-round burst."
	att.SortOrder = 5
	att.AutoStats = true
	att.Slot = "mifl_fas2_deagle_slide"

	att.Mult_SightTime = 1.15
	att.Mult_HipDispersion = 1.25

	att.Add_BarrelLength = 4

	att.Mult_Recoil = 0.8
	att.Mult_RecoilSide = 0.8
	att.Mult_VisualRecoilMult = 1.2

	att.ModelOffset = Vector(0.2, -0.1, -2.2)

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2_raptor_glock.mdl"

	att.Mult_ShootPitch = 0.95

	att.Override_Firemodes = {
	    {
	        Mode = -3,
	        RunawayBurst = true,
	        PostBurstDelay = 0.35,
	        Mult_RPM = 1.75,
	    },
	    {
	        Mode = 1,
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_famas_barrel_commando.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_famas_barrel_commando")

	att.PrintName = "Commando Frame"
	att.Icon = Material("entities/arccw_mifl_fas2_famas_hg_kurz.png", "mips smooth")
	att.Description = "Shorter barrel for the FAMAS intended for CQB use. Fires faster, but range and recoil control is much worse."
	att.SortOrder = 6
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
		"con.fas2.ubgl",
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_famas_hg"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.75
	att.Mult_AccuracyMOA = 2
	att.Mult_RPM = 1.2

	att.Add_BarrelLength = -8

	att.Mult_HipDispersion = 0.9

	att.Mult_ShootPitch = 1.3

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_sd.mdl"

	att.ModelOffset = Vector(0, 0.5, 0)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_famas_barrel_felin.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_famas_barrel_felin")

	att.PrintName = "La Valorisée"
	att.Icon = Material("entities/arccw_mifl_fas2_famas_hg_felin.png", "mips smooth")
	att.Description = "Compact frame but longer barrel for the FAMAS, promptly ruining the point of a bullpup but adding more range."
	att.SortOrder = 10
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_famas_hg"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 1.75
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.5
	att.Mult_AccuracyMOA = 0.75

	att.Mult_ShootPitch = 0.95

	att.Add_BarrelLength = 4

	att.Override_Firemodes = {
	    {
	        Mode = 2,
	    },
	    {
	        Mode = -3,
	        RunawayBurst = true,
	        Mult_Recoil = 0.95,
	        PostBurstDelay = 0.08,
	        Mult_RPM = 2,
	    },
	    {
	        Mode = 0
	    }
	}

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_felin.mdl"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_famas_barrel_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_famas_barrel_sd")

	att.PrintName = "Whisper Frame"
	att.Icon = Material("entities/arccw_mifl_fas2_famas_hg_sd.png", "mips smooth")
	att.Description = "Silencieux in lighter frame for manuevorous purpose. Hipfire performance is significantly worse."
	att.SortOrder = 9
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_famas_hg"

	att.Mult_MoveSpeed = 1.05

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Add_BarrelLength = 3

	att.Mult_ShootPitch = 1.5
	att.Mult_ShootVol = 0.7
	att.Mult_AccuracyMOA = 0.75
	att.Mult_Range = 1.25

	att.Mult_HipDispersion = 1.3
	att.Mult_SightTime = 1.15

	att.Add_BarrelLength = 14

	att.Mult_RPM = 0.9

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_sd.mdl"

	att.ModelOffset = Vector(1, -0.33, 0.5)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_famas_barrel_xs.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_famas_barrel_xs")

	att.PrintName = "Obrez Frame"
	att.Icon = Material("entities/arccw_mifl_fas2_famas_hg_no.png", "mips smooth")
	att.Description = "Reduced the length by half. Its insane firerate may be of use, if one can still hit their target."
	att.SortOrder = 2
	att.Desc_Pros = {
		"pro.fas2.xs",
	}
	att.Desc_Cons = {
		"con.fas2.ubgl",
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_famas_hg"
	att.Override_ShootWhileSprint = true
	att.Mult_Range = 0.3
	att.Mult_Recoil = 1.5
	att.Mult_SightTime = 0.75
	att.Mult_DrawTime = 0.75
	att.Mult_AccuracyMOA = 4
	att.Mult_RPM = 1.3
	att.Mult_ReloadTime = 0.85
	att.Add_BarrelLength = -12

	att.Mult_MoveDispersion = 1.5
	att.Mult_HipDispersion = 1.5

	att.Mult_SpeedMult = 1.15
	att.Mult_SightedSpeedMult = 1.25

	att.Mult_ShootPitch = 1.3

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_m4x.mdl"

	att.ModelOffset = Vector(-10, -4, -1.9)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_famas_mag_556_50.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_famas_mag_556_50")

	att.PrintName = "50-Round 5.56mm"
	att.Icon = Material("entities/arccw_mifl_fas2_famas_mag_50.png", "mips smooth")
	att.Description = "Heavy quad stack straight magazine holding twice the rounds."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 50 + 100
	att.AutoStats = true
	att.Slot = {"mifl_fas2_famas_mag"}

	att.ActivateElements = {"50"}

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Override_ClipSize = 50
	att.Mult_ReloadTime = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_famas_mag_9mm_25.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_famas_mag_9mm_25")

	att.PrintName = "25-Round 9mm"
	att.Icon = Material("entities/arccw_mifl_fas2_famas_mag_25.png", "mips smooth")
	att.Description = "Conversion to 9mm allows for faster firing rate and a few more rounds at the cost of range."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 25
	att.AutoStats = true
	att.Slot = {"mifl_fas2_famas_mag"}

	att.ActivateElements = {"25"}

	att.Override_ClipSize = 25

	att.Mult_Range = 0.75
	att.Mult_Penetration = 0.5
	att.Mult_Recoil = 0.75
	att.Mult_RPM = 1.1
	att.Mult_AccuracyMOA = 2
	att.Mult_Damage = 0.75
	att.Mult_DamageMin = 0.75
	att.Mult_ShootPitch = 1.1

	att.Override_ShellModel = "models/shells/shell_9mm.mdl"
	att.Override_Ammo = "pistol"
	att.Override_Trivia_Class = "Submachine Gun"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/famas/famas_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/famas/9.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/famas/famas_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/famas/9_s.wav" end
	end

	att.InvAtt = {"mifl_fas2_g36_mag_9mm_15", "mifl_fas2_g20_mag_17_9", "mifl_fas2_m4a1_mag_9mm_21", "mifl_fas2_m11_mag_16", "mifl_fas2_m24_mag_9mm", "mifl_fas2_mp5_mag_15", "mifl_fas2_sg55x_mag_45"}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_famas_mag_9mm_50.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_famas_mag_9mm_50")

	att.PrintName = "50-Round 9mm"
	att.Icon = Material("entities/arccw_mifl_fas2_famas_mag_25.png", "mips smooth")
	att.Description = "Conversion to 9mm allows for faster firing rate and a few more rounds at the cost of range. Quadstack gives it even greater capacity."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 50
	att.AutoStats = true
	att.Slot = {"mifl_fas2_famas_mag"}

	att.ActivateElements = {"50_9"}

	att.Override_ClipSize = 50
	att.Mult_ReloadTime = 1.25
	att.Mult_SightTime = 1.15

	att.Mult_Range = 0.75
	att.Mult_Penetration = 0.5
	att.Mult_Recoil = 0.75
	att.Mult_RPM = 1.1
	att.Mult_AccuracyMOA = 2
	att.Mult_Damage = 0.75
	att.Mult_DamageMin = 0.75
	att.Mult_ShootPitch = 1.1

	att.Override_ShellModel = "models/shells/shell_9mm.mdl"
	att.Override_Ammo = "pistol"
	att.Override_Trivia_Class = "Submachine Gun"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/famas/famas_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/famas/9.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/famas/famas_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/famas/9_s.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g20_mag_17_9.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g20_mag_17_9")

	att.PrintName = "17-Round 9mm G17"
	att.Icon = Material("entities/arccw_mifl_fas2_g20_8.png", "mips smooth")
	att.Description = "Conversion to 9mm, a more common and less peppy cartridge."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 17
	att.AutoStats = true
	att.Slot = "mifl_fas2_g20_mag"

	att.Override_ClipSize = 17

	att.Mult_Recoil = 0.7
	att.Mult_Damage = 0.85
	att.Mult_DamageMin = 0.85
	att.Mult_RPM = 1.15

	att.Override_Trivia_Calibre = "9x19mm Parabellum"

	att.InvAtt = {"mifl_fas2_famas_mag_9mm_25", "mifl_fas2_g36_mag_9mm_15", "mifl_fas2_m4a1_mag_9mm_21", "mifl_fas2_m11_mag_16", "mifl_fas2_m24_mag_9mm", "mifl_fas2_mp5_mag_15", "mifl_fas2_sg55x_mag_45"}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g20_mag_33_9.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g20_mag_33_9")

	att.PrintName = "33-Round 9mm G18"
	att.Icon = Material("entities/arccw_mifl_fas2_g20_33.png", "mips smooth")
	att.Description = "Long stick mag used by the Glock 18 so it doesn't empty itself in one second."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 33
	att.AutoStats = true
	att.Slot = "mifl_fas2_g20_mag"

	att.ActivateElements = {"mag_33"}

	att.Override_ClipSize = 33

	att.Mult_Recoil = 0.7
	att.Mult_Damage = 0.85
	att.Mult_DamageMin = 0.85
	att.Mult_RPM = 1.15

	att.Mult_MoveSpeed = 0.9
	att.Mult_SightTime = 1.15
	att.Mult_ReloadTime = 1.25

	att.Override_Trivia_Calibre = "9x19mm Parabellum"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g20_mag_8_50.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g20_mag_8_50")

	att.PrintName = "8-Round .50GI G20"
	att.Icon = Material("entities/arccw_mifl_fas2_g20_8.png", "mips smooth")
	att.Description = "Conversion to .50 GI to ruin your wrist, your gun, and whatever happens to be in front of you. This shouldn't be working at all, yet here you are, using it."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 8
	att.AutoStats = true
	att.Slot = "mifl_fas2_g20_mag"

	att.ActivateElements = {"mag_8"}

	att.Override_ClipSize = 8

	att.Mult_RPM = 0.6
	att.Mult_Damage = 2
	att.Mult_DamageMin = 1.5
	att.Mult_ReloadTime = 1.05

	att.Mult_Recoil = 1.8
	att.Mult_RecoilSide = 2
	att.Mult_VisualRecoilMult = 2

	att.Mult_ShootPitch = 0.75

	att.Override_Ammo = "357"
	att.Override_Trivia_Calibre = ".50 GI"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g20_slide_17.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g20_slide_17")

	att.PrintName = "G17 Slide"
	att.Icon = Material("entities/arccw_mifl_fas2_g20_slide17.png", "mips smooth")
	att.Description = "Lightweight slide used on the G17."
	att.SortOrder = 3.8
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g20_slide"

	att.Mult_Recoil = 1.1
	att.Mult_RPM = 1.1
	att.Mult_SightTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g20_slide_17c.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g20_slide_17c")

	att.PrintName = "G17L Slide"
	att.Icon = Material("entities/arccw_mifl_fas2_g20_slide17c.png", "mips smooth")
	att.Description = "Unusually long slide and barrel for unusually long range."
	att.SortOrder = 10
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g20_slide"

	att.Mult_Range = 1.75
	att.Mult_Recoil = 0.85
	att.Mult_SightTime = 1.25
	att.Mult_AccuracyMOA = 0.5
	att.Mult_DrawTime = 1.25
	att.Mult_HolsterTime = 1.25
	att.Mult_RPM = 0.8

	att.Add_BarrelLength = 8

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g20_slide_18.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g20_slide_18")

	att.PrintName = "G18 Slide"
	att.Icon = Material("entities/arccw_mifl_fas2_g20_slide18.png", "mips smooth")
	att.Description = "Vented and compensated slide allows for full-auto fire, effectively turning the weapon into a machine-pistol. Watch that ammo count!"
	att.SortOrder = 4
	att.Desc_Pros = {
	    "pro.fullauto"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g20_slide"

	att.Mult_SightTime = 1.25
	att.Mult_DrawTime = 1.25

	att.Add_BarrelLength = 2

	att.Mult_RPM = 1.5

	att.Mult_ShootPitch = 0.97

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
-- mifl_fas2_g20_slide_18c.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g20_slide_18c")

	att.PrintName = "G18-K Slide"
	att.Icon = Material("entities/arccw_mifl_fas2_g20_slide18c.png", "mips smooth")
	att.Description = "Shortened automatic G18 slide with no compensator. Cannot fire as fast, but is more compact."
	att.SortOrder = -1
	att.Desc_Pros = {
	    "pro.fullauto"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g20_slide"

	att.Mult_Range = 0.75
	att.Mult_SightTime = 0.85
	att.Mult_DrawTime = 0.75
	att.Mult_Recoil = 1.25

	att.Add_BarrelLength = -2

	att.Mult_RPM = 1.3

	att.Mult_ShootPitch = 1.1

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
-- mifl_fas2_g20_slide_c.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g20_slide_c")

	att.PrintName = "G26 Slide"
	att.Icon = Material("entities/arccw_mifl_fas2_g20_slidec.png", "mips smooth")
	att.Description = "A homemade short slide for the Glock. Not really equivalent to the compact G26, but does make the gun more manuverable."
	att.SortOrder = -2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g20_slide"

	att.Mult_Range = 0.75
	att.Mult_SightTime = 0.75
	att.Mult_DrawTime = 0.5
	att.Mult_Recoil = 1.25

	att.Mult_RPM = 1.25

	att.Add_BarrelLength = -1
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g20_slide_raptor.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g20_slide_raptor")

	att.PrintName = "G18 Raptor Slide"
	att.Icon = Material("entities/arccw_mifl_fas2_g20_slideraptor.png", "mips smooth")
	att.Description = "Modifies the weapon with a 3-burst and a foregrip for stability."
	att.SortOrder = 5
	att.AutoStats = true
	att.Slot = "mifl_fas2_g20_slide"

	att.Mult_Range = 1.3
	att.Mult_SightTime = 1.12
	att.Mult_DrawTime = 1.12

	att.Add_BarrelLength = 4

	att.Mult_Recoil = 0.8
	att.Mult_RecoilSide = 0.4
	att.Mult_VisualRecoilMult = 1.2

	att.ModelOffset = Vector(0.5, -0.3, -1.8)

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2_raptor_glock.mdl"

	att.Mult_RPM = 2

	att.Mult_ShootPitch = 0.97

	att.Override_Firemodes = {
	    {
	        Mode = -3,
	        RunawayBurst = true,
	        PostBurstDelay = 0.2
	    },
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g20_slide_whisper.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g20_slide_whisper")

	att.PrintName = "Whisper Slide"
	att.Icon = Material("entities/arccw_mifl_fas2_g20_slidesd.png", "mips smooth")
	att.Description = "Integrated pistol suppressor made by some hobbyist. It is significantly more quiet than mounted suppressors by reducing bullets to subsonic velocities."
	att.SortOrder = 11
	att.Desc_Pros = {
	    "pro.invistracers"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"mifl_fas2_g20_slide", "mifl_fas2_m1911_slide", "mifl_fas2_deagle_slide"}

	att.Mult_Recoil = 0.9
	att.Mult_SightTime = 1.3
	att.Mult_HipDispersion = 1.3
	att.Mult_DrawTime = 1.25
	att.Mult_HolsterTime = 1.25

	att.Mult_ShootPitch = 2
	att.Mult_ShootVol = 0.6
	att.Mult_AccuracyMOA = 0.75
	att.Mult_Range = 1.25

	att.Add_BarrelLength = 6

	Override_PhysTracerProfile = 7
	Override_TracerNum = 0

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g20_stock_g18.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g20_stock_g18")

	att.PrintName = "Compact Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_g20_stock.png", "mips smooth")
	att.Description = "Compact polymer stock that improves strafe speed and moving accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"mifl_fas2_g20_stock", "mifl_fas2_m1911_stock", "mifl_fas2_m4a1_stock"}

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightedSpeedMult = 1.25
	att.Mult_SightTime = 1.15
	att.Mult_Recoil = 1.1
	att.Mult_MoveDispersion = 0.75
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g20_stock_raptor.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g20_stock_raptor")

	att.PrintName = "Raptor Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_g20_stock_raptor.png", "mips smooth")
	att.Description = "Pistol stock intended for use with the Raptor burst fire kit. Significantly reduces recoil of the first 3 shots."
	att.Desc_Pros = {
	    "pro.fas2.raptor_stock"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g20_stock"

	att.Mult_MoveSpeed = 0.9
	att.Mult_SightedSpeedMult = 0.75
	att.Mult_SightTime = 1.25
	att.Override_ShotRecoilTable = {
	    [0] = 0.7,
	    [1] = 0.6,
	    [2] = 0.5
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g36_barrel_kurz.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g36_barrel_kurz")

	att.PrintName = "Kurz Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_g36_hg_k.png", "mips smooth")
	att.Description = "Shorter handguard with no rails offer great handling."
	att.SortOrder = 1.5
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
		"con.fas2.ubgl"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g36c_hg"

	att.Mult_MoveSpeed = 0.8

	att.Mult_Range = 0.9
	att.Mult_Recoil = 1.2
	att.Mult_SightTime = 0.9
	att.Mult_AccuracyMOA = 1.1
	att.Mult_RPM = 1.2

	att.Mult_ShootPitch = 1.1

	att.Add_BarrelLength = -4
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g36_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g36_barrel_long")

	att.PrintName = "Marksman Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_g36_hg_mgsl8.png", "mips smooth")
	att.Description = "Longer barrel extending the weapons range at the cost of weight and maneuverability."
	att.SortOrder = 10
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g36c_hg"

	att.Mult_MoveSpeed = 0.8

	att.Mult_Range = 1.6
	att.Mult_Recoil = 0.8
	att.Mult_SightTime = 1.21
	att.Mult_AccuracyMOA = 0.7
	att.Mult_RPM = 0.9

	att.Mult_ShootPitch = 0.8

	att.Add_BarrelLength = 15
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g36_barrel_no.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g36_barrel_no")

	att.PrintName = "No Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_g36_hg_no.png", "mips smooth")
	att.Description = "I suppose the G36 bareley even had a barrel."
	att.SortOrder = 1
	att.Desc_Pros = {
		"pro.fas2.xs",
	}
	att.Desc_Cons = {
		"con.fas2.ubgl"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g36c_hg"
	att.Override_ShootWhileSprint = true
	att.Mult_MoveDispersion = 3
	att.Mult_HipDispersion = 1.5
	att.Mult_Range = 0.55
	att.Mult_Recoil = 1.375
	att.Mult_SightTime = 0.55
	att.Mult_AccuracyMOA = 2.2
	att.Mult_RPM = 1.2

	att.Add_BarrelLength = -7
	att.Mult_ReloadTime = 0.9

	att.ModelOffset = Vector(-5, -4.5, 1.2)

	att.LHIK = true
	att.LHIK_Priority = 0.1

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_m4x.mdl"

	att.Mult_MoveDispersion = 1.3

	att.Mult_ShootPitch = 1.45
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g36_barrel_oicw.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g36_barrel_oicw")

	att.PrintName = "Grenadier Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_g36_hg_oicw.png", "mips smooth")
	att.Description = "Prototype grenadier rifle with top-mounted XM25 grenade launcher. Very heavy and bulky."
	att.SortOrder = 8
	att.Desc_Pros = {
	    "Selectable underbarrel grenade launcher",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
		"Double tap +ZOOM to equip/dequip",
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g36c_hg"

	att.Mult_MoveSpeed = 0.85

	att.Mult_SightTime = 1.5
	att.Mult_Recoil = 0.8
	att.Mult_RPM = 0.9

	att.Mult_ShootPitch = 0.8

	att.Add_BarrelLength = 15

	att.UBGL = true
	att.ExcludeFlags = {"ubgl"}


	att.UBGL_BaseAnims = true

	att.UBGL_PrintName = "OICW"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_m79"
	att.UBGL_ClipSize = 1
	att.UBGL_Ammo = "smg1_grenade"
	att.UBGL_RPM = 120
	att.UBGL_Recoil = 1
	att.UBGL_Capacity = 4

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("smg1_grenade")
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if (wep:Clip2() <= 0) then return end

	    wep:PlayAnimation("fire")

	    wep:FireRocket("arccw_gl_m79_he", 3000 * ArcCW.HUToM)

	    wep:EmitSound("weapons/grenade_launcher1.wav", 100)

	    wep:SetClip2(wep:Clip2() - 1)

	    wep:SetNextPrimaryFire(CurTime() + 0.5)

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
		local clip = 4 + 1
		
	    if wep:Clip2() >= clip then return end

	    if Ammo(wep) <= 0 then return end

	    wep:SetNextSecondaryFire(CurTime() + (wep:Clip2() == 0 and 3.5 or 3))

	    wep:PlayAnimation(wep:Clip2() == 0 and "oicw_dry" or "oicw_wet", nil, true)

	    local reserve = Ammo(wep)

	    reserve = reserve + wep:Clip2()

	    local load = math.Clamp(5, 0, reserve)

	    wep.Owner:SetAmmo(reserve - load, "smg1_grenade")

	    wep:SetClip2(load)
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g36_barrel_scope.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g36_barrel_scope")

	att.PrintName = "Combat Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_g36_hg_scoped.png", "mips smooth")
	att.Description = "Medium barrel fitted with an optic."
	att.SortOrder = 9.5
	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g36c_hg"

	att.Mult_MoveSpeed = 0.8

	att.Mult_Range = 1.6
	att.Mult_Recoil = 0.8
	att.Mult_SightTime = 1.21
	att.Mult_AccuracyMOA = 0.7
	att.Mult_RPM = 0.9

	att.Mult_ShootPitch = 0.8

	att.Add_BarrelLength = 15

	att.AdditionalSights = {
	    {
	        Pos = Vector(-0.2, 20, -6.22),
	        Ang = Angle(0, 0, 0),
	        Magnification = 2,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 2,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",		
	        IgnoreExtra = true,	
	    }
	}
	att.KeepBaseIrons = true

	att.Model = "models/weapons/arccw/mifl_atts/fas2_optic_acog.mdl"
	att.ModelBodygroups = "11"

	att.Holosight = true
	att.HolosightMagnification = 4
	att.HolosightMagnificationMin = 4
	att.HolosightMagnificationMax = 4
	att.HolosightReticle = Material("mifl_fas2_reticle/g36.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 4
	att.HolosightBone = "holosight"
	att.Colorable = true
	att.HolosightBlackbox = true

	att.ModelOffset = Vector(-8, 0.2, 4.75)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g36_barrel_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g36_barrel_sd")

	att.PrintName = "Whisper Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_g36_hg_sd.png", "mips smooth")
	att.Description = "Suppressed barrel, generous handling."
	att.SortOrder = 10
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g36c_hg"

	att.Mult_MoveSpeed = 0.95

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Add_BarrelLength = 6

	att.Mult_ShootPitch = 1.6
	att.Mult_ShootVol = 0.6
	att.Mult_AccuracyMOA = 0.8
	att.Mult_Range = 1.15

	att.Mult_SightTime = 1.08

	att.Mult_HipDispersion = 1.3

	att.Add_BarrelLength = 14

	att.Override_PhysTracerProfile = 5

	att.Mult_RPM = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g36_mag_762_10.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g36_mag_762_10")

	att.PrintName = "10-Round 7.62mm"
	att.Icon = Material("entities/arccw_mifl_fas2_g36_ammo_10.png", "mips smooth")
	att.Description = "Curious conversion to 7.62 increases damage and range but decreases mag capacity and controllability."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 10 - 200
	att.AutoStats = true
	att.Slot = "mifl_fas2_g36_mag"

	att.ActivateElements = {"10"}

	att.Mult_Recoil = 1.9
	att.Mult_RecoilSide = 1.2
	att.Mult_VisualRecoilMult = 1.2

	att.Mult_MoveSpeed = 1.1
	att.Mult_Damage = 1.8
	att.Mult_DamageMin = 2.3
	att.Mult_Range = 2
	att.Mult_Penetration = 2
	att.Mult_MuzzleVelocity = 1.3
	att.Mult_SightTime = 0.85
	att.Override_ClipSize = 10
	att.Mult_ReloadTime = 0.9

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/g36/762.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/g36/7sd.wav" end
	end

	att.Override_Trivia_Calibre = "7.62mm"
	att.Override_Trivia_Class = "Desginated Marksman Rifle"

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
-- mifl_fas2_g36_mag_9mm_15.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g36_mag_9mm_15")

	att.PrintName = "15-Round 9mm"
	att.Icon = Material("entities/arccw_mifl_fas2_g36_ammo_15.png", "mips smooth")
	att.Description = "Converting the weapon into 9mm is not possible in real life, but here it decreases damage and increases firerate."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 15 - 100
	att.AutoStats = true
	att.Slot = {"mifl_fas2_g36_mag"}

	att.ActivateElements = {"15"}

	att.Mult_MoveSpeed = 1.05
	att.Mult_SightedSpeedMult = 1.1

	att.Mult_Range = 0.75
	att.Mult_Penetration = 0.5
	att.Mult_Recoil = 0.8
	att.Mult_SightTime = 0.8
	att.Mult_RPM = 1.2
	att.Mult_AccuracyMOA = 2
	att.Override_ClipSize = 15
	att.Mult_Damage = 0.75
	att.Mult_DamageMin = 0.75
	att.Mult_ShootPitch = 0.9
	att.Mult_ReloadTime = 0.825

	att.Override_Ammo = "pistol"

	att.Override_ShellModel = "models/shells/shell_9mm.mdl"

	att.Override_Trivia_Class = "Submachine Gun"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/g36/9mm.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/g36/9sd.wav" end
		
	end

	att.AddSuffix = " C9"

	att.InvAtt = {"mifl_fas2_famas_mag_9mm_25", "mifl_fas2_g20_mag_17_9", "mifl_fas2_m4a1_mag_9mm_21", "mifl_fas2_m11_mag_16", "mifl_fas2_m24_mag_9mm", "mifl_fas2_mp5_mag_15", "mifl_fas2_sg55x_mag_45"}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g36_mag_9mm_30.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g36_mag_9mm_30")

	att.PrintName = "30-Round 9mm"
	att.Icon = Material("entities/arccw_mifl_fas2_g36_ammo_30.png", "mips smooth")
	att.Description = "Converting the weapon into 9mm is not possible in real life, but here it decreases damage and increases firerate."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 30 - 100
	att.AutoStats = true
	att.Slot = {"mifl_fas2_g36_mag"}

	att.ActivateElements = {"30"}

	att.Mult_SightedSpeedMult = 1.12

	att.Mult_Range = 0.75
	att.Mult_Penetration = 0.5
	att.Mult_Recoil = 0.82
	att.Mult_SightTime = 0.82
	att.Mult_RPM = 1.2
	att.Mult_AccuracyMOA = 2.1
	att.Override_ClipSize = 30
	att.Mult_Damage = 0.75
	att.Mult_DamageMin = 0.75
	att.Mult_ShootPitch = 0.9
	att.Mult_ReloadTime = 0.9

	att.Override_Ammo = "pistol"

	att.Override_ShellModel = "models/shells/shell_9mm.mdl"

	att.Override_Trivia_Class = "Submachine Gun"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_fire1.wav" then return "weapons/arccw_mifl/fas2/mac11/mac11_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/mac11/mac11_suppressed_fire1.wav" end
		
	end

	att.AddSuffix = " C9"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g36_stock_mp5.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g36_stock_mp5")

	att.PrintName = "Sliding Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_g36c_stock_mp5.png", "mips smooth")
	att.Description = "Compact sliding stock offers decent sight acquisition and horizontal control."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"mifl_fas2_g36_stock", "mifl_fas2_g3_stock", "mifl_fas2_m4a1_stock"}

	att.Mult_Recoil = 1.125
	att.Mult_RecoilSide = 0.7
	att.Mult_VisualRecoilMult = 0.9
	att.Mult_SightTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g3_hg_eod.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g3_hg_eod")

	att.PrintName = "EOD Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_g3_hg_eod.png", "mips smooth")
	att.Description = "Short barrel shroud taken from specialized EOD MP5s. Offers superior hipfire capabilities."
	att.SortOrder = -4
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g3_hg"

	att.Mult_Range = 0.7
	att.Mult_SpeedMult = 1.1
	att.Mult_AccuracyMOA = 2
	att.Mult_HipDispersion = 0.7
	att.Mult_SightTime = 0.75
	att.Mult_Recoil = 1.25

	att.Add_BarrelLength = -2

	att.Mult_HeatCapacity = 1.5
	att.Mult_FixTime = 0.5
	att.Mult_HeatDissipation = 1.25
	att.Mult_HeatDelayTime = 0.5
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g3_hg_k.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g3_hg_k")

	att.PrintName = "Kurz Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_g3_hg_k.png", "mips smooth")
	att.Description = "Yes, that is indeed a MP5K handguard on a G3. When people talk about how the two guns are mechanically similar, I don't think this is what they meant."
	att.SortOrder = -8
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g3_hg"


	att.Mult_Range = 0.3
	att.Mult_AccuracyMOA = 4
	att.Mult_SightTime = 0.6
	att.Mult_SpeedMult = 1.15
	att.Mult_Recoil = 1.5
	att.Mult_RecoilSide = 1.5
	att.Mult_RPM = 1.4
	att.Mult_MoveDispersion = 2
	att.Mult_HipDispersion = 0.5

	att.Add_BarrelLength = -4

	att.LHIK = true
	att.LHIK_Priority = -2
	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_felin.mdl"
	att.ModelOffset = Vector(0, 0, 0)

	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g3_hg_navy.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g3_hg_navy")

	att.PrintName = "Navy Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_g3_hg_navy.png", "mips smooth")
	att.Description = "Short handguard with flashlight that came off a MP5 Navy. Has a noticably faster firerate."
	att.SortOrder = -3
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g3_hg"

	att.Mult_Range = 0.7
	att.Mult_AccuracyMOA = 2
	att.Mult_SightTime = 0.75
	att.Mult_SpeedMult = 1.08
	att.Mult_Recoil = 1.3
	att.Mult_RPM = 1.15

	att.Add_BarrelLength = -2

	att.LHIK = true
	att.LHIK_Priority = -2
	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_sd.mdl"
	att.ModelOffset = Vector(1, -0.75, 0)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g3_hg_para.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g3_hg_para")

	att.PrintName = "Paratrooper Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_g3_hg_para.png", "mips smooth")
	att.Description = "Shortened barrel and handguard. Offers more mobility but less range and recoil control."
	att.SortOrder = -2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g3_hg"

	att.Mult_Range = 0.75
	att.Mult_AccuracyMOA = 1.5
	att.Mult_SightTime = 0.8
	att.Mult_SpeedMult = 1.05
	att.Mult_Recoil = 1.1

	att.Add_BarrelLength = -2
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g3_hg_psg1.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g3_hg_psg1")

	att.PrintName = "Marksman Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_g3_hg_long.png", "mips smooth")
	att.Description = "Law enforcement PSG-1 barrel offers precision shooting capability. This kit is very heavy."
	att.SortOrder = 2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g3_hg"

	att.Mult_Range = 1.2
	att.Mult_AccuracyMOA = 0.9
	att.Mult_SightTime = 1.1
	att.Mult_SpeedMult = 0.9
	att.Mult_Recoil = 0.9
	att.Mult_RecoilSide = 0.7
	att.Mult_RPM = 0.7

	att.Add_BarrelLength = 6
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g3_hg_psg2.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g3_hg_psg2")

	att.PrintName = "Combat Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_g3_hg_lont.png", "mips smooth")
	att.Description = "Shorten PSG-1 barrel. Still retains its longer brother capability but with greater handling. It is however not as long as the default G3 barrel."
	att.SortOrder = 2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g3_hg"

	att.Mult_Range = 0.9
	att.Mult_AccuracyMOA = 1.2
	att.Mult_SightTime = 0.9
	att.Mult_Recoil = 1.1
	att.Mult_RecoilSide = 0.7
	att.Mult_RPM = 1.15

	att.Add_BarrelLength = -2
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g3_hg_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g3_hg_sd")

	att.PrintName = "SD Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_g3_hg_sd.png", "mips smooth")
	att.Description = "Integrated suppressor for the G3."
	att.SortOrder = 0
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g3_hg"
	att.GivesFlags = {"mifl_fas2_g3_hg_sd"}

	att.Mult_ShootPitch = 1.5
	att.Mult_ShootVol = 0.75
	att.Mult_AccuracyMOA = 0.75
	att.Mult_Range = 1.25

	att.Mult_SightTime = 1.25

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g3_hg_vollmer.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g3_hg_vollmer")

	att.PrintName = "Commando Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_g3_hg_vollmer.png", "mips smooth")
	att.Description = "Short barrel and handguard with a light handle offering a much higher RPM."
	att.SortOrder = -5
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g3_hg"

	att.Mult_Range = 0.6
	att.Mult_AccuracyMOA = 2.5
	att.Mult_SightTime = 0.75
	att.Mult_SpeedMult = 1.1
	att.Mult_Recoil = 1.4
	att.Mult_RecoilSide = 1.25
	att.Mult_RPM = 1.3

	att.Add_BarrelLength = -3
	ArcCW.LoadAttachmentType(att)
end

