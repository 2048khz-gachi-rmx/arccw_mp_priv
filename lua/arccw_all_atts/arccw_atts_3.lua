------
-- go_ammo_sg_dragon.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ammo_sg_dragon")

	att.PrintName = "Incendiary Shells"
	att.Icon = Material("entities/acwatt_go_ammo_sg_dragon.png", "smooth mips")
	att.Description = "Nicknamed 'Dragon's Breath' by many, these shotgun shells are loaded with magnesium powder that ignites anything in front as it flies. Without an actual projectile load, it does little direct damage."
	att.Desc_Pros = {"pro.gsoe.dragonsbreath"}
	att.Desc_Cons = {
	    "con.gsoe.dragonsbreath",
	    "con.gsoe.add_accuracymoa.30"
	}
	att.Slot = "go_ammo"

	att.AutoStats = true

	att.Override_Num = 20

	att.Override_AlwaysPhysBullet = true
	att.Override_PhysBulletMuzzleVelocity = 80
	att.Override_PhysTracerProfile = 0
	att.Override_PhysBulletImpact = false
	att.Override_PhysBulletGravity = 4
	att.Override_PhysBulletDrag = 4

	att.Mult_Damage = 0.5
	att.Mult_DamageMin = 0.5
	att.Mult_Recoil = 0.5
	att.Add_AccuracyMOA = 30
	--att.Override_Penetration = 96

	att.Hook_Compatible = function(wep)
	    if not wep:GetIsShotgun() then return false end
	end

	local fired = {
	    "sprites/flamelet1",
	    "sprites/flamelet2",
	    "sprites/flamelet3",
	    "sprites/flamelet4",
	    "sprites/flamelet5",
	}

	att.Hook_AddShootSound = function(wep, data)
	    wep:EmitSound("arccw_go/molotov/fire_ignite_1.wav", data.volume, 200, 0.9, CHAN_STATIC)
	end

	att.Override_PhysBulletImpact = false

	att.Hook_PhysBulletHit = function(wep, data)
	    local tr, bullet = data.tr, data.bullet
	    if SERVER and IsValid(tr.Entity) then

	        local delta = wep:GetRangeFraction(bullet.Travelled * ArcCW.HUToM)

	        local dmg = DamageInfo()
	        dmg:SetDamage(Lerp(delta, bullet.DamageMax, bullet.DamageMin))
	        dmg:SetDamageType(DMG_BURN)
	        dmg:SetDamagePosition(data.bullet.Pos)
	        dmg:SetInflictor(wep)
	        dmg:SetAttacker(wep:GetOwner())
	        if tr.Entity:IsOnFire() and (tr.Entity.ArcCW_GSOE_Ignited or 0) ~= CurTime() then
	            dmg:ScaleDamage(1.5)
	            dmg:SetDamageType(DMG_BULLET)
	        end
	        tr.Entity:TakeDamageInfo(dmg)

	        if delta <= 0.75 and (tr.Entity.ArcCW_GSOE_Ignited or 0) ~= CurTime() then
	            if not tr.Entity:IsOnFire() then tr.Entity.ArcCW_GSOE_Ignited = CurTime() end
	            local dur = (1 - delta) * 5 + 5
	            if tr.Entity:IsPlayer() then dur = (1 - delta) * 3 end
	            tr.Entity:Ignite(dur)
	        end

	        if tr.Entity:IsPlayer() or tr.Entity:IsNPC() or tr.Entity:IsNextBot() then
	            bullet.Damaged[tr.Entity] = true
	            local tr2 = util.TraceLine({
	                start = bullet.Pos,
	                endpos  = bullet.Pos + bullet.Vel:GetNormalized() * (bullet.Vel:Length() + 16),
	                filter = table.GetKeys(bullet.Damaged),
	            })
	            ArcCW:DoPenetration(tr2, dmg, bullet, bullet.Penleft + 100, true, bullet.Damaged)
	        end

	        -- Fire a fake bullet for the sole purpose of penetration
	        --[[]
	        wep:GetOwner():FireBullets({
	            Src = bullet.Pos,
	            Dir = bullet.Vel:GetNormalized(),
	            Distance = bullet.Vel:Length() + 16,
	            Tracer = 0,
	            Damage = 0,
	            IgnoreEntity = bullet.Attacker,
	            Callback = function(catt, ctr, cdmg)
	                ArcCW:DoPenetration(ctr, cdmg, bullet, bullet.Penleft, true, bullet.Damaged)
	            end
	        }, true)
	        ]]
	    end

	    if CLIENT then
	        local range = bullet.Weapon:GetBuff("Range") / ArcCW.HUToM
	        local emitter = ParticleEmitter(tr.HitPos)
	        if not IsValid(emitter) then return end

	        local inrange = bullet.Travelled < range * 0.5

	        if inrange then
	            local fire = emitter:Add(fired[math.random(#fired)], tr.HitPos)
	            fire:SetVelocity( VectorRand() * 100 * VectorRand() )
	            fire:SetGravity( Vector(0, 0, 100) )
	            fire:SetDieTime( math.Rand(0.5, 0.75) )
	            fire:SetStartAlpha( 150 )
	            fire:SetEndAlpha( 0 )
	            fire:SetStartSize( 5 )
	            fire:SetEndSize( 20 )
	            fire:SetRoll( math.Rand(-180, 180) )
	            fire:SetRollDelta( math.Rand(-0.2,0.2) )
	            fire:SetColor( 255, 255, 255 )
	            fire:SetAirResistance( 150 )
	            fire:SetPos( tr.HitPos )
	            fire:SetLighting( false )
	            fire:SetCollide(true)
	            fire:SetBounce(0.75)
	            fire:SetNextThink( CurTime() + FrameTime() )
	            fire:SetThinkFunction( function(pa)
	                if !pa then return end
	                local col1 = Color(255, 255, 255)
	                local col2 = Color(0, 0, 0)

	                local col3 = col1
	                local d = pa:GetLifeTime() / pa:GetDieTime()
	                col3.r = Lerp(d, col1.r, col2.r)
	                col3.g = Lerp(d, col1.g, col2.g)
	                col3.b = Lerp(d, col1.b, col2.b)

	                pa:SetColor(col3.r, col3.g, col3.b)
	                pa:SetNextThink( CurTime() + FrameTime() )
	            end )
	        end

	        if not inrange or math.random(1, 100) < 25 then
	            local smoke = emitter:Add("particles/smokey", tr.HitPos)
	            smoke:SetVelocity( VectorRand() * 25 )
	            smoke:SetGravity( Vector(0, 0, 0) )
	            smoke:SetDieTime( math.Rand(0.25, 1) )
	            smoke:SetStartAlpha(inrange and 150 or 50 )
	            smoke:SetEndAlpha( 0 )
	            smoke:SetStartSize( 5 )
	            smoke:SetEndSize( inrange and 50 or 25 )
	            smoke:SetRoll( math.Rand(-180, 180) )
	            smoke:SetRollDelta( math.Rand(-0.2,0.2) )
	            smoke:SetColor( 255, 255, 255 )
	            smoke:SetAirResistance( 150 )
	            smoke:SetPos( tr.HitPos )
	            smoke:SetLighting( false )
	            smoke:SetCollide(true)
	            smoke:SetBounce(0.75)
	            smoke:SetNextThink( CurTime() + FrameTime() )
	            smoke:SetThinkFunction( function(pa)
	                if !pa then return end
	                local col1 = Color(255, 135, 0)
	                local col2 = Color(150, 150, 150)

	                local col3 = col1
	                local d = pa:GetLifeTime() / pa:GetDieTime()
	                col3.r = Lerp(d, col1.r, col2.r)
	                col3.g = Lerp(d, col1.g, col2.g)
	                col3.b = Lerp(d, col1.b, col2.b)

	                pa:SetColor(col3.r, col3.g, col3.b)
	                pa:SetNextThink( CurTime() + FrameTime() )
	            end )
	        end

	        emitter:Finish()
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ammo_sg_flechette.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ammo_sg_flechette")

	att.PrintName = "Flechette Shells"
	att.Icon = Material("entities/acwatt_go_ammo_sg_flechette.png", "smooth mips")
	att.Description = "Thin, sharp pointed projectiles provide better performance over range and superior penetration."
	att.Desc_Pros = {
	    "pro.pen.12"
	}
	att.Desc_Cons = {
	}
	att.Slot = "go_ammo"

	att.AutoStats = true

	att.Mult_Damage = 0.7
	att.Mult_DamageMin = 1
	att.Mult_Range = 2
	att.Mult_AccuracyMOA = 0.5
	att.Mult_MoveDispersion = 1.5
	att.Override_Penetration = 12

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ammo_sg_magnum.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ammo_sg_magnum")

	att.PrintName = "Magnum Shells"
	att.Icon = Material("entities/acwatt_go_ammo_sg_magnum.png", "mips smooth")
	att.Description = "A heavy loading of the default buckshot shell, improving close range damage at the cost of range, recoil, and spread."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo"

	att.Mult_Range = 0.75
	att.Mult_AccuracyMOA = 2

	att.Mult_Damage = 1.15
	att.Mult_DamageMin = 0.75

	att.Override_Num_Priority = 2

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ammo_sg_sabot.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ammo_sg_sabot")

	att.PrintName = "Sabot Shells"
	att.Icon = Material("entities/acwatt_go_ammo_sg_sabot.png", "mips smooth")
	att.Description = "Aerodynamic slug encased in plastic sabot. Excellent accuracy and performance at range, but rather poor damage."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo"

	att.Override_Num = 1
	att.Mult_Range = 2.5
	att.Mult_AccuracyMOA = 0.1

	att.Mult_Damage = 0.5
	att.Mult_DamageMin = 0.65

	att.Override_Num_Priority = 2

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ammo_sg_scatter.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ammo_sg_scatter")

	att.PrintName = "Scattershot Shells"
	att.Icon = Material("entities/acwatt_go_ammo_sg_scatter.png", "mips smooth")
	att.Description = "Shells with extra pellets, potentially improving hit chance."
	att.Desc_Pros = {
	    "Extra pellets"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo"

	att.Override_Num = 16

	att.Mult_Range = 0.5
	att.Mult_AccuracyMOA = 3

	att.Mult_Damage = 1
	att.Mult_DamageMin = 0.85

	att.Override_Num_Priority = 2

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ammo_sg_slug.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ammo_sg_slug")

	att.PrintName = "Slug Shells"
	att.Icon = Material("entities/acwatt_go_ammo_sg_slug.png", "mips smooth")
	att.Description = "A single lead slug that improves accuracy and long range performance, though does not scatter."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo"

	att.Override_Num = 1
	att.Mult_Range = 1.5
	att.Mult_AccuracyMOA = 0.25

	att.Mult_Damage = 0.8
	att.Mult_DamageMin = 0.85

	att.Override_Num_Priority = 2

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ammo_sg_triple.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ammo_sg_triple")

	att.PrintName = "Triple-Hit Shells"
	att.Icon = Material("entities/acwatt_go_ammo_sg_triple.png", "mips smooth")
	att.Description = "A shell with three projectiles each, more accurate and powerful at range but with inferior general stopping power."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo"

	att.Override_Num = 3
	att.Mult_Range = 1.25
	att.Mult_AccuracyMOA = 0.75

	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 0.9

	att.Override_Num_Priority = 2

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ammo_sub.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ammo_sub")

	att.PrintName = "Subsonic Rounds"
	att.Icon = Material("entities/acwatt_go_ammo_sub.png", "mips smooth")
	att.Description = "Reduced load rounds which are more quiet than standard ammo. Makes tracers invisible."
	att.Desc_Pros = {
	    "pro.invistracers"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo"


	att.Mult_Range = 0.75
	att.Mult_Recoil = 0.8
	att.Mult_ShootVol = 0.85

	att.Override_PhysTracerProfile = 7
	att.Override_TracerNum = 0

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ammo_tmj.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ammo_tmj")

	att.PrintName = "TMJ Rounds"
	att.Icon = Material("entities/acwatt_go_ammo_tmj.png", "mips smooth")
	att.Description = "Rounds which are totally coated in a copper jacket, improving penetrative capabilities and range at the cost of overall damage."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo"


	att.Mult_Penetration = 2

	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 1.1

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ammo_tr.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ammo_tr")

	att.PrintName = "Tracer Rounds"
	att.Icon = Material("entities/acwatt_go_ammo_tr.png", "mips smooth")
	att.Description = "Rounds which contain a small pyrotechnic charge 'doped' with a chemical such as Strontium or Barium to produce a colored flame."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo"

	att.Mult_Damage = 1.01
	att.Mult_DamageMin = 1.01

	att.Mult_Penetration = 0.95

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
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ar15_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ar15_barrel_long")

	att.PrintName = "510mm A2 Barrel"
	att.Icon = Material("entities/acwatt_go_ar15_barrel_long.png", "mips smooth")
	att.Description = "Long M16A2 barrel. Good for long range engagements."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ar15_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.3
	att.Mult_AccuracyMOA = 0.75

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ar15_barrel_med.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ar15_barrel_med")

	att.PrintName = "370mm Carbine Barrel"
	att.Icon = Material("entities/acwatt_go_ar15_barrel_short.png", "mips smooth")
	att.Description = "Medium-length barrel used on the original M4 carbine."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ar15_barrel"

	att.Mult_Range = 1.15
	att.Mult_Recoil = 0.9
	att.Mult_SightTime = 1.1
	att.Mult_AccuracyMOA = 0.9

	att.Mult_ShootPitch = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- go_aug_ammo_9mm.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_aug_ammo_9mm")

	att.PrintName = "32-Round 9mm Mag"
	att.Icon = Material("entities/acwatt_go_aug_ammo_9mm.png", "mips smooth")
	att.Description = "Conversion that makes the AUG into a 9mm submachine gun. Reduces weight and improves fire rate, at the cost of range."
	att.SortOrder = 32
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_aug_9mm"

	att.Mult_Range = 0.5
	att.Mult_Penetration = 0.5
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 0.8
	att.Mult_RPM = 1.1
	att.Mult_AccuracyMOA = 2
	att.Override_ClipSize = 32

	att.Override_Ammo = "pistol"

	att.Override_ShellModel = "models/shells/shell_9mm.mdl"

	att.Override_Trivia_Class = "Submachine Gun"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "arccw_go/aug/aug_01.wav" then return "arccw_go/bizon/bizon_02.wav" end
	    if fsound == "arccw_go/aug/aug_03.wav" then return "arccw_go/bizon/bizon_01.wav" end
	    if fsound == "arccw_go/m4a1/m4a1_silencer_01.wav" then return "arccw_go/mp5/mp5_01.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_aug_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_aug_barrel_long")

	att.PrintName = "620mm HBAR Barrel"
	att.Icon = Material("entities/acwatt_go_aug_barrel_long.png", "mips smooth")
	att.Description = "Long-range SAW barrel for the AUG. Improves range and recoil control, at the cost of handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_aug_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 1.25
	att.Mult_Recoil = 0.85
	att.Mult_SightTime = 1.3
	att.Mult_AccuracyMOA = 0.75

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_aug_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_aug_barrel_short")

	att.PrintName = "420mm Para Barrel"
	att.Icon = Material("entities/acwatt_go_aug_barrel_short.png", "mips smooth")
	att.Description = "Short length AUG barrel for submachine gun or commando carbine use. Improves handling, though offers much worse range and accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_aug_barrel"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 2

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_awp_barrel_bull.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_awp_barrel_bull")

	att.PrintName = "490mm Bull Barrel"
	att.Icon = Material("entities/acwatt_go_awp_barrel_bull.png", "mips smooth")
	att.Description = "Bull barrel that significantly reduces recoil, though at the cost of handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_awp_barrel"

	att.Mult_Recoil = 0.25
	att.Mult_SightTime = 1.4

	att.Mult_ShootPitch = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- go_awp_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_awp_barrel_long")

	att.PrintName = "660mm Sniper Barrel"
	att.Icon = Material("entities/acwatt_go_awp_barrel_long.png", "mips smooth")
	att.Description = "Fitted maximum-length barrel for the AWP. Improves long range performance."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_awp_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 1.25
	att.Mult_Recoil = 0.95
	att.Mult_SightTime = 1.35
	att.Mult_AccuracyMOA = 0.75

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_awp_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_awp_barrel_short")

	att.PrintName = "390mm Custom Barrel"
	att.Icon = Material("entities/acwatt_go_awp_barrel_short.png", "mips smooth")
	att.Description = "Short length custom barrel. Improves handling, though offers much worse range and accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_awp_barrel"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 2

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_awp_mag_15.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_awp_mag_15")

	att.PrintName = "15-Round .338 AWM"
	att.Icon = Material("entities/acwatt_go_awp_mag_15.png", "mips smooth")
	att.Description = "Extended magazine improves capacity at the cost of handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 15
	att.AutoStats = true
	att.Slot = "go_awp_mag"

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.1
	att.Override_ClipSize = 15
	att.Mult_ReloadTime = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_awp_mag_5.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_awp_mag_5")

	att.PrintName = "5-Round .338 AWM"
	att.Icon = Material("entities/acwatt_go_awp_mag_5.png", "mips smooth")
	att.Description = "Small magazine with lighter load. Improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 5
	att.AutoStats = true
	att.Slot = "go_awp_mag"

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Override_ClipSize = 5
	att.Mult_ReloadTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_awp_stock_obrez.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_awp_stock_obrez")

	att.PrintName = "Obrez Stock"
	att.Icon = Material("entities/acwatt_go_awp_stock_obrez.png", "mips smooth")
	att.Description = "Cut-down stock for the AWP. It is unknown what monster would take a hacksaw to such a fine piece of military hardware, but it does provide superior movement speed."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_awp_stock"

	att.Mult_Recoil = 2
	att.Mult_SpeedMult = 1.25
	att.Mult_SightTime = 0.75

	att.NoStock = true
	ArcCW.LoadAttachmentType(att)
end

------
-- go_bizon_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_bizon_barrel_long")

	att.PrintName = "290mm GRU Barrel"
	att.Icon = Material("entities/acwatt_go_bizon_barrel_long.png", "mips smooth")
	att.Description = "Long barrel with extended handguard. Good for long range engagements."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_bizon_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.5
	att.Mult_AccuracyMOA = 0.75

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_bizon_barrel_med.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_bizon_barrel_med")

	att.PrintName = "230mm FSB Barrel"
	att.Icon = Material("entities/acwatt_go_bizon_barrel_med.png", "mips smooth")
	att.Description = "Medium-length barrel for the PP-19-02."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_bizon_barrel"

	att.Mult_Range = 1.15
	att.Mult_Recoil = 0.9
	att.Mult_SightTime = 1.15
	att.Mult_AccuracyMOA = 0.9

	att.Mult_ShootPitch = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- go_bizon_mag_47.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_bizon_mag_47")

	att.PrintName = "47-Round 9mm Bizon"
	att.Icon = Material("entities/acwatt_go_bizon_mag_47.png", "mips smooth")
	att.Description = "Small magazine with lighter load. Improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 47
	att.AutoStats = true
	att.Slot = "go_bizon_mag"

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Override_ClipSize = 47
	att.Mult_ReloadTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_bizon_mag_82.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_bizon_mag_82")

	att.PrintName = "82-Round 9mm Helix"
	att.Icon = Material("entities/acwatt_go_bizon_mag_82.png", "mips smooth")
	att.Description = "Extended magazine improves capacity at the cost of handling."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 82
	att.AutoStats = true
	att.Slot = "go_bizon_mag"

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.1
	att.Override_ClipSize = 82
	att.Mult_ReloadTime = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_cz75_mag_30.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_cz75_mag_30")

	att.PrintName = "30-Round 9mm CZ"
	att.Icon = Material("entities/acwatt_go_cz75_mag_30.png", "mips smooth")
	att.Description = "Extended magazine for the CZ75 pistol. Heavy, but may be worth the extra ammo."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 30
	att.AutoStats = true
	att.Slot = "go_cz75_mag"

	att.Override_ClipSize = 30

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.15
	att.Mult_ReloadTime = 1.25

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_long"
	    elseif anim == "reload_empty" then
	        return "reload_long_empty"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_cz75_slide_auto.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_cz75_slide_auto")

	att.PrintName = "120mm CZ-A Slide"
	att.Icon = Material("entities/acwatt_go_cz75_slide_auto.png", "mips smooth")
	att.Description = "Slide with integral compensator that improves recoil and adds the ability to fire in full auto."
	att.Desc_Pros = {
	    "pro.fullauto"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_cz75_slide"

	att.Mult_Recoil = 0.95

	att.Mult_RPM = 1.5

	att.Mult_ShootPitch = 0.95

	att.Override_Firemodes = {
	    {
	        Mode = 2
	    },
	    {
	        Mode = 0
	    },
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- go_cz75_slide_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_cz75_slide_long")

	att.PrintName = "150mm CZ-L Slide"
	att.Icon = Material("entities/acwatt_go_cz75_slide_long.png", "mips smooth")
	att.Description = "Long slide that improves range but also adds weight."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_cz75_slide"

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.5
	att.Mult_AccuracyMOA = 0.5
	att.Mult_DrawTime = 1.15

	att.Mult_RPM = 0.85

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_cz75_slide_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_cz75_slide_short")

	att.PrintName = "90mm CZ-C Slide"
	att.Icon = Material("entities/acwatt_go_cz75_slide_short.png", "mips smooth")
	att.Description = "Compact slide that improves weapon handling and trigger response."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_cz75_slide"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 1.5
	att.Mult_DrawTime = 0.75

	att.Mult_RPM = 1.15

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_deagle_mag_10_44.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_deagle_mag_10_44")

	att.PrintName = "10-Round .44 Deagle"
	att.Icon = Material("entities/acwatt_go_deagle_mag_9.png", "mips smooth")
	att.Description = "Extended magazine for the .44 Magnum conversion. Heavier, but gives even more ammo per magazine."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 5
	att.AutoStats = true
	att.Slot = "go_deagle_mag"
	att.ActivateElements = {"go_deagle_mag_9"}
	att.Override_Trivia_Calibre = ".44 Magnum"

	att.Override_ClipSize = 10
	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 0.9
	att.Mult_Recoil = 0.8
	att.Mult_VisualRecoilMult = 0.8

	att.Mult_SpeedMult = 0.95
	att.Mult_SightTime = 1.15
	att.Mult_ReloadTime = 1.25

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_long"
	    elseif anim == "reload_empty" then
	        return "reload_long_empty"
	    end
	end

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return "arccw_go/deagle/deagle_44.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_deagle_mag_12_357.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_deagle_mag_12_357")

	att.PrintName = "12-Round .357 Deagle"
	att.Icon = Material("entities/acwatt_go_deagle_mag_9.png", "mips smooth")
	att.Description = "Extended magazine for the .357 Magnum conversion. If onedeag doesn't work, try twelvedeag."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 4
	att.AutoStats = true
	att.Slot = "go_deagle_mag"
	att.ActivateElements = {"go_deagle_mag_9"}
	att.Override_Trivia_Calibre = ".357 Magnum"

	att.Override_ClipSize = 12
	att.Mult_Damage = 0.8
	att.Mult_DamageMin = 0.8
	att.Mult_Recoil = 0.6
	att.Mult_VisualRecoilMult = 0.6

	att.Mult_SpeedMult = 0.95
	att.Mult_SightTime = 1.15
	att.Mult_ReloadTime = 1.25

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_long"
	    elseif anim == "reload_empty" then
	        return "reload_long_empty"
	    end
	end

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return "arccw_go/deagle/deagle_357.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_deagle_mag_7_shot.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_deagle_mag_7_shot")

	att.PrintName = "7-Round 40ga Deagle"
	att.Icon = Material("entities/acwatt_go_deagle_mag_regular.png", "mips smooth")
	att.Description = "A curious barrel and magazine that fits custom 40 Gauge shotshells, which aren't too powerful because of the tiny bore diameter. Probably someone's range toy."
	att.Desc_Pros = {
	    "pro.num.8"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 2.5
	att.AutoStats = true
	att.Slot = "go_deagle_mag"
	att.Override_Trivia_Calibre = "40 Gauge"
	att.Override_Ammo = "buckshot"

	att.Override_Num = 8
	att.Mult_AccuracyMOA = 3
	att.Mult_Damage = 1.2
	att.Mult_DamageMin = 0.7
	att.Mult_Recoil = 0.7
	att.Mult_RPM = 0.8
	att.Mult_Range = 0.75

	att.Override_IsShotgun = true
	att.Override_ShellModel = "models/shells/shell_12gauge.mdl"
	att.Override_ShellScale = 0.8
	att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable

	att.Hook_AddShootSound = function(wep)
	    if wep:GetBuff_Override("Silencer") then
	        wep:MyEmitSound("arccw_go/m590_suppressed_fp.wav", 90, 100, 0.4, CHAN_WEAPON - 1)
	    else
	        wep:MyEmitSound("arccw_go/sawedoff/sawedoff-1.wav", 90, 100, 0.4, CHAN_WEAPON - 1)
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_deagle_mag_8_44.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_deagle_mag_8_44")

	att.PrintName = "8-Round .44 Deagle"
	att.Icon = Material("entities/acwatt_go_deagle_mag_regular.png", "mips smooth")
	att.Description = "Barrel and magazine conversion that uses the relatively less powerful .44 Magnum. It can squeeze one more round in the same magazine."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 5.5
	att.AutoStats = true
	att.Slot = "go_deagle_mag"
	att.Override_Trivia_Calibre = ".44 Magnum"

	att.Override_ClipSize = 8
	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 0.9
	att.Mult_Recoil = 0.8
	att.Mult_VisualRecoilMult = 0.8

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return "arccw_go/deagle/deagle_44.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_deagle_mag_9.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_deagle_mag_9")

	att.PrintName = "9-Round .50 Deagle"
	att.Icon = Material("entities/acwatt_go_deagle_mag_9.png", "mips smooth")
	att.Description = "Extended magazine for the Desert Eagle pistol. Heavy, but may be worth the extra ammo."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 9
	att.AutoStats = true
	att.Slot = "go_deagle_mag"

	att.Override_ClipSize = 9

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.15
	att.Mult_ReloadTime = 1.25

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_long"
	    elseif anim == "reload_empty" then
	        return "reload_long_empty"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_deagle_mag_9_357.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_deagle_mag_9_357")

	att.PrintName = "9-Round .357 Deagle"
	att.Icon = Material("entities/acwatt_go_deagle_mag_regular.png", "mips smooth")
	att.Description = "Barrel and magazine conversion that uses the smaller and less powerful .357 Magnum. Because of the smaller size, it can fit 2 more rounds in the same magazine."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 4.5
	att.AutoStats = true
	att.Slot = "go_deagle_mag"
	att.Override_Trivia_Calibre = ".357 Magnum"

	att.Override_ClipSize = 9
	att.Mult_Damage = 0.8
	att.Mult_DamageMin = 0.8
	att.Mult_Recoil = 0.6
	att.Mult_VisualRecoilMult = 0.6

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return "arccw_go/deagle/deagle_357.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_deagle_slide_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_deagle_slide_long")

	att.PrintName = "200mm Gryphon Slide"
	att.Icon = Material("entities/acwatt_go_deagle_slide_long.png", "mips smooth")
	att.Description = "Long Desert Eagle slide that improves range but also adds weight."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_deagle_slide"

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.5
	att.Mult_AccuracyMOA = 0.5
	att.Mult_DrawTime = 1.15

	att.Mult_RPM = 0.85

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_deagle_slide_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_deagle_slide_short")

	att.PrintName = "140mm Beagle Slide"
	att.Icon = Material("entities/acwatt_go_deagle_slide_short.png", "mips smooth")
	att.Description = "Compact slide that improves weapon handling and trigger response."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_deagle_slide"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 1.5
	att.Mult_DrawTime = 0.75

	att.Mult_RPM = 1.15

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_extras_boondoggle.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_extras_boondoggle")

	att.PrintName = "Corrected Hand"
	att.Icon = Material("entities/acwatt_go_extras_boondoggle.png", "mips smooth")
	att.Description = [[Better looking LHIK hand.]]
	--[[]
	att.Description = [[
	    boon·dog·gle
	    /ˈbo͞onˌdäɡəl/

	    INFORMAL • NORTH AMERICAN
	    
	noun
	    work or activity that is wasteful or pointless but gives the appearance of having value.
	    "writing off the cold fusion phenomenon as a boondoggle best buried in literature"

	verb
	    waste money or time on unnecessary or questionable projects.
	    "the only guarantees are higher taxes and bureaucratic boondoggling"
	]]

	att.SortOrder = 0

	att.IgnorePickX = true
	att.Free = true

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Free = true
	att.Slot = "go_lhikcorrect"

	att.LHIK = true
	att.LHIK_Priority = 0.5

	att.Model = "models/weapons/arccw_go/atts/extras_boondoggle 1.mdl"

	att.ModelOffset = Vector(-2, -0.3, 0.5)
	ArcCW.LoadAttachmentType(att)
end

------
-- go_extras_boondoggle2.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_extras_boondoggle2")

	att.PrintName = "Corrected Hand"
	att.Icon = Material("entities/acwatt_go_extras_boondoggle.png", "mips smooth")
	att.Description = [[Better looking LHIK hand.]]
	--[[]
	att.Description = [[
	    boon·dog·gle
	    /ˈbo͞onˌdäɡəl/

	    INFORMAL • NORTH AMERICAN
	    
	noun
	    work or activity that is wasteful or pointless but gives the appearance of having value.
	    "writing off the cold fusion phenomenon as a boondoggle best buried in literature"

	verb
	    waste money or time on unnecessary or questionable projects.
	    "the only guarantees are higher taxes and bureaucratic boondoggling"
	]]

	att.SortOrder = 0

	att.IgnorePickX = true
	att.Free = true

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Free = true
	att.Slot = "go_lhikcorrect"

	att.LHIK = true
	att.LHIK_Priority = 0.5

	att.Model = "models/weapons/arccw_go/atts/extras_boondoggle 1.mdl"

	att.ModelOffset = Vector(1, -0.3, 0.5)
	ArcCW.LoadAttachmentType(att)
end

------
-- go_extras_boondoggle3.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_extras_boondoggle3")

	att.PrintName = "Corrected Hand"
	att.Icon = Material("entities/acwatt_go_extras_boondoggle.png", "mips smooth")
	att.Description = [[Better looking LHIK hand.]]
	--[[]
	att.Description = [[
	    boon·dog·gle
	    /ˈbo͞onˌdäɡəl/

	    INFORMAL • NORTH AMERICAN
	    
	noun
	    work or activity that is wasteful or pointless but gives the appearance of having value.
	    "writing off the cold fusion phenomenon as a boondoggle best buried in literature"

	verb
	    waste money or time on unnecessary or questionable projects.
	    "the only guarantees are higher taxes and bureaucratic boondoggling"
	]]

	att.SortOrder = 0

	att.IgnorePickX = true
	att.Free = true

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Free = true
	att.Slot = "go_lhikcorrect"

	att.LHIK = true
	att.LHIK_Priority = 0.5

	att.Model = "models/weapons/arccw_go/atts/extras_boondoggle 1.mdl"

	att.ModelOffset = Vector(-0.5, -0.3, 0.6)
	ArcCW.LoadAttachmentType(att)
end

------
-- go_famas_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_famas_barrel_long")

	att.PrintName = "620mm Tireur Barrel"
	att.Icon = Material("entities/acwatt_go_famas_barrel_long.png", "mips smooth")
	att.Description = "Long-range FAMAS sniper barrel. Improves weapon performance."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_famas_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 1.25
	att.Mult_Recoil = 0.85
	att.Mult_SightTime = 1.35
	att.Mult_AccuracyMOA = 0.5

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_famas_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_famas_barrel_short")

	att.PrintName = "405mm Raider Barrel"
	att.Icon = Material("entities/acwatt_go_famas_barrel_short.png", "mips smooth")
	att.Description = "Short length FAMAS barrel for special forces. Offers superior handling at the cost of performance."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_famas_barrel"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 2

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_famas_mag_25.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_famas_mag_25")

	att.PrintName = "25-Round 5.56mm FR"
	att.Icon = Material("entities/acwatt_go_famas_mag_25.png", "mips smooth")
	att.Description = "Reduced capacity magazine from the FAMAS F1. Offers slightly better handling at the cost of capacity."
	att.SortOrder = 25
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.AutoStats = true
	att.Slot = "go_famas_mag"

	att.Mult_MoveSpeed = 1.05
	att.Mult_SightTime = 0.9
	att.Override_ClipSize = 25
	att.Mult_ReloadTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_fiveseven_mag_25_46.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_fiveseven_mag_25_46")

	att.PrintName = "25-Round 4.6mm HK"
	att.Icon = Material("entities/acwatt_go_fiveseven_mag_regular.png", "mips smooth")
	att.Description = "A curious conversion kit that makes the weapon fire 4.6x30mm cartridges. While both are thin PDW ammunition, the 4.6mm is slightly worse at long range and can load more in the magazine."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = -10
	att.AutoStats = true
	att.Slot = "go_fiveseven_mag"
	att.Override_Trivia_Calibre = "4.6x30mm"

	att.Override_ClipSize = 25

	att.Mult_Damage = 1.05
	att.Mult_DamageMin = 0.85
	att.Mult_Recoil = 0.95
	att.Mult_RPM = 1.1

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return "arccw_go/fiveseven/fiveseven_46.wav" end
	end

	--[[att.Hook_GetDistantShootSound = function(wep, snd)
	    if snd == wep.DistantShootSound then return "arccw_go/mp7/mp7-1-distant.wav" end
	end]]

	att.Hook_NameChange = function(wep, name)
	    return "Four-siX"
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_fiveseven_mag_30.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_fiveseven_mag_30")

	att.PrintName = "30-Round 5.7mm FN"
	att.Icon = Material("entities/acwatt_go_fiveseven_mag_30.png", "mips smooth")
	att.Description = "Extended magazine for the Five-seveN pistol. Heavy, but may be worth the extra ammo."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 30
	att.AutoStats = true
	att.Slot = "go_fiveseven_mag"

	att.Override_ClipSize = 30

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.15
	att.Mult_ReloadTime = 1.25

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_long"
	    elseif anim == "reload_empty" then
	        return "reload_long_empty"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_fiveseven_mag_40_46.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_fiveseven_mag_40_46")

	att.PrintName = "40-Round 4.6mm HK"
	att.Icon = Material("entities/acwatt_go_fiveseven_mag_30.png", "mips smooth")
	att.Description = "Extended magazine loaded with 4.6x30mm cartridges. It's almost like a baby MP7."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = -12
	att.AutoStats = true
	att.Slot = "go_fiveseven_mag"
	att.Override_Trivia_Calibre = "4.6x30mm"

	att.ActivateElements = {"go_fiveseven_mag_30"}
	att.Override_ClipSize = 40
	att.Mult_ReloadTime = 1.25
	att.Mult_SightTime = 1.15
	att.Mult_SpeedMult = 0.95

	att.Mult_Damage = 1.05
	att.Mult_DamageMin = 0.85
	att.Mult_Recoil = 0.95
	att.Mult_RPM = 1.1

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return "arccw_go/fiveseven/fiveseven_46.wav" end
	end

	--[[att.Hook_GetDistantShootSound = function(wep, snd)
	    if snd == wep.DistantShootSound then return "arccw_go/mp7/mp7-1-distant.wav" end
	end]]

	att.Hook_NameChange = function(wep, name)
	    return "Four-siX"
	end

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_long"
	    elseif anim == "reload_empty" then
	        return "reload_long_empty"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_fiveseven_slide_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_fiveseven_slide_long")

	att.PrintName = "160mm Plus Slide"
	att.Icon = Material("entities/acwatt_go_fiveseven_slide_long.png", "mips smooth")
	att.Description = "Long slide that improves range but also adds weight."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_fiveseven_slide"

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.5
	att.Mult_AccuracyMOA = 0.5
	att.Mult_DrawTime = 1.15

	att.Mult_RPM = 0.85

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_fiveseven_slide_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_fiveseven_slide_short")

	att.PrintName = "110mm FN Slide"
	att.Icon = Material("entities/acwatt_go_fiveseven_slide_short.png", "mips smooth")
	att.Description = "Compact slide that improves weapon handling and trigger response."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_fiveseven_slide"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 1.5
	att.Mult_DrawTime = 0.75

	att.Mult_RPM = 1.15

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_flashlight.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_flashlight")

	att.PrintName = "Flashlight"
	att.Icon = Material("entities/acwatt_go_flashlight.png", "mips smooth")
	att.Description = "Mountable flashlight. Illuminates targets for the user, but may give away their position."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.light"
	}
	att.AutoStats = true
	att.Slot = {"tac_pistol", "tac"}

	att.Model = "models/weapons/arccw_go/atts/flashlight.mdl"

	att.Flashlight = false
	att.FlashlightFOV = 50
	att.FlashlightFarZ = 512 -- how far it goes
	att.FlashlightNearZ = 1 -- how far away it starts
	att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR -- LINEAR, CONSTANT, QUADRATIC are available
	att.FlashlightColor = Color(255, 255, 255)
	att.FlashlightTexture = "effects/flashlight001"
	att.FlashlightBrightness = 4
	att.FlashlightBone = "laser"

	att.ToggleStats = {
	    {
	        PrintName = "High",
	        Flashlight = true
	    },
	    {
	        PrintName = "Eco",
	        Flashlight = true,
	        FlashlightFOV = 50,
	        FlashlightFarZ = 365,
	        FlashlightBrightness = 1
	    },
	    {
	        PrintName = "Off",
	        Flashlight = false,
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- go_flashlight_combo.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_flashlight_combo")

	att.PrintName = "Combo Flashlight"
	att.Icon = Material("entities/acwatt_go_laser_surefire.png", "mips smooth")
	att.Description = "Mountable flashlight with laser system that illuminates targets and helps with hip fire and moving accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.light"
	}
	att.AutoStats = true
	att.Slot = {"tac_pistol", "tac"}

	att.Model = "models/weapons/arccw_go/atts/laser_surefire.mdl"


	att.KeepBaseIrons = true

	att.Laser = false
	att.LaserStrength = 3 / 5
	att.LaserBone = "laser"

	att.ColorOptionsTable = {Color(255, 0, 0)}

	att.Mult_SightTime = 1.1
	att.Mult_MoveSpeed = 0.95

	att.Flashlight = false
	att.FlashlightFOV = 50
	att.FlashlightFarZ = 512 -- how far it goes
	att.FlashlightNearZ = 1 -- how far away it starts
	att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR -- LINEAR, CONSTANT, QUADRATIC are available
	att.FlashlightColor = Color(255, 255, 255)
	att.FlashlightTexture = "effects/flashlight001"
	att.FlashlightBrightness = 4
	att.FlashlightBone = "laser"

	att.ToggleStats = {
	    {
	        PrintName = "Both",
	        Laser = true,
	        Flashlight = true,
	        Mult_HipDispersion = 0.75,
	        Mult_MoveDispersion = 0.75
	    },
	    {
	        PrintName = "Laser",
	        Laser = true,
	        Mult_HipDispersion = 0.75,
	        Mult_MoveDispersion = 0.75
	    },
	    {
	        PrintName = "Light",
	        Flashlight = true,
	    },
	    {
	        PrintName = "Off",
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- go_flashlight_xhair.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_flashlight_xhair")

	att.PrintName = "Crosshair Flashlight"
	att.Icon = Material("entities/acwatt_go_flashlight.png", "mips smooth")
	att.Description = "Mountable flashlight with cross pattern. Narrow field of view, but assists in aiming a little and goes rather far. Able to point fire."
	att.Ignore = false
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.light"
	}
	att.AutoStats = true
	att.Slot = {"tac_pistol", "tac"}

	att.Model = "models/weapons/arccw_go/atts/flashlight.mdl"

	att.Flashlight = false
	att.FlashlightFOV = 45
	att.FlashlightFarZ = 4096 -- how far it goes
	att.FlashlightNearZ = 1 -- how far away it starts
	att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR -- LINEAR, CONSTANT, QUADRATIC are available
	att.FlashlightColor = Color(255, 255, 255)
	att.FlashlightTexture = "effects/flashlight_xhair"
	att.FlashlightBrightness = 2
	att.FlashlightBone = "laser"
	att.KeepBaseIrons = true

	att.Mult_SightTime = 1.05

	att.ToggleStats = {
	    {
	        PrintName = "On",
	        Flashlight = true,
	        AdditionalSights = {
	            {
	                Pos = Vector(-2, 10, -4), -- relative to where att.Model is placed
	                Ang = Angle(0, 0, -45),
	                GlobalPos = false,
	                GlobalAng = true,
	                Magnification = 1
	            }
	        },
	        Mult_HipDispersion = 0.9,
	    },
	    {
	        PrintName = "Off",
	        Flashlight = false,
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- go_fore_bipod.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_fore_bipod")

	att.PrintName = "Bipod"
	att.Icon = Material("entities/acwatt_go_fore_bipod.png", "mips smooth")
	att.Description = "Attachable bipod for giving weapons a superior shooting platform."

	att.SortOrder = 1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "foregrip"

	att.LHIK = true

	att.Model = "models/weapons/arccw_go/atts/bipod.mdl"

	att.Mult_SightTime = 1.5
	att.Mult_SpeedMult = 0.9

	att.Bipod = true
	att.Mult_BipodRecoil = 0.45
	att.Mult_BipodDispersion = 0.5
	ArcCW.LoadAttachmentType(att)
end

------
-- go_foregrip.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_foregrip")

	att.PrintName = "Battle Foregrip"
	att.Icon = Material("entities/acwatt_go_foregrip.png", "mips smooth")
	att.Description = "Attachable vertical fore grip. Improves weapon controllability at the cost of added weight."

	att.SortOrder = 1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "foregrip"

	att.LHIK = true

	att.Model = "models/weapons/arccw_go/atts/foregrip.mdl"

	att.Mult_Recoil = 0.85

	att.Mult_SightTime = 1.1
	att.Mult_HipDispersion = 0.9
	att.Mult_SpeedMult = 0.95

	att.Override_HoldtypeActive = "smg"
	ArcCW.LoadAttachmentType(att)
end

------
-- go_foregrip_angled.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_foregrip_angled")

	att.PrintName = "Angled Foregrip"
	att.Icon = Material("entities/acwatt_go_foregrip_angled.png", "mips smooth")
	att.Description = "Angled foregrip provides better weapon handling with a smooth surface, though at the cost of recoil control."

	att.SortOrder = 1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "foregrip"

	att.LHIK = true

	att.Model = "models/weapons/arccw_go/atts/foregrip_angled.mdl"

	att.ModelOffset = Vector(2, 0, 0)

	att.Mult_Recoil = 1.15

	att.Mult_SightTime = 0.85
	att.Mult_SpeedMult = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- go_foregrip_combat.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_foregrip_combat")

	att.PrintName = "Combat Foregrip"
	att.Icon = Material("entities/acwatt_go_foregrip_combat.png", "mips smooth")
	att.Description = "Light folding grip. Improves recoil control when aiming."

	att.SortOrder = 1

	att.Desc_Pros = {
	    "pro.gsoe.foregrip_combat",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "foregrip"

	att.LHIK = true

	att.Model = "models/weapons/arccw_go/atts/foregrip_combat.mdl"
	att.ModelOffset = Vector(0.5, 0, 0)

	att.Mult_RecoilSide = 1.15
	att.Mult_SightTime = 1.05
	att.Mult_MoveSpeed = 0.95
	att.Mult_MoveDispersion = 0.85

	att.Override_HoldtypeActive = "smg"

	att.Hook_ModifyRecoil = function(wep, tbl)
	    tbl.Recoil = tbl.Recoil * (1 - ( 0.25 * ( 1 - wep:GetSightDelta() ) ))
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_foregrip_ergo.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_foregrip_ergo")

	att.PrintName = "Ergo Foregrip"
	att.Icon = Material("entities/acwatt_go_foregrip_ergo.png", "mips smooth")
	att.Description = "Ergonomic foregrip that helps with controlling the weapon while on the move."

	att.SortOrder = 1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "foregrip"

	att.LHIK = true

	att.Model = "models/weapons/arccw_go/atts/foregrip_ergo.mdl"

	att.Mult_MoveDispersion = 0.85

	att.Mult_SightTime = 1.05
	att.Mult_SpeedMult = 0.975

	att.Override_HoldtypeActive = "smg"
	ArcCW.LoadAttachmentType(att)
end

------
-- go_foregrip_project.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_foregrip_project")

	att.PrintName = "Project Grip"
	att.Icon = Material("entities/acwatt_go_foregrip_project.png", "mips smooth")
	att.Description = "Filed off PDW foregrip used on the P90. A foregrip fit for a spaceman."

	att.SortOrder = 1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "foregrip"

	att.LHIK = true

	att.Model = "models/weapons/arccw_go/atts/foregrip_project.mdl"
	att.ModelOffset = Vector(0.5, 0, 0)

	att.Mult_Recoil = 0.75
	att.Mult_RecoilSide = 0.75

	att.Mult_MoveDispersion = 1.25
	att.Mult_SightedSpeedMult = 0.75
	att.Mult_MoveSpeed = 0.9

	att.Override_HoldtypeActive = "smg"
	ArcCW.LoadAttachmentType(att)
end

------
-- go_foregrip_snatch.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_foregrip_snatch")

	att.PrintName = "Snatch Foregrip"
	att.Icon = Material("entities/acwatt_go_foregrip_snatch.png", "mips smooth")
	att.Description = "Canted foregrip with excellent recoil control, though it negatively impacts weapon handling."

	att.SortOrder = 1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "foregrip"

	att.LHIK = true

	att.Model = "models/weapons/arccw_go/atts/foregrip_snatch.mdl"

	att.Mult_Recoil = 0.75

	att.Mult_SightTime = 1.5
	att.Mult_HipDispersion = 0.75
	att.Mult_SpeedMult = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_foregrip_soup.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_foregrip_soup")

	att.PrintName = "Leather Foregrip"
	att.Icon = Material("entities/acwatt_go_foregrip_soup.png", "mips smooth")
	att.Description = "A ring with a leather belt hanging off it. Very little grip surface, but agile."

	att.SortOrder = 1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "foregrip"

	att.LHIK = true

	att.Model = "models/weapons/arccw_go/atts/foregrip_soup.mdl"

	att.Mult_RecoilSide = 1.15

	att.Mult_HipDispersion = 1.1
	att.Mult_SightedSpeedMult = 1.25
	att.Mult_DrawTime = 0.75
	att.Mult_HolsterTime = 0.75

	att.Override_HoldtypeActive = "smg"
	ArcCW.LoadAttachmentType(att)
end

------
-- go_foregrip_stubby.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_foregrip_stubby")

	att.PrintName = "Stubby Foregrip"
	att.Icon = Material("entities/acwatt_go_foregrip_stubby.png", "mips smooth")
	att.Description = "Short foregrip offering marginally better weapon control, particularly in the lateral direction."

	att.SortOrder = 1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "foregrip"

	att.LHIK = true

	att.Model = "models/weapons/arccw_go/atts/foregrip_stubby.mdl"

	att.Mult_RecoilSide = 0.85

	att.Mult_SightTime = 1.05
	att.Mult_HipDispersion = 0.95
	att.Mult_SpeedMult = 0.975

	att.Override_HoldtypeActive = "smg"
	ArcCW.LoadAttachmentType(att)
end

------
-- go_g3_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_g3_barrel_long")

	att.PrintName = "650mm SG1 Barrel"
	att.Icon = Material("entities/acwatt_go_g3_barrel_long.png", "mips smooth")
	att.Description = "Sniper barrel for the G3. Improves range and recoil control, at the cost of handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_g3_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 1.25
	att.Mult_Recoil = 0.85
	att.Mult_SightTime = 1.3
	att.Mult_AccuracyMOA = 0.75

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_g3_barrel_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_g3_barrel_sd")

	att.PrintName = "640mm Whisper Barrel"
	att.Icon = Material("entities/acwatt_go_g3_barrel_sd.png", "mips smooth")
	att.Description = "G3 integral silencer. Reduces weapon report and improves weapon characteristics. Superior handling compared to a standalone suppressor."
	att.Desc_Pros = {
	    "pro.invistracers"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_g3_barrel"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Mult_ShootPitch = 0.9
	att.Mult_ShootVol = 0.75
	att.Mult_AccuracyMOA = 0.75
	att.Mult_Range = 1.25

	att.Mult_SightTime = 1.1

	att.Override_PhysTracerProfile = 7
	att.Override_TracerNum = 0
	ArcCW.LoadAttachmentType(att)
end

------
-- go_g3_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_g3_barrel_short")

	att.PrintName = "315mm Kurz Barrel"
	att.Icon = Material("entities/acwatt_go_g3_barrel_short.png", "mips smooth")
	att.Description = "Short length G3KA4 barrel. Improves handling, though offers much worse range and accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_g3_barrel"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 2

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_g3_grip_black.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_g3_grip_black")

	att.PrintName = "Black Grip"
	att.Icon = Material("entities/acwatt_go_g3_grip_black.png", "mips smooth")
	att.Description = "Alternative black G3 grip. Otherwise identical to factory option."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_g3_grip"
	att.Free = true
	ArcCW.LoadAttachmentType(att)
end

------
-- go_g3_mag_10.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_g3_mag_10")

	att.PrintName = "10-Round 7.62mm Steel"
	att.Icon = Material("entities/acwatt_go_g3_mag_10.png", "mips smooth")
	att.Description = "Small magazine with lighter load. Improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 10
	att.AutoStats = true
	att.Slot = "go_g3_mag"

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Override_ClipSize = 10
	att.Mult_ReloadTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_g3_mag_20_556.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_g3_mag_20_556")

	att.PrintName = "20-Round 5.56mm USGI"
	att.Icon = Material("entities/acwatt_go_m4_mag_20.png", "mips smooth")
	att.Description = "5.56mm conversion makes gun effectively into an HK33 pattern, improving fire rate and recoil at the cost of damage. Reduced capacity magazine improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 20
	att.AutoStats = true
	att.Slot = "go_g3_mag"

	att.InvAtt = "go_m4_mag_20"

	att.Override_Ammo = "smg1"

	att.Override_ClipSize = 20
	att.Mult_Damage = 0.6
	att.Mult_DamageMin = 0.9
	att.Mult_Range = 0.8
	att.Mult_RPM = 1.25
	att.Mult_Recoil = 0.6

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Mult_ReloadTime = 0.9

	att.Override_Trivia_Class = "Assault Rifle"
	att.Override_Trivia_Calibre = "5.56x45mm NATO"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "arccw_go/g3sg1/g3sg1_01.wav" then return "arccw_go/m4a1/m4a1_us_04.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_g3_mag_30.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_g3_mag_30")

	att.PrintName = "30-Round 7.62mm Steel"
	att.Icon = Material("entities/acwatt_go_g3_mag_30.png", "mips smooth")
	att.Description = "Extended magazine improves capacity at the cost of handling."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 30
	att.AutoStats = true
	att.Slot = "go_g3_mag"

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.1
	att.Override_ClipSize = 30
	att.Mult_ReloadTime = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_g3_mag_30_556.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_g3_mag_30_556")

	att.PrintName = "30-Round 5.56mm STANAG"
	att.Icon = Material("entities/acwatt_go_g3_mag_30_556.png", "mips smooth")
	att.Description = "5.56mm conversion makes gun effectively into an HK33 pattern, improving fire rate and recoil at the cost of damage."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 30
	att.AutoStats = true
	att.Slot = "go_g3_mag"

	att.Override_Ammo = "smg1"

	att.Override_ClipSize = 30
	att.Mult_Damage = 0.6
	att.Mult_DamageMin = 0.9
	att.Mult_Range = 0.8
	att.Mult_RPM = 1.25
	att.Mult_Recoil = 0.6

	att.Override_Trivia_Class = "Assault Rifle"
	att.Override_Trivia_Calibre = "5.56x45mm NATO"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "arccw_go/g3sg1/g3sg1_01.wav" then return "arccw_go/m4a1/m4a1_us_04.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_g3_mag_60_556.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_g3_mag_60_556")

	att.PrintName = "50-Round 5.56mm Quad"
	att.Icon = Material("entities/acwatt_go_556_ammo_60round.png", "mips smooth")
	att.Description = "5.56mm conversion makes gun effectively into an HK33 pattern, improving fire rate and recoil at the cost of damage. Quad stack magazine improves capacity."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 50
	att.AutoStats = true
	att.Slot = "go_g3_mag"

	att.Override_Ammo = "smg1"

	att.InvAtt = "go_556_ammo_60round"

	att.Override_ClipSize = 50
	att.Mult_Damage = 0.6
	att.Mult_DamageMin = 0.9
	att.Mult_Range = 0.8
	att.Mult_RPM = 1.25
	att.Mult_Recoil = 0.6

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.15
	att.Mult_ReloadTime = 1.25

	att.Override_Trivia_Class = "Assault Rifle"
	att.Override_Trivia_Calibre = "5.56x45mm NATO"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "arccw_go/g3sg1/g3sg1_01.wav" then return "arccw_go/m4a1/m4a1_us_04.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_g3_stock_collapsible.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_g3_stock_collapsible")

	att.PrintName = "Collapsible Stock"
	att.Icon = Material("entities/acwatt_go_g3_stock_collapsible.png", "mips smooth")
	att.Description = "Retractable G3 stock. Improves moving accuracy and strafe performance at the cost of recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_g3_stock"

	att.Mult_Recoil = 1.15
	att.Mult_MoveDispersion = 0.75
	ArcCW.LoadAttachmentType(att)
end

------
-- go_g3_stock_padded.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_g3_stock_padded")

	att.PrintName = "Padded Stock"
	att.Icon = Material("entities/acwatt_go_g3_stock_padded.png", "mips smooth")
	att.Description = "G3 sniper-style stock. Improves recoil at the cost of handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_g3_stock"

	att.Mult_Recoil = 0.9
	att.Mult_SightTime = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- go_galil_ar_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_galil_ar_barrel_long")

	att.PrintName = "508mm Sniper Barrel"
	att.Icon = Material("entities/acwatt_go_ace_barrel_long.png", "mips smooth")
	att.Description = "Long Galil barrel used on sniper and 7.62mm variants. Improved performance at range."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_galil_ar_barrel"

	att.Mult_SpeedMult = 0.9

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.3
	att.Mult_AccuracyMOA = 0.5

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_galil_ar_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_galil_ar_barrel_short")

	att.PrintName = "332mm SAR Barrel"
	att.Icon = Material("entities/acwatt_go_ace_barrel_short.png", "mips smooth")
	att.Description = "Short length Galil barrel, offering improved mobility at the cost of range and accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_galil_ar_barrel"

	att.Mult_SpeedMult = 1.1

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 2

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_glock_mag_13_45acp.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_glock_mag_13_45acp")

	att.PrintName = "13-Round .45 ACP G21"
	att.Icon = Material("entities/acwatt_go_glock_mag_regular.png", "mips smooth")
	att.Description = "Convert the weapon to the Glock 21, firing the venerable .45 ACP. It is more powerful than 10mm Auto up close, but loads even less rounds due to its size."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap",
	    "con.gsoe.nog18"
	}
	att.SortOrder = 4.5
	att.AutoStats = true
	att.Slot = "go_glock_mag"
	att.GivesFlags = {"noauto"}
	att.ExcludeFlags = {"go_glock_slide_auto"}
	att.Override_Trivia_Calibre = ".45 ACP"
	att.Hook_GetCapacity = function(wep, cap)
	    if wep.Attachments[3].Installed == "go_glock_slide_short" then
	        return 10
	    else
	        return 13
	    end
	end
	att.Hook_NameChange = function(wep, name)
	    if wep.Attachments[3].Installed == "go_glock_slide_short" then
	        return "Glock 30"
	    elseif wep.Attachments[3].Installed == "go_glock_slide_long" then
	        return "Glock 21L"
	    else
	        return "Glock 21"
	    end
	end

	att.Mult_RPM = 0.8
	att.Mult_Damage = 1.3
	att.Mult_DamageMin = 1.1
	att.Mult_Recoil = 1.3
	--att.Mult_ShootPitch = 1.1

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return "arccw_go/glock18/glock_45.wav" end
	end
	--[[att.Hook_GetDistantShootSound = function(wep, sound)
	    if snd == wep.DistantShootSound then return "arccw_go/usp/usp_unsil-1-distant.wav" end
	end]]
	ArcCW.LoadAttachmentType(att)
end

------
-- go_glock_mag_15_10auto.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_glock_mag_15_10auto")

	att.PrintName = "15-Round 10mm G20"
	att.Icon = Material("entities/acwatt_go_glock_mag_regular.png", "mips smooth")
	att.Description = "Convert the weapon to the 10mm Glock 20. It is stronger than 9mm at all ranges, but kicks quite harder."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap",
	    "con.gsoe.nog18"
	}
	att.SortOrder = 5.5
	att.AutoStats = true
	att.Slot = "go_glock_mag"
	att.GivesFlags = {"noauto"}
	att.ExcludeFlags = {"go_glock_slide_auto"}
	att.Override_Trivia_Calibre = "10mm Auto"
	att.Hook_GetCapacity = function(wep, cap)
	    if wep.Attachments[3].Installed == "go_glock_slide_short" then
	        return 12
	    else
	        return 15
	    end
	end
	att.Hook_NameChange = function(wep, name)
	    if wep.Attachments[3].Installed == "go_glock_slide_short" then
	        return "Glock 29"
	    elseif wep.Attachments[3].Installed == "go_glock_slide_long" then
	        return "Glock 20L"
	    else
	        return "Glock 20"
	    end
	end

	att.Mult_RPM = 0.9
	att.Mult_Damage = 1.2
	att.Mult_DamageMin = 1.2
	att.Mult_Recoil = 1.3
	--att.Mult_ShootPitch = 0.95

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return "arccw_go/glock18/glock_10.wav" end
	end
	--[[att.Hook_GetDistantShootSound = function(wep, sound)
	    if snd == wep.DistantShootSound then return "arccw_go/p250/p250-1-distant.wav" end
	end]]
	ArcCW.LoadAttachmentType(att)
end

