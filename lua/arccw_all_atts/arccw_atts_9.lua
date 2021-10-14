local Material = ArcCW.AttachmentMat

------
-- perk_vampire.lua
------

do
	local att = {}
	ArcCW.SetShortName("perk_vampire")

	att.PrintName = "Health Recycling"
	att.Icon = Material("entities/acwatt_perk_vampire.png")
	att.Description = "Successful hits heal shooter, at the cost of dealing significantly less damage."
	att.Ignore = true
	att.Desc_Pros = {
	    "+ Health steal"
	}
	att.Desc_Cons = {
	    "- Reduced damage",
	}
	att.Slot = "perk"

	att.Mult_Damage = 0.5
	att.Mult_DamageMin = 0.5

	att.Hook_BulletHit = function(wep, data)
	    if !data.tr.Entity then return end

	    if data.tr.HitWorld then return end

	    if data.tr.Entity:Health() <= 0 then return end

	    if wep.Owner:Health() > wep.Owner:GetMaxHealth() then return end

	    wep.Owner:SetHealth(math.Clamp(wep.Owner:Health() + (data.damage * 0.1), 0, wep.Owner:GetMaxHealth()))
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- pistol_gangstyle.lua
------

do
	local att = {}
	ArcCW.SetShortName("pistol_gangstyle")

	att.Ignore = false

	att.PrintName = "Bandit Style"
	att.Icon = Material("entities/acwatt_gangstyle.png")
	att.Description = "A sideways shooting style that allows for the muzzle climb of a pistol to sweep a room, coined for its use in the warlord era of China."
	att.Desc_Pros = {
	    "+ Sideways recoil",
	}
	att.Desc_Cons = {
	    "- Recoil control",
	    "- Recoil stability"
	}
	att.Slot = "style_pistol"
	att.Free = true

	att.LHIK = true
	att.LHIKHide = true
	att.Override_ActivePos = Vector(-2, 0, -4)
	att.Override_ActiveAng = Angle(0, 0, -60)

	att.Override_RecoilDirection = Angle(0, -1, 0)
	att.Override_RecoilDirectionSide = Angle(1, 0, 0)

	att.Override_AddSightRoll = -90

	att.Mult_Recoil = 1.2
	att.Mult_RecoilSide = 1.2
	ArcCW.LoadAttachmentType(att)
end

------
-- pistol_onehand.lua
------

