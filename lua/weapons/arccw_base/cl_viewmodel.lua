local mth      = math
local m_sin    = mth.sin
local m_cos    = mth.cos
local m_min    = mth.min
local m_appor  = mth.Approach
local m_clamp  = mth.Clamp
local m_angdif = mth.AngleDifference
local f_lerp   = Lerp
local srf      = surface

SWEP.ActualVMData = false

local eyeangles, lasteyeangles, coolswayang = Angle(), Angle(), Angle()
local swayangx_lerp, swayangy_lerp, swayangz_lerp = 0, 0, 0
local swayxmult, swayymult, swayzmult = 1, 1, 1
local coolswaypos = Vector()

local function ApprVecAng(from, to, dlt)
    local ret = (isangle(from) and isangle(to)) and Angle() or Vector()

    ret[1] = m_appor(from[1], to[1], dlt)
    ret[2] = m_appor(from[2], to[2], dlt)
    ret[3] = m_appor(from[3], to[3], dlt)

    return ret
end

local function LerpSource(dlt, from, to)
    from[1] = f_lerp(dlt, from[1], to[1])
    from[2] = f_lerp(dlt, from[2], to[2])
    from[3] = f_lerp(dlt, from[3], to[3])
end

local function LerpInto(dlt, from, to, into)
    into[1] = f_lerp(dlt, from[1], to[1])
    into[2] = f_lerp(dlt, from[2], to[2])
    into[3] = f_lerp(dlt, from[3], to[3])
end

local function addElem(vec, x, y, z)
    vec[1] = vec[1] + x
    vec[2] = vec[2] + y
    vec[3] = vec[3] + z
end

local function easeOut(x, intensity)
    intensity = (intensity and -intensity * 10) or -15 -- values < 1 not recommended
    return (x <= 0 and 0) or (x == 1 and 1) or 1 - (2 ^ (intensity * x))
end

local function easeInOut(x)
    return x == 0 and 0
        or x == 1 and 1
        or x < 0.5 and 2 ^ (20 * x - 10) / 2
        or (2 - (2 ^ (-20 * x + 10))) / 2;
end

-- touch:
SWEP.VM_CrouchIn = 0.25
SWEP.VM_CrouchOut = 0.4
SWEP.VM_SprintRecovery = 0.5

SWEP.VM_BarrelWallFrac = 0 -- don't touch

SWEP.VM_LastBarrelHit = 0

SWEP.VM_LastBarrelRecoverFrom = 0
SWEP.VM_LastBarrelRecover = 0

local sharedVector = Vector()
local sharedVector2 = Vector()

local sharedEVVector = Vector()
local sharedEVAng = Angle()

local sharedAngle = Angle()
local sharedAngle2 = Angle()

-- local b = bench("pp", 1000)

--[[
25.02:
    "pp" took 94.639ms (avg. across 1000 calls: 0.095ms, time since last print: 1253.706ms)
    "pp" took 92.227ms (avg. across 1000 calls: 0.092ms, time since last print: 1245.575ms)
    "pp" took 88.247ms (avg. across 1000 calls: 0.088ms, time since last print: 1422.749ms)
]]

