function SWEP:DoHolosight()

	-- In VRMod, we draw all holosights all the time
	if vrmod and vrmod.IsPlayerInVR(self:GetOwner()) then
		for i, asight in pairs(self.SightTable) do
			local aslot = self.Attachments[asight.Slot] or {}
			local atttbl = asight.HolosightData

			if !atttbl and aslot.Installed then
				atttbl = ArcCW.AttachmentTable[aslot.Installed]

				if !atttbl.Holosight then return end
			end

			if atttbl then
				local hsp = asight.HolosightPiece or self.HSPElement
				local hsm = asight.HolosightModel

				if !hsp and !hsm then
					self:SetupActiveSights()
					return
				end

				self:DrawHolosight(atttbl, hsm, hsp, asight)
			end
		end

		return
	end

	local asight = self:GetActiveSights()
	if !asight then return end
	local aslot = self.Attachments[asight.Slot] or {}

	local atttbl = asight.HolosightData

	if !atttbl and aslot.Installed then
		atttbl = ArcCW.AttachmentTable[aslot.Installed]

		if !atttbl.Holosight then return end
	end

	if atttbl then
		local hsp = asight.HolosightPiece or self.HSPElement
		local hsm = asight.HolosightModel

		if !hsp and !hsm then
			--self:SetupActiveSights()
			return
		end

		self:DrawHolosight(atttbl, hsm, hsp)
	end
end

function SWEP:ShouldFlatScope()
	return false -- this system was removed, but we need to keep this function
end

local rtsize = ScrH()

local rtmat = GetRenderTarget("arccw_rtmat", rtsize, rtsize, false)
local rtmat_cheap = GetRenderTarget("arccw_rtmat_cheap", ScrW(), ScrH(), false)
local rtmat_spare = GetRenderTarget("arccw_rtmat_spare", ScrW(), ScrH(), false)

-- local shadow = Material("hud/scopes/shadow.png")

local thermal = Material("models/debug/debugwhite")
local colormod = Material("pp/colour")
-- local warp = Material("models/props_c17/fisheyelens2")
local coldtime = 30

-- shamelessly robbed from Jackarunda
local function IsWHOT(ent)
	if !ent:IsValid() then return false end
	if (ent:IsWorld()) then return false end
	if (ent.Health and (ent:Health() <= 0)) then return false end
	if ent:IsOnFire() then return true end
	if ent:IsPlayer() then
		if ent.ArcticMedShots_ActiveEffects and ent.ArcticMedShots_ActiveEffects["coldblooded"] then
			return false
		end

		return true
	end
	if ent:IsNextBot() then return true end
	if (ent:IsNPC()) then
		if ent.ArcCWCLHealth and ent.ArcCWCLHealth <= 0 then return false end
		if (ent.Health and (ent:Health() > 0)) then return true end
	elseif (ent:IsRagdoll()) then
		local Time = CurTime()
		if !ent.ArcCW_ColdTime then ent.ArcCW_ColdTime = Time + coldtime end
		return ent.ArcCW_ColdTime > Time
	elseif (ent:IsVehicle()) then
		return ent:GetVelocity():Length() >= 100
	end
	return false
end

