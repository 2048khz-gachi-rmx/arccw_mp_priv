local Material = ArcCW.AttachmentMat

------
-- gsoe_extra_fcg_smartburst.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsoe_extra_fcg_smartburst")

	att.PrintName = "(CSExtras) Smart Burst"
	att.Icon = Material("entities/acwatt_fcg_smartburst.png", "smooth mips")
	att.Description = "A burst firemode conversion that varies its length to magazine capacity. Fires faster than traditional bursting."
	att.Desc_Neutrals = {
	    "Each burst fires 10% of magazine (min. 2)",
	}
	att.Desc_Cons = {
	    "con.burstdelay"
	}
	att.Slot = "go_perk"
	att.InvAtt = "fcg_smartburst"

	att.Ignore = false

	att.Override_Firemodes = {
	    {
	        Mode = -1000,
	        CustomBars = "---__",
	        PrintName = "S-BST",
	        RunawayBurst = true,
	    },
	    {
	        Mode = 0
	    }
	}

	att.Mult_RPM = 1.15
	att.AutoStats = true

	att.Hook_GetBurstLength = function(wep)

	    local bstCnt = math.max(math.ceil(wep:GetCapacity() * 0.1), 2)

	    if wep:GetNWInt("ArcCW_SmartBurst", -1) < 0 then
	        wep:SetBurstCount(0)
	        wep:SetNWInt("ArcCW_SmartBurst", bstCnt)
	    end

	    return wep:GetNWInt("ArcCW_SmartBurst", -1) < 0 and nil or wep:GetNWInt("ArcCW_SmartBurst")
	end

	-- Using this as a makeshift onReload hook right now
	att.Hook_SelectReloadAnimation = function(wep, mult)
	    wep:SetNWInt("ArcCW_SmartBurst", -1)
	end

	att.Hook_ShouldNotFire = function(wep)
	    if wep:GetNWInt("ArcCW_SmartBurst", -1) > 1 and wep:GetNWInt("ArcCW_SmartBurst", -1) <= wep:GetBurstCount() then
	        wep:SetNWInt("ArcCW_SmartBurst", -1)
	        wep.Primary.Automatic = false
	        wep:SetNextPrimaryFire(CurTime() + 0.12)
	        return true
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsoe_extra_fcg_tidal.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsoe_extra_fcg_tidal")

	att.PrintName = "(CSExtras) Tidal"
	att.Icon = Material("entities/acwatt_fcg_tidal.png", "smooth mips")
	att.Description = "Fire system that harnesses the magnetic field to cycle bullets at a dramatic rate. Like its namesake, the actual rate of fire increases and decreases periodically."
	att.Desc_Neutrals = {
	    "250% maximum firerate",
	    "100% minimum firerate",
	}
	att.Desc_Pros = {
	    "+ Fully automatic fire",
	    "+ Potential fire rate increase"
	}
	att.Desc_Cons = {
	    "- Inconsistent fire rate",
	}
	att.Slot = "go_perk"
	att.InvAtt = "fcg_tidal"

	att.Override_Firemodes = {
	    {
	        Mode = 2,
	        PrintName = "TIDAL",
	    },
	    {
	        Mode = 0
	    }
	}

	att.AutoStats = true

	att.Mult_RPM = 1
	att.Mult_AccuracyMOA = 1.4

	att.Hook_ModifyRPM = function(wep, delay)
	    return delay * (0.4 + math.abs(math.sin(CurTime() * 0.6) * 1))
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsoe_extra_muzz_8choke.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsoe_extra_muzz_8choke")

	att.PrintName = "(CSExtras) 8-Choke"
	att.Icon = Material("entities/acwatt_muzz_8choke.png", "smooth mips")
	att.Description = "Curious shotgun choke producing an 8-shaped pattern."
	att.Desc_Pros = {
	    "+ 8-shaped pattern",
	}
	att.Desc_Cons = {
	    "- Numbers are for nerds"
	}
	att.AutoStats = false
	att.Slot = "muzzle"
	att.InvAtt = "muzz_choke"

	att.SortOrder = 21
	att.Mult_AccuracyMOA = 0.2

	att.Override_ShotgunSpreadPattern = true
	att.Override_ShotgunSpreadDispersion = false

	att.Hook_ShotgunSpreadOffset = function(wep, data)

	    local a1 = Angle(0, math.Rand(-360, 360), 0)
	    local v1 = a1:Forward() * 1.8

	    if math.random(0, 1) >= 0.5 then
	        v1.x = v1.x + 2
	    else
	        v1.x = v1.x - 2
	    end
	    data.ang = Angle(v1.x, v1.y, 0)

	    return data
	end

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsoe_extra_muzz_fchoke.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsoe_extra_muzz_fchoke")

	att.PrintName = "(CSExtras) F-Choke"
	att.Icon = Material("entities/acwatt_muzz_fchoke.png", "smooth mips")
	att.Description = "Curious shotgun choke producing a F-shaped pattern."
	att.Desc_Pros = {
	    "+ No need to type F in the chat",
	}
	att.Desc_Cons = {
	    "- The F might be for you"
	}
	att.AutoStats = false
	att.Slot = "muzzle"
	att.InvAtt = "muzz_choke"

	att.Mult_AccuracyMOA = 0.2

	att.Override_ShotgunSpreadPattern = true
	att.Override_ShotgunSpreadDispersion = false

	att.Hook_ShotgunSpreadOffset = function(wep, data)
	    local rand = math.random()
	    if rand <= 0.4 then
	        data.ang = Angle(math.Rand(-3, 3), 2, 0)
	    elseif rand <= 0.7 then
	        data.ang = Angle(-3, math.Rand(-1, 2), 0)
	    else
	        data.ang = Angle(0, math.Rand(-1, 2), 0)
	    end

	    return data
	end

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsoe_extra_muzz_zchoke.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsoe_extra_muzz_zchoke")

	att.PrintName = "(CSExtras) Z-Choke"
	att.Icon = Material("entities/acwatt_muzz_zchoke.png", "smooth mips")
	att.Description = "Curious shotgun choke producing a Z-shaped pattern."
	att.Desc_Pros = {
	    "+ Zorro reference?",
	}
	att.Desc_Cons = {
	    "- Or is it something else..."
	}
	att.AutoStats = false
	att.Slot = "muzzle"
	att.InvAtt = "muzz_choke"

	att.SortOrder = 20
	att.Mult_AccuracyMOA = 0.2

	att.Override_ShotgunSpreadPattern = true
	att.Override_ShotgunSpreadDispersion = false

	att.Hook_ShotgunSpreadOffset = function(wep, data)
	    local rand = math.random()
	    if rand <= 0.333 then
	        data.ang = Angle(3, math.Rand(-3, 3), 0)
	    elseif rand <= 0.666 then
	        data.ang = Angle(-3, math.Rand(-3, 3), 0)
	    else
	        local sqrt3 = 1.73205
	        local line = math.Rand(-sqrt3, sqrt3)
	        data.ang = Angle(line, line, 0)
	    end

	    return data
	end

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsoe_extra_perk_beefficient.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsoe_extra_perk_beefficient")

	att.PrintName = "(CSExtras) Be Efficient"
	att.Icon = Material("entities/acwatt_perk_beefficient.png", "smooth mips")
	att.Description = "Headshots have a chance to load one bullet from your reserve into your chamber.\nRemember to also be polite, and have a plan to kill everyone you meet."
	att.Desc_Pros = {
	    "Load round on headshot"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "100% chance to load on player hit",
	    "75% chance to load on NPC hit"
	}
	att.Slot = "go_perk"
	att.InvAtt = "perk_beefficient"

	att.NotForNPC = true

	att.AutoStats = true

	att.Hook_Compatible = function(wep)
	    if wep.Num ~= 1 or not wep.ManualAction then return false end
	end

	att.Hook_BulletHit = function(wep, data)
	    if CLIENT then return end

	    if data.tr.Entity and data.tr.HitGroup == HITGROUP_HEAD and (data.tr.Entity:IsPlayer() or math.random() <= 0.75) then
	        if wep:GetOwner():IsPlayer() then
	            wep:GetOwner():RemoveAmmo(1, wep.Primary.Ammo)
	        end
	        wep:SetClip1(wep:Clip1() + 1)
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsoe_extra_perk_fastbolt.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsoe_extra_perk_fastbolt")

	att.PrintName = "(CSExtras) Greased Bolt"
	att.Icon = Material("entities/acwatt_perk_fastbolt.png", "smooth mips")
	att.Description = "A well oiled bolt and a steadfast hand improves weapon cycling rate."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Slot = "go_perk"
	att.InvAtt = "perk_fastbolt"

	att.NotForNPC = true

	att.AutoStats = true
	att.Mult_CycleTime = 0.85

	att.Hook_Compatible = function(wep)
	    if wep.Num ~= 1 or not wep.ManualAction then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsoe_extra_perk_infinite.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsoe_extra_perk_infinite")

	att.PrintName = "(CSExtras) Infinity"
	att.Icon = Material("entities/acwatt_perk_infinite.png", "smooth mips")
	att.Description = "An attempt to replicate the infinity-shaped drum magazine used by the mother of special forces. Each shot will drain a round from reserves with a 60% chance of replenishing the magazine. The heavy weight of the system impacts performance severely."
	att.Desc_Pros = {
	    "+ Chance to refill magazine"
	}
	att.Desc_Cons = {
	}
	att.Slot = "go_perk"
	att.InvAtt = "perk_infinite"
	att.NotForNPC = true

	att.AutoStats = true

	att.Mult_SightTime = 1.25
	att.Mult_MoveSpeed = 0.85
	att.Mult_SightedMoveSpeed = 0.7
	att.Mult_MoveDispersion = 1.3
	att.Mult_ReloadTime = 1.3

	att.Hook_Compatible = function(wep)
	    if wep.Primary.ClipSize <= 6 or wep.ShotgunReload then return false end
	end

	att.Hook_FireBullets = function(wep, data)
	    if CLIENT then return end
	    if not wep:GetOwner():IsPlayer() then wep:SetClip1(wep:Clip1() + 1) return end

	    if wep:GetOwner():GetAmmoCount(wep.Primary.Ammo) <= 0 then return end
	    wep:GetOwner():RemoveAmmo(1, wep.Primary.Ammo)

	    if math.random() <= 0.6 then
	        wep:SetClip1(wep:Clip1() + 1)
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsoe_extra_perk_push.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsoe_extra_perk_push")

	att.PrintName = "(CSExtras) Airbender"
	att.Icon = Material("entities/acwatt_perk_push.png", "smooth mips")
	att.Description = "Specialized internals generate a gust of air as the bullet flies, physically punching the target with force proportional to damage. The firing force will push the user back proportional to recoil."
	att.Desc_Pros = {
	    "+ Push force on target",
	    "+ Disorients target"
	}
	att.Desc_Cons = {
	    "- Push force on self",
	}
	att.Slot = "go_perk"
	att.InvAtt = "perk_push"

	att.NotForNPC = true

	att.AutoStats = true

	att.Mult_Damage = 0.85
	att.Mult_Recoil = 1.25

	att.Hook_PostFireBullets = function(wep)
	    if CLIENT then return end

	    local dir = wep.Owner:GetForward()
	    if wep.Owner:IsPlayer() and wep.Owner:GetPhysicsObject():IsValid() then
	        local v = dir * (wep.Owner:IsOnGround() and -3 or -1) * math.Clamp(math.sqrt(wep.Recoil), 0.5, 3) * 60
	        if GetConVar("arccw_extra_nofly"):GetBool() and not wep.Owner:IsOnGround() then v = v * 0.25 end
	        wep.Owner:SetVelocity( v )
	    end
	end

	att.Hook_BulletHit = function(wep, data)
	    if CLIENT then return end
	    local ent = data.tr.Entity

	    -- Debounce for one tick to block shotgun shots
	    if (ent.ArcCW_AirbenderNext or 0) >= CurTime() then return end
	    ent.ArcCW_AirbenderNext = CurTime() + 0.01

	    local dir = data.tr.Normal:GetNormalized()
	    -- Use full damage on shotguns
	    local damage = math.min(120, wep:GetDamage(data.range))
	    if ent and ent:GetPhysicsObject():IsValid() then
	        if ent:IsNPC() or ent:IsNextBot() then
	            if ent:OnGround() then
	                dir.z = 0.25
	                dir = dir:GetNormalized()
	                ent:SetVelocity( ent:GetVelocity() + dir * damage * 15 )
	            end
	        elseif ent:IsPlayer() then
	            dir.z = 1
	            ent:SetVelocity( dir * (ent:IsOnGround() and 6 or 2) * damage )
	            local r = math.Clamp(damage / 12, 0.5, 10)
	            local punch = AngleRand(-r, r)
	            punch.r = 0
	            ent:SetEyeAngles(ent:EyeAngles() + punch)
	            ent:ViewPunch(punch * 2)
	        else
	            dir.z = 0.25
	            dir = dir:GetNormalized()
	            ent:GetPhysicsObject():AddVelocity(dir * damage * 4)
	        end
	    end

	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsoe_extra_perk_streetjustice.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsoe_extra_perk_streetjustice")

	att.PrintName = "(CSExtras) Street Justice"
	att.Icon = Material("entities/acwatt_perk_streetjustice.png", "smooth mips")
	att.Description = "Concentrate all your fury into every bash, creating a strong push force and knocking ammo from the target to you (how does that work?)."
	att.Desc_Pros = {
	    "+ Ammo steal on bash",
	    "+ Knockback force on bash"
	}
	att.Desc_Cons = {
	}
	att.Slot = "go_perk"
	att.InvAtt = "perk_streetjustice"

	att.NotForNPC = true

	att.AutoStats = true
	att.Mult_MeleeDamage = 1.25
	att.Mult_MeleeTime = 1.25
	att.Mult_DrawTime = 1.25

	att.Hook_PostBash = function(wep, data)
	    local ent = data.tr.Entity
	    local dir = data.tr.Normal:GetNormalized()

	    if IsValid(ent) then
	        if (ent.ArcCW_StreetJustice or 0) < CurTime() and (ent:IsNPC() or ent:IsPlayer()) then
	            local otherWep = ent:GetActiveWeapon()
	            if ent:IsPlayer() and IsValid(otherWep) and otherWep:Clip1() > 0 then
	                ent:GetActiveWeapon():SetClip1(math.ceil(otherWep:Clip1() / 4))
	                wep:SetClip1(math.min(wep:GetCapacity() + wep:GetChamberSize(), math.ceil(wep:Clip1() + wep.RegularClipSize * 0.5)))
	                ent.ArcCW_StreetJustice = CurTime() + 10
	                ent:EmitSound("ambient/alarms/warningbell1.wav", 90, 110)
	            elseif ent:IsNPC() and IsValid(otherWep) then
	                ent:GetActiveWeapon():SetClip1(0)
	                wep:SetClip1(math.min(wep:GetCapacity() + wep:GetChamberSize(), math.ceil(wep:Clip1() + wep.RegularClipSize * 0.25)))
	                ent.ArcCW_StreetJustice = CurTime() + 3
	            end
	        end
	        if ent:IsNPC() or (ent:IsNextBot() and ent:GetPhysicsObject():IsValid()) then
	            dir.z = 0.15
	            dir = dir:GetNormalized()
	            ent:SetVelocity( ent:GetVelocity() + dir * 2000 * (ent:IsOnGround() and 1 or 0.1) )
	        elseif ent:IsPlayer() then
	            dir.z = 0.75
	            ent:SetVelocity( dir * (ent:IsOnGround() and 5 or 3) * 50 )
	            local punch = AngleRand(-30, 30)
	            punch.r = 0
	            ent:SetEyeAngles(ent:EyeAngles() + punch)
	            ent:ViewPunch(punch * 2)
	        elseif IsValid(ent) and ent:GetPhysicsObject():IsValid() then
	            dir.z = 0.25
	            dir = dir:GetNormalized()
	            ent:GetPhysicsObject():AddVelocity(dir * 90 * 4)
	        end
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- laser_compact.lua
------

