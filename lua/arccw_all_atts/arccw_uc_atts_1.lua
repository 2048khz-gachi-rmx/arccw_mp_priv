local Material = ArcCW.AttachmentMat

------
-- uc_40mm_airburst.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_40mm_airburst")

	att.PrintName = "40mm Airburst Grenades"
	att.AbbrevName = "Airburst"
	att.Icon = Material("entities/att/arccw_uc_40mm_generic.png", "mips smooth")
	att.Description = "Grenades filled with fragmentation. While usually detonated by a time fuse, this one has been modified to detonate by proximity. Intended for indirect fire, the projectile is slow and has high drag, with a safety fuse to prevent point-blank detonations."
	att.Desc_Pros = {
	    "uc.40mm.airburst",
	    "uc.40mm.proximity",
	}
	att.Desc_Cons = {
	    "uc.40mm.nodmg",
	    "uc.40mm.arm",
	    "uc.40mm.drag.high",
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_40mm"
	att.AutoStats = true
	att.Override_ShootEntity = "arccw_uc_40mm_airburst"
	att.Mult_MuzzleVelocity = 0.75
	att.Mult_ShootPitch = 0.9
	att.ActivateElements = {"40mm_airburst"}
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_40mm_buckshot.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_40mm_buckshot")

	att.PrintName = "40mm Buckshot Grenades"
	att.AbbrevName = "Buckshot"
	att.Icon = Material("entities/att/arccw_uc_40mm_generic.png", "mips smooth")
	att.Description = "Officially desginated the 'Multiple Projectile Anti Personnel' ammunition, these grenades are effectively large buckshot rounds containing 20 pellets.\nIntended to be used when the enemy is too close to use explosives."
	att.Desc_Pros = {
	    "uc.40mm.buckshot"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_40mm"
	att.AutoStats = true
	att.Override_ShootEntity = false
	att.Override_Num = 20
	att.Override_Damage = 18 * 20
	att.Override_DamageMin = 6 * 20
	att.Override_Range = 50
	att.Override_RangeMin = 5
	att.Override_HullSize = 4
	att.Override_AccuracyMOA = 50
	att.ActivateElements = {"40mm_buckshot"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_shotgun"
	end
	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return ")^/arccw_uc/common/gl_fire_buck.ogg" end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then
	        return ")^/arccw_uc/common/gl_fire_buck_dist.ogg" end
	end
	if engine.ActiveGamemode() == "urbanstrife" then
	    att.PenetrationAmmoType = "buckshot"
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_40mm_caseless.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_40mm_caseless")

	att.PrintName = "40mm Caseless Grenades"
	att.AbbrevName = "Caseless"
	att.Icon = Material("entities/att/arccw_uc_40mm_caseless.png", "mips smooth")
	att.Description = "Russian caseless VOG-25 grenades converted for use in regular tubes.\nWithout the need to remove an empty case, these can be reloaded faster; but the caseless design also means less propellant and less explosive power."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_40mm"
	att.AutoStats = true
	att.Mult_ReloadTime = 0.78
	att.Mult_MuzzleVelocity = 0.85
	att.Mult_Damage = 0.75
	att.Mult_DamageMin = 0.75
	att.Mult_ShootPitch = 1.1
	att.ActivateElements = {"40mm_caseless"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_caseless"
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_40mm_dp.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_40mm_dp")

	att.PrintName = "40mm Dual Purpose Grenades"
	att.AbbrevName = "Dual Purpose"
	att.Icon = Material("entities/att/arccw_uc_40mm_generic.png", "mips smooth")
	att.Description = "Grenades with a shaped charge for armor penetration, allowing it to punch through thin walls or deal massive impact damage to enemies or vehicles."
	att.Desc_Pros = {
	    "uc.40mm.hedp",
	    "uc.40mm.impact"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_40mm"
	att.Override_ShootEntity = "arccw_uc_40mm_dp"
	att.AutoStats = true
	att.Mult_Damage = 0.6
	att.Mult_DamageMin = 0.6
	att.ActivateElements = {"40mm_dp"}
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_40mm_flash.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_40mm_flash")

	att.PrintName = "40mm Stun Grenades" -- trol
	att.AbbrevName = "Stun"
	att.Icon = Material("entities/att/arccw_uc_40mm_generic.png", "mips smooth")
	att.Description = "Less-than-lethal grenades that create a blinding flash and deafening bang.\nWhile typically used as hand grenades, the larger projectile allows for a more visible and audible effect."
	att.Desc_Pros = {
	    "uc.40mm.flash"
	}
	att.Desc_Cons = {
	    "uc.40mm.nodmg"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_40mm"
	att.Override_ShootEntity = "arccw_uc_40mm_flash"
	att.AutoStats = true
	--att.Mult_Recoil = 1
	att.ActivateElements = {"40mm_flash"}
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_40mm_hornetnest.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_40mm_hornetnest")

	att.PrintName = "40mm 'Hornet's Nest' Grenades"
	att.AbbrevName = "Hornet's Nest"
	att.Icon = Material("entities/att/arccw_uc_40mm_generic.png", "mips smooth")
	att.Description = "Aftermarket grenades that fit 16 .22 LR cartridges.\nMade to circumvent legal restrictions, these grenades are less lethal but more accurate than an equivalent 40mm buckshot round."
	att.Desc_Pros = {
	    "uc.40mm.hornet"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_40mm"
	att.AutoStats = true
	att.Override_ShootEntity = false
	att.Override_Num = 16
	att.Override_Damage = 12 * 16
	att.Override_DamageMin = 5 * 16
	att.Override_Range = 60
	att.Override_RangeMin = 15
	att.Override_HullSize = 2
	att.Override_AccuracyMOA = 25
	att.Mult_Recoil = 0.4
	-- att.Mult_AccuracyMOA = 1
	att.ActivateElements = {"40mm_hornetnest"}
	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return ")^/arccw_uc/common/gl_fire_hornet.ogg" end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then
	        return ")^/arccw_uc/common/gl_fire_hornet_dist.ogg" end
	end
	if engine.ActiveGamemode() == "urbanstrife" then
	    att.PenetrationAmmoType = "plinking"
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_40mm_hv.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_40mm_hv")

	att.PrintName = "40mm High Velocity Grenades"
	att.AbbrevName = "High Velocity"
	att.Icon = Material("entities/att/arccw_uc_40mm_generic.png", "mips smooth")
	att.Description = "Fin-stabilized, lightweight grenade with explosive payload.\nFlies fast and with low drag, but creates a smaller and less lethal explosion."
	att.Desc_Pros = {
	    "uc.40mm.drag.low"
	}
	att.Desc_Cons = {
	    "uc.40mm.blast.low"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_40mm"
	att.Override_ShootEntity = "arccw_uc_40mm_hv"
	att.AutoStats = true
	att.Mult_Damage = 0.7
	att.Mult_DamageMin = 0.7
	att.Mult_MuzzleVelocity = 1.5
	att.Mult_ShootPitch = 1.15
	att.ActivateElements = {"40mm_hv"}
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_40mm_incendiary.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_40mm_incendiary")

	att.PrintName = "40mm Incendiary Grenades" -- trol
	att.AbbrevName = "Incendiary"
	att.Icon = Material("entities/att/arccw_uc_40mm_generic.png", "mips smooth")
	att.Description = "Hand-made grenades loaded with a fuel mixture that disperses on impact, burning an area over time."
	att.Desc_Pros = {
	    "uc.40mm.incendiary"
	}
	att.Desc_Cons = {
	    "uc.40mm.mindmg"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_40mm"
	att.AutoStats = true
	att.Override_ShootEntity = "arccw_uc_40mm_incendiary"
	--att.Mult_Recoil = 1
	att.ActivateElements = {"40mm_incendiary"}
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_40mm_napalm.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_40mm_napalm")

	att.PrintName = "40mm Napalm Grenades"
	att.AbbrevName = "Napalm"
	att.Icon = Material("entities/att/arccw_uc_40mm_generic.png", "mips smooth")
	att.Description = "Extremely illegal airburst grenades loaded with sticky napalm.\nWhile the napalm only disperses in a small radius, it will stick onto targets that come into contact with it, causing a gruesome and fiery death."
	att.Desc_Pros = {
	    "uc.40mm.napalm",
	    "uc.40mm.proximity",
	}
	att.Desc_Cons = {
	    "uc.40mm.nodmg",
	    "uc.40mm.arm",
	    "uc.40mm.drag.high",
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_40mm"
	att.AutoStats = true
	att.Override_ShootEntity = "arccw_uc_40mm_napalm"
	att.Mult_ShootPitch = 0.95
	att.ActivateElements = {"40mm_napalm"}
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_ammo_ap.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_ammo_ap")

	att.PrintName = "\"AP\" Armor-piercing Rounds"
	att.AbbrevName = "\"AP\" Armor-piercing"
	att.SortOrder = 5
	att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
	att.Description = "Bullets designed to penetrate body armor, usually built around a penetrator of hardened steel, tungsten, or tungsten carbide.\nUpon impact on a hard target, the case is destroyed, but the penetrator continues its motion and penetrates the target."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_ammo"
	att.AutoStats = true
	att.Mult_Range = 2
	att.Mult_Penetration = 2
	att.Mult_Damage = 0.85
	att.Mult_DamageMin = 0.85
	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_ammo_jhp.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_ammo_jhp")

	att.PrintName = "\"JHP\" Jacketed Hollow-point Rounds"
	att.AbbrevName = "\"JHP\" Jacketed Hollow-point"
	att.SortOrder = 4
	att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
	att.Description = "A type of bullet with a hollow tip that expands on impact, causing a more lethal hit without penetrating further than necessary.\nFor use in environments where over-penetration could cause collateral damage."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_ammo"
	att.AutoStats = true
	att.Mult_Penetration = 0.25
	att.Mult_Damage = 1.17
	att.Mult_DamageMin = 0.85
	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_ammo_jsp.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_ammo_jsp")

	att.PrintName = "\"JSP\" Jacketed Soft-point Rounds"
	att.AbbrevName = "\"JSP\" Jacketed Soft-point"
	att.SortOrder = 3
	att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
	att.Description = "Bullets with an exposed lead tip that expands on impact.\nThese expose the soft lead-alloy core deformed when striking a target."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_ammo"
	att.AutoStats = true
	att.Mult_Penetration = 0.6
	att.Mult_Damage = 1.1
	att.Mult_Range = 0.8
	att.Mult_RangeMin = 1.4
	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_ammo_lowtr.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_ammo_lowtr")

	att.PrintName = "\"TR\" Near-empty tracers"
	att.SortOrder = 1
	att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
	att.Description = "The last 5 rounds of the magazine are tracer rounds, providing a visual indication when the magazine is almost empty."
	att.Desc_Pros = {
	    "uc.lowind"
	}
	att.Desc_Cons = {
	    "uc.tracer"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_ammo"
	att.InvAtt = "uc_ammo_tr"
	att.AutoStats = true
	att.Mult_HipDispersion = 0.95
	att.Hook_AddShootSound = function(wep, data)
	    local clip = wep:Clip1()
	    if clip <= 5 and clip > 0 then
	        wep:MyEmitSound("physics/metal/metal_computer_impact_bullet3.wav", data.volume, data.pitch + (5 - clip) * 7, 0.2, CHAN_AUTO)
	    end
	end
	att.Override_TracerFinalMag = 6
	att.Override_TracerFinal = "arccw_uc_tracer"
	att.ToggleStats = {
	    {
	        PrintName = "White",
	        Override_PhysTracerProfile = 8
	    },
	    {
	        PrintName = "Green",
	        Override_PhysTracerProfile = 2
	    },
	    {
	        PrintName = "Red",
	        Override_PhysTracerProfile = 1
	    },
	}
	--[[]
	att.Override_TracerFinalMag = 5 -- this doesn't actually work like this, you know
	att.ToggleStats = {
	    {
	        PrintName = "Red",
	        Override_PhysTracerProfile = 1
	    },
	    {
	        PrintName = "Green",
	        Override_PhysTracerProfile = 2
	    },
	    {
	        PrintName = "Violet",
	        Override_PhysTracerProfile = 5
	    },
	    {
	        PrintName = "Yellow",
	        Override_PhysTracerProfile = 4
	    },
	}
	]]
	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_ammo_sg_baton.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_ammo_sg_baton")

	att.PrintName = "\"BATON\" Flexible Baton"
	att.SortOrder = -1
	att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
	att.Description = [[Less-lethal law enforcement round that fires a cushioned, low-velocity "bean bag" filled with lead pellets.
	Designed to apprehend targets through pain instead of killing them, though the 40-gram projectile can still inflict deadly or permanent injuries.
	Only compatible with manual action shotguns due to a weak pressure curve.]]
	att.Desc_Pros = {
	    "Targets may drop their weapon",
	}
	att.Desc_Cons = {
	    "uc.alwaysphys",
	}
	att.Desc_Neutrals = {
	    "uc.oneprojectile"
	}
	att.Slot = {"ud_ammo_shotgun","uc_ammo"}
	att.AutoStats = true
	att.Override_Num = 1
	att.Override_Num_Priority = 2
	att.Mult_Recoil = .5
	local path = ")^arccw_uc/common/"
	att.Hook_PhysBulletHit = function(wep,data)
	    if CLIENT then return end
	    local tr = data.tr
	    local bullet = data.bullet
	    if tr.Entity and (tr.Entity:IsPlayer() or tr.Entity:IsNPC()) and tr.Entity:GetActiveWeapon() then
	        local delta = bullet.Travelled / (bullet.Range / ArcCW.HUToM)
	        delta = math.Clamp(delta, 0, 1)
	        local dmg = Lerp(delta, bullet.DamageMax, bullet.DamageMin) -- one day I will understand this math
	        local chance = math.random() * bullet.DamageMax
	        -- if tr.HitGroup == HITGROUP_LEFTARM or tr.HitGroup == HITGROUP_RIGHTARM then
	        --     chance = chance * 2
	        -- end
	        if chance <= dmg * .75 then -- Chance for a weapon drop increases the closer the shooter is to the target, but is never guaranteed
	            tr.Entity:DropWeapon()
	            if tr.Entity:IsPlayer() then
	                tr.Entity:ScreenFade(1,Color(128,0,0,64),.5,0)
	                tr.Entity:ViewPunch(Angle(3,0,0))
	            end
	        end
	    end
	end
	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "shotgun-lesslethal-01.ogg", path .. "shotgun-lesslethal-02.ogg"} end
	    --if fsound == wep.ShootSoundSilenced then return path .. "shotgun-lesslethal_sup.ogg" end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound or distantsound == wep.DistantShootSoundSilenced then return false 
	    end
	end
	att.Mult_Damage = .2
	att.Mult_DamageMin = .2
	att.Mult_Penetration = 0
	att.Mult_Range = .33
	att.Mult_RangeMin = .33
	att.Override_AlwaysPhysBullet = true
	--att.Override_PhysBulletMuzzleVelocity = 80
	att.Hook_Compatible = function(wep)
	    if !wep.ManualAction or !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_ammo_sg_bird.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_ammo_sg_bird")

	att.PrintName = "\"BIRD\" #9 Birdshot"
	att.SortOrder = 4
	att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
	att.Description = [[Hunting rounds with a wide spread and a very large number of pellets, designed to shoot birds out of the sky.
	While not as lethal as buckshot, the loose clump spread makes it easier to hit small or multiple targets.]]
	att.Desc_Pros = {
	    "uc.pellet.24"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = {"ud_ammo_shotgun","uc_ammo"}
	att.AutoStats = true
	att.Add_Num = 24
	att.Mult_Damage = .9
	att.Mult_DamageMin = .8
	att.Mult_Recoil = .85
	att.Mult_AccuracyMOA = 3
	-- it's payday, fellas
	att.Add_HullSize = 1
	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_ammo_sg_drgn.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_ammo_sg_drgn")

	att.PrintName = "\"DRGN\" Dragon's Breath"
	att.SortOrder = -1
	att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
	att.Description = [[Novelty magnesium-based round that projects a spectacular jet of sparks and fire.
	Burning at over 3,000 °F, the blast isn't immediately lethal, but can easily set objects and people ablaze.
	Only compatible with manual action shotguns due to a weak pressure curve.]]
	att.Desc_Pros = {
	    "pro.ignite",
	    "uc.pellet.24"
	}
	att.Desc_Cons = {
	    "uc.dragon",
	    "uc.alwaysphys",
	}
	att.Desc_Neutrals = {
	}
	att.Slot = {"ud_ammo_shotgun","uc_ammo"}
	att.AutoStats = true
	--att.Override_DamageType = DMG_BURN
	att.Add_Num = 24
	-- att.Hook_PostBulletHit = function(wep,data)
	--     if SERVER and data.tr.Entity then
	--         local dur = 6 - (data.range * 2) / wep.Range
	--         if dur > 0 then
	--             data.tr.Entity:Ignite(dur)
	--         end
	--     end
	-- end
	att.Hook_PhysBulletHit = function(wep,data)
	    if SERVER and data.tr.Entity then
	        local dur = 6 - (data.bullet.Travelled * 2 * ArcCW.HUToM) / wep.Range
	        if dur > 0 then
	            data.tr.Entity:Extinguish() -- Entity:Ignite() doesn't work if it's already on fire, gotta prevent that DPS loss
	            data.tr.Entity:Ignite(dur)
	        end
	    end
	    local effect = EffectData()
	    effect:SetOrigin(data.tr.HitPos)
	    util.Effect("StunstickImpact",effect)
	    -- if data.tr.HitWorld and math.random(1,3) == 3 then
	    --     util.Decal("FadingScorch",data.tr.HitPos - data.tr.HitNormal,data.tr.HitPos + data.tr.HitNormal) -- this is too spammy
	    -- end
	end
	att.Mult_AccuracyMOA = 1.5
	att.Mult_Damage = .5
	att.Mult_DamageMin = .5
	att.Mult_Penetration = .5
	att.Mult_Range = .35
	att.Override_AlwaysPhysBullet = true
	att.Mult_PhysBulletGravity = 3
	--att.Override_PhysTracerProfile = 1
	att.Override_MuzzleEffect = "muzzleflash_dragonbreath"
	att.Hook_AddShootSound = function(wep, data)
	    wep:EmitSound("DB_ADD",data.volume,data.pitch,1,CHAN_WEAPON - 1) -- lua/arccw/shared/sh_0_uc.lua
	end
	att.Hook_Compatible = function(wep)
	    if !wep.ManualAction or !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_ammo_sg_flech.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_ammo_sg_flech")

	att.PrintName = "\"FLECH\" Flechettes"
	att.SortOrder = 3
	att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
	att.Description = [[Payload consisting of heavy, aerodynamic metal darts, which have less clump spread and more penetration than buckshot.]]
	att.Desc_Pros = {
	    "uc.pellet.8",
	    "uc.penetration.12"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = {"ud_ammo_shotgun","uc_ammo"}
	att.AutoStats = true
	att.Add_Num = 8
	att.Mult_AccuracyMOA = .5
	att.Add_Penetration = 12
	att.Mult_Range = .75
	att.Mult_Damage = .8
	att.Mult_HullSize = 0.5
	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_ammo_sg_frag.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_ammo_sg_frag")

	att.PrintName = "\"HE\" FRAG-12"
	att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
	att.Description = [[Shotgun slug with a small high-explosive warhead. On impact, the round saturates its surroundings with shrapnel like a frag grenade.
	Meant for breaching, but it can also useful for applying damage over an area.
	Beware: the explosion doesn't care who it hurts.]]
	att.Desc_Pros = {
	    "uc.explode"
	}
	att.Desc_Cons = {
	    "uc.alwaysphys",
	}
	att.Desc_Neutrals = {
	    "uc.oneprojectile"
	}
	att.SortOrder = 2
	att.Slot = {"ud_ammo_shotgun","uc_ammo"}
	att.Mult_Penetration = 0.1
	att.Mult_Damage = 0.5
	att.Mult_DamageMin = 0.5
	att.Mult_Range = .5
	att.Mult_HipDispersion = 1.5
	att.Override_Num = 1
	att.Override_Num_Priority = 99
	att.AutoStats = true
	att.Override_HullSize = 0
	att.GivesFlags = {"uc_slug"}
	att.Override_AlwaysPhysBullet = true
	att.Mult_PhysBulletGravity = 1.5
	att.Override_PhysBulletImpact = false
	--[[]
	local function BulletHit(wep, data)
	    if data.damage then
	        util.BlastDamage(wep, wep:GetOwner(), data.tr.HitPos, 128, data.damage)
	        local eff = EffectData()
	        eff:SetOrigin(data.tr.HitPos)
	        util.Effect("Explosion", eff)
	        util.Decal("Scorch", data.tr.HitPos - data.tr.HitNormal, data.tr.HitPos + data.tr.HitNormal, ents.GetAll())
	    end
	end
	att.Hook_BulletHit = BulletHit
	]]
	att.Hook_PhysBulletHit = function(wep, data)
	    if SERVER then
	    local delta = data.bullet.Travelled / (data.bullet.Range / ArcCW.HUToM)
	    delta = math.Clamp(delta, 0, 1)
	    local dmg = Lerp(delta, data.bullet.DamageMax, data.bullet.DamageMin)
	    util.BlastDamage(wep, wep:GetOwner(), data.tr.HitPos, 128, dmg)
	    local eff = EffectData()
	    eff:SetOrigin(data.tr.HitPos)
	    eff:SetMagnitude(4)
	    eff:SetScale(0.5)
	    eff:SetRadius(4)
	    util.Effect("Sparks", eff)
	    util.Effect("Explosion", eff)
	    util.Decal("Scorch", data.tr.HitPos - data.tr.HitNormal, data.tr.HitPos + data.tr.HitNormal, ents.GetAll())
	    end
	end
	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_ammo_sg_slug.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_ammo_sg_slug")

	att.PrintName = "\"SLUG\" Full-Bore Slug"
	att.SortOrder = 1
	att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
	att.Description = [[A single heavy projectile, comparable in performance to a high-caliber rifle cartridge at close to medium range.
	Applicable in situations that require marksmanship and minimal collateral damage.]]
	att.Desc_Pros = {
	    "uc.penetration.8"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "uc.oneprojectile"
	}
	att.Slot = {"ud_ammo_shotgun","uc_ammo"}
	att.AutoStats = true
	att.Override_Num = 1
	att.Override_Num_Priority = 2
	att.Mult_Damage = .75
	att.Mult_DamageMin = .5
	att.Mult_AccuracyMOA = .3
	att.Add_Penetration = 8
	att.Mult_RangeMin = 2
	att.Mult_Range = 2.5
	att.Mult_HipDispersion = 2
	att.Override_HullSize = 0
	att.GivesFlags = {"uc_slug"}
	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_ammo_tmj.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_ammo_tmj")

	att.PrintName = "\"TMJ\" Total Metal Jacket Rounds"
	att.AbbrevName = "\"TMJ\" Total Metal Jacket"
	att.SortOrder = 2
	att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
	att.Description = "Bullet entirely encased in a thin jacket of metal over a core of different metal to protect it from abrasion or corrosion.\nProtecting the base of a lead-core bullet from burning powder gas may prevent molten lead from being released as a fine spray in turbulent gas leaving the muzzle of a firearm."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_ammo"
	att.AutoStats = true
	att.Mult_DamageMin = 1.15
	att.Mult_Damage = 0.9
	att.Mult_RangeMin = 0.8
	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_ammo_tr.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_ammo_tr")

	att.PrintName = "\"TR\" Tracer Rounds"
	att.AbbrevName = "\"TR\" Tracer"
	att.SortOrder = 1
	att.Icon = Material("entities/att/arccw_uc_ammo_generic.png", "mips smooth")
	att.Description = "A pyrotechnic charge inside the bullet creates a bright, colorful trail behind it during flight. The bright trails help predict ballistic trajectories without using sights."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.tracer"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_ammo"
	att.AutoStats = true
	att.Mult_HipDispersion = 0.85
	att.ToggleStats = {
	    {
	        PrintName = "Green",
	        Override_PhysTracerProfile = 2
	    },
	    {
	        PrintName = "Red",
	        Override_PhysTracerProfile = 1
	    },
	    {
	        PrintName = "White",
	        Override_PhysTracerProfile = 8
	    },
	}
	att.Override_Tracer = "arccw_uc_tracer"
	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_choke_cyl.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_choke_cyl")

	att.PrintName = "Cylinder Choke"
	att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
	att.Description = "A mildly tight shotgun choke. Tightens pellet spread at the cost of straight recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = {"choke","muzzle"}
	att.AutoStats = true
	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then
	        return false
	    end
	end
	att.Mult_Recoil = 1.1
	att.Mult_AccuracyMOA = .9
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_choke_full.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_choke_full")

	att.PrintName = "Full Choke"
	att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
	att.Description = "A very tight choke for shotguns, noticably tightening spread. However, it tends to offset aiming."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.disp.100"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = {"choke","muzzle"}
	att.AutoStats = true
	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then
	        return false
	    end
	end
	att.Mult_Recoil = 1.25
	att.Mult_RecoilSide = 1.5
	att.Mult_AccuracyMOA = .7
	att.Add_HipDispersion = 100
	att.Add_SightsDispersion = 100
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_choke_rifled.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_choke_rifled")

	att.PrintName = "Rifled Choke"
	att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
	att.Description = "A special choke that improves the aerodynamics of slug rounds. It is not as effective as a fully rifled barrel."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "uc.reqslug"
	}
	att.Slot = {"choke","muzzle"}
	att.AutoStats = true
	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then
	        return false
	    end
	end
	att.Mult_AccuracyMOA = .7
	att.Mult_HipDispersion = 1.15
	att.Mult_Recoil = 1.05
	att.RequireFlags = {"uc_slug"}
	att.GivesFlags = {"uc_choke_rifled"}
	att.ExcludeFlags = {"uc_fg_sg_rifled"}
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_choke_wide.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_choke_wide")

	att.PrintName = "Wide Choke"
	att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
	att.Description = "A loose choke that widens pellet spread, potentailly making targets easier to hit."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = {"choke","muzzle"}
	att.AutoStats = true
	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then
	        return false
	    end
	end
	att.Mult_Recoil = 0.75
	att.Mult_AccuracyMOA = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_fg_autotrigger.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_fg_autotrigger")

	att.PrintName = "Forced Reset Trigger"
	att.Icon = Material("entities/att/arccw_uc_forcedresettrigger.png", "mips smooth")
	att.Description = "Trigger system that pushes back against the shooter's finger, allowing them to fire much more rapidly. By the definition of the ATF, this does not count as full-automatic, for the time being at least."
	att.Desc_Pros = {
	    "uc.auto"
	}
	att.Desc_Cons = {
	    "uc.frcd_visrec"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_fg"
	att.AutoStats = true
	att.SortOrder = 2
	att.Hook_Compatible = function(wep)
	    if wep:GetIsManualAction() then return false end
	    -- for i, v in pairs(wep.Firemodes) do
	    --     if !v then continue end
	    --     if !v.Mode then continue end
	    --     if v.Mode == 2 then
	    --         -- Not available if gun has automatic firemode
	    --         return false
	    --     -- elseif v.Mode < 0 then
	    --     --     -- Use burst variant
	    --     --     return false
	    --     end
	    -- end
	end
	att.Override_Firemodes_Priority = 100
	att.Override_Firemodes = {
	    {
	        PrintName = "fcg.frcd",
	        Mode = 2,
	    },
	    {
	        Mode = 0
	    }
	}
	--att.Mult_RPM = 1.25
	att.Mult_RecoilSide = 1.25
	att.Mult_VisualRecoilMult = 2
	att.Mult_MalfunctionMean = .85
	att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_fg_autotrigger_burst.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_fg_autotrigger_burst")

	att.PrintName = "Forced Reset Trigger"
	att.Icon = Material("entities/att/arccw_uc_forcedresettrigger.png", "mips smooth")
	att.Description = "Trigger system that pushes back against the shooter's finger, allowing them to fire much more rapidly. By the definition of the ATF, this does not count as full-automatic, for the time being at least."
	att.Desc_Pros = {
	    "uc.auto"
	}
	att.Desc_Cons = {
	    "uc.frcd_visrec"
	}
	att.Desc_Neutrals = {
	    "uc.frcd_burst"
	}
	att.Slot = "uc_fg"
	att.AutoStats = true
	att.InvAtt = "ud_fg_autotrigger"
	att.SortOrder = 2
	att.Hook_Compatible = function(wep)
	    if wep:GetIsManualAction() then return false end
	    local burst = false
	    for i, v in pairs(wep.Firemodes) do
	        if !v then continue end
	        if !v.Mode then continue end
	        if v.Mode == 2 then
	            -- Not available if gun has automatic firemode
	            return false
	        elseif v.Mode < 0 then
	            -- Burst *needed* for this variant
	            burst = true
	        end
	    end
	    if !burst then return false end
	end
	att.Override_Firemodes_Priority = 100
	att.Override_Firemodes = {
	    {
	        PrintName = "fcg.frcd",
	        Mode = 2,
	    },
	    {
	        Mode = 0
	    }
	}
	att.Mult_RPM = .75
	att.Mult_RecoilSide = 1.25
	att.Mult_VisualRecoil = 2
	att.Ignore = true
	att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_fg_binary.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_fg_binary")

	att.PrintName = "Binary Trigger"
	att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
	att.Description = "you pull it to fire a shot. you release it to fire a shot. like 2 bullet"
	att.Desc_Pros = {
	    "Binary fire"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_fg"
	att.Ignore = true -- as i was writing htis i got headache
	att.AutoStats = true
	att.NotForNPCS = true
	att.SortOrder = 2
	att.Hook_Compatible = function(wep)
	    if wep:GetIsManualAction() then
	        return false
	    end
	end
	att.Override_Firemodes_Priority = 100
	att.Override_Firemodes = {
	    {
	        PrintName = "BINARY",
	        Mode = -2,
	    },
	    {
	        Mode = 0
	    }
	}
	att.Hook_Think = function(wep)
	    if IsFirstTimePredicted() and wep:GetOwner():KeyReleased(IN_ATTACK) then
	        wep:PrimaryAttack()
	    end
	end
	att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_fg_civvy.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_fg_civvy")

	att.PrintName = "Competition Internals"
	att.Icon = Material("entities/att/arccw_uc_fg_civvy.png", "smooth mips")
	att.Description = "High quality, precision manufactured aftermarket parts that improve weapon performance. Because of the parts' civilian origin, the fire control group doesn't support automatic fire."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.semionly"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_fg"
	att.AutoStats = true
	att.Hook_Compatible = function(wep)
	    if wep:GetIsManualAction() then
	        return false
	    end
	end
	att.Override_Firemodes = {
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}
	att.Override_Firemodes_Priority = 10
	att.Mult_Range = 1.25
	att.Mult_AccuracyMOA = 0.5
	att.Mult_RPM = .9
	att.Mult_MalfunctionMean = 1.5
	att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_fg_deeprifling.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_fg_deeprifling")

	att.PrintName = "Deep Rifling"
	att.Icon = Material("entities/att/arccw_uc_deeprifling.png", "mips smooth")
	att.Description = "A custom tailored rifling scheme allows bullets to strike with greater impact, penetrating deeper."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_fg"
	att.AutoStats = true
	att.SortOrder = 1
	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then
	        return false
	    end
	end
	att.Mult_Penetration = 1.25
	att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_fg_dualstage.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_fg_dualstage")

	att.PrintName = "Dual-Stage Trigger"
	att.Icon = Material("entities/att/arccw_uc_dualstagetrigger.png", "mips smooth")
	att.Description = "A heavy trigger with a semi-automatic middle stage and a fully-automatic end stage. Can shoot semi- and fully- automatically without the need for switching a fire selector."
	att.Desc_Pros = {
	    "uc.dualstage.pro"
	}
	att.Desc_Cons = {
	    "uc.dualstage.con"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_fg"
	att.Hook_Compatible = function(wep)
	    if wep:GetIsManualAction() then
	        return false
	    end
	end
	att.SortOrder = 2
	att.Hook_Compatible = function(wep)
	    if wep:GetIsManualAction() then
	        return false
	    end
	    for i, v in pairs(wep.Firemodes) do
	        if !v then continue end
	        if v.Mode and v.Mode != 1 and v.Mode != 0 then
	            return
	        end
	    end
	    return false
	end
	--att.Override_ShotRecoilTable = {0.7}
	function att.Hook_ModifyRPM(wep, delay)
	    if wep:GetBurstCount() > 0 then
	        return delay * .95
	    else
	        return delay * 1.5
	    end
	end
	att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_fg_heavy.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_fg_heavy")

	att.PrintName = "Heavy Bolt"
	att.Icon = Material("entities/att/arccw_uc_heavybolt.png", "mips smooth")
	att.Description = "Heavyweight bolt springs reduce the cyclic rate of the weapon while improving its controllability."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_fg"
	att.AutoStats = true
	att.SortOrder = 3
	att.Mult_Recoil = .9
	att.Mult_RPM = .75
	att.Hook_Compatible = function(wep)
	    if wep:GetIsManualAction() then
	        return false
	    end
	end
	att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_fg_heavy_manual.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_fg_heavy_manual")

	att.PrintName = "Heavy Bolt"
	att.Icon = Material("entities/att/arccw_uc_heavybolt.png", "mips smooth")
	att.Description = "Heavyweight bolt that slows down cycling but improves recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_fg"
	att.AutoStats = true
	att.InvAtt = "ud_fg_heavy"
	att.SortOrder = 3
	att.Mult_Recoil = 0.75
	att.Mult_CycleTime = 1.1
	att.Hook_Compatible = function(wep)
	    if not wep:GetIsManualAction() then
	        return false
	    end
	end
	att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_fg_light.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_fg_light")

	att.PrintName = "Light Bolt"
	att.Icon = Material("entities/att/arccw_uc_lightbolt.png", "mips smooth")
	att.Description = "A low weight set of bolt components increase the cyclic speed of the weapon, at the cost of recoil absorption."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_fg"
	att.AutoStats = true
	att.SortOrder = 3
	att.Mult_Recoil = 1.25
	att.Mult_RPM = 1.1
	att.Hook_Compatible = function(wep)
	    if wep:GetIsManualAction() then
	        return false
	    end
	end
	att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_fg_light_manual.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_fg_light_manual")

	att.PrintName = "Light Bolt"
	att.Icon = Material("entities/att/arccw_uc_lightbolt.png", "mips smooth")
	att.Description = "A low weight set of bolt components that speeds up bolt handling but increases recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_fg"
	att.AutoStats = true
	att.SortOrder = 3
	att.InvAtt = "ud_fg_light"
	att.Mult_Recoil = 1.25
	att.Mult_CycleTime = 0.9
	att.Hook_Compatible = function(wep)
	    if not wep:GetIsManualAction() then
	        return false
	    end
	end
	att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_fg_lightweight.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_fg_lightweight")

	att.PrintName = "Lightweight Construction"
	--att.Icon = Material("entities/att/arccw_uc_matchgradetrigger.png", "mips smooth")
	att.Description = "Custom-made components optimized for low weight result in a less physically demanding weapon."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = {"uc_fg","uc_fg_singleshot"}
	att.SortOrder = 1.5
	att.AutoStats = true
	att.Mult_SpeedMult = 1.075
	att.Mult_Recoil = 1.075
	att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
	att.Ignore = true
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_fg_longrifling.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_fg_longrifling")

	att.PrintName = "Long Rifling"
	att.Icon = Material("entities/att/arccw_uc_longrifling.png", "mips smooth")
	att.Description = "Custom rifling improves muzzle velocity, allowing the weapon to shoot further."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = {"uc_fg","uc_fg_singleshot"}
	att.AutoStats = true
	att.SortOrder = 1
	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then
	        return false
	    end
	end
	att.Mult_Range = 1.1
	att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_fg_loosesprings.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_fg_loosesprings")

	att.PrintName = "Loose Springs"
	att.Icon = Material("entities/att/arccw_uc_loosesprings.png", "mpis smooth")
	att.Description = "With help from some loose magazine springs, it is possible to stuff more ammo in a magazine than is usually recommended."
	att.Desc_Pros = {
	    "uc.loosesprings"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_fg"
	att.AutoStats = true
	function att.Hook_GetCapacity(wep,cap)
	    return math.max(cap + 1, math.floor(cap * 1.08))
	end
	att.Hook_Compatible = function(wep)
	    if wep:GetCapacity() == 1 then return false end
	end
	att.Mult_RPM = .85
	att.Mult_MalfunctionMean = 0.9
	att.GivesFlags = {"ud_loosesprings"}
	att.ExcludeFlags = {"ud_underload"}
	att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_fg_match.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_fg_match")

	att.PrintName = "Match Trigger"
	att.Icon = Material("entities/att/arccw_uc_matchgradetrigger.png", "mips smooth")
	att.Description = "Hair trigger for competition shooting allows crisp trigger pulls, improving first shot performance."
	att.Desc_Pros = {
	    "uc.match.1",
	    "uc.match.2",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = {"uc_fg"}
	att.SortOrder = 2
	att.AutoStats = true
	att.Hook_Compatible = function(wep)
	    if wep:GetIsManualAction() or wep:GetIsShotgun() then
	        return false
	    end
	end
	att.Override_ShotRecoilTable = {[1] = 0.75}
	att.Mult_TriggerDelayTime = 0.25
	--[[]
	att.M_Hook_Mult_AccuracyMOA = function(wep, data)
	    if wep:GetBurstCount() == 0 then
	        data.mult = data.mult * 0.5
	    end
	end
	]]
	att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_fg_match_single.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_fg_match_single")

	att.PrintName = "Match Trigger"
	att.Icon = Material("entities/att/arccw_uc_matchgradetrigger.png", "mips smooth")
	att.Description = "Hair trigger for competition shooting allows crisp trigger pulls, improving first shot performance."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = {"uc_fg_singleshot"}
	att.SortOrder = 2
	att.AutoStats = true
	att.Hook_Compatible = function(wep)
	    if wep:GetIsManualAction() or wep:GetIsShotgun() then
	        return false
	    end
	end
	att.Mult_Recoil = .75
	--[[]
	att.M_Hook_Mult_AccuracyMOA = function(wep, data)
	    if wep:GetBurstCount() == 0 then
	        data.mult = data.mult * 0.5
	    end
	end
	]]
	att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_fg_preciserifling.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_fg_preciserifling")

	att.PrintName = "Precision Rifling"
	att.Icon = Material("entities/att/arccw_uc_precisionrifling.png", "mips smooth")
	att.Description = "High-precision machined rifling allows the weapon to shoot much more consistently."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = {"uc_fg","uc_fg_singleshot"}
	att.AutoStats = true
	att.SortOrder = 1
	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then
	        return false
	    end
	end
	att.Mult_AccuracyMOA = 0.75
	att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_fg_sg_rifled.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_fg_sg_rifled")

	att.PrintName = "Rifled Barrel"
	att.Icon = Material("entities/att/arccw_uc_precisionrifling.png", "mips smooth")
	att.Description = "Specially made barrels designed for slug rounds. Improves precision noticably."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "uc.reqslug"
	}
	att.Slot = "uc_fg"
	att.AutoStats = true
	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then -- or wep:GetBuff("Num") > 1
	        return false
	    end
	end
	att.Mult_AccuracyMOA = .5
	att.Mult_SightTime = 1.15
	att.Mult_HipDispersion = 1.2
	att.Mult_Recoil = 1.2
	att.RequireFlags = {"uc_slug"}
	att.GivesFlags = {"uc_fg_sg_rifled"}
	att.ExcludeFlags = {"uc_choke_rifled"}
	att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_fg_slamfire.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_fg_slamfire")

	att.PrintName = "Slamfire Kit"
	att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
	att.Description = "Reckless removal of trigger safety features allows shells to fire immediately upon being cycled while the trigger is held. This enables rapid \"rack and fire\" behavior similar to old trench guns, but impacts weapon performance."
	att.Desc_Pros = {
	    "uc.slam"
	}
	att.Desc_Cons = {
	    "uc.disp.100"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_fg"
	att.AutoStats = true
	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() or !wep:GetIsManualAction() then
	        return false
	    end
	end
	att.Mult_Recoil = 1.2
	att.Mult_RecoilSide = 1.5
	att.Add_HipDispersion = 100
	att.Add_SightsDispersion = 100
	att.Override_Firemodes = {
	    {
	        Mode = 2,
	        PrintName = "fcg.slam",
	    },
	    {
	        Mode = 0
	    }
	}
	att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_fg_underwater.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_fg_underwater")

	att.PrintName = "Sealed Bolt"
	att.Icon = Material("entities/att/acwatt_uc_sealedbolt.png", "smooth mips")
	att.Description = "Watertight modifications that allow the weapon to fire underwater."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "uc_fg"
	att.AutoStats = true
	att.SortOrder = 3
	att.Override_CanFireUnderwater = true
	att.Hook_AddShootSound = function(wep)
	    if wep:GetOwner():WaterLevel() >= 3 then
	        wep:MyEmitSound("weapons/underwater_explode" .. math.random(3, 4) .. ".wav", 70, math.random(60, 80), 0.5, CHAN_AUTO)
	    end
	end
	att.Hook_PreDoEffects = function(wep)
	    if wep:GetOwner():WaterLevel() >= 3 then
	        return true
	    end
	end
	att.M_Hook_Mult_ShootPitch = function(wep, data)
	    if wep:GetOwner():WaterLevel() >= 3 then
	        data.mult = data.mult * 0.6
	    end
	end
	att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_grip_handstop.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_grip_handstop")

	att.PrintName = "Handstop"
	att.AbbrevName = "Handstop"
	att.Icon = Material("entities/att/hs.png", "mips smooth")
	att.Description = "Prevents the hand from sliding down the barrel, allowing improved point shooting precision via a special \"C-clamp\" grip.\nMay obstruct ironsights, be careful."
	att.AutoStats = true
	att.Slot = "foregrip"
	att.LHIK = true
	att.ModelOffset = Vector(2, 0, -0.8)
	att.Model = "models/weapons/arccw/atts/uc_handstop.mdl"
	att.ModelSkin = 1
	att.Override_ActivePos = Vector(-0.5, -0.5, 0.5)
	att.Override_ActiveAng = Angle(0, 0, -7)
	att.Mult_Recoil = .95
	att.Mult_Sway = .75
	att.Mult_HipDispersion = .8
	att.Mult_SightTime = 1.2
	att.Mult_SightedSpeedMult = .8
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_grip_magpul_afg1.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_grip_magpul_afg1")

	att.PrintName = "MAGPUL AFG-1 Horizontal Grip"
	att.AbbrevName = "MAGPUL AFG-1"
	att.Icon = Material("entities/att/afg1.png", "mips smooth")
	att.Description = "An ergonomically angled grip surface reduces wrist strain, increasing maneuverability."
	att.AutoStats = true
	att.Slot = "foregrip"
	att.LHIK = true
	att.ModelOffset = Vector(0, 0, -0.7)
	att.Model = "models/weapons/arccw/atts/uc_magpul_afg1.mdl"
	att.ModelSkin  = 1
	att.Mult_SightTime = .85
	att.Mult_Sway = 1.5
	att.Mult_Recoil = 1.05
	att.Ignore = true
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_grip_magpul_afg1_tan.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_grip_magpul_afg1_tan")

	att.PrintName = "MAGPUL AFG-1 Tan Horizontal Grip"
	att.AbbrevName = "MAGPUL AFG-1 Tan"
	att.Icon = Material("entities/att/afg1_tan.png", "mips smooth")
	att.Description = "Decreases recoil by providing a more secure holding position."
	att.AutoStats = true
	att.Slot = "foregrip"
	att.LHIK = true
	att.ModelOffset = Vector(0, 0, -0.7)
	att.Model = "models/weapons/arccw/atts/uc_magpul_afg1.mdl"
	att.Mult_Recoil = .8
	att.Mult_SightTime = 1.15
	att.Mult_MoveDispersion = 1.25
	att.Ignore = true
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_grip_magpul_afg2.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_grip_magpul_afg2")

	att.PrintName = "MAGPUL AFG-2 Angled Fore Grip"
	att.AbbrevName = "Angled Foregrip"
	att.Icon = Material("entities/att/afg2.png", "mips smooth")
	att.Description = "An ergonomically angled grip surface reduces wrist strain, increasing maneuverability."
	att.AutoStats = true
	att.Slot = "foregrip"
	att.LHIK = true
	att.ModelOffset = Vector(0, 0, -0.75)
	att.Model = "models/weapons/arccw/atts/uc_magpul_afg2.mdl"
	att.ModelSkin  = 1
	att.Mult_SightTime = 0.8
	att.Mult_Sway = 1.25
	att.Mult_Recoil = 1.1
	att.Mult_RecoilSide = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_grip_magpul_afg2_tan.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_grip_magpul_afg2_tan")

	att.PrintName = "MAGPUL AFG-2 Angled Fore Grip (Tan)"
	att.AbbrevName = "Angled Foregrip (Tan)"
	att.Icon = Material("entities/att/afg2_tan.png", "mips smooth")
	att.Description = "An ergonomically angled grip surface reduces wrist strain, increasing maneuverability but weakening grip stability.\nThis unit is cosmetically colored tan."
	att.AutoStats = true
	att.Slot = "foregrip"
	att.LHIK = true
	att.ModelOffset = Vector(0, 0, -0.75)
	att.Model = "models/weapons/arccw/atts/uc_magpul_afg2.mdl"
	att.Mult_SightTime = 0.8
	att.Mult_Sway = 1.25
	att.Mult_Recoil = 1.1
	att.Mult_RecoilSide = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_grip_troy.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_grip_troy")

	att.PrintName = "Troy Modular Combat Grip"
	att.AbbrevName = "Vertical Foregrip"
	att.Icon = Material("entities/att/longtroy.png", "mips smooth")
	att.Description = "Long, massive foregrip tailored for exquisite weapon control. Makes the weapon difficult to conceal."
	att.AutoStats = true
	att.Slot = "foregrip"
	att.LHIK = true
	att.ModelOffset = Vector(0, 0, -0.7)
	att.Model = "models/weapons/arccw/atts/uc_troygrip.mdl"
	-- att.ModelSkin  = 1
	att.Mult_Recoil = .75
	att.Mult_HipDispersion = .9
	att.Mult_SightTime = 1.25
	att.Mult_DrawTime = 1.35
	att.Override_HoldtypeActive = "smg"
	att.Override_HoldtypeActive_Priority = 2
	-- att.Ignore = true
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_grip_troyshort.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_grip_troyshort")

	att.PrintName = "Troy Modular Combat Grip (Stubby)"
	att.AbbrevName = "Stubby Foregrip"
	att.Icon = Material("entities/att/shorttroy.png", "mips smooth")
	att.Description = "Decreases recoil by providing a more natural forearm position."
	att.AutoStats = true
	att.Slot = "foregrip"
	att.LHIK = true
	att.ModelOffset = Vector(0, 0, -0.7)
	att.Model = "models/weapons/arccw/atts/uc_troygrip_short.mdl"
	-- att.ModelSkin  = 1
	att.Mult_Recoil = .8
	att.Mult_SightTime = 1.15
	att.Mult_MoveDispersion = 1.25
	att.Override_HoldtypeActive = "smg"
	att.Override_HoldtypeActive_Priority = 2
	-- att.Ignore = true
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_muzzle_brake1.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_muzzle_brake1")

	att.PrintName = "Hammerhead Muzzle Brake" -- fictional
	att.AbbrevName = "Hammerhead Brake"
	att.Icon = Material("entities/att/muzzle3.png", "mips smooth")
	att.Description = "A muzzle device that redirects propellant gasses to the sides to reduce the recoil of the gun."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.AutoStats = true
	att.Slot = {"muzzle","muzzle_shotgun"}
	att.SortOrder = 100
	att.Model = "models/weapons/arccw/atts/uc_muzzle2.mdl"
	att.ModelOffset = Vector(2, 0, 0)
	att.ModelScale = Vector(1.15, 1.15, 1.15)
	att.OffsetAng = Angle(0, 0, 0)
	att.IsMuzzleDevice = true
	att.Mult_Recoil = .75
	att.Mult_RecoilSide = .9
	att.Add_BarrelLength = 2
	att.Mult_SightTime = 1.15
	att.Mult_Sway = 1.05
	att.Mult_ShootVol = 1.35
	att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_muzzle_brake2.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_muzzle_brake2")

	att.PrintName = "Helix Light Brake" -- fictional
	att.AbbrevName = "Helix Brake"
	att.Icon = Material("entities/att/muzzle5.png", "mips smooth")
	att.Description = "A light muzzle device that redirects propellant gasses to the sides to reduce the recoil of the gun ableit less efficiently than a normal brake."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.AutoStats = true
	att.Slot = {"muzzle","muzzle_shotgun"}
	att.SortOrder = 100
	att.Model = "models/weapons/arccw/atts/uc_muzzle3.mdl"
	att.ModelOffset = Vector(2, 0, 0)
	att.ModelScale = Vector(1.15, 1.15, 1.15)
	att.OffsetAng = Angle(0, 0, 0)
	att.IsMuzzleDevice = true
	att.Mult_Recoil = .90
	att.Mult_RecoilSide = .95
	att.Add_BarrelLength = 2
	att.Mult_SightTime = 1.05
	att.Mult_ShootVol = 1.15
	att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_muzzle_compensator.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_muzzle_compensator")

	att.PrintName = "Basilisk Heavy Compensator" -- fictional
	att.AbbrevName = "Basilisk Compensator"
	att.Icon = Material("entities/att/muzzle4.png", "mips smooth")
	att.Description = "A muzzle device that redirects propellant gases to counter muzzle rise, particularly in the lateral directions."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.AutoStats = true
	att.Slot = {"muzzle","muzzle_shotgun"}
	att.SortOrder = 100
	att.Model = "models/weapons/arccw/atts/uc_muzzle5.mdl"
	att.ModelOffset = Vector(1.3, 0, 0)
	att.ModelScale = Vector(.85, .85, .85)
	att.OffsetAng = Angle(0, 0, 0)
	att.IsMuzzleDevice = true
	--att.Mult_ShootPitch = .95 please don't
	att.Mult_Recoil = .85
	att.Mult_RecoilSide = .75
	att.Add_BarrelLength = 2
	att.Mult_SightTime = 1.2
	att.Mult_Sway = 1.5
	att.Mult_ShootVol = 1.25
	att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_muzzle_fhider1.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_muzzle_fhider1")

	att.PrintName = "Flash Suppressor" -- fictional
	att.AbbrevName = "Flash Hider"
	att.Icon = Material("entities/att/muzzle1.png", "mips smooth")
	att.Description = "Reduces muzzle flash to the point where it can't block the shooter's vision or compromise their position."
	att.Desc_Pros = {
	    "uc.flashhider"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.AutoStats = true
	att.Slot = {"muzzle"}
	att.SortOrder = 50
	att.Model = "models/weapons/arccw/atts/uc_muzzle1.mdl"
	att.ModelOffset = Vector(1.55, 0, 0)
	att.ModelScale = Vector(.85, .85, .85)
	att.OffsetAng = Angle(0, 0, 0)
	-- att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true
	-- att.Mult_ShootPitch = 1.1 please don't
	-- att.Mult_ShootVol = 0.75
	-- att.Mult_Range = 1.1
	att.Add_BarrelLength = 2
	-- att.Mult_SightTime = 1.15
	-- att.Mult_Sway = 1.25
	att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_muzzle_fhider2.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_muzzle_fhider2")

	att.PrintName = "idk2 Flash Hider" -- fictional
	att.AbbrevName = "idk2 Flash Hider"
	att.Icon = Material("entities/att/muzzle5.png", "mips smooth")
	att.Description = "nigga hidden twice"
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.AutoStats = true
	att.Slot = {"muzzle"}
	att.SortOrder = 100
	att.Model = "models/weapons/arccw/atts/uc_muzzle4.mdl"
	att.ModelOffset = Vector(1.6, 0, 0)
	att.ModelScale = Vector(1.15, 1.15, 1.15)
	att.OffsetAng = Angle(0, 0, 0)
	-- att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true
	-- att.Mult_ShootPitch = 1.1 please don't
	-- att.Mult_ShootVol = 0.75
	-- att.Mult_Range = 1.1
	att.Add_BarrelLength = 2
	-- att.Mult_SightTime = 1.15
	-- att.Mult_Sway = 1.25
	att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
	att.Ignore = true
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_muzzle_supressor_870.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_muzzle_supressor_870")

	att.PrintName = "Cylinder Suppressor"
	att.Icon = Material("entities/att/acwatt_uc_supressor_870.png", "mips smooth")
	att.Description = "Shotgun muzzle device that traps propellant gases, hiding muzzle flash and reducing firing volume. Bulky and heavy, but provides better ballistic performance.\n\n\"By the time you figured it out, it would be too late.\""
	att.Desc_Neutrals = {"uc.muzzleblocking"}
	att.AutoStats = true
	att.Slot = {"muzzle_shotgun","muzzle"}
	att.GivesFlags = {"muzzleblocking"}
	att.ExcludeFlags = {"nomuzzleblocking"}
	att.SortOrder = 150
	att.Model = "models/weapons/arccw/atts/ud_silencer_870.mdl"
	att.ModelOffset = Vector(-1, 0, 0)
	att.OffsetAng = Angle(0, 0, 0)
	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true
	att.Mult_ShootPitch = 1.1
	att.Mult_ShootVol = 0.75
	att.Add_BarrelLength = 6
	att.Mult_SightTime = 1.3
	att.Mult_HipDispersion = 1.2
	att.Mult_Sway = 1.5
	att.Mult_Range = 1.1
	att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_muzzle_supressor_ga9.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_muzzle_supressor_ga9")

	att.PrintName = "GA9 Revolution 9 Suppressor"
	att.AbbrevName = "GA9 Suppressor"
	att.Icon = Material("entities/att/ga9rev.png", "mips smooth")
	att.Description = "Traps propellant gases from the muzzle, hiding muzzle flash and reducing volume significantly.\nCompact and lightweight, with little impact on handling, but still lengthens profile more than other muzzle attachments."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.AutoStats = true
	att.Slot = {"muzzle"}
	att.SortOrder = 150
	att.Model = "models/weapons/arccw/atts/uc_ga_revolution9.mdl"
	att.ModelOffset = Vector(2, 0, 0)
	att.ModelScale = Vector(1.15, 1.15, 1.15)
	att.OffsetAng = Angle(0, 0, 0)
	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true
	att.Mult_ShootPitch = 1.1
	att.Mult_ShootVol = 0.75
	att.Mult_Range = 0.9
	att.Add_BarrelLength = 5
	att.Mult_SightTime = 1.05
	att.Mult_Sway = 1.1
	att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
	att.Hook_Compatible = function(wep,data)
	    if !(ArcCW.UC.PistolAmmoTypes[wep.Primary.Ammo]) then
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_muzzle_supressor_light.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_muzzle_supressor_light")

	att.PrintName = "L15 'Lighthouse' Suppressor" -- fictional
	att.AbbrevName = "Lighthouse Suppressor"
	att.Icon = Material("entities/att/acwatt_uc_supressor_light.png", "mips smooth")
	att.Description = "Traps propellant gases from the muzzle, hiding muzzle flash and reducing volume significantly.\nImproves close range stopping power slightly due to redirection of gas pressure."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.AutoStats = true
	att.Slot = {"muzzle"}
	att.SortOrder = 150
	att.Model = "models/weapons/arccw/atts/ud_silencer_light.mdl"
	att.ModelOffset = Vector(2, 0, 0)
	att.OffsetAng = Angle(0, 180, 0)
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
	att.Hook_Compatible = function(wep,data)
	    if !(ArcCW.UC.RifleAmmoTypes[wep.Primary.Ammo]) then
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_muzzle_supressor_longass.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_muzzle_supressor_longass")

	att.PrintName = "ATA Giraffe-556 Suppressor" -- fictional
	att.AbbrevName = "Giraffe Suppressor"
	att.Icon = Material("entities/att/longass.png", "mips smooth")
	att.Description = "Traps propellant gases from the muzzle, hiding muzzle flash and reducing volume significantly.\nExtremely long suppressor tube provides excellent noise reduction, but is also very unwieldy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.AutoStats = true
	att.Slot = {"muzzle"}
	att.SortOrder = 150
	att.Model = "models/weapons/arccw/atts/uc_longass_silencer.mdl"
	att.ModelOffset = Vector(2, 0, 0)
	att.ModelScale = Vector(1.15, 1.15, 1.15)
	att.OffsetAng = Angle(0, 0, 0)
	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true
	att.Mult_ShootPitch = 1.1
	att.Mult_ShootVol = 0.7
	att.Mult_Range = 1.2
	att.Add_BarrelLength = 10
	att.Mult_SightTime = 1.25
	att.Mult_SightedSpeedMult = 0.85
	att.Mult_Sway = 1.5
	att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
	att.Hook_Compatible = function(wep,data)
	    if !(ArcCW.UC.PistolAmmoTypes[wep.Primary.Ammo]) then
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- uc_muzzle_supressor_masada.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_muzzle_supressor_masada")

	att.PrintName = "Magpul PTS AAC Masada Suppressor"
	att.AbbrevName = "Masada Suppressor"
	att.Icon = Material("entities/att/masada.png", "mips smooth")
	att.Description = "Traps propellant gases from the muzzle, hiding muzzle flash and reducing volume significantly.\nReduces recoil by providing extra room for gas expansion."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.AutoStats = true
	att.Slot = {"muzzle"}
	att.SortOrder = 150
	att.Model = "models/weapons/arccw/atts/uc_magpul_masada.mdl"
	att.ModelOffset = Vector(2, 0, 0)
	att.ModelScale = Vector(1.15, 1.15, 1.15)
	att.OffsetAng = Angle(0, 0, 0)
	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true
	att.Mult_ShootPitch = 1.1
	att.Mult_ShootVol = 0.75
	att.Mult_Recoil = .9
	att.Add_BarrelLength = 5
	att.Mult_SightTime = 1.15
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
-- uc_muzzle_supressor_pbs1.lua
------

do
	local att = {}
	ArcCW.SetShortName("uc_muzzle_supressor_pbs1")

	att.PrintName = "PBS-1 Suppressor"
	att.Icon = Material("entities/att/pbs1.png", "mips smooth")
	att.Description = "Traps propellant gases from the muzzle, hiding muzzle flash and reducing volume significantly.\nRussian-made. Stats are temporary."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.AutoStats = true
	att.Slot = {"ur_ak_muzzle"}
	att.SortOrder = 149
	att.Model = "models/weapons/arccw/atts/uc_pbs1.mdl"
	att.ModelOffset = Vector(1.75, 0, 0)
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
	    if !(wep.Primary.Ammo == "smg1" and !table.HasValue(wep:GetWeaponFlags(),"barrel_carbine")) then
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