function SWEP:FormThermalImaging(tex)
	if !tex then
		tex = render.GetRenderTarget()
	end

	render.PushRenderTarget(tex)

	cam.Start3D()

	if tex then
		colormod:SetTexture("$fbtexture", tex)
	else
		colormod:SetTexture("$fbtexture", render.GetScreenEffectTexture())
	end

	local asight = self:GetActiveSights()

	local nvsc = asight.ThermalScopeColor or color_white
	local tvsc = asight.ThermalHighlightColor or color_white

	local tab = ents.GetAll()

	-- table.Add(tab, player.GetAll())
	-- table.Add(tab, ents.FindByClass("npc_*"))

	render.SetStencilEnable(true)
	render.SetStencilWriteMask(255)
	render.SetStencilTestMask(255)
	render.ClearStencil()

	local sw = ScrH()
	local sh = sw

	local sx = (ScrW() - sw) / 2
	local sy = (ScrH() - sh) / 2

	render.SetScissorRect( sx, sy, sx + sw, sy + sh, true )

	render.SetStencilReferenceValue(64)

	render.SetStencilPassOperation(STENCIL_REPLACE)
	render.SetStencilFailOperation(STENCIL_KEEP)
	render.SetStencilZFailOperation(STENCIL_KEEP)
	render.SetStencilCompareFunction(STENCIL_ALWAYS)

	for _, v in pairs(tab) do

		if !IsWHOT(v) then continue end

		local Br = 0.9
		if v.ArcCW_ColdTime then
			Br = (0.75 * v.ArcCW_ColdTime - CurTime()) / coldtime
		end

		if v:IsVehicle() then
			Br = math.Clamp(v:GetVelocity():Length() / 400, 0, 1)
		end

		if Br > 0 then

			if !asight.ThermalScopeSimple then
				render.SetBlend(0.5)
				render.SuppressEngineLighting(true)

				Br = Br * 250

				-- render.MaterialOverride(thermal)

				render.SetColorModulation(Br, Br, Br)
			end

			v:DrawModel()

		end
	end

	render.SetColorModulation(1, 1, 1)

	render.SuppressEngineLighting(false)

	render.MaterialOverride()

	render.SetBlend(1)

	render.SetStencilCompareFunction(STENCIL_EQUAL)

	if asight.ThermalScopeSimple then
		surface.SetDrawColor(Color(255, 255, 255))
		surface.DrawRect(0, 0, ScrW(), ScrH())
	end

	DrawColorModify({
		["$pp_colour_addr"] = 0,
		["$pp_colour_addg"] = 0,
		["$pp_colour_addb"] = 0,
		["$pp_colour_brightness"] = 0,
		["$pp_colour_contrast"] = 1,
		["$pp_colour_colour"] = 0,
		["$pp_colour_mulr"] = 0,
		["$pp_colour_mulg"] = 0,
		["$pp_colour_mulb"] = 0
	})

	DrawColorModify({
		["$pp_colour_addr"] = tvsc.r - 255,
		["$pp_colour_addg"] = tvsc.g - 255,
		["$pp_colour_addb"] = tvsc.b - 255,
		["$pp_colour_addr"] = 0,
		["$pp_colour_addg"] = 0,
		["$pp_colour_addb"] = 0,
		["$pp_colour_brightness"] = 0,
		["$pp_colour_contrast"] = 1,
		["$pp_colour_colour"] = 1,
		["$pp_colour_mulr"] = 0,
		["$pp_colour_mulg"] = 0,
		["$pp_colour_mulb"] = 0
	})

	if !asight.ThermalNoCC then
		render.SetStencilCompareFunction(STENCIL_NOTEQUAL)
		render.SetStencilPassOperation(STENCIL_KEEP)

		if !asight.ThermalFullColor then
			DrawColorModify({
				["$pp_colour_addr"] = 0,
				["$pp_colour_addg"] = 0,
				["$pp_colour_addb"] = 0,
				["$pp_colour_brightness"] = 0,
				["$pp_colour_contrast"] = 1,
				["$pp_colour_colour"] = 0,
				["$pp_colour_mulr"] = 0,
				["$pp_colour_mulg"] = 0,
				["$pp_colour_mulb"] = 0
			})
		end

		DrawColorModify({
			["$pp_colour_addr"] = nvsc.r - 255,
			["$pp_colour_addg"] = nvsc.g - 255,
			["$pp_colour_addb"] = nvsc.b - 255,
			-- ["$pp_colour_addr"] = 0,
			-- ["$pp_colour_addg"] = 0,
			-- ["$pp_colour_addb"] = 0,
			["$pp_colour_brightness"] = asight.Brightness or 0.1,
			["$pp_colour_contrast"] = asight.Contrast or 0.5,
			["$pp_colour_colour"] = 1,
			["$pp_colour_mulr"] = 0,
			["$pp_colour_mulg"] = 0,
			["$pp_colour_mulb"] = 0
		})
	end

	render.SetScissorRect( sx, sy, sx + sw, sy + sh, false )

	render.SetStencilEnable(false)

	colormod:SetTexture("$fbtexture", render.GetScreenEffectTexture())

	cam.End3D()

	render.PopRenderTarget()
end

local green = Color(0, 255, 0)

