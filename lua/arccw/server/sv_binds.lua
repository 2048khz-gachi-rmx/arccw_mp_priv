-- the accursed predicted binds

local function extractEnum(ply, cmd)
	local btns = cmd:GetButtons()
	local data = bit.band(btns, bit.bor(ArcCW.IN_CUSTOMIZE, ArcCW.IN_WHAT))
	--svprint("Sv buttons", cmd:GetButtons())

	if data ~= 0 then
		return data
	end
end

hook.Add("StartCommand", "ArcCW_ReadBinds", function(ply, cmd)
	local enums = extractEnum(ply, cmd)
	if not enums then return end

	local cust = bit.band(enums, ArcCW.IN_CUSTOMIZE) > 0
	local what = bit.band(enums, ArcCW.IN_WHAT) > 0

	local wpn = ply:GetActiveWeapon()
	if !wpn.ArcCW then return end

	wpn:ToggleCustomizeHUD(wpn:GetState() ~= ArcCW.STATE_CUSTOMIZE)
end)