do
	local att = {}
	ArcCW.SetShortName("laser_compact")

	att.PrintName = "Compact Laser"
	att.Icon = Material("entities/acwatt_laser_compact.png")
	att.Description = "Small lightweight laser for pistols. Red beam assists with aiming from the hip. Not as powerful as a bright laser."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.beam"
	}
	att.AutoStats = true
	att.Slot = {"tac_pistol", "tac"}

	att.Model = "models/weapons/arccw/atts/laser_compact.mdl"

	att.Laser = true
	att.LaserStrength = 0.5
	att.LaserBone = "laser"

	att.ColorOptionsTable = {Color(255, 50, 50)}

	att.Mult_HipDispersion = 0.7
	ArcCW.LoadAttachmentType(att)
end

------
-- muzz_booster.lua
------

do
	local att = {}
	ArcCW.SetShortName("muzz_booster")

	att.PrintName = "Muzzle Booster"
	att.Icon = Material("entities/acwatt_muzz_booster.png")
	att.Description = "Muzzle device which boosts exhaust gases in order to increase fire rate. Doing so increases felt recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"muzzle"}

	att.SortOrder = 50

	att.Model = "models/weapons/arccw/atts/muzz_booster.mdl"

	att.Mult_ShootPitch = 0.975
	--att.Mult_ShootVol = 1.05

	att.Mult_SightTime = 1.05

	att.Add_BarrelLength = 4

	att.Mult_Recoil = 1.25
	--att.Mult_RecoilSide = 1.15

	att.Mult_RPM = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- muzz_brake.lua
