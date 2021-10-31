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
	att.Mult_AccuracyMOA = 0.6
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

	att.Mult_Recoil = 0.8
	att.Mult_HipDispersion = 0.1
	att.Mult_AccuracyMOA = 2.5
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_akimbo_deagle.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_akimbo_deagle")

	att.PrintName = "Desert Eagle"
	att.Icon = Material("entities/acwatt_mw2_akimbo.png", "smooth")
	att.Description = "Wholy."
	att.Hidden = false
	att.Desc_Pros = {
	    "+100% more gun",
	}
	att.Desc_Cons = {
	    "- Cannot use ironsights"
	}
	att.Desc_Neutrals = {
	    "Don't toggle the UBGL"
	}
	att.AutoStats = true
	att.Mult_HipDispersion = 4
	att.Slot = "akimbotest"

	att.GivesFlags = {"cantuseshitinakimboyet"}

	att.SortOrder = 1738

	att.AddSuffix = " + Desert Eagle"

	att.MountPositionOverride = 0

	att.Model = "models/weapons/arccw/fesiugmw2/akimbo/c_desert_eagle_left_2.mdl"


	att.LHIK = true
	att.LHIK_Animation = true
	att.LHIK_MovementMult = 0

	att.UBGL = true

	att.UBGL_PrintName = "AKIMBO"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_4"
	att.UBGL_ClipSize = 7
	att.UBGL_Ammo = "357"
	att.UBGL_RPM = 60 / 0.079
	att.UBGL_Recoil = 1
	att.UBGL_RecoilSide = 1
	att.UBGL_RecoilRise = 0
	att.UBGL_Capacity = 7

	att.Hook_ShouldNotSight = function(wep)
	    return true
	end

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("357") -- att.UBGL_Ammo
	end

	att.Hook_Think = function(wep)
	    if wep:GetMW2Masterkey_ShellInsertTime() < CurTime() and wep:GetMW2Masterkey_ShellInsertTime() != 0 then
	        wep:SetMW2Masterkey_ShellInsertTime(0)
	        local clip = 7
	        if wep:Clip2() >= clip then return end
	        if Ammo(wep) <= 0 then return end

	        local reserve = Ammo(wep)
	        reserve = reserve + wep:Clip2()
	        local load = math.Clamp(clip, 0, reserve)
	        wep.Owner:SetAmmo(reserve - load, "357")
	        wep:SetClip2(load)
	    end

	    if !IsFirstTimePredicted() then return end
	    if wep:GetOwner():KeyPressed(IN_RELOAD) then
	        wep:SetInUBGL(false)
	        wep:ReloadUBGL()
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK) then
	        wep:SetInUBGL(false)
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK2) then
	        wep:SetInUBGL(true)
	        wep:ShootUBGL()
	    end
	end

	local awesomelist = {
	    ["sprint_in_akimbo_right"] = {
	        time = 10/30,
	        anim = "sprint_in",
	    },
	    ["sprint_out_akimbo_right"] = {
	        time = 10/30,
	        anim = "sprint_out",
	    },
	    ["sprint_loop_akimbo_right"] = {
	        time = 30/40,
	        anim = "sprint_loop",
	    },
	    ["pullout_akimbo_right"] = {
	        time = 26/30 /4,
	        anim = "pullout",
	    },
	    ["putaway_akimbo_right"] = {
	        time = 26/30 /4,
	        anim = "putaway",
	    },
	}

	att.Hook_TranslateSequence = function(wep, anim)
	    if awesomelist[anim] then
	        local bab = awesomelist[anim]
	        wep:DoLHIKAnimation(bab.anim, bab.time)
	    end
	end

	att.Hook_LHIK_TranslateAnimation = function(wep, anim)
	    if anim == "idle" then
	        --wep:DoLHIKAnimation("idle", 200/30) This will fucking crash your game because it plays idle when the animation playing is idle WHY DIDNT I CALL IT IDLE_AKIMBO_LEFT WOEISME
	        return "DoNotPlayIdle"
	    end
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    -- this bitch
	    local fixedcone = wep:GetDispersion() / 360 / 60

	    wep.Owner:FireBullets({
			Src = wep.Owner:EyePos(),
			Num = 1,
			Damage = 40,
			Force = 1,
			Attacker = wep.Owner,
			Dir = wep.Owner:EyeAngles():Forward(),
			Spread = Vector(fixedcone, fixedcone, 0),
			Callback = function(_, tr, dmg)
				local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

				local dmgmax = 40
				local dmgmin = 20

				local delta = dist / 800 * 0.025

				delta = math.Clamp(delta, 0, 1)

				local amt = Lerp(delta, dmgmax, dmgmin)

				dmg:SetDamage(amt)
			end
		})
	    wep:EmitSound("weapons/fesiugmw2/fire/deagle.wav", 130, 115 * math.Rand(1 - 0.05, 1 + 0.05))
	                            -- This is kinda important
	                                            -- Wep volume
	                                                    -- Weapon pitch (along with the pitch randomizer)




	    wep:SetClip2(wep:Clip2() - 1)
	    
	    if wep:Clip2() > 0 then
	        wep:DoLHIKAnimation("fire", 16/30)
	    else
	        wep:DoLHIKAnimation("fire_last", 16/30)
	    end

	    wep:DoEffects()

	    return false
	end

	att.UBGL_Reload = function(wep, ubgl)
	        if wep:Clip2() >= 7 then return end
	        if Ammo(wep) <= 0 then return end

	    wep:SetInUBGL(false)
	    wep:Reload()

	    if wep:Clip2() <= 0 then
	        wep:DoLHIKAnimation("reload_empty", 63/30)
	        wep:SetNextSecondaryFire(CurTime() + 63/30)
	        wep:SetMW2Masterkey_ShellInsertTime(CurTime() + 1.429)
	        wep:PlaySoundTable({
	            {s = "weapons/fesiugmw2/foley/wpfoly_de50_reload_clipout_v1.wav", 	t = 10/30},
	            {s = "weapons/fesiugmw2/foley/wpfoly_de50_reload_clipin_v1.wav",  	t = 39/30},
	            {s = "weapons/fesiugmw2/foley/wpfoly_de50_reload_chamber_v1.wav", 	t = 48/30},
	        })
	    else
	        wep:DoLHIKAnimation("reload", 59/30)
	        wep:SetNextSecondaryFire(CurTime() + 59/30)
	        wep:SetMW2Masterkey_ShellInsertTime(CurTime() + 1.429)
	        wep:PlaySoundTable({
	            {s = "weapons/fesiugmw2/foley/wpfoly_de50_reload_clipout_v1.wav", 	t = 10/30},
	            {s = "weapons/fesiugmw2/foley/wpfoly_de50_reload_clipin_v1.wav", 	    t = 39/30},
	        })
	    end
	end

	att.Hook_GetHUDData = function( wep, data )
	    if ArcCW:ShouldDrawHUDElement("CHudAmmo") then
	        data.clip = wep:Clip2() .. " / " .. wep:Clip1()
	    else
	        data.clip = wep:Clip1() + wep:Clip2()
	    end
	    data.ubgl = nil
	    return data
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_akimbo_glock17.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_akimbo_glock17")

	att.PrintName = "G17"
	att.Icon = Material("entities/acwatt_mw2_akimbo.png", "smooth")
	att.Description = "Wholy."
	att.Hidden = false
	att.Desc_Pros = {
	    "+100% more gun",
	}
	att.Desc_Cons = {
	    "- Cannot use ironsights"
	}
	att.Desc_Neutrals = {
	    "Don't toggle the UBGL"
	}
	att.AutoStats = true
	att.Mult_HipDispersion = 4
	att.Slot = "akimbotest"

	att.GivesFlags = {"cantuseshitinakimboyet"}

	att.SortOrder = 1738

	att.AddSuffix = " + G17"

	att.MountPositionOverride = 0

	att.Model = "models/weapons/arccw/fesiugmw2/akimbo/c_glock17_left_1.mdl"

	att.LHIK = true
	att.LHIK_Animation = true
	att.LHIK_MovementMult = 0

	att.UBGL = true

	att.UBGL_PrintName = "AKIMBO"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_4"
	att.UBGL_ClipSize = 17
	att.UBGL_Ammo = "pistol"
	att.UBGL_RPM = 60 / 0.079
	att.UBGL_Recoil = .4
	att.UBGL_RecoilSide = .2
	att.UBGL_RecoilRise = .2
	att.UBGL_Capacity = 17

	att.Hook_ShouldNotSight = function(wep)
	    return true
	end

	att.Hook_Think = function(wep)
	    if wep:GetMW2Masterkey_ShellInsertTime() < CurTime() and wep:GetMW2Masterkey_ShellInsertTime() != 0 then
	        wep:SetMW2Masterkey_ShellInsertTime(0)
	        local clip = 17
	        if wep:Clip2() >= clip then return end
	        if Ammo(wep) <= 0 then return end

	        local reserve = Ammo(wep)
	        reserve = reserve + wep:Clip2()
	        local load = math.Clamp(clip, 0, reserve)
	        wep.Owner:SetAmmo(reserve - load, "pistol")
	        wep:SetClip2(load)
	    end

	    if !IsFirstTimePredicted() then return end
	    if wep:GetOwner():KeyPressed(IN_RELOAD) then
	        wep:SetInUBGL(false)
	        wep:ReloadUBGL()
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK) then
	        wep:SetInUBGL(false)
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK2) then
	        wep:SetInUBGL(true)
	        wep:ShootUBGL()
	    end
	end

	local awesomelist = {
	    ["sprint_in_akimbo_right"] = {
	        time = 10/30,
	        anim = "sprint_in",
	    },
	    ["sprint_out_akimbo_right"] = {
	        time = 10/30,
	        anim = "sprint_out",
	    },
	    ["sprint_loop_akimbo_right"] = {
	        time = 30/40,
	        anim = "sprint_loop",
	    },
	    ["pullout_akimbo_right"] = {
	        time = 26/30 /4,
	        anim = "pullout",
	    },
	    ["putaway_akimbo_right"] = {
	        time = 26/30 /4,
	        anim = "putaway",
	    },
	}

	att.Hook_TranslateSequence = function(wep, anim)
	    if awesomelist[anim] then
	        local bab = awesomelist[anim]
	        wep:DoLHIKAnimation(bab.anim, bab.time)
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
	    local fixedcone = wep:GetDispersion() / 360 / 60

	    wep.Owner:FireBullets({
			Src = wep.Owner:EyePos(),
			Num = 1,
			Damage = 40,
			Force = 1,
			Attacker = wep.Owner,
			Dir = wep.Owner:EyeAngles():Forward(),
			Spread = Vector(fixedcone, fixedcone, 0),
			Callback = function(_, tr, dmg)
				local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

				local dmgmax = 40
				local dmgmin = 20

				local delta = dist / 800 * 0.025

				delta = math.Clamp(delta, 0, 1)

				local amt = Lerp(delta, dmgmax, dmgmin)

				dmg:SetDamage(amt)
			end
		})
	    wep:EmitSound("weapons/fesiugmw2/fire/glock.wav", 110, 105 * math.Rand(1 - 0.05, 1 + 0.05))
	                            -- This is kinda important
	                                            -- Wep volume
	                                                    -- Weapon pitch (along with the pitch randomizer)




	    wep:SetClip2(wep:Clip2() - 1)
	    
	    if wep:Clip2() > 0 then
	        wep:DoLHIKAnimation("fire", 6/30)
	    else
	        wep:DoLHIKAnimation("fire_last", 6/30)
	    end

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	        if wep:Clip2() >= 17 then return end
	        if Ammo(wep) <= 0 then return end

	    wep:SetInUBGL(false)
	    wep:Reload()

	    if wep:Clip2() <= 0 then
	        wep:DoLHIKAnimation("reload_empty", 89/40)
	        wep:SetNextSecondaryFire(CurTime() + 89/40)
	        wep:SetMW2Masterkey_ShellInsertTime(CurTime() + 1.2)
	        wep:PlaySoundTable({
	            {s = "weapons/fesiugmw2/foley/wpfoly_glock_reload_lift_v1.wav", 	t = 0},
	            {s = "weapons/fesiugmw2/foley/wpfoly_glock_reload_clipout_v1.wav", 	t = 4/40},
	            {s = "weapons/fesiugmw2/foley/wpfoly_glock_reload_clipin_v1.wav",  	t = 42/40},
	            {s = "weapons/fesiugmw2/foley/wpfoly_glock_reload_chamber_v1.wav", 	t = 67/40},
	        })
	    else
	        wep:DoLHIKAnimation("reload", 70/40)
	        wep:SetNextSecondaryFire(CurTime() + 70/40)
	        wep:SetMW2Masterkey_ShellInsertTime(CurTime() + 1.2)
	        wep:PlaySoundTable({
	            {s = "weapons/fesiugmw2/foley/wpfoly_glock_reload_lift_v1.wav", 	t = 0},
	            {s = "weapons/fesiugmw2/foley/wpfoly_glock_reload_clipout_v1.wav", 	t = 4/40},
	            {s = "weapons/fesiugmw2/foley/wpfoly_glock_reload_clipin_v1.wav", 	    t = 36/40},
	        })
	    end
	end

	att.Hook_GetHUDData = function( wep, data )
	    if ArcCW:ShouldDrawHUDElement("CHudAmmo") then
	        data.clip = wep:Clip2() .. " / " .. wep:Clip1()
	    else
	        data.clip = wep:Clip1() + wep:Clip2()
	    end
	    data.ubgl = nil
	    return data
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_akimbo_m1887.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_akimbo_m1887")

	att.PrintName = "Model 1887"
	att.Icon = Material("entities/acwatt_mw2_akimbo.png", "smooth")
	att.Description = "Terminate."
	att.Hidden = false
	att.Desc_Pros = {
	    "+100% more gun",
	}
	att.Desc_Cons = {
	    "- Cannot use ironsights"
	}
	att.Desc_Neutrals = {
	    "Don't toggle the UBGL"
	}
	att.AutoStats = true
	att.Mult_HipDispersion = 4
	att.Slot = "akimbotest"

	att.GivesFlags = {"cantuseshitinakimboyet"}

	att.SortOrder = 1738

	att.AddSuffix = " + Model 1887"

	att.MountPositionOverride = 0

	att.Model = "models/weapons/arccw/fesiugmw2_2/c_m1887_1.mdl"


	att.LHIK = true
	att.LHIK_Animation = true
	att.LHIK_MovementMult = 0

	att.UBGL = true

	att.UBGL_PrintName = "AKIMBO"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_m3"
	att.UBGL_ClipSize = 7
	att.UBGL_Ammo = "Buckshot"
	att.UBGL_RPM = 60 / 0.079
	att.UBGL_Recoil = 1
	att.UBGL_RecoilSide = 1
	att.UBGL_RecoilRise = 0
	att.UBGL_Capacity = 7

	att.Hook_ShouldNotSight = function(wep)
	    return true
	end

	att.Hook_Think = function(wep)
		if wep:GetMW2Masterkey_NeedPump() and wep:GetMW2Masterkey_ReloadingTimer() <= CurTime() and !wep:GetMW2Masterkey_Reloading() and !wep.Owner:KeyDown(IN_ATTACK2) then
	        wep:DoLHIKAnimation("rechamber_l", 35/30)
			wep:SetNextSecondaryFire(CurTime() + 0.85)
			wep:SetMW2Masterkey_NeedPump(false)

	        wep:PlaySoundTable({
	            {s = "weapons/fesiugmw2/foley/wpfoly_m1887_reload_lift_v1.wav", 	t = 0/30},
	            {s = "weapons/fesiugmw2/foley/wpfoly_m1887_reload_open_v1.wav", 	t = 6/30},
	            {s = "weapons/fesiugmw2/foley/wpfoly_m1887_reload_close_v1.wav", 	t = 16/30},
	        })
		end
		if wep:GetMW2Masterkey_Reloading() and wep:GetMW2Masterkey_ReloadingTimer() < CurTime() and (wep:Clip2() >= 7 or wep:GetOwner():KeyDown(IN_ATTACK2)) then
			MW2M1887_ReloadFinish(wep)
		elseif wep:GetMW2Masterkey_Reloading() and wep:GetMW2Masterkey_ReloadingTimer() < CurTime() and wep:Clip2() < 7 then
			MW2M1887_ReloadLoop(wep)
		end

	    if wep:GetMW2Masterkey_ShellInsertTime() < CurTime() and wep:GetMW2Masterkey_ShellInsertTime() != 0 then
		    MW2M1887_InsertShell(wep)
	        wep:SetMW2Masterkey_ShellInsertTime(0)
	    end

	    if !IsFirstTimePredicted() then return end
	    if wep:GetOwner():KeyPressed(IN_RELOAD) then
	        wep:SetInUBGL(false)
	        wep:ReloadUBGL()
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK) then
	        wep:SetInUBGL(false)
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK2) then
	        wep:SetInUBGL(true)
	        wep:ShootUBGL()
	        wep:SetInUBGL(false)
	    end
	end

	local awesomelist = {
	    ["sprint_in_r"] = {
	        time = 10/30,
	        anim = "sprint_in_l",
	    },
	    ["sprint_out_r"] = {
	        time = 10/30,
	        anim = "sprint_out_l",
	    },
	    ["sprint_loop_r"] = {
	        time = 30/40,
	        anim = "sprint_loop_l",
	    },
	    ["pullout_first_r"] = {
	        time = 47/30,
	        anim = "pullout_first_l",
	        --soundtable = {}
	    },
	    ["pullout_r"] = {
	        time = 25/30,
	        anim = "pullout_l",
	    },
	    ["putaway_r"] = {
	        time = 25/30,
	        anim = "putaway_l",
	    },
	}

	att.Hook_TranslateSequence = function(wep, anim)    
	    --if anim != "idle_r" then print("lol", anim) end
	    if awesomelist[anim] then
	        local bab = awesomelist[anim]
	        --print(CurTime() .. " - epic win")
	        --PrintTable(bab)
	        wep:DoLHIKAnimation(bab.anim, bab.time)
	        if bab.soundtable then wep:PlaySoundTable(bab.soundtable) end
	    end
	end

	att.Hook_LHIK_TranslateAnimation = function(wep, anim)
	    if anim == "idle" then return "idle_l" end
	end

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("Buckshot") -- att.UBGL_Ammo
	end

	att.UBGL_Fire = function(wep, ubgl)
	    PrintTable(att)

	    if wep:Clip2() <= 0 then return end
		if wep:GetMW2Masterkey_NeedPump() then return end
		if wep:GetMW2Masterkey_Reloading() then return end

	    -- this bitch
	    local fixedcone = wep:GetDispersion() / 360 / 60

	    wep.Owner:FireBullets({
			Src = wep.Owner:EyePos(),
			Num = 1,
			Damage = 40,
			Force = 1,
			Attacker = wep.Owner,
			Dir = wep.Owner:EyeAngles():Forward(),
			Spread = Vector(fixedcone, fixedcone, 0),
			Callback = function(_, tr, dmg)
				local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

				local dmgmax = 40
				local dmgmin = 20

				local delta = dist / 800 * 0.025

				delta = math.Clamp(delta, 0, 1)

				local amt = Lerp(delta, dmgmax, dmgmin)

				dmg:SetDamage(amt)
			end
		})
	    wep:EmitSound("weapons/fesiugmw2/fire/shot_w1200.wav", 130, 115 * math.Rand(1 - 0.05, 1 + 0.05))
	                            -- This is kinda important
	                                            -- Wep volume
	                                                    -- Weapon pitch (along with the pitch randomizer)




	    wep:SetClip2(wep:Clip2() - 1)
	    
	    wep:DoLHIKAnimation("fire_l", 12/30)
	    wep:SetMW2Masterkey_ReloadingTimer(CurTime() + 0.433)
	    wep:SetMW2Masterkey_NeedPump(true)

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	        if wep:Clip2() >= 7 then return end
	        if Ammo(wep) <= 0 then return end
	        if wep:GetMW2Masterkey_Reloading() then return end

	    wep:SetInUBGL(false)
	    wep:Reload()


		MW2M1887_ReloadStart(wep)
		wep:SetMW2Masterkey_Reloading(true)
	end

	att.Hook_GetHUDData = function( wep, data )
	    if ArcCW:ShouldDrawHUDElement("CHudAmmo") then
	        data.clip = wep:Clip2() .. " / " .. wep:Clip1()
	    else
	        data.clip = wep:Clip1() + wep:Clip2()
	    end
	    data.ubgl = nil
	    return data
	end



	-- don't copy... yet

	function MW2M1887_ReloadStart(wep)
	    wep:DoLHIKAnimation("reload_start_l", 59/30)
		wep:SetMW2Masterkey_ReloadingTimer(CurTime() + 59/30)
		
		--wep:SetReloading(CurTime() + 59/30)
	    wep:SetMW2Masterkey_ShellInsertTime(CurTime() + 1.45)
		wep:SetMW2Masterkey_Reloading(true)

	    wep:PlaySoundTable({
	        {s = "weapons/fesiugmw2/foley/wpfoly_m1887_reload_lift_v1.wav", 	t = 0/30},
	        {s = "weapons/fesiugmw2/foley/wpfoly_m1887_reload_open_v1.wav", 	t = 14/30},
	        {s = "weapons/fesiugmw2/foley/wpfoly_m1887_reload_shell_v1.wav", 	t = 54/30},
	    })
	end

	function MW2M1887_ReloadLoop(wep)
	    wep:DoLHIKAnimation("reload_loop_l", 33/40)
		wep:SetMW2Masterkey_ReloadingTimer(CurTime() + 33/40)
	    wep:SetMW2Masterkey_ShellInsertTime(CurTime() + 0.6)
		--wep:SetReloading(CurTime() + 33/40)

	    wep:PlaySoundTable({
	        {s = "weapons/fesiugmw2/foley/wpfoly_m1887_reload_shell_v1.wav", 		t = 18/40}
	    })
	end

	function MW2M1887_ReloadFinish(wep)
	    wep:DoLHIKAnimation("reload_finish_l", 41/30)
		--wep:SetReloading(CurTime() + 41/30)
		wep:SetMW2Masterkey_Reloading(false)
		wep:SetMW2Masterkey_NeedPump(false)
	    
	    wep:PlaySoundTable({
	        {s = "weapons/fesiugmw2/foley/wpfoly_m1887_reload_close_v1.wav", 	t = 15/30},
	    })
	end

	function MW2M1887_InsertShell(wep)
		wep:GetOwner():RemoveAmmo(1, "buckshot")
		wep:SetClip2(wep:Clip2() + 1)
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_akimbo_m9.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_akimbo_m9")

	att.PrintName = "M9"
	att.Icon = Material("entities/acwatt_mw2_akimbo.png", "smooth")
	att.Description = "Wholy."
	att.Hidden = false
	att.Desc_Pros = {
	    "+100% more gun",
	}
	att.Desc_Cons = {
	    "- Cannot use ironsights"
	}
	att.Desc_Neutrals = {
	    "Don't toggle the UBGL"
	}
	att.AutoStats = true
	att.Mult_HipDispersion = 4
	att.Slot = "akimbotest"

	att.GivesFlags = {"cantuseshitinakimboyet"}

	att.SortOrder = 1738

	att.AddSuffix = " + M9"

	att.MountPositionOverride = 0

	att.Model = "models/weapons/arccw/fesiugmw2/akimbo/c_beretta_left_4.mdl"

	att.LHIK = true
	att.LHIK_Animation = true
	att.LHIK_MovementMult = 0

	att.UBGL = true

	att.UBGL_PrintName = "AKIMBO"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_4"
	att.UBGL_ClipSize = 15
	att.UBGL_Ammo = "pistol"
	att.UBGL_RPM = 60 / 0.079
	att.UBGL_Recoil = .45
	att.UBGL_RecoilSide = .55
	att.UBGL_RecoilRise = .25
	att.UBGL_Capacity = 15

	att.Hook_ShouldNotSight = function(wep)
	    return true
	end

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("pistol") -- att.UBGL_Ammo
	end

	att.Hook_Think = function(wep)
	    if wep:GetMW2Masterkey_ShellInsertTime() < CurTime() and wep:GetMW2Masterkey_ShellInsertTime() != 0 then
	        wep:SetMW2Masterkey_ShellInsertTime(0)
	        local clip = 15
	        if wep:Clip2() >= clip then return end
	        if Ammo(wep) <= 0 then return end

	        local reserve = Ammo(wep)
	        reserve = reserve + wep:Clip2()
	        local load = math.Clamp(clip, 0, reserve)
	        wep.Owner:SetAmmo(reserve - load, "pistol")
	        wep:SetClip2(load)
	    end

	    if !IsFirstTimePredicted() then return end
	    if wep:GetOwner():KeyPressed(IN_RELOAD) then
	        wep:SetInUBGL(false)
	        wep:ReloadUBGL()
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK) then
	        wep:SetInUBGL(false)
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK2) then
	        wep:SetInUBGL(true)
	        wep:ShootUBGL()
	    end
	end

	local awesomelist = {
	    ["sprint_in_akimbo_right"] = {
	        time = 10/30,
	        anim = "sprint_in",
	    },
	    ["sprint_out_akimbo_right"] = {
	        time = 10/30,
	        anim = "sprint_out",
	    },
	    ["sprint_loop_akimbo_right"] = {
	        time = 30/40,
	        anim = "sprint_loop",
	    },
	    ["pullout_akimbo_right"] = {
	        time = 26/30 /4,
	        anim = "pullout",
	    },
	    ["putaway_akimbo_right"] = {
	        time = 26/30 /4,
	        anim = "putaway",
	    },
	}

	att.Hook_TranslateSequence = function(wep, anim)
	    if awesomelist[anim] then
	        local bab = awesomelist[anim]
	        wep:DoLHIKAnimation(bab.anim, bab.time)
	    end
	end

	att.Hook_LHIK_TranslateAnimation = function(wep, anim)
	    if anim == "idle" and wep:Clip2() <= 0 then
	        return "idle_empty"
	    end
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    -- this bitch
	    local fixedcone = wep:GetDispersion() / 360 / 60

	    wep.Owner:FireBullets({
			Src = wep.Owner:EyePos(),
			Num = 1,
			Damage = 40,
			Force = 1,
			Attacker = wep.Owner,
			Dir = wep.Owner:EyeAngles():Forward(),
			Spread = Vector(fixedcone, fixedcone, 0),
			Callback = function(_, tr, dmg)
				local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

				local dmgmax = 40
				local dmgmin = 20

				local delta = dist / 800 * 0.025

				delta = math.Clamp(delta, 0, 1)

				local amt = Lerp(delta, dmgmax, dmgmin)

				dmg:SetDamage(amt)
			end
		})
	    wep:EmitSound("weapons/fesiugmw2/fire/m9.wav", 110, 100 * math.Rand(1 - 0.05, 1 + 0.05))
	                            -- This is kinda important
	                                            -- Wep volume
	                                                    -- Weapon pitch (along with the pitch randomizer)




	    wep:SetClip2(wep:Clip2() - 1)
	    
	    if wep:Clip2() > 0 then
	        wep:DoLHIKAnimation("fire", 6/30)
	    else
	        wep:DoLHIKAnimation("fire_last", 6/30)
	    end

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	        if wep:Clip2() >= 15 then return end
	        if Ammo(wep) <= 0 then return end

	    wep:SetInUBGL(false)
	    wep:Reload()

	    if wep:Clip2() <= 0 then
	        wep:DoLHIKAnimation("reload_empty", 89/40)
	        wep:SetNextSecondaryFire(CurTime() + 89/40)
	        wep:SetMW2Masterkey_ShellInsertTime(CurTime() + 1.2)
	        wep:PlaySoundTable({
	            {s = "weapons/fesiugmw2/foley/wpfoly_beretta9mm_reload_clipout_v2.wav", 	t = 4/40},
	            {s = "weapons/fesiugmw2/foley/wpfoly_beretta9mm_reload_clipin_v2.wav",  	t = 42/40},
	            {s = "weapons/fesiugmw2/foley/wpfoly_beretta9mm_reload_chamber_v2.wav", 	t = 67/40},
	        })
	    else
	        wep:DoLHIKAnimation("reload", 70/40)
	        wep:SetNextSecondaryFire(CurTime() + 70/40)
	        wep:SetMW2Masterkey_ShellInsertTime(CurTime() + 1.2)
	        wep:PlaySoundTable({
	            {s = "weapons/fesiugmw2/foley/wpfoly_beretta9mm_reload_clipout_v2.wav", 	t = 4/40},
	            {s = "weapons/fesiugmw2/foley/wpfoly_beretta9mm_reload_clipin_v2.wav", 	    t = 36/40},
	        })
	    end
	end

	att.Hook_GetHUDData = function( wep, data )
	    if ArcCW:ShouldDrawHUDElement("CHudAmmo") then
	        data.clip = wep:Clip2() .. " / " .. wep:Clip1()
	    else
	        data.clip = wep:Clip1() + wep:Clip2()
	    end
	    data.ubgl = nil
	    return data
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_akimbo_m93r.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_akimbo_m93r")

	att.PrintName = "M93 Raffica"
	att.Icon = Material("entities/acwatt_mw2_akimbo.png", "smooth")
	att.Description = "Wholy."
	att.Hidden = true
	att.Desc_Pros = {
	    "+100% more gun",
	}
	att.Desc_Cons = {
	    "- Cannot use ironsights"
	}
	att.Desc_Neutrals = {
	    "Don't toggle the UBGL"
	}
	att.AutoStats = true
	att.Mult_HipDispersion = 4
	att.Slot = "akimbotest"

	att.GivesFlags = {"cantuseshitinakimboyet"}

	att.SortOrder = 1738

	att.AddSuffix = " + M93R"

	att.MountPositionOverride = 0

	att.Model = "models/weapons/arccw/fesiugmw2/akimbo/c_beretta393_left_2.mdl"

	att.LHIK = true
	att.LHIK_Animation = true
	att.LHIK_MovementMult = 0

	att.UBGL = true

	att.UBGL_PrintName = "AKIMBO"
	att.UBGL_Automatic = true
	att.UBGL_MuzzleEffect = "muzzleflash_4"
	att.UBGL_ClipSize = 20
	att.UBGL_Ammo = "pistol"
	att.UBGL_RPM = 60 / 0.064
	att.UBGL_Recoil = .45
	att.UBGL_RecoilSide = .55
	att.UBGL_RecoilRise = .25
	att.UBGL_Capacity = 20

	local burstcount = 0
	local burstlength = 3

	att.Hook_ShouldNotSight = function(wep)
	    return true
	end

	att.Hook_Think = function(wep)
	    if !IsFirstTimePredicted() then return end
	    if wep:GetOwner():KeyPressed(IN_RELOAD) then
	        wep:SetInUBGL(false)
	        wep:ReloadUBGL()
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK) then
	        wep:SetInUBGL(true)
	        wep:ShootUBGL()
	    elseif wep:GetOwner():KeyReleased(IN_ATTACK) then
	        local postburst = 0.1

	        if (CurTime() + postburst) > wep:GetNextSecondaryFire() then
	        wep:SetNextSecondaryFire(CurTime() + postburst) end
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK2) then
	        wep:SetInUBGL(false)
	    end

	    if wep:Clip2() > 0 then
	        if burstcount > 0 then
	            wep:ShootUBGL()
	        end
	    
	    end

	        if burstcount == burstlength then
	            att.UBGL_Automatic = false
	            burstcount = 0
	        end

	end

	att.Hook_TranslateSequence = function(wep, anim)
	    local awesome-- = wep:GetAnimKeyTime(anim)

	    -- i fucking hate it! i really do why the fuck it so nastyy
	    -- need to find a way to fix this disaster

	    
	    if anim == "sprint_in_akimbo_right" or anim == "sprint_out_akimbo_right" or anim == "sprint_loop_akimbo_right" or anim == "pullout_akimbo_right" or anim == "putaway_akimbo_right" then
	        if anim == "sprint_in_akimbo_right" then
	            awesome = 11/30
	            playanim = "sprint_in"
	        elseif anim == "sprint_out_akimbo_right" then
	            awesome = 11/30
	            playanim = "sprint_out"
	        elseif anim == "sprint_loop_akimbo_right" then
	            awesome = 31/40
	            playanim = "sprint_loop"
	        elseif anim == "pullout_akimbo_right" then
	            awesome = 26/30 /4
	            playanim = "pullout"
	        elseif anim == "putaway_akimbo_right" then
	            awesome = 26/30 /4
	            playanim = "putaway"
	        end
	            wep:DoLHIKAnimation(playanim, awesome)
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
	    local fixedcone = wep:GetDispersion() / 360 / 60

	    wep.Owner:FireBullets({
			Src = wep.Owner:EyePos(),
			Num = 1,
			Damage = 40,
			Force = 1,
			Attacker = wep.Owner,
			Dir = wep.Owner:EyeAngles():Forward(),
			Spread = Vector(fixedcone, fixedcone, 0),
			Callback = function(_, tr, dmg)
				local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

				local dmgmax = 40
				local dmgmin = 20

				local delta = dist / 800 * 0.025

				delta = math.Clamp(delta, 0, 1)

				local amt = Lerp(delta, dmgmax, dmgmin)

				dmg:SetDamage(amt)
			end
		})
	    wep:EmitSound("weapons/fesiugmw2/fire/m9.wav", 110, 100 * math.Rand(1 - 0.05, 1 + 0.05))
	                            -- This is kinda important
	                                            -- Wep volume
	                                                    -- Weapon pitch (along with the pitch randomizer)




	    wep:SetClip2(wep:Clip2() - 1)

	    if IsFirstTimePredicted() then
	        burstcount = burstcount + 1
	    end
	    
	    if wep:Clip2() > 0 then
	        wep:DoLHIKAnimation("fire", 6/30)
	    else
	        wep:DoLHIKAnimation("fire_last", 6/30)
	    end

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	        if wep:Clip2() >= 15 then return end
	        if Ammo(wep) <= 0 then return end

	    wep:SetInUBGL(false)
	    wep:Reload()

	    local clip = 20

	    if wep:Clip2() >= clip then return end -- att.UBGL_Capacity

	    if Ammo(wep) <= 0 then return end

	    burstcount = 0

	    if wep:Clip2() <= 0 then
	        wep:DoLHIKAnimation("reload_empty", 89/40)
	        wep:SetNextSecondaryFire(CurTime() + 89/40)
	        wep:PlaySoundTable({
	            {s = "weapons/fesiugmw2/foley/wpfoly_beretta9mm_reload_clipout_v2.wav", 	t = 4/40},
	            {s = "weapons/fesiugmw2/foley/wpfoly_beretta9mm_reload_clipin_v2.wav",  	t = 42/40},
	            {s = "weapons/fesiugmw2/foley/wpfoly_beretta9mm_reload_chamber_v2.wav", 	t = 67/40},
	        })
	    else
	        wep:DoLHIKAnimation("reload", 70/40)
	        wep:SetNextSecondaryFire(CurTime() + 70/40)
	        wep:PlaySoundTable({
	            {s = "weapons/fesiugmw2/foley/wpfoly_beretta9mm_reload_clipout_v2.wav", 	t = 4/40},
	            {s = "weapons/fesiugmw2/foley/wpfoly_beretta9mm_reload_clipin_v2.wav", 	    t = 36/40},
	        })
	    end

	    local reserve = Ammo(wep)

	    reserve = reserve + wep:Clip2()

	    local load = math.Clamp(clip, 0, reserve)

	    wep.Owner:SetAmmo(reserve - load, "pistol") -- att.UBGL_Ammo

	    wep:SetClip2(load)
	end

	att.Hook_GetHUDData = function( wep, data )
	    if ArcCW:ShouldDrawHUDElement("CHudAmmo") then
	        data.clip = wep:Clip2() .. " / " .. wep:Clip1()
	    else
	        data.clip = wep:Clip1() + wep:Clip2()
	    end
	    data.ubgl = nil
	    return data
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_akimbo_ranger.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_akimbo_ranger")

	att.PrintName = "Ranger"
	att.Icon = Material("entities/acwatt_mw2_akimbo.png", "smooth")
	att.Description = "Wholy."
	att.Hidden = false
	att.Desc_Pros = {
	    "+100% more gun",
	}
	att.Desc_Cons = {
	    "- Cannot use ironsights"
	}
	att.Desc_Neutrals = {
	    "Don't toggle the UBGL"
	}
	att.AutoStats = true
	att.Mult_HipDispersion = 4
	att.Slot = "akimbotest"

	att.GivesFlags = {"cantuseshitinakimboyet"}

	att.SortOrder = 1738

	att.AddSuffix = " + Ranger"

	att.MountPositionOverride = 0

	att.Model = "models/weapons/arccw/fesiugmw2_2/c_ranger_2.mdl"


	att.LHIK = true
	att.LHIK_Animation = true
	att.LHIK_MovementMult = 0

	att.UBGL = true

	att.UBGL_PrintName = "AKIMBO"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_m3"
	att.UBGL_ClipSize = 2
	att.UBGL_Ammo = "Buckshot"
	att.UBGL_RPM = 60 / 0.009
	att.UBGL_Recoil = 3
	att.UBGL_RecoilSide = 2
	att.UBGL_RecoilRise = 0
	att.UBGL_Capacity = 2

	att.Hook_ShouldNotSight = function(wep)
	    return true
	end

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("Buckshot") -- att.UBGL_Ammo
	end

	att.Hook_Think = function(wep)
	    if wep:GetMW2Masterkey_ShellInsertTime() < CurTime() and wep:GetMW2Masterkey_ShellInsertTime() != 0 then
	        wep:SetMW2Masterkey_ShellInsertTime(0)
	        local clip = 2
	        if wep:Clip2() >= clip then return end
	        if Ammo(wep) <= 0 then return end

	        local reserve = Ammo(wep)
	        reserve = reserve + wep:Clip2()
	        local load = math.Clamp(clip, 0, reserve)
	        wep.Owner:SetAmmo(reserve - load, "Buckshot")
	        wep:SetClip2(load)
	    end

	    if !IsFirstTimePredicted() then return end
	    if wep:GetOwner():KeyPressed(IN_RELOAD) then
	        wep:SetInUBGL(false)
	        wep:ReloadUBGL()
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK) then
	        wep:SetInUBGL(false)
	    elseif wep:GetOwner():KeyPressed(IN_ATTACK2) then
	        wep:SetInUBGL(true)
	        wep:ShootUBGL()
	    end
	end

	att.Hook_TranslateSequence = function(wep, anim)
	end

	local awesomelist = {
	    ["sprint_in_r"] = {
	        time = 10/30,
	        anim = "sprint_in_l",
	    },
	    ["sprint_out_r"] = {
	        time = 10/30,
	        anim = "sprint_out_l",
	    },
	    ["sprint_loop_r"] = {
	        time = 30/40,
	        anim = "sprint_loop_l",
	    },
	    ["pullout_r"] = {
	        time = 12/30,
	        anim = "pullout_l",
	    },
	    ["putaway_r"] = {
	        time = 23/30,
	        anim = "putaway_l",
	    },
	}

	att.Hook_TranslateSequence = function(wep, anim)
	    if awesomelist[anim] then
	        local bab = awesomelist[anim]
	        wep:DoLHIKAnimation(bab.anim, bab.time)
	    end
	end

	att.Hook_LHIK_TranslateAnimation = function(wep, anim)
	    if anim == "idle" then return "idle_l" end
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    -- this bitch
	    local fixedcone = wep:GetDispersion() / 360 / 60

	    wep.Owner:FireBullets({
			Src = wep.Owner:EyePos(),
			Num = 6,
			Damage = 75,
			Force = 1,
			Attacker = wep.Owner,
			Dir = wep.Owner:EyeAngles():Forward(),
			Spread = Vector(fixedcone, fixedcone, 0),
			Callback = function(_, tr, dmg)
				local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

				local dmgmax = 75
				local dmgmin = 35

				local delta = dist / 800 * 0.025

				delta = math.Clamp(delta, 0, 1)

				local amt = Lerp(delta, dmgmax, dmgmin)

				dmg:SetDamage(amt)
			end
		})
	    wep:EmitSound("weapons/fesiugmw2/fire/shot_ranger.wav", 130, 115 * math.Rand(1 - 0.05, 1 + 0.05))
	                            -- This is kinda important
	                                            -- Wep volume
	                                                    -- Weapon pitch (along with the pitch randomizer)




	    wep:SetClip2(wep:Clip2() - 1)
	    
	    wep:DoLHIKAnimation("fire_l", 16/30)

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	        if wep:Clip2() >= 2 then return end
	        if Ammo(wep) <= 0 then return end

	    wep:SetInUBGL(false)
	    wep:Reload()

	    wep:DoLHIKAnimation("reload_mp_l", 120/30)
	    wep:SetNextSecondaryFire(CurTime() + 120/30)
	    wep:SetMW2Masterkey_ShellInsertTime(CurTime() + 1.549)
	    wep:PlaySoundTable({
	        {s = "weapons/fesiugmw2/foley/wpfoly_ranger_reload_lift_v1.wav", 		t = 0.01},
	        {s = "weapons/fesiugmw2/foley/wpfoly_ranger_reload_clipout_v1.wav", 		t = 12/30},
	        {s = "weapons/fesiugmw2/foley/wpfoly_ranger_reload_clip1in_v1.wav", 		t = 53/30},
	        {s = "weapons/fesiugmw2/foley/wpfoly_ranger_reload_clip2in_v1.wav", 		t = 70/30},
	        {s = "weapons/fesiugmw2/foley/wpfoly_ranger_reload_chamber_v1.wav", 		t = 106/30},
	    })
	end

	att.Hook_GetHUDData = function( wep, data )
	    if ArcCW:ShouldDrawHUDElement("CHudAmmo") then
	        data.clip = wep:Clip2() .. " / " .. wep:Clip1()
	    else
	        data.clip = wep:Clip1() + wep:Clip2()
	    end
	    data.ubgl = nil
	    return data
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_integrallaser.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_integrallaser")

	att.PrintName = "Hide Laser"
	att.Icon = Material("entities/acwatt_mw2_integrallaser.png", "smooth")
	att.Description = "What it says on the tin."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mw2_hidelaser"
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_tacticalknife.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_tacticalknife")

	att.PrintName = "Tactical Knife"
	att.Icon = Material("entities/acwatt_mw2_tacknife.png", "smooth")

	att.Description = "Underhand blade.\n\nPress E+LMB to melee."
	att.Desc_Pros = {
		"Quick, deadly melee attack",
	}
	att.Desc_Cons = {
		"- Increased visual recoil",
		"BUG: Cannot use optics",
	    "(Sight autosolver doesn't correct for new idle)",
	}
	att.AutoStats = false
	att.Slot = {"mw2_tacknife","altirons","yeslaser"}

	att.Hook_SelectBashAnim = function(wep, anim)
		return "bash_knife"
	end

	att.SortOrder = 1738

	att.Override_CanBash = true

	att.Mult_MeleeTime = 1
	att.Mult_MeleeDamage = 4
	att.Add_MeleeRange = 18
	att.Mult_MeleeAttackTime = 0.395
	att.Mult_MeleeTime = 1.6
	att.Override_MeleeDamageType = DMG_SLASH

	att.GivesFlags = {"arcticfixyoshit1"}

	att.AddSuffix = " Tactical"
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_ubgl_m203.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_ubgl_m203")

	att.PrintName = "Grenade Launcher"
	att.Icon = Material("entities/acwatt_mw2_ubgl_m203.png", "smooth")
	att.Description = "Weapon-exclusive grenade launcher with its own unique animations."
	att.Desc_Pros = {
	    "pro.ubgl",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "info.toggleubgl"
	}
	att.AutoStats = true
	att.Slot = "mw2_ubgl"

	att.SortOrder = 1738

	att.MountPositionOverride = 0

	att.UBGL = true
	att.UBGL_BaseAnims = true

	att.UBGL_PrintName = "UB (HE)"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_m79"
	att.UBGL_ClipSize = 1
	att.UBGL_Ammo = "smg1_grenade"
	att.UBGL_RPM = 1200
	att.UBGL_Recoil = 2 -- There's a animation error with your hand, please don't notice it ^-^
	att.UBGL_Capacity = 1

	att.AddSuffix = " Grenadier"

	att.Hook_ShouldNotSight = function(wep)
	    return wep:GetInUBGL()
	end

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("smg1_grenade")
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    wep:PlayAnimation("alt_fire_m203", 1, true, nil, nil, nil, true)

	    wep:FireRocket("arccw_gl_he_mw2", 1000)

	    if wep.MW2_M203isGP25 then
	        wep:EmitSound("weapons/fesiugmw2/fire/gp25.wav", 100)
	    else
	        wep:EmitSound("weapons/fesiugmw2/fire/m203.wav", 100)
	    end

	    wep:SetClip2(wep:Clip2() - 1)

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    if wep:Clip2() >= 1 then return end

	    if Ammo(wep) <= 0 then return end

	    wep:PlayAnimation("alt_reload_m203", 1, true, nil, nil, nil, true)
	    wep:SetReloading(CurTime() + wep:GetAnimKeyTime("alt_reload_m203"))

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