do
	local att = {}
	ArcCW.SetShortName("pistol_onehand")

	att.PrintName = "Cowboy Style"
	att.Icon = Material("entities/acwatt_pistol_onehand.png")
	att.Description = "A one-handed shooting style which improves maneuverability but reduces recoil control."
	att.Desc_Pros = {
	    "pro.pistol_onehand"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "style_pistol"

	att.Free = true

	att.LHIK = true
	att.LHIKHide = true

	att.Override_ShootWhileSprint = true

	att.Mult_MoveDispersion = 1.5

	att.Mult_Recoil = 1.5
	att.Mult_RecoilSide = 1.5

	att.Mult_SightTime = 0.6
	att.Mult_DrawTime = 0.6

	att.Override_HoldtypeSights = "pistol"
	att.Override_HoldtypeActive = "pistol"
	ArcCW.LoadAttachmentType(att)
end

------
-- stock_heavy.lua
------

do
	local att = {}
	ArcCW.SetShortName("stock_heavy")

	att.PrintName = "Heavy Stock"
	att.Icon = Material("entities/acwatt_stock_heavy.png")
	att.Description = "Heavy stock which improves recoil control and stability but takes longer to aim with."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "stock"

	att.Mult_Recoil = 0.85
	att.Mult_RecoilSide = 0.75
	att.Mult_SightTime = 1.1
	att.Mult_SpeedMult = 0.85
	att.Mult_HipDispersion = 1.25

	att.ActivateElements = {"hstock"}
	ArcCW.LoadAttachmentType(att)
end

------
-- stock_light.lua
------

do
	local att = {}
	ArcCW.SetShortName("stock_light")

	att.PrintName = "Light Stock"
	att.Icon = Material("entities/acwatt_stock_light.png")
	att.Description = "Lightened stock that allows for faster sight time and ergonomic control, at the cost of recoil control."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "stock"

	att.Mult_Recoil = 1.15
	att.Mult_RecoilSide = 0.9
	att.Mult_SightTime = 0.85
	att.Mult_HipDispersion = 0.9

	att.ActivateElements = {"lstock"}
	ArcCW.LoadAttachmentType(att)
end

------
-- stock_skeleton.lua
------

do
	local att = {}
	ArcCW.SetShortName("stock_skeleton")

	att.PrintName = "Skeleton Stock"
	att.Icon = Material("entities/acwatt_stock_skeleton.png")
	att.Description = "Hollow skeleton stock allows for improved movement speed, but harms recoil control."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "stock"

	att.Mult_SpeedMult = 1.2
	att.Mult_Recoil = 1.15
	att.Mult_RecoilSide = 1.35
	att.Mult_MoveDispersion = 1.25

	att.ActivateElements = {"skelstock"}
	ArcCW.LoadAttachmentType(att)
end

------
-- stock_strafe.lua
------

do
	local att = {}
	ArcCW.SetShortName("stock_strafe")

	att.PrintName = "Adjustable Stock"
	att.Icon = Material("entities/acwatt_stock_strafe.png")
	att.Description = "Adjustable stock improves sighted strafe speed, with a marginal weight increase."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "stock"

	att.Mult_SightTime = 1.1
	att.Mult_SpeedMult = 0.9
	att.Mult_SightedMoveSpeed = 1.5
	ArcCW.LoadAttachmentType(att)
end

------
-- stock_sturdy.lua
------

do
	local att = {}
	ArcCW.SetShortName("stock_sturdy")

	att.PrintName = "Sturdy Stock"
	att.Icon = Material("entities/acwatt_stock_sturdy.png")
	att.Description = "Strengthened stock has reduced 'play' while maneuvering, improving moving accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "stock"

	att.Mult_MoveDispersion = 0.65
	att.Mult_SightedMoveSpeed = 0.75
	ArcCW.LoadAttachmentType(att)
end

------
-- supp_fragile.lua
------

do
	local att = {}
	ArcCW.SetShortName("supp_fragile")

	att.PrintName = "Fragile Suppressor"
	att.Ignore = true
	att.Icon = Material("entities/acwatt_supp_heavy.png")
	att.Description = "Improvised suppressor with good sound dampening, which is very light, but breaks when used."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.obstruction",
	    "con.fragile"
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.Model = "models/weapons/arccw/atts/supp_heavy.mdl"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true

	att.Mult_ShootPitch = 0.95
	att.Mult_ShootVol = 0.75

	att.Add_BarrelLength = 24

	att.DamageOnShoot = 1
	att.Health = 5

	att.Hook_AttDestroyed = function(wep, data)
	    wep:EmitSound("weapons/arccw/supp_break.wav", 75, 100, 1, CHAN_STATIC)
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- supp_heavy.lua
------

do
	local att = {}
	ArcCW.SetShortName("supp_heavy")

	att.PrintName = "Colossal Suppressor"
	att.Icon = Material("entities/acwatt_supp_heavy.png")
	att.Description = "Large sound suppressor with ballistic-enhancing qualities. Extremely cumbersome."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.obstruction"
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.SortOrder = 15

	att.Model = "models/weapons/arccw/atts/supp_heavy.mdl"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true

	att.Mult_ShootPitch = 0.9
	att.Mult_ShootVol = 0.75
	att.Mult_AccuracyMOA = 0.75
	att.Mult_Range = 1.25

	att.Mult_SightTime = 1.4
	att.Mult_HipDispersion = 1.5

	att.Add_BarrelLength = 24
	ArcCW.LoadAttachmentType(att)
end

------
-- supp_light.lua
------

do
	local att = {}
	ArcCW.SetShortName("supp_light")

	att.PrintName = "Light Suppressor"
	att.Icon = Material("entities/acwatt_supp_light.png")
	att.Description = "Lightweight weapon suppressor. Negatively impacts ballistic performance."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.SortOrder = 10

	att.Model = "models/weapons/arccw/atts/supp_light.mdl"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true

	att.Mult_ShootPitch = 1.1
	att.Mult_ShootVol = 0.75

	att.Mult_HipDispersion = 1.15
	att.Mult_Range = 0.8

	att.Add_BarrelLength = 8
	ArcCW.LoadAttachmentType(att)
end

------
-- supp_med.lua
------

do
	local att = {}
	ArcCW.SetShortName("supp_med")

	att.PrintName = "Tactical Suppressor"
	att.Icon = Material("entities/acwatt_supp_med.png")
	att.Description = "Balanced sound suppressor. Moderately improves performance."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.SortOrder = 12

	att.Model = "models/weapons/arccw/atts/supp_medium.mdl"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true

	att.Mult_ShootVol = 0.75
	att.Mult_AccuracyMOA = 0.9
	att.Mult_Range = 1.05

	att.Mult_SightTime = 1.25
	att.Mult_HipDispersion = 1.25

	att.Add_BarrelLength = 12
	ArcCW.LoadAttachmentType(att)
end

------
-- supp_mw2.lua
------

do
	local att = {}
	ArcCW.SetShortName("supp_mw2")

	att.PrintName = "Newage Silencer"
	att.Icon = Material("entities/acwatt_supp_mw2.png", "smooth")
	att.Description = "Modern sound suppressor used in modern warfare. Not as quiet or improves performance, but far more ergonomic."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"muzzle","muzzle_shotgun"}

	att.Model = "models/weapons/arccw/fesiugmw2/atts/supp_mw2.mdl"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = false

	att.Mult_ShootPitch = 0.9
	att.Mult_ShootVol = 0.9
	att.Mult_Range = 1.05

	att.Mult_HipDispersion = 1.05

	att.Add_BarrelLength = 12

	att.ModelScale = Vector( 0.5, 0.5, 0.5 )

	att.AddSuffix = " Silenced"
	ArcCW.LoadAttachmentType(att)