------

--[[do
	local att = {}
	ArcCW.SetShortName("muzz_brake")

	att.PrintName = "Muzzle Brake"
	att.Icon = Material("entities/acwatt_muzz_brake.png")
	att.Description = "Muzzle device that aggressively fights recoil by sending exhaust gases upward to combat muzzle rise. Improves vertical recoil, but makes recoil less stable. Also increases weapon report."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"muzzle", "muzzle_shotgun"}

	att.SortOrder = 50

	att.Model = "models/weapons/arccw/atts/muzz_brake.mdl"

	att.Mult_ShootPitch = 0.95
	att.Mult_ShootVol = 1.15

	att.Mult_SightTime = 1.05

	att.Add_BarrelLength = 2

	att.Mult_Recoil = 0.8
	att.Mult_RecoilSide = 1.5
	ArcCW.LoadAttachmentType(att)
end]]

------
-- muzz_breacher.lua
------

do
	local att = {}
	ArcCW.SetShortName("muzz_breacher")

	att.PrintName = "Breaching Device"
	att.Icon = Material("entities/acwatt_muzz_breacher.png")
	att.Description = "Heavy muzzle device with spiked front that increases melee damage."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"muzzle", "muzzle_shotgun"}

	att.SortOrder = 50

	att.Model = "models/weapons/arccw/atts/muzz_breacher.mdl"

	att.Mult_MeleeDamage = 1.5

	att.Mult_SpeedMult = 0.97

	att.Add_BarrelLength = 3

	att.Mult_MeleeTime = 0.9

	att.Add_MeleeRange = 4
	ArcCW.LoadAttachmentType(att)
