local enabled = GetConVar("arccw_enable_sway")
local mult = GetConVar("arccw_mult_sway")
local off = math.pi * 1.25

ArcCW.SwayDir = 0

function ArcCW.Sway(cmd)
    if not enabled then return end

    local ply = LocalPlayer()
    local wpn = ply:GetActiveWeapon()

    if not wpn.ArcCW then return end

    local ang = cmd:GetViewAngles()

    if (wpn.Sighted or wpn:GetState() == ArcCW.STATE_SIGHTS) and not wpn.NoSway then

        local sway = mult:GetFloat() * wpn:GetBuff("Sway")
        --sway = sway * math.Clamp(1 / (wpn:GetActiveSights().ScopeMagnification or 1), 0.1, 1)
        if wpn:InBipod() then
            sway = sway * ((wpn.BipodDispersion or 1) * wpn:GetBuff_Mult("Mult_BipodDispersion") or 0.1)
        end
        if sway > 0.05 then
			local mult = FrameTime() * sway
            local UCT = UnPredictedCurTime()

            ang.p = math.Clamp(ang.p + (.5 * math.sin(0 + UCT * 1.25)) * mult, -89, 89)
            ang.y = ang.y + (.5 * math.cos(off + UCT * 0.625)) * mult

            cmd:SetViewAngles(ang)
        end
    end
end

hook.Add("CreateMove", "ArcCW_Sway", ArcCW.Sway)