end

------
-- supp_shotgun.lua
------

do
	local att = {}
	ArcCW.SetShortName("supp_shotgun")

	att.PrintName = "Colossal Suppressor"
	att.Icon = Material("entities/acwatt_supp_heavy.png")
	att.Description = "Sound suppressor with large bore intended for shotguns. Reduces weapon sound, at the cost of heavy bulk."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.obstruction"
	}
	att.AutoStats = true
	att.Slot = "muzzle_shotgun"

	att.SortOrder = 15

	att.InvAtt = "supp_heavy"

	att.Model = "models/weapons/arccw/atts/supp_heavy.mdl"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true

	att.Mult_ShootPitch = 0.9
	att.Mult_ShootVol = 0.75

	att.Mult_SightTime = 1.4
	att.Mult_HipDispersion = 1.5

	att.Add_BarrelLength = 24
	ArcCW.LoadAttachmentType(att)
end

------
-- tac_anpeq.lua
------

do
	local att = {}
	ArcCW.SetShortName("tac_anpeq")

	att.PrintName = "Red Laser"
	att.Icon = Material("entities/acwatt_tac_anpeq.png")
	att.Description = "Powerful red laser aiming module. Laser assists with aiming from the hip. Far more effective than other laser colors."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.beam"
	}
	att.AutoStats = true
	att.Slot = "tac"

	att.Model = "models/weapons/arccw/atts/laser_anpeq.mdl"

	att.Laser = true
	att.LaserStrength = 1
	att.LaserBone = "laser"

	att.ColorOptionsTable = {Color(255, 50, 50)}

	att.Mult_SightTime = 1.15

	att.Mult_HipDispersion = 0.4
	ArcCW.LoadAttachmentType(att)