end

------
-- muzz_choke.lua
------

do
	local att = {}
	ArcCW.SetShortName("muzz_choke")

	att.PrintName = "Tight Choke"
	att.Icon = Material("entities/acwatt_muzz_choke.png")
	att.Description = "Shotgun choke which reduces pellet spread, at the cost of directly worsening clump dispersion while hip firing. Also increases felt recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"choke", "muzzle_shotgun"}

	att.SortOrder = 30

	att.Mult_Recoil = 1.35
	att.Mult_HipDispersion = 1.5
	att.Mult_AccuracyMOA = 0.7
	ArcCW.LoadAttachmentType(att)
end

------
-- muzz_circlechoke.lua
------

do
	local att = {}
	ArcCW.SetShortName("muzz_circlechoke")

	att.PrintName = "Concentric Choke"
	att.Icon = Material("entities/acwatt_muzz_circlechoke.png")
	att.Description = "Shotgun choke producing a circular pattern which is hollow in the middle."
	att.Desc_Pros = {
	    "pro.muzz_circlechoke",
	}
	att.Desc_Cons = {
	    "con.muzz_circlechoke"
	}
	att.AutoStats = false
	att.Slot = {"choke", "muzzle_shotgun"}

	att.SortOrder = 20

	att.Mult_AccuracyMOA = 0.25

	att.Override_ShotgunSpreadPattern = true
	att.Override_ShotgunSpreadDispersion = false

	att.Hook_ShotgunSpreadOffset = function(wep, data)
	    local a1 = Angle(0, math.Rand(-360, 360), 0)
	    local v1 = a1:Forward() * 2.5
	    data.ang = Angle(v1.x, v1.y, 0)

	    return data
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- muzz_compensator.lua
------

