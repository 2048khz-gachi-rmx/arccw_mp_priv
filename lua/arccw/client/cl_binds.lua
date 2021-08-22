ArcCW.KEY_FIREMODE        = "+zoom"
ArcCW.KEY_FIREMODE_ALT    = "arccw_firemode"
ArcCW.KEY_ZOOMIN          = "invnext"
ArcCW.KEY_ZOOMIN_ALT      = "arccw_zoom_in"
ArcCW.KEY_ZOOMOUT         = "invprev"
ArcCW.KEY_ZOOMOUT_ALT     = "arccw_zoom_out"
ArcCW.KEY_TOGGLEINV       = "+menu_context"
ArcCW.KEY_TOGGLEINV_ALT   = "arccw_toggle_inv"
ArcCW.KEY_SWITCHSCOPE     = "+use"
ArcCW.KEY_SWITCHSCOPE_ALT = "arccw_switch_scope"
ArcCW.KEY_TOGGLEUBGL      = "arccw_toggle_ubgl"
ArcCW.KEY_TOGGLEATT       = "arccw_toggle_att"
ArcCW.KEY_MELEE           = "arccw_melee"

ArcCW.BindToEffect = {
    [ArcCW.KEY_FIREMODE]    = "firemode",
    [ArcCW.KEY_ZOOMIN]      = "zoomin",
    [ArcCW.KEY_ZOOMOUT]     = "zoomout",
    [ArcCW.KEY_TOGGLEINV]   = "inv",
    [ArcCW.KEY_SWITCHSCOPE] = "switchscope_dtap",
}

ArcCW.BindToEffect_Unique = {
    [ArcCW.KEY_TOGGLEUBGL]      = "ubgl",
    [ArcCW.KEY_SWITCHSCOPE_ALT] = "switchscope",
    [ArcCW.KEY_FIREMODE_ALT]    = "firemode",
    [ArcCW.KEY_ZOOMIN_ALT]      = "zoomin",
    [ArcCW.KEY_ZOOMOUT_ALT]     = "zoomout",
    [ArcCW.KEY_TOGGLEINV_ALT]   = "inv",
    [ArcCW.KEY_TOGGLEATT]       = "toggleatt",
    [ArcCW.KEY_MELEE]           = "melee",
}


function ArcCW:GetBind(bind)
    local button = input.LookupBinding(bind)

    return button == "no value" and bind .. " unbound" or button
end

local function ArcCW_TranslateBindToEffect(bind)
    local alt = GetConVar("arccw_altbindsonly"):GetBool()
    if alt then
        return ArcCW.BindToEffect_Unique[bind], true
    else
        return ArcCW.BindToEffect_Unique[bind] or ArcCW.BindToEffect[bind] or bind, ArcCW.BindToEffect_Unique[bind] != nil
    end
end

local function SendNet(string, bool)
    net.Start(string, true)
        if bool != nil then net.WriteBool(bool) end
    net.SendToServer()
end

ArcCW.CMD_NeedSend = 0
ArcCW.CMD_NeedSendTick = 0

local function WritePredictedBit(num)
    ArcCW.CMD_NeedSend = bit.bor(ArcCW.CMD_NeedSend, num)
    ArcCW.CMD_NeedSendTick = LocalPlayer():GetCurrentCommand():TickCount()
end

local function DoUbgl(wep)
    if wep:GetInUBGL() then
        SendNet("arccw_ubgl", false)

        wep:DeselectUBGL()
    else
        SendNet("arccw_ubgl", true)

        wep:SelectUBGL()
    end
end

local debounce = 0
local function ToggleAtts(wep)
    if debounce > UnPredictedCurTime() then return end -- ugly hack for double trigger
    debounce = UnPredictedCurTime() + 0.1
    local used = false
    for k, v in pairs(wep.Attachments) do
        local atttbl = v.Installed and ArcCW.AttachmentTable[v.Installed]
        if atttbl and atttbl.ToggleStats then
            used = true
            wep:ToggleSlot(k, nil, true)
        end
    end
    if used then
        EmitSound("weapons/arccw/firemode.wav", EyePos(), -2, CHAN_ITEM, 1,75, 0, math.random(90, 110))
    end
end

local lastpressZ = 0
local lastpressZCMD = 0

local lastpressE = 0
local lastpressECMD = 0