end

------
-- tac_green.lua
------

do
	local att = {}
	ArcCW.SetShortName("tac_green")

	att.PrintName = "Green Laser"
	att.Icon = Material("entities/acwatt_tac_green.png")
	att.Description = "Green laser aiming module. Reduces time taken to bring sights on target."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.beam"
	}
	att.AutoStats = true
	att.Slot = {"tac_pistol", "tac"}

	att.Model = "models/weapons/arccw/atts/laser_green.mdl"

	att.Laser = true
	att.LaserStrength = 1
	att.LaserBone = "laser"

	att.ColorOptionsTable = {Color(50, 255, 50)}

	att.Mult_HipDispersion = 0.85
	att.Mult_SightTime = 0.8
	--att.Mult_Recoil = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- tac_pointer.lua
------

do
	local att = {}
	ArcCW.SetShortName("tac_pointer")

	att.PrintName = "Blue Laser"
	att.Icon = Material("entities/acwatt_tac_pointer.png")
	att.Description = "Blue-colored laser pointer. Bright blue dot improves accuracy while moving."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.beam"
	}
	att.AutoStats = true
	att.Slot = {"tac_pistol", "tac"}

	att.Model = "models/weapons/arccw/atts/laser_pointer.mdl"

	att.Laser = true
	att.LaserStrength = 1
	att.LaserBone = "laser"

	att.ColorOptionsTable = {Color(50, 50, 255)}

	att.Mult_HipDispersion = 0.85
	att.Mult_MoveDispersion = 0.5
	--att.Mult_SightTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- ubgl_gp25.lua
------

do
	local att = {}
	ArcCW.SetShortName("ubgl_gp25")

	att.PrintName = "GP25 (HEAT)"
	att.Icon = Material("entities/acwatt_ubgl_gp25.png")
	att.Description = "Russian underbarrel launcher with anti-tank rocket rounds. Rockets travel straight and deal heavy direct damage with light splash damage."
	att.Desc_Pros = {
	    "pro.ubgl",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "info.toggleubgl"
	}
	att.AutoStats = true
	att.Slot = "ubgl"

	att.LHIK = true
	att.LHIK_Animation = true

	att.MountPositionOverride = 0

	att.Model = "models/weapons/arccw/atts/ubgl_gp25.mdl"
	att.ModelBodygroups = "01"

	att.UBGL = true

	att.UBGL_PrintName = "UB (AT)"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_m79"
	att.UBGL_ClipSize = 1
	att.UBGL_Ammo = "smg1_grenade"
	att.UBGL_RPM = 300
	att.UBGL_Recoil = 3.5
	att.UBGL_Capacity = 1

	att.DrawFunc = function(wep, element, wm)
	    if wep:Clip2() == 0 then
	        element.Model:SetBodygroup(1, 0)
	    else
	        element.Model:SetBodygroup(1, 1)
	    end
	end

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("smg1_grenade")
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    wep:DoLHIKAnimation("fire", 0.5)

	    wep:FireRocket("arccw_gl_rocket", 30000)

	    wep:EmitSound("weapons/grenade_launcher1.wav", 100)

	    wep:SetClip2(wep:Clip2() - 1)

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    if wep:Clip2() >= 1 then return end

	    if Ammo(wep) <= 0 then return end

	    wep:SetNextSecondaryFire(CurTime() + 4)

	    wep:DoLHIKAnimation("reload_m60a1", 4)
	    wep:PlaySoundTable({
	        {s = "weapons/arccw/m203/m203_shellin.wav", t = 2},
	        {s = "weapons/p228/p228_slideback.wav", t = 3}
	    })

	    local reserve = Ammo(wep)

	    reserve = reserve + wep:Clip2()

	    local clip = 1

	    local load = math.Clamp(clip, 0, reserve)

	    wep.Owner:SetAmmo(reserve - load, "smg1_grenade")

	    wep:SetClip2(load)
	end

	att.Mult_SightTime = 1.25
	att.Mult_SpeedMult = 0.8
	att.Mult_SightedSpeedMult = 0.85
	ArcCW.LoadAttachmentType(att)
