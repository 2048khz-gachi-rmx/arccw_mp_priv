local Material = ArcCW.AttachmentMat

------
-- slog_tuna_ammo_dmg.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_ammo_dmg")

	att.PrintName = "Hollow Shell"
	att.Icon = Material("entities/slog_tuna_ammo_holllow.png", "mips smooth")
	att.Description = "Flesh wounding round, cannot traverse far disntance or penetrate."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_ammo"}
	att.Mult_RPM = 0.95
	att.Mult_AccuracyMOA = 1.25
	att.Mult_Damage = 1.25
	att.Mult_DamageMin = 0.85
	att.Mult_Range = 0.95
	att.Mult_Penetration = 0
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_ammo_dragon.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_ammo_dragon")

	att.PrintName = "Dragon's Breath"
	att.Icon = Material("entities/slog_tuna_ammo_flame.png", "mips smooth")
	att.Description = "Flaming shell that burns everything in its path."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_ammo_sg", "fortuna_ammo_rf"}
	att.Mult_RPM = 0.85
	att.Mult_Recoil = 1.15
	att.Mult_Damage = 1.25
	att.Mult_DamageMin = 0.75
	att.Mult_Range = 0.75
	att.Mult_Penetration = 0.125
	att.Mult_AccuracyMOA = 1.5
	att.Mult_ShootPitch = 0.9
	att.Override_DamageType = DMG_BURN + DMG_BLAST
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_ammo_explosive.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_ammo_explosive")

	att.PrintName = "Explosive Tip"
	att.Icon = Material("entities/slog_tuna_ammo_frag.png", "mips smooth")
	att.Description = "Explosive rounds."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_ammo_sg"}
	att.Mult_RPM = 0.375
	att.Mult_AccuracyMOA = 0.25
	att.Mult_Damage = 1.15
	att.Mult_DamageMin = 0.75
	att.Mult_Range = 0.25
	att.Mult_Penetration = 0
	att.Mult_MuzzleVelocity = 0.5
	att.Override_Num = 1
	att.Override_DamageType = DMG_BLAST + DMG_AIRBOAT
	att.Hook_ModifyRPM = function(wep, delay)
	    local max = math.min(5, wep:GetCapacity())
	    local delta = wep:GetBurstCount() / max
	    local mult = Lerp(delta, 1, 0.75)
	    return delay / mult
	end
	att.Hook_BulletHit = function(wep, data)
	    local ent = data.tr.Entity
	    local effectdata = EffectData()
	    effectdata:SetOrigin( data.tr.HitPos )
	    util.Effect( "Explosion", effectdata)
	    local rad = math.Clamp(math.ceil(wep:GetDamage(0)), (wep.Damage + wep.DamageMin)*5/2, (wep.Damage + wep.DamageMin)*8/2)
	    util.BlastDamage(wep, wep:GetOwner(), data.tr.HitPos, rad, wep:GetDamage(data.range))
	    if ent:IsValid() and ent:GetClass() == {"npc_helicopter"} then
	        data.dmgtype = DMG_AIRBOAT
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_ammo_explosive_rf.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_ammo_explosive_rf")

	att.PrintName = "Explosive Tip"
	att.Icon = Material("entities/slog_tuna_ammo_frag.png", "mips smooth")
	att.Description = "Explosive rounds."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_ammo_rf"}
	att.Mult_RPM = 0.375
	att.Mult_AccuracyMOA = 3
	att.Mult_Damage = 1.5
	att.Mult_DamageMin = 0.75
	att.Mult_Range = 0.25
	att.Mult_Penetration = 0
	att.Mult_MuzzleVelocity = 0.5
	att.Override_Num = 1
	att.Override_DamageType = DMG_BLAST + DMG_AIRBOAT
	att.Hook_ModifyRPM = function(wep, delay)
	    local max = math.min(5, wep:GetCapacity())
	    local delta = wep:GetBurstCount() / max
	    local mult = Lerp(delta, 1, 0.75)
	    return delay / mult
	end
	att.Hook_BulletHit = function(wep, data)
	    local ent = data.tr.Entity
	    local effectdata = EffectData()
	    effectdata:SetOrigin( data.tr.HitPos )
	    util.Effect( "Explosion", effectdata)
	    local rad = math.Clamp(math.ceil(wep:GetDamage(0)), (wep.Damage + wep.DamageMin)*5/2, (wep.Damage + wep.DamageMin)*8/2)
	    util.BlastDamage(wep, wep:GetOwner(), data.tr.HitPos, rad, wep:GetDamage(data.range))
	    if ent:IsValid() and ent:GetClass() == {"npc_helicopter"} then
	        data.dmgtype = DMG_AIRBOAT
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_ammo_hunt.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_ammo_hunt")

	att.PrintName = "Hunter's Kit"
	att.Icon = Material("entities/slog_tuna_ammo_hunt.png", "mips smooth")
	att.Description = "Hollow flesh piercing tip that do significant damage towards extremities. Damage is reduce for body and head."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_ammo", "fortuna_ammo_sg", "fortuna_ammo_rf"}
	att.Hook_BulletHit = function(wep, data)
	    if CLIENT then return end
	    if data.tr.HitGroup == HITGROUP_HEAD then
	        data.damage = data.damage * 0.5
	    elseif data.tr.HitGroup == HITGROUP_CHEST then
	        data.damage = data.damage * 0.5	
	    elseif data.tr.HitGroup == HITGROUP_STOMACH then
	        data.damage = data.damage * 0.5	
	    elseif data.tr.HitGroup == HITGROUP_LEFTARM then
	        data.damage = data.damage * 2	
	    elseif data.tr.HitGroup == HITGROUP_RIGHTARM then
	        data.damage = data.damage * 2			
	    elseif data.tr.HitGroup == HITGROUP_LEFTLEG then
	        data.damage = data.damage * 2	
	    elseif data.tr.HitGroup == HITGROUP_RIGHTLEG then
	        data.damage = data.damage * 2					
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_ammo_penetrate.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_ammo_penetrate")

	att.PrintName = "Armour Piercing"
	att.Icon = Material("entities/slog_tuna_ammo_pene.png", "mips smooth")
	att.Description = "Piercing bullets traverse at much greater distance."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_ammo"}
	att.Mult_RPM = 1.15
	att.Mult_AccuracyMOA = 0.95
	att.Mult_Damage = 0.75
	att.Mult_DamageMin = 1.25
	att.Mult_Range = 1.2
	att.Mult_Penetration = 5
	att.Mult_MuzzleVelocity = 2
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_ammo_shotgun.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_ammo_shotgun")

	att.PrintName = "Fractured Shell"
	att.Icon = Material("entities/slog_tuna_ammo_frac.png", "mips smooth")
	att.Description = "Unstable tip that fractures into smaller chunks when shot."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_ammo"}
	att.Mult_RPM = 0.8
	att.Mult_Recoil = 1.15
	att.Mult_AccuracyMOA = 10
	att.Mult_Damage = 1.5
	att.Mult_DamageMin = 1.2
	att.Mult_Range = 0.5
	att.Mult_Penetration = 0.125
	att.Override_Num = 6
	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_ammo_slog.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_ammo_slog")

	att.PrintName = "Slug Rounds"
	att.Icon = Material("entities/slog_tuna_ammo_slog.png", "mips smooth")
	att.Description = "Just a big fuck off round really. Capable of defeating armour. Extend the range of a shotgun by a margin."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_ammo_sg"}
	att.Mult_RPM = 0.85
	att.Mult_Recoil = 1.15
	att.Mult_Damage = 0.85
	att.Mult_DamageMin = 2
	att.Mult_Range = 2
	att.Mult_Penetration = 5
	att.Override_Num = 1
	att.Mult_AccuracyMOA = 0.075
	att.Mult_ShootPitch = 0.9
	att.Override_DamageType = DMG_AIRBOAT
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_fg.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_fg")

	att.PrintName = "Combat Foregrip"
	att.Icon = Material("entities/slog_tuna_fg.png", "mips smooth")
	att.Description = "Heavy foregrip provides limited recoil and hipfire control."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_fg"}
	att.LHIK = true
	att.Model = "models/weapons/arccw/slog_osi_suck/att/fg.mdl"
	att.Mult_Recoil = 0.85
	att.Mult_HipDispersion = 0.9
	att.Mult_SightTime = 1.1
	att.Mult_SightedSpeedMult = 0.85
	att.Override_HoldtypeActive = "smg"
	att.ModelOffset = Vector(0, 0, -1)
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_fg_afg.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_fg_afg")

	att.PrintName = "Angled Foregrip"
	att.Icon = Material("entities/slog_tuna_fg_afg.png", "mips smooth")
	att.Description = "Undegrip improves handling and fast sight acquisition."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_fg"}
	att.LHIK = true
	att.Model = "models/weapons/arccw/slog_osi_suck/att/afg.mdl"
	att.Mult_SightTime = 0.75
	att.Mult_SightedSpeedMult = 0.85
	att.Mult_HipDispersion = 1.1
	att.Override_HoldtypeActive = "ar2"
	att.ModelOffset = Vector(0, 0, -1)
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_fg_ak.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_fg_ak")

	att.PrintName = "Forward Grip"
	att.Icon = Material("entities/slog_tuna_fg_ak.png", "mips smooth")
	att.Description = "Light weighted recoil control device. Extremely uncomfortable."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_fg"}
	att.LHIK = true
	att.Model = "models/weapons/arccw/slog_osi_suck/att/fg_ak.mdl"
	att.Mult_Recoil = 0.95
	att.Mult_HipDispersion = 1.05
	att.Mult_SightTime = 0.95
	att.Mult_SightedSpeedMult = 0.9
	att.Override_HoldtypeActive = "smg"
	att.ModelOffset = Vector(0, 0, -0.85)
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_fg_lmg.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_fg_lmg")

	att.PrintName = "Horizontal Grip"
	att.Icon = Material("entities/slog_tuna_fg_lmg.png", "mips smooth")
	att.Description = "Horizontally angled grip for heavy arms."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_fg"}
	att.LHIK = true
	att.Model = "models/weapons/arccw/slog_osi_suck/att/fg_lmg.mdl"
	att.Mult_Recoil = 0.75
	att.Mult_HipDispersion = 0.75
	att.Mult_SightTime = 1.25
	att.Mult_SightedSpeedMult = 0.65
	att.Override_HoldtypeActive = "smg"
	att.ModelOffset = Vector(0, 0, -0.85)
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_laser_4.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_laser_4")

	att.PrintName = "Tac Laser"
	att.Icon = Material("entities/slog_tuna_las_4.png", "mips smooth")
	att.Description = "Blue laser pointer. Improves hip-fire accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.beam"
	}
	att.AutoStats = true
	att.Slot = {"fortuna_tac"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/laser_4.mdl"
	att.Laser = true
	att.LaserStrength = 0.8
	att.LaserBone = "laser"
	att.ColorOptionsTable = {Color(0, 0, 255)}
	att.Mult_HipDispersion = 0.65
	att.Mult_MoveDispersion = 0.65
	att.Mult_SightTime = 0.9
	att.Mult_MoveSpeed = 0.95
	att.ModelScale = Vector(1.1, 1.1, 1.1)
	att.ModelOffset = Vector(0, 0, 0)
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_laser_knife.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_laser_knife")

	att.PrintName = "Tac Knife"
	att.Icon = Material("entities/slog_tuna_las_knife.png", "mips smooth")
	att.Description = "Underbarrel Knife for CQC engagement."
	att.SortOrder = 2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.beam"
	}
	att.AutoStats = true
	att.Slot = {"fortuna_tac_pistol", "fortuna_knife_muz"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/laser_knife.mdl"
	att.Mult_SightTime = 1.05
	att.Mult_MoveSpeed = 0.95
	att.Mult_MeleeDamage = 2
	att.Add_BarrelLength = 3
	att.Mult_MeleeTime = 0.9
	att.Add_MeleeRange = 16
	att.Override_BashPreparePos = Vector(2, -2, -2.6)
	att.Override_BashPrepareAng = Angle(8, 4, 5)
	att.Override_BashPos = Vector(1.2, 12, -1.8)
	att.Override_BashAng = Angle(4, 6, 0)
	att.ExcludeFlags = {"muz_long"}
	att.GivesFlags = {"tac_short"}
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_laser_npc.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_laser_npc")

	att.PrintName = "Tac Laser"
	att.Icon = Material("entities/slog_tuna_las_4.png", "mips smooth")
	att.Description = "Blue laser pointer. Improves hip-fire accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.beam"
	}
	att.AutoStats = true
	att.Slot = {"fortuna_tac"}
	att.Hidden = true
	att.Model = "models/weapons/arccw/slog_osi_suck/att/laser_peq.mdl"
	att.Laser = true
	att.LaserStrength = 5
	att.LaserBone = "laser"
	att.ColorOptionsTable = {Color(0, 225, 225)}
	att.Mult_HipDispersion = 0.65
	att.Mult_MoveDispersion = 0.65
	att.Mult_SightTime = 0.9
	att.Mult_MoveSpeed = 0.95
	att.ModelScale = Vector(1.1, 1.1, 1.1)
	att.ModelOffset = Vector(0, 0, 0)
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_laser_peq.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_laser_peq")

	att.PrintName = "Compact Laser"
	att.Icon = Material("entities/slog_tuna_las_peq.png", "mips smooth")
	att.Description = "Red laser pointer. Improves hip-fire accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.beam"
	}
	att.AutoStats = true
	att.Slot = {"fortuna_tac"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/laser_peq.mdl"
	att.Laser = true
	att.LaserStrength = 0.8
	att.LaserBone = "laser"
	att.ColorOptionsTable = {Color(255, 0, 0)}
	att.Mult_HipDispersion = 0.75
	att.Mult_MoveDispersion = 0.75
	att.Mult_SightTime = 0.9
	att.Mult_MoveSpeed = 0.95
	att.ModelScale = Vector(1.2, 1.2, 1.2)
	att.ModelOffset = Vector(0, 0, 0)
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_laser_piss.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_laser_piss")

	att.PrintName = "Compact Laser"
	att.Icon = Material("entities/slog_tuna_las_tac.png", "mips smooth")
	att.Description = "Red laser pointer. Improves hip-fire accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.beam"
	}
	att.AutoStats = true
	att.Slot = {"fortuna_tac_pistol"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/laser_piss.mdl"
	att.Laser = true
	att.LaserStrength = 0.25
	att.LaserBone = "laser"
	att.ColorOptionsTable = {Color(255, 0, 0)}
	att.Mult_HipDispersion = 0.75
	att.Mult_MoveDispersion = 0.75
	att.Mult_SightTime = 0.9
	att.Mult_MoveSpeed = 0.95
	att.ModelScale = Vector(0.8, 0.8, 0.8)
	att.ModelOffset = Vector(0.05, 0, -0.05)
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_laser_piss2.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_laser_piss2")

	att.PrintName = "Tac Laser"
	att.Icon = Material("entities/slog_tuna_las_tac2.png", "mips smooth")
	att.Description = "Blue laser pointer. Improves hip-fire accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.beam"
	}
	att.AutoStats = true
	att.Slot = {"fortuna_tac_pistol"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/laser_piss2.mdl"
	att.Laser = true
	att.LaserStrength = 0.5
	att.LaserBone = "laser"
	att.ColorOptionsTable = {Color(0, 0, 255)}
	att.Mult_HipDispersion = 0.65
	att.Mult_MoveDispersion = 0.65
	att.Mult_SightTime = 0.9
	att.Mult_MoveSpeed = 0.95
	att.ModelScale = Vector(1.05, 1.05, 1.05)
	att.ModelOffset = Vector(0.25, 0, 0)
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_laser_pistol.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_laser_pistol")

	att.PrintName = "Covert Laser"
	att.Icon = Material("entities/slog_tuna_las_pistol.png", "mips smooth")
	att.Description = "Pointer designed for pistol."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.beam"
	}
	att.AutoStats = true
	att.Slot = {"fortuna_tac_pistol"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/laser_pistol.mdl"
	att.Laser = true
	att.LaserStrength = 0.75
	att.LaserBone = "laser"
	att.ColorOptionsTable = {Color(0, 105, 225)}
	att.KeepBaseIrons = true
	att.Mult_MoveSpeed = 0.95
	att.ModelScale = Vector(1, 1, 1)
	att.ModelOffset = Vector(0.25, 0, -0.05)
	att.ToggleStats = {
	    {
	        PrintName = "Laser",
	        AutoStatName = "On",
	        Laser = true,
			LaserColor = Color(255, 0, 0),
			Mult_HipDispersion = 0.75,
			Mult_MoveDispersion = 0.75,
			Mult_SightTime = 0.9,
			KeepBaseIrons = true,
	        AdditionalSights = {
	           {
	               Pos = Vector(-2, 25, -4), -- relative to where att.Model is placed
	               Ang = Angle(0, 0, -20),
	               GlobalPos = false,
	               GlobalAng = true,
	               Magnification = 1
	           }
	       },
		},
	    {
	        PrintName = "Flashlight",
	        AutoStatName = "On",
			Flashlight = true,
			FlashlightFOV = 60,
			FlashlightFarZ = 512,
			FlashlightNearZ = 1,
			Mult_HipDispersion = 0.8,
			Mult_MoveDispersion = 0.8,
			Mult_SightTime = 0.95,		
			FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR,
			FlashlightColor = Color(255, 255, 255),
			FlashlightTexture = "effects/flashlight001",
			FlashlightBrightness = 1.5,
			FlashlightBone = "laser",
			AdditionalSights = {
	           {
	               Pos = Vector(-2, 25, -4), -- relative to where att.Model is placed
	               Ang = Angle(0, 0, -20),
	               GlobalPos = false,
	               GlobalAng = true,
	               Magnification = 1
	           }
	       },
		},	
	    {
	        PrintName = "Off",
	        Laser = false,
	        Mult_HipDispersion = 1,
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_muz_acc.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_muz_acc")

	att.PrintName = "Compensator"
	att.Icon = Material("entities/slog_tuna_muz_acc.png", "mips smooth")
	att.Description = "Special muzzle device built to sustain upwards recoil. Quite unstable."
	att.SortOrder = 2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_muzzle"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/muz_acc.mdl"
	att.IsMuzzleDevice = true
	att.Add_BarrelLength = 6
	att.Mult_ShootPitch = 1.25
	att.Mult_SightTime = 1.15
	att.Mult_MoveSpeed = 0.925
	att.Mult_Recoil = 0.85
	att.Mult_RecoilSide = 1.25
	att.Mult_VisualRecoilMult = 0.85
	att.Mult_RPM = 1.125
	att.ModelOffset = Vector(0, 0, 0.1)
	att.GivesFlags = {"muz_long"}
	att.ExcludeFlags = {"tac_short"}
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_muz_boost.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_muz_boost")

	att.PrintName = "Muzzle Booster"
	att.Icon = Material("entities/slog_tuna_muz_boost.png", "mips smooth")
	att.Description = "Muzzle device that increases gas pressure, improving fire rate on automatic weapons at the cost of increased recoil. Does nothing on manual-action firearms."
	att.SortOrder = 1
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_muzzle", "fortuna_muzzle_pist"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/muz_boost.mdl"
	att.IsMuzzleDevice = true
	att.Add_BarrelLength = 4
	att.Mult_ShootPitch = 1.15
	att.Mult_SightTime = 1.05
	att.Mult_MoveSpeed = 0.95
	att.Mult_RPM = 1.25
	att.Mult_Recoil = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_muz_brake.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_muz_brake")

	att.PrintName = "Muzzle Brake"
	att.Icon = Material("entities/slog_tuna_muz_brake.png", "mips smooth")
	att.Description = "Muzzle device that redirect gas sideways. Decreases horizontal recoil but increases that of vertical."
	att.SortOrder = 1
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_muzzle"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/muz_brake.mdl"
	att.IsMuzzleDevice = true
	att.Add_BarrelLength = 2
	att.Mult_ShootPitch = 0.9
	att.Mult_SightTime = 1.025
	att.Mult_MoveSpeed = 0.975
	att.Mult_Recoil = 1.25
	att.Mult_RecoilSide = 0.65
	att.Mult_VisualRecoilMult = 1.2
	att.Mult_RPM = 0.9
	att.ModelOffset = Vector(0, 0, 0)
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_muz_comp.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_muz_comp")

	att.PrintName = "Compensator"
	att.Icon = Material("entities/slog_tuna_muz_comp.png", "mips smooth")
	att.Description = "Muzzle device that redirects firing gases to help stabilize recoil."
	att.SortOrder = 1
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_muzzle_pist"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/muz_comp.mdl"
	att.IsMuzzleDevice = true
	att.Add_BarrelLength = 2
	att.Mult_ShootPitch = 0.9
	att.Mult_SightTime = 1.05
	att.Mult_MoveSpeed = 0.95
	att.Mult_RecoilSide = 0.85
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_muz_pissd.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_muz_pissd")

	att.PrintName = "Osprey Suppressor"
	att.Icon = Material("entities/slog_tuna_muz_pissd.png", "mips smooth")
	att.Description = "Rectangular pistol suppressor."
	att.SortOrder = 2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_muzzle_pist"}
	att.SortOrder = 15
	att.Model = "models/weapons/arccw/slog_osi_suck/att/muz_pissd.mdl"
	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true
	att.Mult_ShootPitch = 1
	att.Mult_ShootVol = 0.75
	att.Mult_AccuracyMOA = 0.8
	att.Mult_Range = 1.1
	att.Mult_SightTime = 1.1
	att.Mult_HipDispersion = 1.15
	att.Add_BarrelLength = 8
	att.Override_MuzzleEffectAttachment = 1
	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	att.GivesFlags = {"muz_long"}
	att.ExcludeFlags = {"tac_short"}
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_muz_rifsd.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_muz_rifsd")

	att.PrintName = "Sandman Suppressor"
	att.Icon = Material("entities/slog_tuna_muz_rif_sd.png", "mips smooth")
	att.Description = "Combat suppressor issues for rifles."
	att.SortOrder = 2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_muzzle"}
	att.SortOrder = 15
	att.Model = "models/weapons/arccw/slog_osi_suck/att/muz_sup_rif.mdl"
	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true
	att.Mult_ShootPitch = 1
	att.Mult_ShootVol = 0.75
	att.Mult_AccuracyMOA = 0.8
	att.Mult_Range = 1.1
	att.Mult_SightTime = 1.1
	att.Mult_HipDispersion = 1.15
	att.Add_BarrelLength = 8
	att.Override_MuzzleEffectAttachment = 1
	att.ModelOffset = Vector(0, 0, 0.15)
	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	att.GivesFlags = {"muz_long"}
	att.ExcludeFlags = {"tac_short"}
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_muz_sgsd.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_muz_sgsd")

	att.PrintName = "Colossal Suppressor"
	att.Icon = Material("entities/slog_tuna_muz_sgsd.png", "mips smooth")
	att.Description = "Heavy suppressor issues for heavy weapons."
	att.SortOrder = 2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_muzzle", "fortuna_muzzle_db"}
	att.SortOrder = 20
	att.Model = "models/weapons/arccw/slog_osi_suck/att/muz_sgsd.mdl"
	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true
	att.Mult_ShootPitch = 0.885
	att.Mult_ShootVol = 0.65
	att.Mult_AccuracyMOA = 0.75
	att.Mult_Range = 1.25
	att.Mult_SightTime = 1.25
	att.Mult_HipDispersion = 0.95
	att.Add_BarrelLength = 10
	att.Override_MuzzleEffectAttachment = 1
	att.ModelOffset = Vector(0, 0, 0.15)
	att.GivesFlags = {"muz_long"}
	att.ExcludeFlags = {"tac_short"}
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_optic_b42.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_optic_b42")

	att.PrintName = "B42 (3x)"
	att.Icon = Material("entities/slog_tuna_optic_b42.png", "mips smooth")
	att.Description = "CQC combat scope with backup irons."
	att.SortOrder = 3
	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_optic"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/b42.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 12.5, -2),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.175,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 3,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",		
	        IgnoreExtra = true,
	    },
	    {
	        Pos = Vector(0, 15, -3.15),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        HolosightData = {
	            Holosight = true,
	            HolosightReticle =  Material("slog_tuna_reticle/combat.png", "mips smooth"),
	            HolosightSize = 3,
	            Colorable = true,
	            HolosightNoHSP = true
	        },		
	        ScrollFunc = ArcCW.SCROLL_NONE
	    },	
	}
	att.Holosight = true
	att.HolosightReticle = Material("slog_tuna_reticle/4x.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 10
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw/slog_osi_suck/att/b42_hsp.mdl"
	att.Colorable = true
	att.HolosightMagnification = 3
	att.HolosightBlackbox = true
	att.Mult_SightTime = 1.055
	att.Mult_SightedSpeedMult = 0.975
	att.ModelOffset = Vector(0, 0, -0.1)
	att.ModelScale = Vector(1.25, 1.25, 1.25)
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_optic_c75.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_optic_c75")

	att.PrintName = "C75 (4x/1x)"
	att.Icon = Material("entities/slog_tuna_optic_c75.png", "mips smooth")
	att.Description = "Mid range hybrid scope with backup reflex."
	att.SortOrder = 4
	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "Double press +USE to toggle sights"
	}
	att.AutoStats = true
	att.Slot = {"fortuna_optic"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/c75.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 11.5, -2.2),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.25,
	        ScopeMagnification = 4,
	        HolosightBone = "scope",
	        HolosightData = {
	            Holosight = true,
	            HolosightMagnification = 4,
	            HolosightReticle = Material("slog_tuna_reticle/3x.png", "mips smooth"),
	            HolosightNoFlare = true,
	            HolosightSize = 10,
	            HolosightBlackbox = true,
	            Colorable = true,
	            HolosightPiece = "models/weapons/arccw/slog_osi_suck/att/c75_hsp.mdl"
	        },
	    },
	    {
	        Pos = Vector(0, 13, -4.2),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,		
	        HolosightBone = "holosight",
	        HolosightData = {
	            Holosight = true,
	            HolosightReticle =  Material("slog_tuna_reticle/top.png", "mips smooth"),
	            HolosightSize = 5,
	            Colorable = true,
	            HolosightNoHSP = true
	        },	
	    },	
	}
	att.Holosight = true
	att.HolosightPiece = "models/weapons/arccw/slog_osi_suck/att/c75_hsp.mdl"
	att.ScopeGlint = true
	att.Mult_SightTime = 1.075
	att.Mult_SightedSpeedMult = 0.95
	att.ModelOffset = Vector(0, 0, -0.08)
	att.ModelScale = Vector(1.25, 1.25, 1.25)
	att.ColorOptionsTable = {
	    Color(255, 50, 50),
	    Color(50, 255, 50)
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_optic_f52.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_optic_f52")

	att.PrintName = "F52 (Reflex)"
	att.Icon = Material("entities/slog_tuna_optic_f52.png", "mips smooth")
	att.Description = "Compact automatic folding sight."
	att.SortOrder = 0.75
	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_optic", "fortuna_optic_s"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/f52.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 12, -1.2),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.25,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}
	att.Holosight = true
	att.HolosightReticle = Material("slog_tuna_reticle/crotchets.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 3
	att.HolosightBone = "holosight"
	att.Colorable = true
	att.Mult_SightTime = 1.025
	att.ModelScale = Vector(1.35, 1.35, 1.35)
	att.ModelOffset = Vector(0, 0, -0.1)
	att.DrawFunc = function(wep, element, wm)
	    if wm then return end
	    if wep:GetState() == ArcCW.STATE_SIGHTS then
	        element.Model:ResetSequence(1)
	    else
	        element.Model:ResetSequence(0)
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_optic_hc7.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_optic_hc7")

	att.PrintName = "HC7 (Holo)"
	att.Icon = Material("entities/slog_tuna_optic_hc7.png", "mips smooth")
	att.Description = "Mid range holographic sight."
	att.SortOrder = 1
	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_optic"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/hc7.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 10, -1),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.25,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}
	att.Holosight = true
	att.HolosightReticle = Material("slog_tuna_reticle/combat.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 3.5
	att.HolosightBone = "holosight"
	att.Colorable = true
	att.Mult_SightTime = 1.075
	att.ModelScale = Vector(0.9, 0.9, 0.9)
	att.ModelOffset = Vector(0, 0, -0.1)
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_optic_holo.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_optic_holo")

	att.PrintName = "E33 (Holo)"
	att.Icon = Material("entities/slog_tuna_optic_holo.png", "mips smooth")
	att.Description = "Boxy holographic sight."
	att.SortOrder = 1
	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_optic"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/holo.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 9, -1.4),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.25,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}
	att.Holosight = true
	att.HolosightReticle = Material("slog_tuna_reticle/holo.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 4
	att.HolosightBone = "holosight"
	att.Colorable = true
	att.Mult_SightTime = 1.075
	att.ModelScale = Vector(0.75, 0.75, 0.75)
	att.ModelOffset = Vector(0.35, 0, 0)
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_optic_hz6.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_optic_hz6")

	att.PrintName = "HZ6 (2.5-6x)"
	att.Icon = Material("entities/slog_tuna_optic_hz6.png", "mips smooth")
	att.Description = "Mid range tactical combat scope."
	att.SortOrder = 6
	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_optic"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/hz6.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 10.5, -1.185),
	        Ang = Angle(0, 0, 0),
	        Magnification = 2,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 2,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",		
	        IgnoreExtra = true,
	    }
	}
	att.ScopeGlint = true
	att.Holosight = true
	att.HolosightReticle = Material("slog_tuna_reticle/6x.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 14
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw/slog_osi_suck/att/hz6_hsp.mdl"
	att.Colorable = true
	att.HolosightMagnification = 2
	att.HolosightBlackbox = true
	att.HolosightMagnification = 1.5
	att.HolosightMagnificationMin = 2.5
	att.HolosightMagnificationMax = 6
	att.Mult_SightTime = 1.125
	att.Mult_SightedSpeedMult = 0.92
	att.ModelOffset = Vector(0, 0, -0.1)
	att.ModelScale = Vector(1.25, 1.25, 1.25)
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_optic_l45.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_optic_l45")

	att.PrintName = "L45 (Reflex)"
	att.Icon = Material("entities/slog_tuna_optic_l45.png", "mips smooth")
	att.Description = "Close range reflex sight."
	att.SortOrder = 0.75
	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_optic"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/l45.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 10, -0.95),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.25,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}
	att.Holosight = true
	att.HolosightReticle = Material("slog_tuna_reticle/shotgun.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 3
	att.HolosightBone = "holosight"
	att.Colorable = true
	att.Mult_SightTime = 1.025
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_optic_l7.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_optic_l7")

	att.PrintName = "L7 (Reflex)"
	att.Icon = Material("entities/slog_tuna_optic_l7.png", "mips smooth")
	att.Description = "Relfex sight for small arms."
	att.SortOrder = 0.25
	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_optic","fortuna_optic_s"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/l7.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 12, -0.9),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.125,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}
	att.Holosight = true
	att.HolosightReticle = Material("slog_tuna_reticle/braces.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 3.5
	att.HolosightBone = "holosight"
	att.Colorable = true
	att.Mult_SightTime = 1.0125
	att.ModelOffset = Vector(0, 0, 0.15)
	att.ModelScale = Vector(1.15, 1.15, 1.15)
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_optic_laser_fl7.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_optic_laser_fl7")

	att.PrintName = "Marksman Laser"
	att.Icon = Material("entities/slog_tuna_optic_laser_fl7.png", "mips smooth")
	att.Description = "Top mount pointer with irons for small arms."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.beam"
	}
	att.AutoStats = true
	att.Slot = {"fortuna_optic_s", "fortuna_optic"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/fl7.mdl"
	att.Laser = true
	att.LaserStrength = 2
	att.LaserBone = "laser"
	att.ColorOptionsTable = {Color(255, 0, 0)}
	att.Mult_HipDispersion = 0.75
	att.Mult_MoveDispersion = 0.75
	att.Mult_SightTime = 1.15
	att.Mult_MoveSpeed = 0.975
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 10, -2.15),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.15,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}
	att.ModelScale = Vector(0.9, 0.9, 0.9)
	att.ModelOffset = Vector(0.8, 0 ,-0.2)
	att.Flashlight = true
	att.FlashlightFOV = 75
	att.FlashlightFarZ = 512 -- how far it goes
	att.FlashlightNearZ = 1 -- how far away it starts
	att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR -- LINEAR, CONSTANT, QUADRATIC are available
	att.FlashlightColor = Color(255, 255, 255)
	att.FlashlightTexture = "effects/flashlight001"
	att.FlashlightBrightness = 2
	att.FlashlightBone = "laser"
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_optic_m7.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_optic_m7")

	att.PrintName = "M7 (LP)"
	att.Icon = Material("entities/slog_tuna_optic_m7.png", "mips smooth")
	att.Description = "Simple holographic option reminiscent of ironsight."
	att.SortOrder = 0.25
	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_optic","fortuna_optic_s"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/m7.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 12, -0.95),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.125,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}
	att.Holosight = true
	att.HolosightReticle = Material("slog_tuna_reticle/brokets.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 2.5
	att.HolosightBone = "holosight"
	att.Colorable = true
	att.Mult_SightTime = 1.025
	att.ModelOffset = Vector(0.15, 0, -0.15)
	att.ModelScale = Vector(1.15, 1.15, 1.15)
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_optic_r60.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_optic_r60")

	att.PrintName = "R60 (Reflex)"
	att.Icon = Material("entities/slog_tuna_optic_r60.png", "mips smooth")
	att.Description = "Big reflex sight offers clarity."
	att.SortOrder = 1
	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_optic"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/r60.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 12, -1.5),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.25,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        Thermal = true,
	        ThermalHighlightColor = Color(255, 255, 0),		
	    }
	}
	att.Holosight = true
	att.HolosightReticle = Material("slog_tuna_reticle/launcher.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 7
	att.HolosightBone = "holosight"
	att.Colorable = true
	att.Mult_SightTime = 1.05
	att.ModelScale = Vector(1.2, 1.2, 1.2)
	att.ModelOffset = Vector(0, 0, 0.1)
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_optic_rds.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_optic_rds")

	att.PrintName = "RZ7 (RDS)"
	att.Icon = Material("entities/slog_tuna_optic_rds.png", "mips smooth")
	att.Description = "Cylindrel combat sight."
	att.SortOrder = 0.75
	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_optic"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/rds.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 10, -0.95),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.25,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}
	att.Holosight = true
	att.HolosightReticle = Material("slog_tuna_reticle/rds.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 4
	att.HolosightBone = "holosight"
	att.Colorable = true
	att.Mult_SightTime = 1.05
	att.ModelScale = Vector(0.85, 0.85, 0.85)
	att.ModelOffset = Vector(0.35, 0, 0)
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_optic_reflex.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_optic_reflex")

	att.PrintName = "C87 (LP)"
	att.Icon = Material("entities/slog_tuna_optic_reflex.png", "mips smooth")
	att.Description = "Holographic option for small arms."
	att.SortOrder = 0.25
	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_optic","fortuna_optic_s"}
	att.Model = "models/weapons/arccw/slog_osi_suck/att/reflex.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 12, -0.5),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.125,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}
	att.Holosight = true
	att.HolosightReticle = Material("slog_tuna_reticle/reflex.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 2.5
	att.HolosightBone = "holosight"
	att.Colorable = true
	att.Mult_SightTime = 1.05
	att.ModelScale = Vector(0.75, 0.75, 0.75)
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_perk_fast.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_perk_fast")

	att.PrintName = "Fast Hands"
	att.Icon = Material("entities/slog_tuna_perk_fast.png", "mips smooth")
	att.Description = "Improves reload time and handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_perk"}
	att.Mult_ReloadTime = 0.85
	att.Mult_DrawTime = 0.75
	att.Mult_CycleTime = 0.75
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_perk_light.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_perk_light")

	att.PrintName = "Hollow Core"
	att.Icon = Material("entities/slog_tuna_perk_hollow.png", "mips smooth")
	att.Description = "Removes any part unnecessary and replace the shell with a lighter material. Speed for controllability"
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_perk"}
	att.Mult_ReloadTime = 0.95
	att.Mult_DrawTime = 0.95
	att.Mult_CycleTime = 0.95
	att.Mult_SpeedMult = 1.2
	att.Mult_SightedSpeedMult = 1.2
	att.Mult_ShootSpeedMult = 1.2
	att.Mult_Recoil = 1.2
	att.Mult_RecoilSide = 1.2
	att.Mult_VisualRecoilMult = 1.2
	att.Mult_SightTime = 0.75
	att.Mult_Sway = 1.2
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_perk_ov.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_perk_ov")

	att.PrintName = "Overclocked Core"
	att.Icon = Material("entities/slog_tuna_perk_ovc.png", "mips smooth")
	att.Description = "Heats up the firing core. All you need is fire superiority."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"fortuna_perk"}
	att.Mult_AccuracyMOA = 1.15
	att.Mult_Damage = 0.75
	att.Mult_DamageMin = 0.65
	att.Mult_Range = 0.8
	att.Mult_RPM = 1.25
	att.Mult_MuzzleVelocity = 1.25
	att.Hook_ModifyRPM = function(wep, delay)
	    local max = math.min(20, wep:GetCapacity())
	    local delta = wep:GetBurstCount() / max
	    local mult = Lerp(delta, 1, 2.5)
	    return delay / mult
	end
	att.Override_Firemodes = {
	    {
	        Mode = 2,
	    },
	}
	att.Hook_GetCapacity = function(wep, cap)
		return wep.RegularClipSize * 3
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_specialist_aicw.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_specialist_aicw")

	att.PrintName = "You aren't suppposed to see this"
	att.Icon = nil
	att.Description = "text of bottom location"
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
	att.Slot = "slog_tuna_specialist_aicw"
	att.UBGL = true
	att.ExcludeFlags = {"ubgl"}
	att.UBGL_Icon = Material("entities/slog_tuna_specialist_aicw.png", "mips smooth")
	att.UBGL_BaseAnims = true
	att.UBGL_PrintName = "Dark Matter"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_m79"
	att.UBGL_ClipSize = 1
	att.UBGL_Ammo = "AR2AltFire"
	att.UBGL_RPM = 120
	att.UBGL_Recoil = 0.5
	att.UBGL_Capacity = 1
	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("AR2AltFire")
	end
	att.Hook_ShouldNotSight = function(wep)
	    if wep:GetInUBGL() then
		return true
		end
	end
	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end
	    wep:FireRocket("arccw_slog_tuna_aicw_balls", 4000 * ArcCW.HUToM)
	    wep:SetClip2(wep:Clip2() - 1)
		wep:EmitSound("weapons/arccw_slog/fortuna/rifle/6nade.ogg", 100)			    		
	    wep:PlayAnimation("fire_ubgl", 1, true, nil, nil, nil, true)
	    wep:DoEffects()
	end
	att.Hook_OnSelectUBGL = function(wep)
	    wep:SetReloading(CurTime() + 15/40)
		wep:SetNextPrimaryFire(CurTime() + 15/40)	
		wep:SetNextSecondaryFire(CurTime() + 15/40)		
	    wep:PlayAnimation("enter_ubgl", 1, true, nil, nil, nil, true)	
	end
	att.Hook_OnDeselectUBGL = function(wep)
	    wep:SetReloading(CurTime() + 15/40)
		wep:SetNextPrimaryFire(CurTime() + 15/40)
	    wep:PlayAnimation("exit_ubgl", 1, true, nil, nil, nil, true)		
	end
	att.UBGL_Reload = function(wep, ubgl)
		local clip = 1
	    if wep:Clip2() >= clip then return end
	    if Ammo(wep) <= 0 then return end
	    wep:SetNextSecondaryFire(CurTime() + (wep:Clip2() == 0 and 80/40)) 
	    wep:PlayAnimation(wep:Clip2() == 0 and "oicw_dry", nil, true)
	    local reserve = Ammo(wep)
	    reserve = reserve + wep:Clip2()
	    local load = math.Clamp(5, 0, reserve)
	    wep.Owner:SetAmmo(reserve - load, "AR2AltFire")
	    wep:SetClip2(load)
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_specialist_akimbo.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_specialist_akimbo")

	att.PrintName = "You aren't suppposed to see this"
	att.Icon = nil
	att.Description = "text of bottom location"
	att.SortOrder = 8
	att.AutoStats = true
	att.Slot = "slog_tuna_specialist_akimbo"
	att.UBGL = true
	att.ExcludeFlags = {"ubgl"}
	att.UBGL_Icon = Material("entities/slog_tuna_specialist_akimbo.png", "mips smooth")
	att.UBGL_BaseAnims = true
	att.UBGL_PrintName = "Revolver"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_3"
	att.UBGL_ClipSize = 5
	att.UBGL_Ammo = "357"
	att.UBGL_RPM = 350
	att.UBGL_Recoil = 1.8
	att.UBGL_RecoilSide = 1.2
	att.UBGL_RecoilRise = 0.4
	att.UBGL_Capacity = 8
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
			Damage = 80,
			Force = 1,
			Attacker = wep.Owner,
			Dir = wep.Owner:EyeAngles():Forward(),
			Spread = Vector(fixedcone, fixedcone, 0),
			Callback = function(_, tr, dmg)
				local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM
				local dmgmax = 80
				local dmgmin = 30
				local delta = dist / 60
				delta = math.Clamp(delta, 0, 1)
				local amt = Lerp(delta, dmgmax, dmgmin)
				dmg:SetDamage(amt)
			end
		})
	    wep:EmitSound("weapons/arccw_slog/fortuna/rev/fire.ogg", 110, 100 * math.Rand(1 - 0.05, 1 + 0.05))
	                            -- This is kinda important
	                                            -- Wep volume
	                                                    -- Weapon pitch (along with the pitch randomizer)
	    wep:PlaySoundTable({
	            {s = "weapons/arccw_slog/fortuna/pistol/echo.wav",			t = 0},
		})													
	    wep:SetClip2(wep:Clip2() - 1)
	    
	    if wep:Clip2() >= 0 then
	        wep:PlayAnimation("fire_2", 1, true, nil, nil, nil, true)
	    end
	    wep:DoEffects()
	end
	att.UBGL_Reload = function(wep, ubgl)
	    wep:Reload()
	    local clip = 8
	    if wep:Clip2() >= clip then return end -- att.UBGL_Capacity
	    if Ammo(wep) <= 0 then return end
	    if wep:Clip2() >= 0 and wep:Clip1() <= 8 then
	        wep:PlayAnimation("wet_lug_rev", 1, true, nil, nil, nil, true)
	        wep:SetReloading(CurTime() + 161/40)
	        wep:SetNextSecondaryFire(CurTime() + 161/40)
			wep:SetNextPrimaryFire(CurTime() + 161/40)			
		end
	    if wep:Clip2() >= 0 and wep:Clip1() == 0 then --- dont laugh at this
	        wep:PlayAnimation("dry_lug_rev", 1, true, nil, nil, nil, true) --- y dis no work :((((((
	        wep:SetReloading(CurTime() + 190/40)
	        wep:SetNextSecondaryFire(CurTime() + 190/40)
			wep:SetNextPrimaryFire(CurTime() + 190/40)		
		end
	    if wep:Clip2() >= 0 and wep:Clip1() == 9 then
	        wep:PlayAnimation("dry_rev", 1, true, nil, nil, nil, true)
	        wep:SetReloading(CurTime() + 118/40)
	        wep:SetNextSecondaryFire(CurTime() + 118/40)
			wep:SetNextPrimaryFire(CurTime() + 118/40)			
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
-- slog_tuna_specialist_awrx6.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_specialist_awrx6")

	att.PrintName = "You aren't suppposed to see this"
	att.Icon = nil
	att.Description = "text of bottom location"
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
	att.Slot = "slog_tuna_specialist_awrx6"
	att.UBGL = true
	att.ExcludeFlags = {"ubgl"}
	att.UBGL_Icon = Material("entities/slog_tuna_specialist_awrx6.png", "mips smooth")
	att.UBGL_BaseAnims = true
	att.UBGL_PrintName = "Master Key"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_m79"
	att.UBGL_ClipSize = 1
	att.UBGL_Ammo = "buckshot"
	att.UBGL_RPM = 120
	att.UBGL_Recoil = 1
	att.UBGL_Capacity = 4
	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("buckshot")
	end
	att.Hook_ShouldNotSight = function(wep)
	    if wep:GetInUBGL() then
		return true
		end
	end
	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end
	    wep.Owner:FireBullets({
	        Src = wep.Owner:EyePos(),
	        Num = 13,
	        Damage = 16,
	        Force = 1.25,
	        Attacker = wep.Owner,
	        Dir = wep.Owner:EyeAngles():Forward(),
	        Spread = Vector(0.065, 0.065, 0.065),
	        Callback = function(_, tr, dmg)
	            local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM
	            local dmgmax = 16
	            local dmgmin = 6
	            local delta = dist / 60
	            delta = math.Clamp(delta, 0, 1)
	            local amt = Lerp(delta, dmgmax, dmgmin)
	            dmg:SetDamage(amt)
	        end
	    })
	    wep:SetClip2(wep:Clip2() - 1)
		wep:EmitSound("weapons/arccw_slog/fortuna/lmg/gl_fire.wav", 100)	
	    if wep:Clip2() > 0 then			    	
			wep:SetNextPrimaryFire(CurTime() + 28/40)	
	        wep:PlayAnimation("shot_fire", 1, true, nil, nil, nil, true)
	    else
	        wep:PlayAnimation("shot_last", 1, true, nil, nil, nil, true)
	    end
	    wep:DoEffects()
	end
	att.Hook_OnSelectUBGL = function(wep)
	    wep:SetReloading(CurTime() + 15/40)
		wep:SetNextPrimaryFire(CurTime() + 15/40)	
		wep:SetNextSecondaryFire(CurTime() + 15/40)		
	    wep:PlayAnimation("enter_ubgl", 1, true, nil, nil, nil, true)	
	end
	att.Hook_OnDeselectUBGL = function(wep)
	    wep:SetReloading(CurTime() + 15/40)
		wep:SetNextPrimaryFire(CurTime() + 15/40)
	    wep:PlayAnimation("exit_ubgl", 1, true, nil, nil, nil, true)		
	end
	att.UBGL_Reload = function(wep, ubgl)
		local clip = 4 + 1
	    if wep:Clip2() >= clip then return end
	    if Ammo(wep) <= 0 then return end
	    wep:SetNextSecondaryFire(CurTime() + (wep:Clip2() == 0 and 115/40 or 95/40)) 
	    wep:PlayAnimation(wep:Clip2() == 0 and "oicw_dry" or "oicw_wet", nil, true)
	    local reserve = Ammo(wep)
	    reserve = reserve + wep:Clip2()
	    local load = math.Clamp(5, 0, reserve)
	    wep.Owner:SetAmmo(reserve - load, "buckshot")
	    wep:SetClip2(load)
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_specialist_fx92.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_specialist_fx92")

	att.PrintName = "You aren't suppposed to see this"
	att.Icon = nil
	att.Description = "text of bottom location"
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
	att.Slot = "slog_tuna_specialist_fx92"
	att.UBGL = true
	att.ExcludeFlags = {"ubgl"}
	att.UBGL_Icon = Material("entities/slog_tuna_specialist_fx92.png", "mips smooth")
	att.UBGL_BaseAnims = true
	att.UBGL_PrintName = "OICW"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_m79"
	att.UBGL_ClipSize = 1
	att.UBGL_Ammo = "smg1_grenade"
	att.UBGL_RPM = 120
	att.UBGL_Recoil = 1
	att.UBGL_Capacity = 4
	att.Hook_ShouldNotSight = function(wep)
	    if wep:GetInUBGL() then
		return true
		end
	end
	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("smg1_grenade")
	end
	att.UBGL_Fire = function(wep, ubgl)
	    if (wep:Clip2() <= 0) then return end
	    wep:PlayAnimation("fire_gl", 1, true, nil, nil, nil, true)
	    wep:FireRocket("arccw_slog_tuna_fx92_exp", 3000 * ArcCW.HUToM)
	    wep:EmitSound("weapons/arccw_slog/fortuna/lmg/gl_fire.wav", 100)
	    wep:SetClip2(wep:Clip2() - 1)
	    wep:DoEffects()
	end
	att.UBGL_Reload = function(wep, ubgl)
		local clip = 4 + 1
	    if wep:Clip2() >= clip then return end
	    if Ammo(wep) <= 0 then return end
	    wep:SetNextSecondaryFire(CurTime() + (wep:Clip2() == 0 and 168/40 or 137/40))
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
-- slog_tuna_specialist_rmb17.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_specialist_rmb17")

	att.PrintName = "You aren't suppposed to see this"
	att.Icon = nil
	att.Description = "text of bottom location"
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
	att.Slot = "slog_tuna_specialist_rmb17"
	att.UBGL = true
	att.ExcludeFlags = {"ubgl"}
	att.UBGL_Icon = Material("entities/slog_tuna_specialist_rpg.png", "mips smooth")
	att.UBGL_BaseAnims = true
	att.UBGL_PrintName = "RPG"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_m79"
	att.UBGL_ClipSize = 1
	att.UBGL_Ammo = "RPG_Round"
	att.UBGL_RPM = 120
	att.UBGL_Recoil = 1
	att.UBGL_Capacity = 1
	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("RPG_Round")
	end
	att.UBGL_Fire = function(wep, ubgl)
	    if (wep:Clip2() <= 0 or wep:Clip1() <= 0) then return end
	    wep:PlayAnimation("fire_gl", 1, true, nil, nil, nil, true)
	    wep:FireRocket("arccw_slog_tuna_rpg_exp", 3000 * ArcCW.HUToM)
	    wep:EmitSound("weapons/arccw_slog/fortuna/ak/fire_rpg.ogg", 100)
	    wep:SetClip2(wep:Clip2() - 1)
	    wep:SetClip1(wep:Clip1() - 1)	
	    wep:DoEffects()
	end
	att.Hook_OnSelectUBGL = function(wep)
	    if wep:Clip2() == 0 then
	        wep:ReloadUBGL()
	    else
	        wep:PlayAnimation("enter_nade", 1, true, nil, nil, nil, true)
	        wep:SetReloading(CurTime() + 103/40)
	    end
	end
	att.Hook_OnDeselectUBGL = function(wep)
	    if wep:Clip2() != 0 then
	        wep:PlayAnimation("exit_nade", 1, true, nil, nil, nil, true)
	        wep:SetReloading(CurTime() + 99/40)
			wep:SetNextPrimaryFire(CurTime() + 99/40)	--- fes cunt u lie to me
	    end
	end
	att.UBGL_Reload = function(wep, ubgl)
		local clip = 1
	    if wep:Clip2() >= clip then return end
	    if Ammo(wep) <= 0 then return end
	    wep:PlayAnimation(wep:Clip2() == 0 and "oicw_dry", 1, true, nil, nil, nil, true)
		wep:SetNextSecondaryFire(CurTime() + 103/40)	
	    local reserve = Ammo(wep)
	    reserve = reserve + wep:Clip2()
	    local load = math.Clamp(5, 0, reserve)
	    wep.Owner:SetAmmo(reserve - load, "RPG_Round")
	    wep:SetClip2(load)
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- slog_tuna_specialist_saw.lua
------

do
	local att = {}
	ArcCW.SetShortName("slog_tuna_specialist_saw")

	att.PrintName = "Saw Grip"
	att.Icon = Material("entities/slog_tuna_fg.png", "mips smooth")
	att.Description = "Foregrip specialised for belt fed and such, removes the ability to ads and severely impacts handling but provides excellent recoil control."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 1000000
	att.AutoStats = true
	att.Slot = {"fortuna_optic_saw"}
	att.LHIK = true
	att.Model = "models/weapons/arccw/slog_osi_suck/att/fg_saw.mdl"
	att.Mult_Recoil = 0.5
	att.Mult_HipDispersion = 0.5
	att.Mult_SightTime = 0.75
	att.Mult_SightedSpeedMult = 0.85
	att.Mult_SpeedMult = 0.75
	att.Mult_ShootSpeedMult = 0.85
	att.Mult_AccuracyMOA = 3
	att.Mult_SightsDispersion = 1.5
	att.Override_HoldtypeActive = "crossbow"
	ArcCW.LoadAttachmentType(att)
end