function SWEP:FormNightVision(tex)
	local asight = self:GetActiveSights()

	local orig = colormod:GetTexture("$fbtexture")

	colormod:SetTexture("$fbtexture", tex)

	render.PushRenderTarget(tex)

	local nvsc = asight.NVScopeColor or green

	if !asight.NVFullColor then
		DrawColorModify({
			["$pp_colour_addr"] = 0,
			["$pp_colour_addg"] = 0,
			["$pp_colour_addb"] = 0,
			["$pp_colour_brightness"] = 0,
			["$pp_colour_contrast"] = 1,
			["$pp_colour_colour"] = 0,
			["$pp_colour_mulr"] = 0,
			["$pp_colour_mulg"] = 0,
			["$pp_colour_mulb"] = 0
		})
	end

	DrawColorModify({
		["$pp_colour_addr"] = nvsc.r - 255,
		["$pp_colour_addg"] = nvsc.g - 255,
		["$pp_colour_addb"] = nvsc.b - 255,
		["$pp_colour_brightness"] = asight.Brightness or -0.05,
		["$pp_colour_contrast"] = asight.Contrast or 4,
		["$pp_colour_colour"] = 1,
		["$pp_colour_mulr"] = 0,
		["$pp_colour_mulg"] = 0,
		["$pp_colour_mulb"] = 0
	})

	render.PopRenderTarget()

	colormod:SetTexture("$fbtexture", orig)
end

local rand = 1 --math.random(0, 100000)

local function resStr()
	return ("%d_%dx%d"):format(rand, ScrW(), ScrH())
end

local rtName = "ArcCW_RT_" .. resStr()
local uid = rand

local main_rt = GetRenderTarget(rtName, 1024, 1024)
local blur_rt = GetRenderTarget(rtName .. "_blur", 1024, 1024)

local mat_BlurX = CreateMaterial("ArcCW_BlurX" .. uid, "g_blurx", {
	["$basetexture"] = rtName .. "_blur",
	["$size"] = "6",
	["$ignorez"] = "1",
	["$additive"] = "1",
})

local mat_BlurY = CreateMaterial("ArcCW_BlurY" .. uid, "g_blury", {
	["$basetexture"] = rtName .. "_blur",
	["$translucent"] = 1,
	["$size"] = "6",
	["$ignorez"] = "1",
	["$additive"] = "1",
})

local mat_main = CreateMaterial("ArcCW_Scope" .. uid, "UnlitGeneric", {
	["$basetexture"] = rtName,
	["$translucent"] = 1,
	["$ignorez"] = 1,
})


mat_BlurX:SetTexture("$basetexture", blur_rt)
mat_BlurY:SetTexture("$basetexture", blur_rt)
mat_main:SetTexture("$basetexture", main_rt)

hook.Add("OnScreenSizeChanged", "ArcCW_Resize_Scope", function()
	-- awful
	uid = resStr()

	mat_BlurX = CreateMaterial("ArcCW_BlurX" .. uid, "g_blurx", {
		["$basetexture"] = rtName .. "_blur",
		["$size"] = "6",
		["$ignorez"] = "1",
		["$additive"] = "1",
	})

	mat_BlurY = CreateMaterial("ArcCW_BlurY" .. uid, "g_blury", {
		["$basetexture"] = rtName .. "_blur",
		["$translucent"] = 1,
		["$size"] = "6",
		["$ignorez"] = "1",
		["$additive"] = "1",
	})

	mat_main = CreateMaterial("ArcCW_Scope" .. uid, "UnlitGeneric", {
		["$basetexture"] = rtName,
		["$translucent"] = 1,
		["$ignorez"] = 1,
	})
end)

local function BlurRenderTarget( rt, sizex, sizey, passes )

	mat_BlurX:SetTexture( "$basetexture", rt )
	mat_BlurY:SetTexture( "$basetexture", blur_rt )
	mat_BlurX:SetFloat( "$size", sizex )
	mat_BlurY:SetFloat( "$size", sizey )

	for i=1, passes+1 do

		render.SetRenderTarget( blur_rt )
		render.SetMaterial( mat_BlurX )
		render.DrawScreenQuad()

		render.SetRenderTarget( rt )
		render.SetMaterial( mat_BlurY )
		render.DrawScreenQuad()

	end

end