end

------
-- ubgl_gp25_flash.lua
------

do
	local att = {}
	ArcCW.SetShortName("ubgl_gp25_flash")

	att.PrintName = "GP25 (FLASH)"
	att.Icon = Material("entities/acwatt_ubgl_gp25.png")
	att.Description = "Russian underbarrel launcher with flashbang rounds. Flashbangs temporarily blind targets and deal a small amount of explosive damage."
	att.Desc_Pros = {
	    "pro.ubgl",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "info.toggleubgl"
	}
	att.AutoStats = true
	att.Slot = "ubgl"
	att.InvAtt = "ubgl_gp25"

	att.LHIK = true
	att.LHIK_Animation = true

	att.MountPositionOverride = 0

	att.Model = "models/weapons/arccw/atts/ubgl_gp25.mdl"
	att.ModelBodygroups = "00"

	att.UBGL = true

	att.UBGL_PrintName = "UB (FLSH)"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_m79"
	att.UBGL_ClipSize = 1
	att.UBGL_Ammo = "smg1_grenade"
	att.UBGL_RPM = 300
	att.UBGL_Recoil = 2.5
	att.UBGL_Capacity = 1

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("smg1_grenade")
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    wep:DoLHIKAnimation("fire", 0.5)

	    wep:FireRocket("arccw_gl_flash", 30000)

	    wep:EmitSound("weapons/grenade_launcher1.wav", 100)

	    wep:SetClip2(wep:Clip2() - 1)

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    if wep:Clip2() >= 1 then return end

	    if Ammo(wep) <= 0 then return end

	    wep:SetNextSecondaryFire(CurTime() + 2.5)

	    wep:DoLHIKAnimation("reload_gp25", 2.5)
	    wep:PlaySoundTable({
	        {s = "weapons/arccw/m203/m203_shellin.wav", t = 1.25},
	        {s = "weapons/p228/p228_slideback.wav", t = 2}
	    })

	    local reserve = Ammo(wep)

	    reserve = reserve + wep:Clip2()

	    local clip = 1

	    local load = math.Clamp(clip, 0, reserve)

	    wep.Owner:SetAmmo(reserve - load, "smg1_grenade")

	    wep:SetClip2(load)
	end

	att.Mult_SightTime = 1.25
	att.Mult_SpeedMult = 0.8
	att.Mult_SightedSpeedMult = 0.85
	ArcCW.LoadAttachmentType(att)
end

------
-- ubgl_m203.lua
------