function SWEP:GetViewModelPosition(pos, ang)
    --b:Open()

    local owner = self:GetOwner()
    local t = self:GetTable()

    if !IsValid(owner) or !owner:Alive() then return end

    -- local SP = game.SinglePlayer()

    local CT = CurTime()
    local UCT = UnPredictedCurTime()
    local FT = FrameTime()
    local pred = IsFirstTimePredicted()

    local gunbone, gbslot = self:GetBuff_Override("LHIK_GunDriver")

    local oldpos, oldang = Vector(), Angle()

    -- local asight = self:GetActiveSights()
    local state  = self:GetState()

    oldpos:Set(pos)
    oldang:Set(ang)

    ang = ang - self:GetOurViewPunchAngles()

    actual = t.ActualVMData or { pos = Vector(), ang = Angle(), down = 1, sway = 1, bob = 1, evpos = Vector(), evang = Angle() }

    local target = {}

    target.pos  = sharedVector
    target.pos:Set(self:GetBuff_Override("Override_ActivePos") or self.ActivePos)

    target.ang  = sharedAngle
    target.ang:Set(self:GetBuff_Override("Override_ActiveAng") or self.ActiveAng)

    target.down = 1
    target.sway = 2
    target.bob  = 2

    if self:GetReloading() then
        if t.ReloadPos then target.pos = t.ReloadPos end
        if t.ReloadAng then target.ang = t.ReloadAng end
    end

    local vm_right   = GetConVar("arccw_vm_right"):GetFloat()
    local vm_up      = GetConVar("arccw_vm_up"):GetFloat()
    local vm_forward = GetConVar("arccw_vm_forward"):GetFloat()
    local vm_fov     = GetConVar("arccw_vm_fov"):GetFloat()
        
    local crouching = owner:Crouching() or owner:KeyDown(IN_DUCK)

    -- This is ugly but NW vars don't rewind themselves properly /shrug
    if not crouching then
        if self:GetNWFloat("CrouchTime", 0) > 0 and self:GetNWFloat("UncrouchTime", 0) == 0 then
            self:SetNWFloat("UncrouchTime", UCT)
        end

        local uncrouchedFor = UCT - self:GetNWFloat("UncrouchTime", 0)
        local crouchFrac = easeOut( math.min( uncrouchedFor / self.VM_CrouchOut, 1) )

        target.down = Lerp(crouchFrac, 0, target.down)

        if self:GetBuff("CrouchPos", true) then
            LerpSource(1 - crouchFrac, target.pos, t.CrouchPos)
        end
        if self:GetBuff("CrouchAng", true) then
            LerpSource(1 - crouchFrac, target.ang, t.CrouchAng) 
        end

        if pred then
            self:SetNWFloat("CrouchTime", 0)
            if crouchFrac == 1 then
                self:SetNWFloat("UncrouchTime", 0)
            end
        end

        
    else

        if pred and self:GetNWFloat("CrouchTime", 0) == 0 then
            self:SetNWFloat("CrouchTime", UCT)
        end

        local crouchedFor = UCT - self:GetNWFloat("CrouchTime", UCT)
        local crouchFrac = easeOut( math.min( crouchedFor / self.VM_CrouchIn, 1 ) )

        target.down = Lerp(crouchFrac, target.down, 0)

        if self:GetBuff("CrouchPos", true) then
            LerpSource(crouchFrac, target.pos, t.CrouchPos)
        end
        if self:GetBuff("CrouchAng", true) then
            LerpSource(crouchFrac, target.ang, t.CrouchAng) 
        end

        if pred and owner:KeyDown(IN_DUCK) then
            self:SetNWFloat("UncrouchTime", 0)
        end
    end

    if self:InBipod() then
        if !t.BipodAngle then
            t.BipodPos = self:GetOwner():EyePos()
            t.BipodAngle = self:GetOwner():EyeAngles()
        end

        local BEA = self.BipodAngle - owner:EyeAngles()

        local irons = self:GetActiveSights()

        target.pos = irons.Pos or target.pos
        target.ang = irons.Ang or target.ang

        local r, f, u = BEA:Right(), BEA:Forward(), BEA:Up()
        local bx, by, bz = t.InBipodMult:Unpack()
        local mx, my, mz = t.InBipodPos:Unpack()

        r:Mul(mx * bx)
        f:Mul(my * by)
        u:Mul(mz * bz)

        target.pos:Add(r)
        target.pos:Add(f)
        target.pos:Add(u)

        target.sway = 0.2
    end

    addElem(target.pos, vm_right, vm_forward, vm_up)

    local sightTime = self:GetSightTime()
    local inSightTime, outSightTime = t.LastEnterSightTimeUnpred, t.LastExitSightTimeUnpred

    local sighted   = (t.Sighted or state == ArcCW.STATE_SIGHTS or
        (UCT - inSightTime) < sightTime)
    local sightedFrac = 0

    -- the bigger the sight time, the less intense the easing out becomes
    -- (and the more "heavy") the weapon feels when scoping

    local intensity = math.Clamp(0.8 / self:GetSightTime(), 1, 5)

    if outSightTime >= inSightTime then
        sightedFrac = 1 - easeOut( math.min(1, (UCT - outSightTime) / sightTime), intensity )
    else
        sightedFrac = easeOut( math.min(1, (UCT - inSightTime) / sightTime), intensity )
    end

    local sprinted  = (t.Sprinted or state == ArcCW.STATE_SPRINT or
            (not sighted and (UCT - t.LastExitSprintTimeUnpred) < t.VM_SprintRecovery)) -- sighting takes priority over sprint recovery
    local sprintFrac = 0

    if sprinted then
        if t.LastExitSprintTimeUnpred >= t.LastEnterSprintTimeUnpred then
            sprintFrac = 1 - easeOut( math.min(1, (UCT - self.LastExitSprintTimeUnpred) / t.VM_SprintRecovery), intensity )
        else
            sprintFrac = easeOut( math.min(1, (UCT - self.LastEnterSprintTimeUnpred) / t.VM_SprintRecovery), intensity )
        end
    end

    local holstered = self:GetCurrentFiremode().Mode == 0


    local sprd = self:GetSprintDelta()

    if state == ArcCW.STATE_CUSTOMIZE then
        target.pos  = Vector()
        target.ang  = Angle()
        target.down = 1
        target.sway = 3
        target.bob  = 1

        local mx, my = input.GetCursorPos()

        mx = 2 * mx / ScrW()
        my = 2 * my / ScrH()

        target.pos:Set(self:GetBuff("CustomizePos"))
        target.ang:Set(self:GetBuff("CustomizeAng"))

        target.pos = target.pos + Vector(mx, 0, my)
        target.ang = target.ang + Angle(0, my * 2, mx * 2)

        if self.InAttMenu then target.ang = target.ang + Angle(0, -5, 0) end
    else
        if (sprinted and !(self:GetBuff_Override("Override_ShootWhileSprint") or t.ShootWhileSprint)) or holstered then

            local intensity = math.Clamp(0.8 / self:GetSightTime(), 1, 5)

            local prePos = target.pos
            local preAng = target.ang

            target.pos  = sharedVector2
            target.ang  = sharedAngle2
            target.down = 1
            target.sway = GetConVar("arccw_vm_sway_sprint"):GetInt()
            target.bob  = GetConVar("arccw_vm_bob_sprint"):GetInt()

            local hpos, spos = self:GetBuff("HolsterPos", true), self:GetBuff("SprintPos", true)
            local hang, sang = self:GetBuff("HolsterAng", true), self:GetBuff("SprintAng", true)

            target.pos:Set(holstered and (hpos or spos) or (spos or hpos))

            target.pos[1] = target.pos[1] + vm_right
            target.pos[2] = target.pos[2] + vm_forward
            target.pos[3] = target.pos[3] + vm_up

            LerpSource(1 - sprintFrac, target.pos, prePos)

            target.ang:Set(holstered and (hang or sang) or (sang or hang))

            if ang.p < -15 then target.ang.p = target.ang.p + ang.p + 15 end

            target.ang.p = m_clamp(target.ang.p, -80, 80)
            LerpSource(1 - sprintFrac, target.ang, preAng)
        end

        if sightedFrac > 0 then
            local irons = self:GetActiveSights()

            LerpSource(sightedFrac, target.pos, irons.Pos)
            LerpSource(sightedFrac, target.ang, irons.Ang)

            target.evpos = sharedEVVector
            if irons.EVPos then
                LerpInto(sightedFrac, vector_origin, irons.EVPos, target.evpos)
            else
                target.evpos:Set(vector_origin)
            end

            target.evang = sharedEVAng
            if irons.EVAng then
                LerpInto(sightedFrac, angle_zero, irons.EVAng, target.evang)
            else
                target.evang:Set(angle_zero)
            end

            target.down  = Lerp(sightedFrac, target.down, 0)
            target.sway  = Lerp(sightedFrac, target.sway, 0.1)
            target.bob   = Lerp(sightedFrac, target.bob, 0.1)

            local sightroll = self:GetBuff_Override("Override_AddSightRoll")

            if sightroll then
                LerpSource(sightedFrac, target.ang, irons.Ang)
                target.ang.r = sightroll
            end
        end
    end

    if sprd > 0 and !self:GetBuff("ShootWhileSprint") then
        local hpos, spos = self:GetBuff("HolsterPos", true), self:GetBuff("SprintPos", true)
        local hang, sang = self:GetBuff("HolsterAng", true), self:GetBuff("SprintAng", true)

        target.pos = LerpVector(sprd, target.pos, spos or hpos)
        target.ang = LerpAngle(sprd, target.ang, sang or hang)
    end

    local deg = self:BarrelHitWall(true)

    local stanceRecover = self:GetSightTime() ^ 0.4 / 2     -- how fast the stance will recover
    local stanceRuin = self:GetSightTime() ^ 0.2            -- how fast the stance will break

    if pred then
        if deg > 0 then
            self.VM_LastBarrelRecover = nil
            self.VM_LastBarrelRecoverFrom = nil
            self.VM_LastBarrelHit = self.VM_LastBarrelHit or UCT
        else
            self.VM_LastBarrelHit = nil
            self.VM_LastBarrelRecover = self.VM_LastBarrelRecover or UCT
            self.VM_LastBarrelRecoverFrom = self.VM_LastBarrelRecoverFrom or self.VM_BarrelWallFrac
        end
    end

    if self.VM_LastBarrelRecover then
        self.VM_BarrelWallFrac = self.VM_LastBarrelRecoverFrom * (1 - easeOut( (UCT - self.VM_LastBarrelRecover) / stanceRuin, 1 ))
    else
        self.VM_BarrelWallFrac = deg * easeOut( (UCT - self.VM_LastBarrelHit) / stanceRuin, 1 )
    end

    if self.VM_BarrelWallFrac > 0 then
        local fr = self.VM_BarrelWallFrac

        LerpSource(fr, target.pos, self.HolsterPos)
        LerpSource(fr, target.ang, self.HolsterAng)

        local int = fr * 2

        target.down = target.down + int
        target.sway = target.sway + int
        target.bob  = target.bob + int
    end

    if !isangle(target.ang) then target.ang = Angle(target.ang) end

    if self.InProcDraw then
        self.InProcHolster = false

        local delta = m_clamp((CT - self.ProcDrawTime) / (0.25 * self:GetBuff_Mult("Mult_DrawTime")), 0, 1)

        targetpos  = LerpVector(delta, Vector(0, -30, -30), target.pos)
        targetang  = LerpAngle(delta, Angle(40, 30, 0), target.ang)
        targetdown = target.down
        targetsway = target.sway
        targetbob  = target.bob

        if delta == 1 then self.InProcDraw = false end
    end

    if self.InProcHolster then
        self.InProcDraw = false

        local delta = 1 - m_clamp((CT - self.ProcHolsterTime) / (0.25 * self:GetBuff_Mult("Mult_DrawTime")), 0, 1)

        target.pos = LerpVector(delta, Vector(0, -30, -30), target.pos)
        target.ang = LerpAngle(delta, Angle(40, 30, 0), target.ang)
        target.down = target.down
        target.sway = target.sway
        target.bob = target.bob

        if delta == 0 then self.InProcHolster = false end
    end

    if self.InProcBash then
        self.InProcDraw = false

        local mult  = self:GetBuff_Mult("Mult_MeleeTime")
        local mtime = self.MeleeTime * mult

        local delta = 1 - m_clamp((CT - self.ProcBashTime) / mtime, 0, 1)

        local bp, ba = self.BashPos, self.BashAng

        bp = self:GetBuff_Override("Override_BashPos") or bp
        ba = self:GetBuff_Override("Override_BashAng") or ba

        if delta > 0.3 then
            bp, ba = self.BashPreparePos, self.BashPrepareAng

            bp = self:GetBuff_Override("Override_BashPreparePos") or bp
            ba = self:GetBuff_Override("Override_BashPrepareAng") or ba
            delta = (delta - 0.5) * 2
        else
            delta = delta * 2
        end

        target.pos = LerpVector(delta, bp, target.pos)
        target.ang = LerpAngle(delta, ba, target.ang)
        target.down = target.down
        target.sway = target.sway
        target.bob = target.bob
        target.speed = 10

        if delta == 0 then self.InProcBash = false end
    end

    --[[ who fucking made this

    if !self.ViewModel_Hit:IsZero() then
        local nap = Vector()
        nap:Set(self.ViewModel_Hit)

        nap[1] = m_clamp(nap[2], -1, 1) * 0.25
        nap[3] = m_clamp(nap[1], -1, 1) * 1

        target.pos:Add(nap)

        local naa = Angle()

        naa[1] = self.ViewModel_Hit[1]
        naa[2] = self.ViewModel_Hit[2]
        naa[3] = self.ViewModel_Hit[3]

        naa[1] = m_clamp(naa[1], -1, 1) * 5
        naa[2] = m_clamp(naa[2], -1, 1) * -2
        naa[3] = m_clamp(naa[3], -1, 1) * 12.5

        target.ang = target.ang + naa

        local nvmh = Vector()
        local spd = self.ViewModel_Hit:Length()

        nvmh[1] = m_appor(self.ViewModel_Hit[1], 0, FT5 * spd)
        nvmh[2] = m_appor(self.ViewModel_Hit[2], 0, FT5 * spd)
        nvmh[3] = m_appor(self.ViewModel_Hit[3], 0, FT5 * spd)

        self.ViewModel_Hit = nvmh
    end
    ]]

    local randVec = VectorRand()
    randVec:Mul(self.RecoilAmount * 0.2)

    target.pos:Add(randVec)

    local speed = target.speed or 3

    local coolsway = GetConVar("arccw_vm_coolsway"):GetBool()

    lookxmult = GetConVar("arccw_vm_look_xmult"):GetFloat()
    lookymult = GetConVar("arccw_vm_look_ymult"):GetFloat()

    swayxmult = GetConVar("arccw_vm_sway_xmult"):GetFloat()
    swayymult = GetConVar("arccw_vm_sway_ymult"):GetFloat()
    swayzmult = GetConVar("arccw_vm_sway_zmult"):GetFloat()
    swayspeed = GetConVar("arccw_vm_sway_speedmult"):GetFloat()
    swayrotate = GetConVar("arccw_vm_sway_rotatemult"):GetFloat()

    if coolsway then
        eyeangles = owner:EyeAngles()
        local sightmult = ((sighted and 0.1) or 1)
        local sprintmult = (sprinted and 3 * sprintFrac or 0) + 1

        local strafing = owner:KeyDown(IN_MOVELEFT) or owner:KeyDown(IN_MOVERIGHT)

        local velmult = math.Clamp(owner:GetVelocity():Length() / 170, 0.1,2)
        local pi = math.Clamp(math.pi * math.Round(velmult) * swayspeed, 1, 6)
        local movmt = (UCT * pi) / 0.5
        local movmtcomp = ((UCT * pi) - 0.25) / 0.5

        local xangdiff = m_angdif(eyeangles.x, lasteyeangles.x) * lookxmult
        local yangdiff = m_angdif(eyeangles.y, lasteyeangles.y) * lookymult
        local rollamount = (strafing and owner:GetVelocity():Angle().y) or eyeangles.y
        local rollangdiff = math.Clamp(m_angdif(eyeangles.y, rollamount ) / 180 * pi, -7, 7)

        coolswaypos[1] = (0.25 * velmult) * m_cos(movmtcomp) * sprintmult * swayxmult * sightmult
        coolswaypos[2] = -math.abs((1 * velmult) * m_cos(movmtcomp)) * swayymult * sightmult
        coolswaypos[3] = -math.abs((0.25 * velmult) * m_cos(movmtcomp)) * swayzmult * sightmult

        swayangx_lerp = f_lerp(0.25, swayangx_lerp, xangdiff * sightmult)
        swayangy_lerp = f_lerp(0.25, swayangy_lerp, yangdiff * sightmult)
        swayangz_lerp = f_lerp(0.025, swayangz_lerp, rollangdiff)

        coolswayang.x = (math.abs((0.5 * velmult) * m_sin(movmt)) + swayangx_lerp * swayxmult)
        coolswayang.y = ((0.25 * velmult) * m_cos(movmt) - swayangy_lerp + swayangz_lerp * swayymult)
        coolswayang.z = (math.min((2.5 * velmult) * m_cos(movmt), 0) + swayangy_lerp - swayangz_lerp * swayzmult) * swayrotate

        target.ang:Add(coolswayang)
        target.pos:Add(coolswaypos)
    end

    -- For some reason, in multiplayer the sighting speed is twice as fast
    speed = 1

    actual.pos:Set(target.pos)
    actual.ang   = target.ang
    actual.down  = target.down
    actual.sway  = target.sway
    actual.bob   = target.bob

    if target.evpos then
        actual.evpos:Set(target.evpos)
    else
        actual.evpos:Set(vector_origin)
    end

    if target.evang then
        actual.evang:Set(target.evang)
    else
        actual.evang:Set(angle_zero)
    end

    self.SwayScale = (coolsway and 0) or actual.sway
    self.BobScale  = (coolsway and 0) or actual.bob

    pos:Add( math.min(self.RecoilPunchBack, 1) * -oldang:Forward() )
    pos:Add( self.RecoilPunchSide * oldang:Right() )
    pos:Add( self.RecoilPunchUp   * -oldang:Up() )

    ang:RotateAroundAxis(oldang:Right(),   actual.ang.x)
    ang:RotateAroundAxis(oldang:Up(),      actual.ang.y)
    ang:RotateAroundAxis(oldang:Forward(), actual.ang.z)

    ang:RotateAroundAxis(oldang:Right(),   actual.evang.x)
    ang:RotateAroundAxis(oldang:Up(),      actual.evang.y)
    ang:RotateAroundAxis(oldang:Forward(), actual.evang.z)

    pos:Add( oldang:Right()   * actual.evpos.x)
    pos:Add( oldang:Forward() * actual.evpos.y)
    pos:Add( oldang:Up()      * actual.evpos.z)

    pos:Add( actual.pos.x * ang:Right() )
    pos:Add( actual.pos.y * ang:Forward() )
    pos:Add( actual.pos.z * ang:Up() )

    pos[3] = pos[3] - actual.down

    ang = ang + self:GetOurViewPunchAngles() * Lerp(self:GetSightDelta(), 1, -1)

    self.ActualVMData = actual

    if coolsway then lasteyeangles = LerpAngle(m_min(FT * 100, 1), lasteyeangles, eyeangles) end

    if gunbone then
        local magnitude = Lerp(self:GetSightDelta(), 0.1, 1)
        local lhik_model = self.Attachments[gbslot].VElement.Model
        local att = lhik_model:LookupAttachment(gunbone)
        local attang = lhik_model:GetAttachment(att).Ang
        local attpos = lhik_model:GetAttachment(att).Pos

        attang = lhik_model:WorldToLocalAngles(attang)
        attpos = lhik_model:WorldToLocal(attpos)

        attang = attang - self.LHIKGunAng
        attpos = attpos - self.LHIKGunPos

        attang = attang * magnitude
        attpos = attpos * magnitude

        ang:Add(attang)
        pos:Add(attpos)
    end

    --b:Close():print()
    return pos, ang