function SWEP:FormCheapScope()
	local screen = render.GetRenderTarget()

	render.CopyTexture( screen, rtmat_spare )

	render.PushRenderTarget(screen)
		cam.Start3D(EyePos(), EyeAngles(), nil, nil, nil, nil, nil, 0, nil)
		ArcCW.LaserBehavior = true
		self:DoLaser(false)
		ArcCW.LaserBehavior = false
		cam.End3D()
	render.PopRenderTarget()

	-- so, in order to avoid the fact that copying RTs doesn't transfer depth buffer data, we just take the screen texture and...
	-- redraw it to cover up the thermal scope stuff. Don't think too hard about this. You have plenty of VRAM.

	local asight = self:GetActiveSights()

	if asight.Thermal then
		self:FormThermalImaging(screen)
	end

	if asight.SpecialScopeFunction then
		asight.SpecialScopeFunction(screen)
	end

	render.CopyTexture( screen, rtmat_cheap )

	render.DrawTextureToScreen(rtmat_spare)

	render.UpdateFullScreenDepthTexture()
end

local recAng = Angle()

function SWEP:FormRTScope()
	local asight = self:GetActiveSights()

	if !asight then return end

	if !asight.MagnifiedOptic then return end

	local mag = asight.ScopeMagnification

	cam.Start3D()

	ArcCW.Overdraw = true
	ArcCW.LaserBehavior = true

	recAng[1] = self:GetAimRecoil() * -self.RecoilAimOffsetMult / mag

	local rt = {
		w = rtsize,
		h = rtsize,
		angles = LocalPlayer():EyeAngles() + recAng,
		origin = LocalPlayer():EyePos(),
		drawviewmodel = false,
		fov = self:GetOwner():GetFOV() / mag / 1.2,
	}

	rtsize = ScrH()

	if ScrH() > ScrW() then rtsize = ScrW() end

	rtmat = GetRenderTarget("arccw_rtmat", rtsize, rtsize, false)

	render.PushRenderTarget(rtmat, 0, 0, rtsize, rtsize)

	render.ClearRenderTarget(rt, color_black)

	if self:GetState() == ArcCW.STATE_SIGHTS then
		render.RenderView(rt)
		cam.Start3D(EyePos(), EyeAngles(), rt.fov, 0, 0, nil, nil, 0, nil)
			self:DoLaser(false)
		cam.End3D()
	end

	ArcCW.Overdraw = false
	ArcCW.LaserBehavior = false

	render.PopRenderTarget()

	cam.End3D()

	if asight.Thermal then
		self:FormThermalImaging(rtmat)
	end

	if asight.SpecialScopeFunction then
		asight.SpecialScopeFunction(rtmat)
	end
end

hook.Add("RenderScene", "ArcCW", function()
	if GetConVar("arccw_cheapscopes"):GetBool() then return end

	local wpn = LocalPlayer():GetActiveWeapon()

	if !wpn.ArcCW then return end

	wpn:FormRTScope()
end)


local black = Material("hud/black.png")
local defaultdot = Material("hud/scopes/dot.png")

local mtrx = Matrix()
local scvec = Vector()
local trvec = Vector()

local shkAng = Angle()
local camRecAng = Angle() -- last frame's recoil ; i hate source

SWEP.SightRecoilRatio = 1
SWEP.CamRecoilRatio = 2