do
	local att = {}
	ArcCW.SetShortName("ubgl_m203")

	att.PrintName = "M203 (HE)"
	att.Icon = Material("entities/acwatt_ubgl_m203.png")
	att.Description = "American-made underbarrel grenade launcher. Fires high explosive shells."
	att.Desc_Pros = {
	    "pro.ubgl",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "info.toggleubgl"
	}
	att.AutoStats = true
	att.Slot = "ubgl"

	att.LHIK = true
	att.LHIK_Animation = true

	att.ModelOffset = Vector(0, 0, 0.25)

	att.MountPositionOverride = 0

	att.Model = "models/weapons/arccw/atts/ubgl_m203.mdl"

	att.UBGL = true

	att.UBGL_PrintName = "UB (HE)"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_m79"
	att.UBGL_ClipSize = 1
	att.UBGL_Ammo = "smg1_grenade"
	att.UBGL_RPM = 300
	att.UBGL_Recoil = 2.5
	att.UBGL_Capacity = 1

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("smg1_grenade")
	end

	att.Hook_LHIK_TranslateAnimation = function(wep, key)
	    if key == "idle" then
	        if wep:GetInUBGL() then
	            return "idle_ready"
	        else
	            return "idle"
	        end
	    end
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    wep:DoLHIKAnimation("fire", 0.5)

	    wep:FireRocket("arccw_gl_he", 30000)

	    wep:EmitSound("weapons/grenade_launcher1.wav", 100)

	    wep:SetClip2(wep:Clip2() - 1)

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    if wep:Clip2() >= 1 then return end

	    if Ammo(wep) <= 0 then return end

	    wep:SetNextSecondaryFire(CurTime() + 2.5)

	    wep:DoLHIKAnimation("reload", 2.5)
	    wep:PlaySoundTable({
	        {s = "weapons/arccw/m203/m203_dooropen.wav", t = 0.25},
	        {s = "weapons/arccw/m203/m203_shellin.wav", t = 1.25},
	        {s = "weapons/arccw/m203/m203_doorclose.wav", t = 2},
	    })

	    local reserve = Ammo(wep)

	    reserve = reserve + wep:Clip2()

	    local clip = 1

	    local load = math.Clamp(clip, 0, reserve)

	    wep.Owner:SetAmmo(reserve - load, "smg1_grenade")

	    wep:SetClip2(load)
	end

	att.Mult_SightTime = 1.25
	att.Mult_SpeedMult = 0.8
	att.Mult_SightedSpeedMult = 0.85
	ArcCW.LoadAttachmentType(att)
end

------
-- ubgl_m203_smk.lua
------

do
	local att = {}
	ArcCW.SetShortName("ubgl_m203_smk")

	att.PrintName = "M203 (SMOKE)"
	att.Icon = Material("entities/acwatt_ubgl_m203.png")
	att.Description = "American-made underbarrel grenade launcher. Fires smoke shells, which produce a white smokescreen. Smoke can be seen through with thermal vision."
	att.Desc_Pros = {
	    "pro.ubgl",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "info.toggleubgl"
	}
	att.AutoStats = true
	att.Slot = "ubgl"
	att.InvAtt = "ubgl_m203"

	att.LHIK = true
	att.LHIK_Animation = true

	att.ModelOffset = Vector(0, 0, 0.25)

	att.MountPositionOverride = 0

	att.Model = "models/weapons/arccw/atts/ubgl_m203.mdl"

	att.UBGL = true

	att.UBGL_PrintName = "UB (SMK)"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_m79"
	att.UBGL_ClipSize = 1
	att.UBGL_Ammo = "smg1_grenade"
	att.UBGL_RPM = 300
	att.UBGL_Recoil = 2.5
	att.UBGL_Capacity = 1

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("smg1_grenade")
	end

	att.Hook_LHIK_TranslateAnimation = function(wep, key)
	    if key == "idle" then
	        if wep:GetInUBGL() then
	            return "idle_ready"
	        else
	            return "idle"
	        end
	    end
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    wep:DoLHIKAnimation("fire", 0.5)

	    wep:FireRocket("arccw_gl_smk", 30000)

	    wep:EmitSound("weapons/grenade_launcher1.wav", 100)

	    wep:SetClip2(wep:Clip2() - 1)

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    if wep:Clip2() >= 1 then return end

	    if Ammo(wep) <= 0 then return end

	    wep:DoLHIKAnimation("reload", 2.5)

	    wep:SetNextSecondaryFire(CurTime() + 2.5)

	    wep:PlaySoundTable({
	        {s = "weapons/arccw/m203/m203_dooropen.wav", t = 0.25},
	        {s = "weapons/arccw/m203/m203_shellin.wav", t = 1.25},
	        {s = "weapons/arccw/m203/m203_doorclose.wav", t = 2},
	    })

	    local reserve = Ammo(wep)

	    reserve = reserve + wep:Clip2()

	    local clip = 1

	    local load = math.Clamp(clip, 0, reserve)

	    wep.Owner:SetAmmo(reserve - load, "smg1_grenade")

	    wep:SetClip2(load)
	end

	att.Mult_SightTime = 1.25
	att.Mult_SpeedMult = 0.8
	att.Mult_SightedSpeedMult = 0.85
	ArcCW.LoadAttachmentType(att)