end

local function ShouldCheapWorldModel(wep)
    local lp = LocalPlayer()

    if lp:GetObserverMode() == OBS_MODE_IN_EYE and lp:GetObserverTarget() == wep:GetOwner() then
        return true
    end

    return !GetConVar("arccw_att_showothers"):GetBool()
end

function SWEP:DrawWorldModel()
    if !IsValid(self:GetOwner()) and !TTT2 and GetConVar("arccw_2d3d"):GetBool() and (EyePos() - self:WorldSpaceCenter()):LengthSqr() <= 262144 then -- 512^2
        local ang = LocalPlayer():EyeAngles()

        ang:RotateAroundAxis(ang:Forward(), 180)
        ang:RotateAroundAxis(ang:Right(),   90)
        ang:RotateAroundAxis(ang:Up(),      90)

        cam.Start3D2D(self:WorldSpaceCenter() + Vector(0, 0, 16), ang, 0.1)
            srf.SetFont("ArcCW_32_Unscaled")

            local w = srf.GetTextSize(self.PrintName)

            srf.SetTextPos(-w / 2, 0)
            srf.SetTextColor(255, 255, 255, 255)
            srf.DrawText(self.PrintName)

            srf.SetFont("ArcCW_24_Unscaled")

            local count = self:CountAttachments()
            if count > 0 then
                local t = tostring(count) .. " Attachments"

                w = srf.GetTextSize(t)

                srf.SetTextPos(-w / 2, 32)
                srf.SetTextColor(255, 255, 255, 255)
                srf.DrawText(t)
            end
        cam.End3D2D()
    end

    if ShouldCheapWorldModel(self) then
        self:DrawModel()
    else
        self:DrawCustomModel(true)
    end

    self:DoLaser(true)

    if self:ShouldGlint() then self:DoScopeGlint()  end

    if !self.CertainAboutAtts then
        net.Start("arccw_rqwpnnet")
        net.WriteEntity(self)
        net.SendToServer()
    end