--[[
do
	local att = {}
	ArcCW.SetShortName("muzz_compensator")

	att.PrintName = "Compensator"
	att.Icon = Material("entities/acwatt_muzz_compensator.png")
	att.Description = "Muzzle device which redirects exhaust gases in order to improve the consistency of felt recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"muzzle", "muzzle_shotgun"}

	att.SortOrder = 50

	att.Model = "models/weapons/arccw/atts/muzz_compensator.mdl"

	att.Mult_ShootPitch = 1.025

	att.Mult_SightTime = 1.05

	att.Add_BarrelLength = 3

	att.Mult_Recoil = 1.05
	att.Mult_RecoilSide = 0.7
	ArcCW.LoadAttachmentType(att)
end
]]
------
-- muzz_crosschoke.lua
------

do
	local att = {}
	ArcCW.SetShortName("muzz_crosschoke")

	att.PrintName = "Cross Choke"
	att.Icon = Material("entities/acwatt_muzz_crosschoke.png")
	att.Description = "Shotgun choke producing a cross-shaped pattern."
	att.Desc_Pros = {
	    "pro.muzz_crosschoke",
	}
	att.Desc_Cons = {
	    "con.situational"
	}
	att.AutoStats = false
	att.Slot = {"choke", "muzzle_shotgun"}

	att.SortOrder = 20

	att.Mult_AccuracyMOA = 0.2

	att.Override_ShotgunSpreadPattern = true
	att.Override_ShotgunSpreadDispersion = false

	att.Hook_ShotgunSpreadOffset = function(wep, data)
	    if math.random(0, 1) >= 0.5 then
	        data.ang = Angle(0, math.Rand(-3, 3), 0)
	    else
	        data.ang = Angle(math.Rand(-3, 3), 0, 0)
	    end

	    return data
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- muzz_duckbill.lua
------

