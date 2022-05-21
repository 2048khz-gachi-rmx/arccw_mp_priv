local mth      = math
local m_rand   = mth.Rand
local m_lerp   = Lerp

function ArcCW:Debug(name, fn, fn2, ...)
	local cv = GetConVar("arccw_debug_" .. name)
	if not cv then
		cv = CreateConVar("arccw_debug_" .. name, 0, FCVAR_ARCHIVE + FCVAR_CLIENTCMD_CAN_EXECUTE)
	end

	local int = cv:GetInt()
	if int == 0 then return end

	if isnumber(fn) then
		if int < fn then return end
		fn2(...)
	else
		fn(fn2, ...)
	end
end

local function dbg(...)
	ArcCW:Debug("pen", ...)
end

function ArcCW:GetRicochetChance(penleft, tr)
    if !GetConVar("arccw_enable_ricochet"):GetBool() then return 0 end

    local degree = tr.HitNormal:Dot((tr.StartPos - tr.HitPos):GetNormalized())
    local ricmult = ArcCW.PenTable[tr.MatType] or 1

    -- 0 at 1
    -- 100 at 0

    local c = Lerp(degree, math.min(penleft * ricmult * 2, 45), 0)

    -- c = c * GetConVar("arccw_ricochet_mult"):GetFloat()

    -- c = 100

    return math.Clamp(c, 0, 100)
end

function ArcCW:IsPenetrating(ptr, ptrent)
    if ptrent:IsWorld() or ptrent == NULL then
        local is_pen = ptr.StartSolid or ptr.AllSolid or not util.IsInWorld(ptr.StartPos)

        return is_pen
    elseif IsValid(ptrent) then
        local mins, maxs = ptrent:WorldSpaceAABB()
        local withinbounding = ptr.HitPos:WithinAABox(mins, maxs)

        --debugoverlay.Box(Vector(0, 0, 0), mins, maxs, 5, Color(255, 255, 255, 50))
        dbg(2, debugoverlay.Cross, ptr.HitPos, 2, 5, Color(255, 255, 0), true)

        if withinbounding then return true end
        --[[]
        -- Check whether the point is inside the hitbox
        -- Requires some math that I can't be bothered to solve
        if ptr.HitBox > 0 then
            local mins2, maxs2 = ptrent:GetHitBoxBounds(ptr.HitBox, ptr.HitGroup)
            local bonepos, boneang = ptrent:GetBonePosition(ptrent:GetHitBoxBone(ptr.HitBox, ptrent:GetHitboxSet()))
            if GetConVar("developer"):GetBool() then
                debugoverlay.BoxAngles(bonepos, mins2, maxs2, boneang, 5, Color(255, 255, 255, 50))
                debugoverlay.Axis(bonepos, boneang, 16, 5, true)
            end
        end
        ]]
    end
    return false
end