end

function SWEP:ShouldCheapScope()
    if !self:GetConVar("arccw_cheapscopes"):GetBool() then return end
end

function SWEP:PreDrawViewModel(vm)
    if ArcCW.VM_OverDraw then return end
    if !vm then return end

    if self:GetState() == ArcCW.STATE_CUSTOMIZE then self:BlurNotWeapon() end

    if GetConVar("arccw_cheapscopesautoconfig"):GetBool() then
        local fps    = 1 / m_min(FrameTime(), FrameTime())
        local lowfps = fps <= 45

        GetConVar("arccw_cheapscopes"):SetBool(lowfps)

        GetConVar("arccw_cheapscopesautoconfig"):SetBool(false)
    end

    local asight = self:GetActiveSights()

    if self:GetSightDelta() < 1 and asight.Holosight then
        ArcCW:DrawPhysBullets()
    end

    if GetConVar("arccw_cheapscopes"):GetBool() and self:GetSightDelta() < 1 and asight.MagnifiedOptic then
        self:FormCheapScope()
    end

    if self:GetSightDelta() < 1 and asight.ScopeTexture then
        self:FormCheapScope()
    end

    cam.Start3D(EyePos(), EyeAngles(), self.CurrentViewModelFOV or self.ViewModelFOV, nil, nil, nil, nil, 1.5, 15000)
    cam.IgnoreZ(true)

    self:DrawCustomModel(false)

    self:DoLHIK()
end

function SWEP:PostDrawViewModel()
    if ArcCW.VM_OverDraw then return end
    render.SetBlend(1)

    cam.End3D()

    cam.Start3D(EyePos(), EyeAngles(), self.CurrentViewModelFOV or self.ViewModelFOV, nil, nil, nil, nil, 0.1, 15000)

    cam.IgnoreZ(true)

    if ArcCW.Overdraw then
        ArcCW.Overdraw = false
    else
        self:DoLaser()
        self:DoHolosight()
    end

    cam.End3D()
end