end

------
-- ubgl_mass.lua
------

do
	local att = {}
	ArcCW.SetShortName("ubgl_mass")

	att.PrintName = "MASS-12 (BUCK)"
	att.Icon = Material("entities/acwatt_ubgl_mass.png")
	att.Description = "Magazine-fed bolt-action 12 gauge underbarrel shotgun."
	att.Desc_Pros = {
	    "pro.ubsg",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "info.toggleubgl"
	}
	att.AutoStats = true
	att.Slot = "ubgl"

	att.LHIK = true
	att.LHIK_Animation = true

	att.MountPositionOverride = 0

	att.Model = "models/weapons/arccw/atts/ubgl_mass.mdl"

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

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    wep:DoLHIKAnimation("fire", 1)

	    wep.Owner:FireBullets({
	        Src = wep.Owner:EyePos(),
	        Num = 8,
	        Damage = 12,
	        Force = 2,
	        Attacker = wep.Owner,
	        Dir = wep.Owner:EyeAngles():Forward(),
	        Spread = Vector(0.05, 0.05, 0.05),
	        Callback = function(_, tr, dmg)
	            local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

	            local dmgmax = 12
	            local dmgmin = 6

	            local delta = dist / 30

	            delta = math.Clamp(delta, 0, 1)

	            local amt = Lerp(delta, dmgmax, dmgmin)

	            dmg:SetDamage(amt)
	        end
	    })

	    wep:EmitSound("weapons/arccw/mag7/mag7_02.wav", 120)

	    wep:PlaySoundTable({
	        {s = "weapons/arccw/mag7/mag7_pump_back.wav", t = 0.25},
	        {s = "weapons/arccw/mag7/mag7_pump_forward.wav", t = 0.5},
	    })

	    wep:SetClip2(wep:Clip2() - 1)

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    if wep:Clip2() >= 4 then return end
	    if Ammo(wep) <= 0 then return end

	    if wep:Clip2() == 0 then

	        wep:DoLHIKAnimation("reload", 3.5)

	        wep:SetNextSecondaryFire(CurTime() + 3.5)

	        wep:PlaySoundTable({
	            {s = "weapons/arccw/mag7/mag7_clipout.wav", t = 0.5},
	            {s = "weapons/arccw/mag7/mag7_clipin.wav", t = 1.5},
	            {s = "weapons/arccw/mag7/mag7_pump_back.wav", t = 2.5},
	            {s = "weapons/arccw/mag7/mag7_pump_forward.wav", t = 2.75},
	        })

	    else

	        wep:DoLHIKAnimation("reload_part", 2.75)

	        wep:SetNextSecondaryFire(CurTime() + 2.75)

	        wep:PlaySoundTable({
	            {s = "weapons/arccw/mag7/mag7_clipout.wav", t = 0.5},
	            {s = "weapons/arccw/mag7/mag7_clipin.wav", t = 1.5},
	        })

	    end

	    local reserve = Ammo(wep)

	    reserve = reserve + wep:Clip2()

	    local clip = 4

	    local load = math.Clamp(clip, 0, reserve)

	    wep.Owner:SetAmmo(reserve - load, "buckshot")

	    wep:SetClip2(load)
	end

	att.Mult_SightTime = 1.25
	att.Mult_SpeedMult = 0.8
	att.Mult_SightedSpeedMult = 0.85
	ArcCW.LoadAttachmentType(att)