do
	local att = {}
	ArcCW.SetShortName("muzz_duckbill")

	att.PrintName = "Duckbill Choke"
	att.Icon = Material("entities/acwatt_muzz_duckbill.png")
	att.Description = "Shotgun choke which produces a wide horizontal dispersion pattern. Potentially good for crowd control."
	att.Desc_Pros = {
	    "pro.muzz_duckbill",
	}
	att.Desc_Cons = {
	    "con.muzz_duckbill"
	}
	att.AutoStats = false
	att.Slot = {"choke", "muzzle_shotgun"}

	att.SortOrder = 20

	att.Mult_AccuracyMOA = 0.25

	att.Override_ShotgunSpreadPattern = true
	att.Override_ShotgunSpreadDispersion = false

	att.Hook_ShotgunSpreadOffset = function(wep, data)
	    data.ang = Angle(0, math.Rand(-5, 5), 0)

	    return data
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- muzz_flashhider.lua
------

do
	local att = {}
	ArcCW.SetShortName("muzz_flashhider")

	att.PrintName = "Flash Hider"
	att.Icon = Material("entities/acwatt_muzz_flashhider.png")
	att.Description = "Muzzle device which hides muzzle flash while improving hip fire characteristics."
	att.Desc_Pros = {
	    "pro.flashhiding",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"muzzle", "muzzle_shotgun"}

	att.SortOrder = 50

	att.Model = "models/weapons/arccw/atts/muzz_flashhider.mdl"

	att.Override_MuzzleEffect = "muzzleflash_pistol"
	att.FlashHider = true

	att.Mult_HipDispersion = 0.75

	att.Mult_ShootPitch = 1.05

	att.Mult_SightTime = 1.07

	att.Add_BarrelLength = 3

	att.Mult_SightedMoveSpeed = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- muzz_hbar.lua
