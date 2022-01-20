function SWEP:AdjustMouseSensitivity()
	if self:GetState() != ArcCW.STATE_SIGHTS then return end

	local threshold = GetConVar("arccw_adjustsensthreshold"):GetFloat()

	local irons = self:GetActiveSights() or {}

	local tmag = ((irons.Magnification or 1) + (irons.ScopeMagnification or 0))

	if tmag < threshold then return end

	return 1 / tmag
end

function SWEP:Scroll(var)
	local irons = self:GetActiveSights()

	if irons.ScrollFunc == ArcCW.SCROLL_ZOOM then
		if !irons.ScopeMagnificationMin then return end
		if !irons.ScopeMagnificationMax then return end

		local old = irons.ScopeMagnification

		local minus = var < 0

		var = math.abs(irons.ScopeMagnificationMax - irons.ScopeMagnificationMin)

		var = var / (irons.ZoomLevels or 5)

		if minus then
			var = var * -1
		end

		irons.ScopeMagnification = irons.ScopeMagnification - var

		irons.ScopeMagnification = math.Clamp(irons.ScopeMagnification, irons.ScopeMagnificationMin, irons.ScopeMagnificationMax)

		self.SightMagnifications[irons.Slot or 0] = irons.ScopeMagnification

		if old != irons.ScopeMagnification then
			self:MyEmitSound(irons.ZoomSound or "", 75, math.Rand(95, 105), 1, CHAN_ITEM)
		end

		-- if !irons.MinZoom then return end
		-- if !irons.MaxZoom then return end

		-- local old = irons.Magnification

		-- irons.Magnification = irons.Magnification - var

		-- irons.Magnification = math.Clamp(irons.Magnification, irons.MinZoom, irons.MaxZoom)

		-- if old != irons.Magnification then
		--     self:MyEmitSound(irons.ZoomSound or "", 75, 100, 1, CHAN_ITEM)
		-- end
	end

end

SWEP.ViewPunchAngle = Angle(0, 0, 0)
SWEP.ViewPunchVelocity = Angle(0, 0, 0)

function SWEP:OurViewPunch(angle)
	self.ViewPunchVelocity:Add(angle)

	local ang = self.ViewPunchVelocity

	ang[1] = math.Clamp(ang[1], -89, 89)
	ang[2] = math.Clamp(ang[2], -180, 180)
	ang[3] = math.Clamp(ang[3], -180, 180)
end

local ang = Angle()

function SWEP:GetOurViewPunchAngles()
	ang:Set(self.ViewPunchAngle)
	ang:Mul(10)
	ang:Add(self:GetOwner():GetViewPunchAngles())
	return ang
end

local function lensqr(ang)
	return (ang[1] ^ 2) + (ang[2] ^ 2) + (ang[3] ^ 2)
end

-- scraped from source SDK 2013, just like this viewpunch damping code
local PUNCH_DAMPING = 9
local PUNCH_SPRING_CONSTANT = 120

local tempAng = Angle()

function SWEP:DoOurViewPunch()
	-- if ( player->m_Local.m_vecPunchAngle->LengthSqr() > 0.001 || player->m_Local.m_vecPunchAngleVel->LengthSqr() > 0.001 )

	local vpa = self.ViewPunchAngle
	local vpv = self.ViewPunchVelocity
	local ft = FrameTime() * 3

	if lensqr(vpa) + lensqr(vpv) > 0.000001 then
		-- {
		--     player->m_Local.m_vecPunchAngle += player->m_Local.m_vecPunchAngleVel * gpGlobals->frametime;
		--     float damping = 1 - (PUNCH_DAMPING * gpGlobals->frametime);

		tempAng:Set(vpv)
		local ft = FrameTime()

		tempAng:Mul(ft)
		vpa:Add(tempAng)
		local damping = 1 - (PUNCH_DAMPING * ft)

		--     if ( damping < 0 )
		--     {
		--         damping = 0;
		--     }

		if damping < 0 then damping = 0 end

		--     player->m_Local.m_vecPunchAngleVel *= damping;

		vpv:Mul(damping)

		--     // torsional spring
		--     // UNDONE: Per-axis spring constant?
		--     float springForceMagnitude = PUNCH_SPRING_CONSTANT * gpGlobals->frametime;
		local springforcemagnitude = PUNCH_SPRING_CONSTANT * ft
		--     springForceMagnitude = clamp(springForceMagnitude, 0.f, 2.f );
		springforcemagnitude = math.Clamp(springforcemagnitude, 0, 2)
		--     player->m_Local.m_vecPunchAngleVel -= player->m_Local.m_vecPunchAngle * springForceMagnitude;

		tempAng:Set(vpa)
		tempAng:Mul(springforcemagnitude)
		vpv:Sub(tempAng)

		--     // don't wrap around
		--     player->m_Local.m_vecPunchAngle.Init( 
		--         clamp(player->m_Local.m_vecPunchAngle->x, -89.f, 89.f ), 
		--         clamp(player->m_Local.m_vecPunchAngle->y, -179.f, 179.f ),
		--         clamp(player->m_Local.m_vecPunchAngle->z, -89.f, 89.f ) );
		-- }

		vpa[1] = math.Clamp(vpa[1], -89.9, 89.9)
		vpa[2] = math.Clamp(vpa[2], -179.9, 179.9)
		vpa[3] = math.Clamp(vpa[3], -89.9, 89.9)

		self.ViewPunchAngle = vpa
		self.ViewPunchVelocity = vpv
	else
		self.ViewPunchAngle:Zero()
		self.ViewPunchVelocity:Zero()
	end