end

------
-- ubgl_mass_slug.lua
------

do
	local att = {}
	ArcCW.SetShortName("ubgl_mass_slug")

	att.PrintName = "MASS-12 (SLUG)"
	att.Icon = Material("entities/acwatt_ubgl_mass.png")
	att.Description = "Magazine-fed bolt-action 12 gauge underbarrel shotgun using slug rounds. Poor accuracy."
	att.Desc_Pros = {
	    "pro.ubsg",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "info.toggleubgl"
	}
	att.AutoStats = true
	att.Slot = "ubgl"

	att.InvAtt = "ubgl_mass"

	att.LHIK = true
	att.LHIK_Animation = true

	att.MountPositionOverride = 0

	att.Model = "models/weapons/arccw/atts/ubgl_mass.mdl"

	att.UBGL = true

	att.UBGL_PrintName = "UB (SLUG)"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_slug"
	att.UBGL_ClipSize = 4
	att.UBGL_Ammo = "buckshot"
	att.UBGL_RPM = 60
	att.UBGL_Recoil = 2
	att.UBGL_Capacity = 4

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("buckshot")
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    wep:DoLHIKAnimation("fire", 1)

	    wep.Owner:FireBullets({
	        Src = wep.Owner:EyePos(),
	        Num = 1,
	        Damage = 70,
	        Force = 2,
	        Attacker = wep.Owner,
	        Dir = wep.Owner:EyeAngles():Forward(),
	        Spread = Vector(0.01, 0.01, 0.01),
	        Callback = function(_, tr, dmg)
	            local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

	            local dmgmax = 70
	            local dmgmin = 25

	            local delta = dist / 35

	            delta = math.Clamp(delta, 0, 1)

	            local amt = Lerp(delta, dmgmax, dmgmin)

	            dmg:SetDamage(amt)
	        end
	    })

	    wep:EmitSound("weapons/arccw/mag7/mag7_02.wav", 120)

	    wep:PlaySoundTable({
	        {s = "weapons/arccw/mag7/mag7_pump_back.wav", t = 0.25},
	        {s = "weapons/arccw/mag7/mag7_pump_forward.wav", t = 0.5},
	    })

	    wep:SetClip2(wep:Clip2() - 1)

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    if wep:Clip2() >= 4 then return end
	    if Ammo(wep) <= 0 then return end

	    if wep:Clip2() == 0 then

	        wep:DoLHIKAnimation("reload", 3.5)

	        wep:SetNextSecondaryFire(CurTime() + 3.5)

	        wep:PlaySoundTable({
	            {s = "weapons/arccw/mag7/mag7_clipout.wav", t = 0.5},
	            {s = "weapons/arccw/mag7/mag7_clipin.wav", t = 1.5},
	            {s = "weapons/arccw/mag7/mag7_pump_back.wav", t = 2.5},
	            {s = "weapons/arccw/mag7/mag7_pump_forward.wav", t = 2.75},
	        })

	    else

	        wep:DoLHIKAnimation("reload_part", 2.75)

	        wep:SetNextSecondaryFire(CurTime() + 2.75)

	        wep:PlaySoundTable({
	            {s = "weapons/arccw/mag7/mag7_clipout.wav", t = 0.5},
	            {s = "weapons/arccw/mag7/mag7_clipin.wav", t = 1.5},
	        })

	    end

	    local reserve = Ammo(wep)

	    reserve = reserve + wep:Clip2()

	    local clip = 4

	    local load = math.Clamp(clip, 0, reserve)

	    wep.Owner:SetAmmo(reserve - load, "buckshot")

	    wep:SetClip2(load)
	end

	att.Mult_SightTime = 1.25
	att.Mult_SpeedMult = 0.8
	att.Mult_SightedSpeedMult = 0.85
	ArcCW.LoadAttachmentType(att)
end