------

do
	local att = {}
	ArcCW.SetShortName("muzz_hbar")

	att.PrintName = "Heavy Barrel"
	att.Icon = Material("entities/acwatt_muzz_hbar.png")
	att.Description = "Reinforced barrel with superior performance characteristics. Improves accuracy and recoil control at the cost of weapon weight."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"muzzle", "barrel"}

	att.SortOrder = 5

	att.Mult_ShootPitch = 0.95
	att.Mult_AccuracyMOA = 0.65
	att.Mult_Range = 1.5
	--att.Mult_Recoil = 0.9

	att.Mult_SightTime = 1.2

	att.Mult_SpeedMult = 0.9
	att.Mult_SightedSpeedMult = 0.9
	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end

	ArcCW.LoadAttachmentType(att)
end

------
-- muzz_lbar.lua
------

do
	local att = {}
	ArcCW.SetShortName("muzz_lbar")

	att.PrintName = "Light Barrel"
	att.Icon = Material("entities/acwatt_muzz_lbar.png")
	att.Description = "Lightweight barrel with reduced weight, at the cost of reduced precision and ballistics."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"muzzle", "barrel"}

	att.SortOrder = 5

	att.Mult_ShootPitch = 1.05
	att.Mult_AccuracyMOA = 1.2

	att.Mult_Range = 0.85
	att.Mult_Recoil = 1.1

	att.Mult_SightTime = 0.75
	att.Mult_SightedSpeedMult = 1.5
	att.Mult_SpeedMult = 1.25
	att.Mult_DrawTime = 0.8

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end

	ArcCW.LoadAttachmentType(att)
end

------
-- muzz_mp5sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("muzz_mp5sd")

	att.PrintName = "Integral Schalldämpfer"
	att.Icon = Material("entities/acwatt_muzz_mp5sd.png")
	att.Description = "Integrated sound dampener which reduces bullets to subsonic velocity. Slows down fire rate due to quieter internal parts, but is otherwise a more egronomic Colossal Suppressor."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true

	att.SortOrder = 100

	att.ActivateElements = {"mp5sd"}

	att.Slot = "mp5sd"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Mult_ShootPitch = 0.9
	att.Mult_ShootVol = 0.75
	att.Mult_AccuracyMOA = 0.75
	att.Mult_Range = 1.25

	att.Mult_SightTime = 1.15
	att.Mult_HipDispersion = 1.3

	att.Add_BarrelLength = 24

	att.Mult_RPM = 0.8
	ArcCW.LoadAttachmentType(att)
end

------
-- muzz_widechoke.lua
------

do
	local att = {}
	ArcCW.SetShortName("muzz_widechoke")

	att.PrintName = "Wide Choke"
	att.Icon = Material("entities/acwatt_muzz_widechoke.png")
	att.Description = "Shotgun choke which increases pellet spread, but greatly reduces hip fire dispersion and felt recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"choke", "muzzle_shotgun"}

	att.SortOrder = 30

	att.Mult_Recoil = 0.7
	att.Mult_HipDispersion = 0.2
	att.Mult_AccuracyMOA = 1.5
	ArcCW.LoadAttachmentType(att)
end
