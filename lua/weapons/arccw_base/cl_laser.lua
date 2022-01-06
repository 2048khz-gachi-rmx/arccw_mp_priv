local mth        = math
local m_log10    = mth.log10
local m_rand     = mth.Rand
local rnd        = render
local SetMat     = rnd.SetMaterial
local DrawBeam   = rnd.DrawBeam
local DrawSprite = rnd.DrawSprite
local cam        = cam

local lasermat = Material("arccw/laser")
local flaremat = Material("effects/whiteflare")
local delta    = 1

function SWEP:DoLaser(world)
    world = world or false

    if world then
        cam.Start3D()
    else
        cam.Start3D(nil, nil, self.CurrentViewModelFOV)
    end

    for slot, k in pairs(self.Attachments) do
        if !k.Installed then continue end

        local attach = ArcCW.AttachmentTable[k.Installed]

        if self:GetBuff_Stat("Laser", slot) then
            local color = self:GetBuff_Stat("LaserColor", slot) or attach.ColorOptionsTable[k.ColorOptionIndex or 1]

            if world then
                if !k.WElement then continue end
                self:DrawLaser(attach, k.WElement.Model, color, true)
            else
                if !k.VElement then continue end
                self:DrawLaser(attach, k.VElement.Model, color)
            end
        end
    end

    if self.Lasers then
        if world then
            for _, k in pairs(self.Lasers) do
                self:DrawLaser(k, self.WMModel or self, k.LaserColor, true)
            end
        else
            -- cam.Start3D(nil, nil, self.ViewmodelFOV)
            for _, k in pairs(self.Lasers) do
                self:DrawLaser(k, self:GetOwner():GetViewModel(), k.LaserColor)
            end
            -- cam.End3D()
        end
    end

    cam.End3D()
end

local tlOut, trOut = {}, {}

function SWEP:DrawLaser(laser, model, color, world)
    local owner = self:GetOwner()
    local behav = ArcCW.LaserBehavior

    if !owner then return end
    if !owner:IsValid() then return end

    if !model then return end

    if !model:IsValid() then return end

    local att = model:LookupAttachment(laser.LaserBone or "laser")

    att = att == 0 and model:LookupAttachment("muzzle") or att

    local pos, ang, dir

    if att == 0 then
        pos = model:GetPos()
        ang = owner:EyeAngles()
        dir = ang:Forward()
    else
        local attdata  = model:GetAttachment(att)
        pos, ang = attdata.Pos, attdata.Ang
        dir      = -ang:Right()
    end

    if world then
        dir = owner:IsNPC() and (-ang:Right()) or dir
    else
        ang:RotateAroundAxis(ang:Up(), 90)
        dir = ang:Forward()

        local eyeang   = owner:EyeAngles() - self:GetOurViewPunchAngles()
        local canlaser = self:GetCurrentFiremode().Mode != 0 and !self:GetReloading() and self:BarrelHitWall() <= 0

        delta = Lerp(0, delta, canlaser and self:GetSightDelta() or 1)

        if self.GuaranteeLaser then delta = 1 end

        dir = Lerp(delta, eyeang:Forward(), dir)
    end

    local beamdir, tracepos = dir, pos

    beamdir = world and (-ang:Right()) or beamdir

    if behav and !world then
        -- local cheap = GetConVar("arccw_cheapscopes"):GetBool()
        local punch = self:GetOurViewPunchAngles()

        ang = owner:EyeAngles() - punch

        tracepos = EyePos()
        tracepos[3] = tracepos[3] - 1
        pos, dir = tracepos, ang:Forward()
        beamdir  = dir
    end

    local dist = 128

    dir:Mul(33000)

    local v2 = lazy.GetSet("laservec", Vector)
    v2:Set(tracepos)
    v2:Add(dir)

    local tl = {}
    tl.start  = tracepos
    tl.endpos = v2
    tl.filter = owner
    tl.output = tlOut

    local tr = util.TraceLine(tl)

    tl.endpos = tracepos + (beamdir * dist)
    tl.output = trOut

    local btr = util.TraceLine(tl)

    local hit    = tr.Hit
    local hitpos = tr.HitPos
    local solid  = tr.StartSolid

    local strength = laser.LaserStrength or 1
    local laserpos = solid and tr.StartPos or hitpos

    laserpos:Sub(EyeVector())

    if solid then return end

    local width = m_rand(0.05, 0.1) * strength

    if (!behav or world) and hit then
        SetMat(lasermat)
        DrawBeam(pos, btr.HitPos, width, 1, 0, color)
    end

    if hit and !tr.HitSky then
        local mul = 1 * strength
        mul = m_log10((hitpos - EyePos()):Length()) * strength
        local rad = m_rand(4, 6) * mul
        local glr = rad * m_rand(0.2, 0.3)

        SetMat(flaremat)

        if !world then
            cam.IgnoreZ(true)
        end
        DrawSprite(laserpos, rad, rad, color)
        DrawSprite(laserpos, glr, glr, color_white)

        if !world then
            cam.IgnoreZ(false)
        end
    end
end