function ArcCW:DoPenetration(tr, damage, bullet, penleft, physical, alreadypenned)
    local hitpos, startpos = tr.HitPos, tr.StartPos

    if CLIENT then
        return
    end

    if tr.HitSky then return end

    if penleft <= 0 then return end

    alreadypenned = alreadypenned or {}

    local skip = false

    local trent = tr.Entity

    local penmult     = ArcCW.PenTable[tr.MatType] or 1
    local pentracelen = math.Clamp(penleft / 10, 0.5, 2)

    local cWorld = trent:IsWorld() or not IsValid(trent)
    if not cWorld then
    	-- props tend to be complex and/or thin; more precision is required
    	pentracelen = 0.25
    end

    local curr_ent = trent
    local startpen = penleft

    if !tr.HitWorld then penmult = penmult * 1.5 end

    if trent.mmRHAe then penmult = trent.mmRHAe end

    penmult = penmult * m_rand(0.9, 1.1) * m_rand(0.9, 1.1)

    local dir    = tr.Normal

    local endpos = hitpos + (dir * pentracelen * 0.3) -- go into the wall a little bit off the start

    local td  = {}
    td.start  = endpos
    td.endpos = endpos + (dir * pentracelen)
    td.mask   = MASK_SHOT

    local ptr = util.TraceLine(td)

    local ptrent = ptr.Entity

    if ArcCW:GetRicochetChance(penleft, tr) > math.random(0, 100) then
        local degree = tr.HitNormal:Dot((tr.StartPos - tr.HitPos):GetNormalized())
        if degree == 0 or degree == 1 then return end
        sound.Play(ArcCW.RicochetSounds[math.random(#ArcCW.RicochetSounds)], tr.HitPos)
        if (tr.Normal:Length() == 0) then return end
        -- ACT3_ShootPBullet(tr.HitPos, ((2 * degree * tr.HitNormal) + tr.Normal) * (vel * math.Rand(0.25, 0.75)), owner, inflictor, bulletid, false, 1, penleft, dist)
        -- return

        dir = (2 * degree * tr.HitNormal) + tr.Normal
        ang = dir:Angle()
        ang = ang + (AngleRand() * (1 - degree) * 1 / 360)

        dir = ang:Forward()

        local d = math.Rand(0.25, 0.95)

        penleft = penleft * d
        dbg(2, debugoverlay.Text, td.endpos - Vector(0, 0, 8), "RICOCHET", 5)
        endpos = hitpos -- back out of the wall for the ricochet
        skip = true
    end

    if !GetConVar("arccw_enable_penetration"):GetBool() then return end

   	--debugoverlay.Sphere(endpos, 3, 3, Colors.Money, true)

    while !skip and penleft > 0 and ArcCW:IsPenetrating(ptr, ptrent)
        --[[and ptr.Fraction < 1]] -- https://i.imgur.com/mtDYkEp.png
        and (ptrent == curr_ent or (cWorld and (ptrent:IsWorld() or ptrent == NULL))) do
        penleft = penleft - (pentracelen * penmult)

        --debugoverlay.Sphere(ptr.StartPos, math.max(0, penleft), 4, color_white, true)
        --debugoverlay.Text(ptr.StartPos, ("%.1f"):format(penleft), 3)

        td.start  = endpos
        td.endpos = endpos + (dir * pentracelen)
        td.mask   = MASK_SHOT

        ptr = util.TraceLine(td)

       -- debugoverlay.Text(ptr.HitPos, ("%.1f"):format(penleft), 3)

        -- This is never called because curr_ent is never updated, genius
        -- Damage is handled in abullet.Callback anyways
        ptrent = ptr.Entity


        local pdeltap = penleft / bullet.Penetration
        local colorlr = m_lerp(pdeltap, 0, 255)

        dbg(2, debugoverlay.Line, endpos, endpos + (dir * pentracelen), 10,
            Color(255, colorlr, colorlr), true)


        endpos = endpos + (dir * pentracelen)

        dir = dir + (VectorRand() * 0.01 * penmult * pentracelen)
        dir:Normalize()
    end

    --debugoverlay.Sphere(endpos, 3, 3, Colors.Red, true)

    -- decrease penetration strength for each surface successfully penetrated

    if cWorld then
    	penleft = penleft / 3
    end

    local in_wall = not util.IsInWorld(endpos)

   -- debugoverlay.Cross(endpos, 8, 4, Colors.Sky, true)

    if penleft <= 0 then
    	dbg(2, debugoverlay.Text, endpos + Vector(0, 0, 4), "Dead", 5)
    end

    if penleft > 0 then
        if (dir:Length() == 0) then return end

        local pdelta = penleft / bullet.Penetration

        local attacker = bullet.Attacker

        if !IsValid(attacker) then
            attacker = game.GetWorld()
        end

        if physical then
            if !ptr.HitWorld then
                alreadypenned[ptrent:EntIndex()] = true
            end

            local newbullet = {}
            newbullet.DamageMin = bullet.DamageMin or 1
            newbullet.DamageMax = bullet.DamageMax or 10
            newbullet.Range = bullet.Range or 100
            newbullet.DamageType = bullet.DamageType or DMG_BULLET
            newbullet.Penleft = penleft
            newbullet.Penetration = bullet.Penetration
            newbullet.Num = bullet.Num or 1
            newbullet.Pos = endpos
            local spd = bullet.Vel:Length()
            newbullet.Attacker = bullet.Attacker
            newbullet.Vel = dir * spd * (penleft / startpen)
            newbullet.Drag = bullet.Drag or 1
            newbullet.Travelled = bullet.Travelled + (endpos - hitpos):Length()
            newbullet.Damaged = alreadypenned
            newbullet.Profile = bullet.Profile or 1
            newbullet.Gravity = bullet.Gravity or 1
            newbullet.StartTime = bullet.StartTime or CurTime()
            newbullet.PhysBulletImpact = bullet.PhysBulletImpact or true
            newbullet.Weapon = bullet.Weapon

            if bit.band( util.PointContents( endpos ), CONTENTS_WATER ) == CONTENTS_WATER then
                newbullet.Underwater = true
            end

            table.insert(ArcCW.PhysBullets, newbullet)

            ArcCW:SendBullet(newbullet)
        else
            local abullet = {}
            abullet.Attacker = owner
            abullet.Dir      = dir
            abullet.Src      = endpos
            abullet.Spread   = Vector(0, 0, 0)
            abullet.Damage   = 0
            abullet.Num      = 1
            abullet.Force    = 0
            abullet.Distance = 33000
            abullet.Tracer   = 0
            abullet.IgnoreEntity = ptr.Entity
            abullet.Callback = function(att, btr, dmg)
                local dist = bullet.Travelled * ArcCW.HUToM
                bullet.Travelled = bullet.Travelled + (btr.HitPos - endpos):Length()

                if alreadypenned[btr.Entity:EntIndex()] then
                    dmg:SetDamage(0)
                else
                    dmg:SetDamageType(bullet.DamageType)
                    dmg:SetDamage(bullet.Weapon:GetDamage(dist, true) * pdelta, true)
                    alreadypenned[btr.Entity:EntIndex()] = dmg:GetDamage()
                end

                hook.Run("ArcCW_BulletPenned", bullet.Weapon, att, btr, dmg, alreadypenned)

                ArcCW:DoPenetration(btr, damage, bullet, penleft, false, alreadypenned)

                dbg(2, debugoverlay.Cross, endpos, 8, 4, Colors.Sky, true)
                dbg(2, debugoverlay.Cross, btr.HitPos, 8, 4, Colors.Red, true)
                dbg(2, debugoverlay.Line, endpos, btr.HitPos, 10, Color(150, 150, 150), true)

                -- if !game.SinglePlayer() and CLIENT then
                    local fx = EffectData()
                    fx:SetStart(tr.HitPos)
                    fx:SetOrigin(btr.HitPos)
                    util.Effect("arccw_ricochet", fx)
                -- end
            end

            attacker:FireBullets(abullet)
        end

        --[[
        local atk = bullet.Attacker

        local supbullet = {}
            supbullet.Src      = hitpos
            supbullet.Dir      = -dir
            supbullet.Damage   = 0
            supbullet.Distance = 8
            supbullet.Tracer   = 0
            supbullet.Force    = 0
        ]]
    else
    	hook.Run("ArcCW_BulletLanded", bullet.Weapon, alreadypenned)
    end
end