function SWEP:DrawHolosight(hs, hsm, hsp, asight)
	-- holosight structure
	-- holosight model

	local ref = 32

	asight = asight or self:GetActiveSights()
	local delta = Ease(self:GetSightDelta(), 2.7)

	if asight.HolosightData then
		hs = asight.HolosightData
	end

	if self:GetState() != ArcCW.STATE_SIGHTS then return end

	if !hs then return end

	local hsc = Color(255, 255, 255)

	if hs.Colorable then
		hsc.r = GetConVar("arccw_scope_r"):GetInt()
		hsc.g = GetConVar("arccw_scope_g"):GetInt()
		hsc.b = GetConVar("arccw_scope_b"):GetInt()
	else
		hsc = hs.HolosightColor or hsc
	end

	local attid = 0

	if hsm then

		attid = hsm:LookupAttachment(asight.HolosightBone or hs.HolosightBone or "holosight")

		if attid == 0 then
			attid = hsm:LookupAttachment("holosight")
		end

	end

	local ret, pos, ang

	if attid != 0 then
		ret = hsm:GetAttachment(attid)
		pos = ret.Pos
		ang = ret.Ang
	else
		pos = EyePos()
		ang = EyeAngles()
	end

	local size = hs.HolosightSize or 1

	local hsmag = asight.ScopeMagnification or 1

	-- if asight.NightVision then

	if hsmag and hsmag > 1 and delta < 1 and asight.NVScope then
		local screen = rtmat

		if GetConVar("arccw_cheapscopes"):GetBool() then
			screen = rtmat_cheap
		end

		if asight.NVScope then
			self:FormNightVision(screen)
		end
	end

	render.UpdateScreenEffectTexture()
	render.ClearStencil()
	render.SetStencilEnable(true)
	render.SetStencilCompareFunction(STENCIL_ALWAYS)
	render.SetStencilPassOperation(STENCIL_REPLACE)
	render.SetStencilFailOperation(STENCIL_KEEP)
	render.SetStencilZFailOperation(STENCIL_REPLACE)
	render.SetStencilWriteMask(255)
	render.SetStencilTestMask(255)

	render.SetBlend(0)

		render.SetStencilReferenceValue(ref)

		ArcCW.Overdraw = true

		render.OverrideDepthEnable( true, true )

		if !hsm then
			hsp:DrawModel()
		else

			hsm:SetBodygroup(1, 0)

			if !hsp or hs.HolosightNoHSP then
				hsm:DrawModel()
			end

			-- render.MaterialOverride()

			render.SetStencilReferenceValue(0)

			hsm:SetBodygroup(1, 1)
			-- hsm:SetSubMaterial(0, "dev/no_pixel_write")
			hsm:DrawModel()
			-- hsm:SetSubMaterial()
			hsm:SetBodygroup(1, 0)

			-- local vm = self:GetOwner():GetViewModel()

			-- ArcCW.Overdraw = true
			-- vm:DrawModel()

			-- ArcCW.Overdraw = false

			render.SetStencilReferenceValue(ref)

			if hsp then
				hsp:DrawModel()
			end
		end

		-- render.MaterialOverride()

		render.OverrideDepthEnable( false, true )

		ArcCW.Overdraw = false

	render.SetBlend(1)

	render.SetStencilPassOperation(STENCIL_REPLACE)
	render.SetStencilCompareFunction(STENCIL_EQUAL)

	-- local pos = EyePos()
	-- local ang = EyeAngles()

	ang:RotateAroundAxis(ang:Forward(), -90)

	local dir = ang:Up()

	local ep = EyePos()

	local pdiff = (pos - ep):Length()
	local d = (8 + pdiff)
	d = hs.HolosightConstDist or d

	pos = LerpVector(delta, ep, pos)

	local vpA = self:GetOurViewPunchAngles()
	local eyeangs = EyeAngles() -- + vpA

	local v, h = self:GetAimRecoil(true)

	local rang = self:GetRecoilViewAng()

	eyeangs[1] = eyeangs[1] - v * self.RecoilAimOffsetMult - vpA[1]  - rang[1] * 2 -- imma be real, i have no clue why it requires *2
	eyeangs[2] = eyeangs[2] - vpA[2] * 0.5 -- follow horizontal viewpunch

	eyeangs:Normalize()

	dir = LerpVector(delta, eyeangs:Forward(), dir:GetNormalized())

	dir:Mul(d)
	pos:Add(dir)

	--fuck:Sub(rang)
	-- render.DrawSphere(pos, 4, 4, 4, color_white)
	-- debugoverlay.Cross(pos, 4, 0.02, Colors.Red)

	if hsmag and hsmag > 1 and delta < 1 then
		local screen = rtmat

		if GetConVar("arccw_cheapscopes"):GetBool() then

			screen = rtmat_cheap

			local ssmag = hsmag

			local sw = ScrW() * ssmag
			local sh = ScrH() * ssmag

			-- local sx = -(sw - ScrW()) / 2
			-- local sy = -(sh - ScrH()) / 2

			local cpos = self:GetOwner():EyePos() + ((EyeAngles() + recAng):Forward() * 2048)

			cpos:Rotate(Angle(0, -ArcCW.StrafeTilt(self), 0))

			local ts = cpos:ToScreen()

			local sx = ts.x - (sw / 2)
			local sy = ts.y - (sh / 2)

			render.SetMaterial(black)
			render.DrawScreenQuad()

			render.DrawTextureToScreenRect(screen, sx, sy, sw, sh)

		else

			local sw = ScrH()
			local sh = sw

			local sx = (ScrW() - sw) / 2
			local sy = (ScrH() - sh) / 2

			render.SetMaterial(black)
			render.DrawScreenQuad()

			render.DrawTextureToScreenRect(screen, sx, sy, sw, sh)

		end
	end

	cam.IgnoreZ( true )

	render.SetStencilReferenceValue(ref)

	cam.End3D()

	cam.Start3D()

	local a = pos:ToScreen()
	local x = math.Round(a.x)
	local y = math.Round(a.y)

	--render.SetColorMaterialIgnoreZ()
	--render.DrawSphere(pos, 2, 8, 8, color_white)

	cam.Start2D()

	if hs.HolosightBlackbox then
		render.SetStencilPassOperation(STENCIL_KEEP)

		surface.SetDrawColor(0, 0, 0, 255 * delta)
		surface.DrawRect(0, 0, ScrW(), ScrH())
	end

	render.SetStencilPassOperation(STENCIL_DECR)
	render.SetStencilCompareFunction(STENCIL_EQUAL)

	local hss = size * 48 * math.min(ScrW(), ScrH()) / 800

	render.SetStencilEnable(false)
	render.PushFilterMag(TEXFILTER.ANISOTROPIC)

		local sw, sh = ScrW(), ScrH()
		local dlt = self:GetSightDelta()
		local mvDisp, jmpdisp = self:GetBlurDispersion()

		local extend = (dlt ^ 0.7 * 0.1) + -- slight extend when zooming in
			math.max(mvDisp / 750, jmpdisp / 200 / 8) -- dispersion affects zoom
			/ hsmag -- higher magnification = less inaccuracy zoom

		local blur = math.max(mvDisp / 75, jmpdisp / 250) -- only movement dispersion affects blurryness

		render.PushRenderTarget(main_rt)
		render.Clear(0, 0, 0, 0, true)
			surface.SetMaterial(hs.HolosightReticle or defaultdot)
			surface.SetDrawColor(hsc or color_white)
			--[[surface.DrawTexturedRect(-extend * sw, -extend * sh,
				sw * (1 + extend * 2), sh * (1 + extend * 2))]]

			surface.DrawTexturedRect(0, 0, sw, sh)

			if !hs.HolosightNoFlare then
				render.SetStencilPassOperation(STENCIL_KEEP)
				render.SetStencilReferenceValue(ref - 1)
				surface.SetMaterial(hs.HolosightFlare or hs.HolosightReticle or defaultdot)
				surface.SetDrawColor(255, 255, 255, 150)

				surface.DrawTexturedRect(0, 0, sw, sh)

				render.SetStencilReferenceValue(ref)
			end

			if blur > 0 then
				BlurRenderTarget(main_rt, blur, blur, 1)
			end
		render.PopRenderTarget(main_rt)

	render.SetStencilEnable(true)

	surface.SetMaterial(mat_main)

	--surface.SetMaterial(hs.HolosightReticle or defaultdot)
	--hss = hss * (1 + extend)

	trvec[1], trvec[2] = x, y
	scvec[1], scvec[2] = 1 + extend, 1 + extend

	mtrx:Identity()
	mtrx:Translate(trvec)
		mtrx:SetScale(scvec)
		--mtrx:RotateNumber(0, -self:GetRecoilTilt(), 0)
	mtrx:Translate(-trvec)

	surface.SetDrawColor(255, 255, 255)

	cam.PushModelMatrix(mtrx, true)
		surface.DrawTexturedRect(
			math.ceil(x - (hss / 2)),
			math.ceil(y - (hss / 2)),
			hss,
			hss)
	cam.PopModelMatrix()

	render.PopFilterMag()


	if hs.HolosightBlackbox then
		-- render.SetColorMaterialIgnoreZ()
		-- render.DrawScreenQuad()

		surface.SetDrawColor(0, 0, 0)
		surface.DrawRect(0, 0, ScrW(), ScrH())
		-- surface.DrawRect(0, (ScrH() - hss) / 2, ScrW(), (ScrH() - hss) / 2)
	end

	cam.End2D()
	cam.End3D()
	self:StartVM3D()
	render.SetStencilEnable( false )

	cam.IgnoreZ( false )

	-- cam.End3D()

	if hsp then

		cam.IgnoreZ(true)

		if GetConVar("arccw_glare"):GetBool() then
			render.SetBlend(delta + 0.1)
		else
			render.SetBlend(delta)
		end
		hsp:DrawModel()
		render.SetBlend(1)

		cam.IgnoreZ( false )

	end
end