end


-- viewbob during reload and firing shake
SWEP.ProceduralViewOffset = Angle(0, 0, 0)
local procedural_spdlimit = 5

local oldangtmp = Angle()
local oldpostmp = Vector()

local mzang_fixed,mzang_fixed_last
local mzang_velocity = Angle()
local progress = 0
local targint,targbool

function SWEP:CoolView(ply, pos, ang, fov)
	if !ang then return end
	if ply != LocalPlayer() then return end
	if ply:ShouldDrawLocalPlayer() then return end
	local vm = ply:GetViewModel()
	if !IsValid(vm) then return end
	local ftv = FrameTime()

	local att = self:GetBuff_Override("Override_CamAttachment") or self.CamAttachment

	if att and (!game.SinglePlayer() or SERVER) then
		local attang = vm:GetAttachment(att).Ang

		attang = vm:WorldToLocalAngles(attang)
		ang:Add(attang)
		ang:Sub(self.Cam_Offset_Ang)
		return
	end

	local viewbobintensity = self.ProceduralViewBobIntensity or 0.3

	if viewbobintensity == 0 then return end

	oldpostmp:Set(pos)
	oldangtmp:Set(ang)

	targbool = self:GetNextPrimaryFire() - .1 > CurTime()
	targint = targbool and 1 or 0
	targint = math.min(targint, 1 - math.pow( vm:GetCycle(), 2 ) )
	progress = Lerp(ftv * 15, progress, targint)

	local angpos = vm:GetAttachment(self.ProceduralViewBobAttachment or self.MuzzleEffectAttachment or 1)

	if !angpos or !self:GetReloading() then
		return
	end

	mzang_fixed = vm:WorldToLocalAngles(angpos.Ang)
	mzang_fixed:Normalize()

	self.ProceduralViewOffset:Normalize()

	if mzang_fixed_last then
		local delta = mzang_fixed - mzang_fixed_last
		delta:Normalize()
		delta:Mul(2)
		mzang_velocity:Add(delta)

		mzang_velocity.p = math.Approach(mzang_velocity.p, -self.ProceduralViewOffset.p * 2, ftv * 20)
		mzang_velocity.p = math.Clamp(mzang_velocity.p, -procedural_spdlimit, procedural_spdlimit)
		self.ProceduralViewOffset.p = self.ProceduralViewOffset.p + mzang_velocity.p * ftv
		self.ProceduralViewOffset.p = math.Clamp(self.ProceduralViewOffset.p, -90, 90)
		mzang_velocity.y = math.Approach(mzang_velocity.y, -self.ProceduralViewOffset.y * 2, ftv * 20)
		mzang_velocity.y = math.Clamp(mzang_velocity.y, -procedural_spdlimit, procedural_spdlimit)
		self.ProceduralViewOffset.y = self.ProceduralViewOffset.y + mzang_velocity.y * ftv
		self.ProceduralViewOffset.y = math.Clamp(self.ProceduralViewOffset.y, -90, 90)
		mzang_velocity.r = math.Approach(mzang_velocity.r, -self.ProceduralViewOffset.r * 2, ftv * 20)
		mzang_velocity.r = math.Clamp(mzang_velocity.r, -procedural_spdlimit, procedural_spdlimit)
		self.ProceduralViewOffset.r = self.ProceduralViewOffset.r + mzang_velocity.r * ftv
		self.ProceduralViewOffset.r = math.Clamp(self.ProceduralViewOffset.r, -90, 90)
	end

	self.ProceduralViewOffset.p = math.Approach(self.ProceduralViewOffset.p, 0, (1 - progress) * ftv * -self.ProceduralViewOffset.p)
	self.ProceduralViewOffset.y = math.Approach(self.ProceduralViewOffset.y, 0, (1 - progress) * ftv * -self.ProceduralViewOffset.y)
	self.ProceduralViewOffset.r = math.Approach(self.ProceduralViewOffset.r, 0, (1 - progress) * ftv * -self.ProceduralViewOffset.r)
	mzang_fixed_last = mzang_fixed
	local ints = 3 * GetConVar("arccw_vm_coolview_mult"):GetFloat() * -viewbobintensity
	ang:RotateAroundAxis(ang:Right(), Lerp(progress, 0, -self.ProceduralViewOffset.p) * ints)
	ang:RotateAroundAxis(ang:Up(), Lerp(progress, 0, self.ProceduralViewOffset.y / 2) * ints)
	ang:RotateAroundAxis(ang:Forward(), Lerp(progress, 0, self.ProceduralViewOffset.r / 3) * ints)

	ang = LerpAngle(0, ang, oldangtmp)
end

local tempAng = Angle()

local angRand = function(ang)
	ang:SetUnpacked(
		math.Rand( -90, 90 ),
		math.Rand( -180, 180 ),
		math.Rand( -180, 180 )
	)
end

function SWEP:CalcView(ply, pos, ang, fov)
	if !CLIENT then return end

	if GetConVar("arccw_vm_coolview"):GetBool() then
		self:CoolView(ply, pos, ang, fov)
	end

	if GetConVar("arccw_shake"):GetBool() then
		angRand(tempAng)
		tempAng:Mul(self.RecoilAmount * 0.008)

		ang:Add(tempAng)
	end

	tempAng:Set(self.ViewPunchAngle)
	tempAng:Mul(10)

	ang:Add(tempAng)

	return pos, ang, fov
end

function SWEP:ShouldGlint()
	return self:GetBuff_Override("ScopeGlint") and self:GetState() == ArcCW.STATE_SIGHTS
end

function SWEP:DoScopeGlint()
end