local function processBind(ply, bind, cmdnum)
    if !(ply:IsValid()) then return end

    local pred = not IsFirstTimePredicted()
    local wep = ply:GetActiveWeapon()

    if !wep.ArcCW then return end

    local block = false

    local _, alt = ArcCW_TranslateBindToEffect(bind)

    if bind == "firemode" and (alt or !GetConVar("arccw_altfcgkey"):GetBool()) and !ply:KeyDown(IN_USE) then
        if wep:GetBuff_Override("UBGL") and !alt and !GetConVar("arccw_altubglkey"):GetBool() then
            if lastpressZ >= UnPredictedCurTime() - 0.25 and lastpressZCMD ~= cmdnum then
                DoUbgl(wep)

                lastpressZ = 0
                lastpressZCMD = 0

                timer.Remove("ArcCW_doubletapZ")
            elseif !pred then
                lastpressZ = UnPredictedCurTime()
                lastpressZCMD = cmdnum
                timer.Create("ArcCW_doubletapZ", 0.25, 1, function()
                    if !(IsValid(ply) and IsValid(wep)) then return end

                    if ply:GetActiveWeapon() != wep then return end

                    if wep:GetInUBGL() then return end

                    SendNet("arccw_firemode")

                    wep:ChangeFiremode()
                end)
            end
        else
            if not pred then
                SendNet("arccw_firemode")
            end

            wep:ChangeFiremode()
        end

        block = true
    elseif bind == "inv" and !ply:KeyDown(IN_USE) and
        GetConVar("arccw_enable_customization"):GetInt() >= 0 and not pred then
        local state = not wep:IsCustomizing()
        if not wep:CanOpenCustomize() then return end

        SendNet("arccw_togglecustomize", state)
        --WritePredictedBit(ArcCW.IN_CUSTOMIZE)
        wep:ToggleCustomizeHUD(state)

        block = true
    elseif bind == "ubgl" then
        DoUbgl(wep)
    elseif bind == "toggleatt" then
        ToggleAtts(wep)
    end

    if wep:GetState() == ArcCW.STATE_SIGHTS then

        if bind == "zoomin" and IsFirstTimePredicted() then
            wep:Scroll(1)
            block = true
        elseif bind == "zoomout" and IsFirstTimePredicted() then
            wep:Scroll(-1)
            block = true
        elseif bind == "switchscope_dtap" then
            if not pred then
                if lastpressE >= UnPredictedCurTime() - 0.25 then
                    wep:SwitchActiveSights()
                    lastpressE = 0
                else
                    lastpressE = UnPredictedCurTime()
                end
            end
        elseif bind == "switchscope" then
            wep:SwitchActiveSights()
        end
    end

    if bind == "melee" and wep:GetState() != ArcCW.STATE_SIGHTS then
        wep:Bash()
    end

    if block then return true end
end

local blockedBinds = {
    ["zoomin"] = function(wep, ply)
        if wep:GetState() == ArcCW.STATE_SIGHTS then return true end
    end,

    ["zoomout"] = function(wep, ply)
        if wep:GetState() == ArcCW.STATE_SIGHTS then return true end
    end,

    ["switchscope"] = true,
    ["ubgl"] = true,
    ["toggleatt"] = true,

    ["inv"] = function(wep, ply)
        if GetConVar("arccw_enable_customization"):GetInt() >= 0 and !ply:KeyDown(IN_USE) then
            return true
        end
    end,

    ["firemode"] = true,
}

local function shouldBlock(ply, bind, btn)
    if not ply:IsValid() then return end

    local wep = ply:GetActiveWeapon()
    if not wep.ArcCW then return end

    bind = ArcCW_TranslateBindToEffect(bind)

    local res = blockedBinds[bind]
    if not res then return end

    if isfunction(res) then
        res = res(wep, ply)
    end

    if res then return res end
end

local function ArcCW_PlayerButtonDown(ply, btn)
    if not ply:IsValid() then return end

    local wep = ply:GetActiveWeapon()
    if not wep.ArcCW then return end

    -- do actions that require prediction here
    local bind = input.LookupKeyBinding(btn)

    bind = ArcCW_TranslateBindToEffect(bind)

    local ucmd = ply:GetCurrentCommand()

    processBind(ply, bind, ucmd:CommandNumber())
end

-- run the predicted hook for proper weapon function
hook.Add("PlayerButtonDown", "ArcCW_PlayerButtonDown", ArcCW_PlayerButtonDown)

-- run the bind hook to stop binds from running when necessary
hook.Add("PlayerBindPress", "ArcCW_PreventBinds", function(ply, bind, _, key)
    if shouldBlock(ply, bind, key) then return true end
end)

hook.Add("StartCommand", "ArcCW_PredBinds", function(ply, cmd)
    if ArcCW.CMD_NeedSend > 0 then
        if cmd:TickCount() > ArcCW.CMD_NeedSendTick + 1 then -- wtf
            -- awfulness
            ArcCW.CMD_NeedSend = 0
        end

        cmd:SetButtons(bit.bor(cmd:GetButtons(), ArcCW.CMD_NeedSend))
    end
end)

-- Actually register the damned things so they can be bound
for k, v in pairs(ArcCW.BindToEffect_Unique) do
    concommand.Add(k, function(ply) ArcCW_PlayerButtonDown(ply, k, true) end, nil, v, 0)
end

-- ArcCW.CaptureKeys = {
--     KEY_G
-- }
-- ArcCW.LastInputs = {}
-- ArcCW.Inputs = {}

-- local function ArcCW_CustomInputs()
--     local inputs = {}

--     for _, i in pairs(ArcCW.CaptureKeys) do
--         -- local conv = GetConVar(i)

--         -- if !conv then continue end
--         -- if !IsValid(conv) then continue end

--         local kc = i

--         inputs[kc] = input.IsKeyDown(kc)
--     end

--     ArcCW.LastInputs = ArcCW.Inputs
--     ArcCW.Inputs = inputs

--     if ArcCW:KeyPressed(KEY_G) then
--         ArcCW:QuickNade("frag")
--     end
-- end

-- hook.Add("Think", "ArcCW_CustomInputs", ArcCW_CustomInputs)

-- function ArcCW:KeyPressed(key)
--     if !ArcCW.LastInputs[key] and ArcCW.Inputs[key] then
--         return true
--     end

--     return false
-- end