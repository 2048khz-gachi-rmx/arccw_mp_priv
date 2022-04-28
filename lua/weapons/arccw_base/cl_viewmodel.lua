local mth      = math
local m_sin    = mth.sin
local m_cos    = mth.cos
local m_min    = mth.min
local m_appor  = mth.Approach
local m_clamp  = mth.Clamp
local m_angdif = mth.AngleDifference
local f_lerp   = Lerp
local srf      = surface

local dirVec = Vector()

SWEP.ActualVMData = false

local eyeangles, lasteyeangles, coolswayang = Angle(), Angle(), Angle()
local swayxmult, swayymult, swayzmult, swayspeed = 1, 1, 1, 1
local swayangx_lerp, swayangy_lerp, swayangz_lerp = 0, 0, 0

local lookxmult, lookymult = 1, 1
SWEP.VMPos = Vector()
SWEP.VMAng = Angle()
SWEP.VMPosOffset = Vector()
SWEP.VMAngOffset = Angle()

SWEP.VMPosOffset_Lerp = Vector()
SWEP.VMAngOffset_Lerp = Angle()

SWEP.VMLookLerp = 0

SWEP.StepBob = 0
SWEP.StepBobLerp = 0
SWEP.StepRandomX = 1
SWEP.StepRandomY = 1
SWEP.LastEyeAng = Angle()
SWEP.SmoothEyeAng = Angle()

SWEP.LastVelocity = Vector()
SWEP.Velocity_Lerp = Vector()
SWEP.VelocityLastDiff = 0

SWEP.Breath_Intensity = 1
SWEP.Breath_Rate = 1

SWEP._LastVMZ = 0
SWEP._LastVMY = 0
SWEP._LastVMYEase = 0

function SWEP:Move_Process(EyePos, EyeAng, velocity, loc_vel)
	local t = self:GetTable()

	local VMPos, VMAng = t.VMPos, t.VMAng
	local VMPosOffset, VMAngOffset = t.VMPosOffset, t.VMAngOffset
	local VMPosOffset_Lerp, VMAngOffset_Lerp = t.VMPosOffset_Lerp, t.VMAngOffset_Lerp
	local FT = (game.SinglePlayer() and FrameTime()) or RealFrameTime() * 0.5308

	local sightedmult = (self:GetState() == ArcCW.STATE_SIGHTS and 0.1) or 1

	local lvv = t._LastVMZ
	local lhv = t._LastVMY

	local mx_vertvel = 700
	local mx_horvel = 200

	local vvel = loc_vel.z
	local hvel = velocity.y
	local hEase = 0.7

	if IsFirstTimePredicted() then
		local apprTo = math.min(mx_horvel, math.abs(hvel)) * math.Sign(hvel)

		vvel = FPSLerp(25, lvv, vvel) --math.Approach(lvv, vvel, FrameTime() * 1500 * land_mul)
		hvel = FPSLerp(15, lhv, apprTo) --math.Approach(lhv, apprTo, FrameTime() * 500 * opposite_mul)

		-- there is a math problem here; we don't know we'll be heading to opposite until
		-- velocity flips over to the other sign, and assume we're going to 0 instead
		-- the jump between eases causes a jump in the VM too

		hEase = 0.7

		--[[if t._LastVMYEase ~= hEase then
			local linear_horFrac = t._lastHorFrac or 0
			local rev_frac = ReverseEase(linear_horFrac, hEase) -- easing this will result in linear_horFrac
			hvel = Lerp(rev_frac, 0, mx_horvel) * math.Sign(hvel)

			local hsign = hvel >= 0 and 1 or -1
		end]]

		t._LastVMYEase = hEase

		t._LastVMZ = vvel
		t._LastVMY = hvel
	else
		vvel = lvv
		hvel = lhv
		hEase = t._LastVMYEase or hEase
	end

	local vsign = vvel >= 0 and 1 or -1
	local hsign = hvel >= 0 and 1 or -1

	local linear_vertFrac = math.TimeFraction(0, mx_vertvel, math.min(math.abs(vvel), mx_vertvel))
	local linear_horFrac = math.TimeFraction(0, mx_horvel, math.abs(hvel))

	t._lastHorFrac = linear_horFrac

	local horFrac = Ease(linear_horFrac, hEase) * -hsign
	local vertFrac = Ease(linear_vertFrac, 0.3) * vsign

	local y = math.Clamp(horFrac * sightedmult, -1, 1)  -- horizontal
	local x = math.Clamp(vertFrac * sightedmult, -1, 1) -- vertical

	--VMPosOffset_Lerp.x = Lerp(8*FT, VMPosOffset_Lerp.x, x)
	--VMPosOffset_Lerp.y = Lerp(8*FT, VMPosOffset_Lerp.y, y)

	local ang_x = x * 5 -- vertical
	local ang_y = -y * 0.5 * (y < 0 and 2 or 1)-- horizontal
	local ang_z = y * 3 / sightedmult + (x * -7) -- roll

	VMAngOffset_Lerp.x = ang_x * sightedmult --LerpC(10*FT, VMAngOffset_Lerp.x, ang_x, 0.75)
	VMAngOffset_Lerp.y = ang_y * sightedmult --LerpC(5*FT, VMAngOffset_Lerp.y, ang_y, 0.6)
	VMAngOffset_Lerp.z = ang_z --Lerp(25*FT, VMAngOffset_Lerp.z, ang_z)

	local up = VMAng:ToUp(dirVec)
	up:Mul(VMPosOffset_Lerp.x + y * 0.5 * sightedmult)
	VMPos:Add(up)

	local right = VMAng:ToRight(dirVec)
	right:Mul(y * 0.5)
	VMPos:Add(right)

	VMAng:Add(VMAngOffset_Lerp)
end

-- num % math.huge == nan, lol
local stepend = 999999999 -- math.pi * 266 -- closest multiple of (2 / 0.75; 2 / 0.5; 2)
local time = 0

function SWEP:Step_Process(EyePos, EyeAng, velocity)
	if velocity:Length() == 0 then
		self.StepBob = 0
		return
	end

	local t = self:GetTable()

	local VMPos, VMAng = t.VMPos, t.VMAng
	local VMPosOffset, VMAngOffset = t.VMPosOffset, t.VMAngOffset
	local VMPosOffset_Lerp, VMAngOffset_Lerp = t.VMPosOffset_Lerp, t.VMAngOffset_Lerp

	local state = self:GetState()
	velocity = math.min(velocity:Length(), 500)
	if state == ArcCW.STATE_SPRINT then
		velocity = velocity * 1.25
	end

	--[[local FT = RealFrameTime()
	local FTMult = 0.15 * FT]]

	local ow = self:GetOwner()

	local sightedmult = (state == ArcCW.STATE_SIGHTS and 0.5) or 1
	local in_sprint = (state == ArcCW.STATE_SPRINT and t.VM_SprintCurrent) or 0

	local sprint_freqmult = in_sprint * 0.8 + 1
	local sprint_posmult = in_sprint * 0.7 + 1
	local sprint_angmult = in_sprint * 3 + 1

	local onground = ow:OnGround()
	local firstPred = IsFirstTimePredicted()

	if firstPred then
		local timeBetweenFootsteps = hook.Run("PlayerStepSoundTime",
			ow, STEPSOUNDTIME_NORMAL, ow:KeyDown(IN_WALK))

		local freq = math.pi / (timeBetweenFootsteps / 1000)

		time = time + FrameTime() * freq * sprint_freqmult
		t.StepBob = time % stepend --self.StepBob + (velocity * 0.00015 + (delta * 0.03)) * swayspeed -- * (FTMult)

		local sb = t.StepBob
		time = sb

		t.StepRandomX = 1
		t.StepRandomY = 1

		if sb >= stepend then
			t.StepBob = sb % stepend
			t.StepRandomX = 1 --math.Rand(1,1.25)
			t.StepRandomY = 1 --math.Rand(1,1.25)
		end
	end

	local sb = t.StepBob

	VMPosOffset:Zero()

	local bouncy = GetConVar("arccw_vm_bouncy"):GetBool()

	if onground then
		local xWave = math.sin(sb)
		local yWave = math.cos(sb * 0.5)
		local zWave = math.cos(sb * 0.75)

		if bouncy then
			xWave = Ease(math.abs(xWave), 0.2) * math.Sign(xWave)
			yWave = Ease(math.abs(yWave), 0.2) * math.Sign(yWave)
			zWave = Ease(math.abs(zWave), 0.2) * math.Sign(zWave)
		end

		VMPosOffset.x = xWave * (velocity * -0.0004 * sightedmult * swayxmult * sprint_posmult)
			* t.StepRandomX * (0.7 + in_sprint * -0.2)

		VMPosOffset.y = (yWave * velocity * -0.0006 * sightedmult  * swayymult)
			* t.StepRandomY * (0.6 + in_sprint * 0.5) -- horizontal

		--[[VMPosOffset.z = zWave * velocity * 0.001 * sightedmult * swayzmult
			* (0.4 + in_sprint * 0.6)]]

		VMPosOffset_Lerp:Add(VMPosOffset)

		VMAngOffset.x = VMPosOffset.x * -(0.2 + in_sprint * 1.4) * 5 -- vertical
		VMAngOffset.y = -VMPosOffset.y * 2.5 * sprint_angmult -- horizontal
		VMAngOffset.z = VMPosOffset.y * 5 * (0.8 + in_sprint * 0.4) -- tilt
	end

	--[[VMPosOffset_Lerp.x = Lerp(16*FT, VMPosOffset_Lerp.x, VMPosOffset.x)
	VMPosOffset_Lerp.y = Lerp(4*FT, VMPosOffset_Lerp.y, VMPosOffset.y)
	VMPosOffset_Lerp.z = Lerp(2*FT, VMPosOffset_Lerp.z, VMPosOffset.z)]]

	VMPos:Add(VMAng:ToUp(dirVec):CMul(VMPosOffset_Lerp.x))
	VMPos:Add(VMAng:ToRight(dirVec):CMul(VMPosOffset_Lerp.y))
	VMPos:Add(VMAng:ToForward(dirVec):CMul(VMPosOffset_Lerp.z))

	VMAng:Add(VMAngOffset)

	VMPosOffset_Lerp:Sub(VMPosOffset)
end

function SWEP:Breath_Health(owner, t)
	local health = owner:Health()
	local maxhealth = owner:GetMaxHealth()

	t.Breath_Intensity = math.Clamp( maxhealth / health, 0, 2 )
	t.Breath_Rate = math.Clamp( ((maxhealth*0.5) / health ), 1, 1.5 )
end

function SWEP:Breath_StateMult(owner, t)
	local sightedmult = (self:GetState() == ArcCW.STATE_SIGHTS and 0.05) or 1

	t.Breath_Intensity = t.Breath_Intensity * sightedmult
end

local cpy = Vector()

function SWEP:Breath_Process(EyePos, EyeAng)
	local t = self:GetTable()

	local VMPos, VMAng = t.VMPos, t.VMAng
	local VMPosOffset, VMAngOffset = t.VMPosOffset, t.VMAngOffset

	local ow = self:GetOwner()

	local ct = SysTime() -- fuck you you will breathe off system time

	self:Breath_Health(ow, t)
	self:Breath_StateMult(ow, t)

	local x = (math.sin(ct * 2 * t.Breath_Rate) * 0.1) * t.Breath_Intensity
	local y = (math.sin(ct * 2.5 * t.Breath_Rate) * 0.025) * t.Breath_Intensity

	VMAngOffset.x = x * 1.5
	VMAngOffset.y = y * 2

	local up = VMAng:ToUp(dirVec)
		up:Mul(x)

	local right = VMAng:ToRight(dirVec)
		right:Mul(y)

	VMPos:Add(up)
	VMPos:Add(right)

	VMAng:Add(VMAngOffset)
end

local angLook = Angle()
local lookDiff = Angle()

SWEP._cachedLook = Angle()
function SWEP:Look_Process(EyePos, EyeAng)
	local t = self:GetTable()
	local VMPos, VMAng = t.VMPos, t.VMAng
	local firstPred = IsFirstTimePredicted()

	--[[if not firstPred then
		VMAng:Add(angLook)
		return
	end]]

	local FT = FrameTime()
	local sightedmult = (self:GetState() == ArcCW.STATE_SIGHTS and 0.1) or 1

	if firstPred then
		lookDiff:Set(EyeAng)
		lookDiff:Sub(t.LastEyeAng)
		local ft = math.min(1 - math.exp(-50 * FT), 1)
		t.SmoothEyeAng = LerpAngle(ft, t.SmoothEyeAng, lookDiff)
	end

	-- x is actually vertical and y is horizontal
	local x = t.SmoothEyeAng.x * sightedmult * lookxmult * 0.5
	local y = t.SmoothEyeAng.y * 0.5 * sightedmult * lookymult

	local vmang_y = y * 1.25
	angLook:SetUnpacked(x * 2.5, vmang_y, y * 2)

	if firstPred then
		t.VMLookLerp = FPSLerp(20, t.VMLookLerp, vmang_y * 1.5 + t.SmoothEyeAng.y)
	end

	--VMAng.y = VMAng.y - t.VMLookLerp

	local up = VMAng:ToUp(dirVec)
		up:Mul(x)
		VMPos:Add(up)

	local r = VMAng:ToRight(dirVec)
		r:Mul(y)
		VMPos:Add(r)

	angLook.y = angLook.y - t.VMLookLerp

	if IsFirstTimePredicted() then
		t.SwayAngle:Set(angLook)
	end

	VMAng:Add(angLook)
end

local velCpy = Vector()
local angCpy = Angle()

local offDlt = Vector()

-- defaults
SWEP.VMOffset = offDlt
SWEP.SwayAngle = Angle()

function SWEP:GetVMPosition(EyePos, EyeAng)
	local velocity = self:GetOwner():GetVelocity()
	angCpy:Set(EyeAng) angCpy:Mul(-1)

	velCpy:Set(velocity) velCpy:Rotate(angCpy)

	local t = self:GetTable()

	t.VMPos:Set(EyePos)
	if IsFirstTimePredicted() then
		offDlt:Set(EyePos)
	end
	t.VMAng:Set(EyeAng)

	self:Move_Process(EyePos, EyeAng, velCpy, velocity)
	self:Step_Process(EyePos, EyeAng, velCpy, velocity)
	self:Breath_Process(EyePos, EyeAng)
	self:Look_Process(EyePos, EyeAng)
	EyeAng:Add(t.VMAngOffset)

	t.LastEyeAng:Set(EyeAng)
	t.LastVelocity:Set(velCpy)

	
	if IsFirstTimePredicted() then
		offDlt:Sub(t.VMPos)
		t.VMOffset = offDlt
	end

	return t.VMPos, t.VMAng
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

local function easeOutCubic(x)
	return 1 - (1 - x) ^ 3
end

-- touch:

-- if true, this will use SightTime for determining recovery speeds
-- otherwise this will use static times

SWEP.VM_UseSightTimeHandling = true

if SWEP.VM_UseSightTimeHandling then
	-- SightTime mults for determining times
	SWEP.VM_CrouchIn = 0.75
	SWEP.VM_CrouchOut = 2
	SWEP.VM_SprintRecovery = 1.3
else
	-- static times
	SWEP.VM_CrouchIn = 0.25
	SWEP.VM_CrouchOut = 0.4
	SWEP.VM_SprintRecovery = 0.5
end

-- don't touch:
SWEP.VM_BarrelWallFrac = 0

SWEP.VM_LastBarrelHit = 0

SWEP.VM_LastBarrelRecoverFrom = 0
SWEP.VM_LastBarrelRecover = 0
SWEP.VM_MaxBarrelFrac = 0

SWEP.VM_CrouchFrac = 0
SWEP.VM_CrouchTime = 0
SWEP.VM_UncrouchTime = -1


SWEP.VM_SprintChange = 0    -- when the sprint state changes, this will be set to VM_SprintCurrent
SWEP.VM_SprintCurrent = 0	-- this is set every frame to the current sprint frac

SWEP.VM_CustChange = 0
SWEP.VM_CustCurrent = 0

-- analogous
SWEP.VM_SightsChange = 0
SWEP.VM_SightsCurrent = 0

local sharedVector = Vector()
local sharedVector2 = Vector()

local sharedEVVector = Vector()
local sharedEVAng = Angle()

local sharedAngle = Angle()
local sharedAngle2 = Angle()

--local b = bench("pp", 1000)

local function calcCrouchFrac(t, UCT, sightTime, timeMul, out)
	local tdelta = 0
	local tmax = 0

	if out then
		local uncrotchTime = t.VM_UncrouchTime
		tdelta = UCT - uncrotchTime
		tmax = (t.VM_UseSightTimeHandling and t.VM_CrouchOut * sightTime) or t.VM_CrouchOut
	else
		local crotchTime = t.VM_CrouchTime -- lul
		tdelta = UCT - crotchTime
		tmax = (t.VM_UseSightTimeHandling and t.VM_CrouchIn * sightTime) or t.VM_CrouchIn
	end

	local crouchFrac = easeOut( math.min( tdelta / (tmax * timeMul), 1 ) )
	return crouchFrac
end


local function calculateSwitchableFrac(from, to, delta, maxdelta)
	local frac = math.min(delta / maxdelta, 1)
	local needAdd = math.max(from, to) - math.min(from, to)
	local add = math.ease.OutQuint(frac) * needAdd

	local sign = (from < to and 1) or -1

	return math[from < to and "min" or "max"] (from + add * sign, to)
end

function SWEP:CalcSwitchableFrac(from, to, delta, max)
	return calculateSwitchableFrac(from, to, delta, max)
end

local recoilAng = Angle()

function SWEP:GetRecoilTilt()
	local max = self:GetMaxRecoil()
	local bound = math.min(1.5, max)
	local fr = math.Remap(self:GetRecoil(), max, 0, bound, 0)

	if fr ~= fr then fr = 0 end -- nan

	return fr * self.PunchDir
end

local function recoilMethod(self)
	local ver, hor = self:GetAimRecoil(true)

	recoilAng[1] = ver --(1 - Ease(fr, 0.6)) * max
	recoilAng[3] = self:GetRecoilTilt()

	return recoilAng -- self:GetOurViewPunchAngles()
end

local b = bench("vm_calc", 600)
local oldpos, oldang = Vector(), Angle()

local tempVec = Vector()
local tempAng = Angle()

local target = {}

function SWEP:CalculateVMPos(pos, ang)
	GCMark("acw vm calc")
	local CT = CurTime()
	local UCT = UnPredictedCurTime()

	local owner = self:GetOwner()
	local t = self:GetTable()

	if !owner or !owner:IsValid() or !owner:Alive() then
		-- b:Close():print()
		return
	end

	local FT = FrameTime()
	local firstpred = IsFirstTimePredicted()

	local gunbone, gbslot = self:GetBuff_Override("LHIK_GunDriver")

	-- local asight = self:GetActiveSights()

	local state  = self:GetState()
	local sightTime = self:GetSightTime()
	local sgtd = self:GetSightDelta()


	oldpos:Set(pos)
	oldang:Set(ang)

	actual = t.ActualVMData

	if not actual then
		actual = { pos = Vector(), ang = Angle(), down = 1, sway = 1, bob = 1, evpos = Vector(), evang = Angle() }
	end

	t.ActualVMData = actual

	target.pos  = sharedVector
	target.pos:Set(self:GetBuff_Override("Override_ActivePos") or self.ActivePos)

	target.ang  = sharedAngle
	target.ang:Set(self:GetBuff_Override("Override_ActiveAng") or self.ActiveAng)

	target.down = 1
	target.sway = 2
	target.bob  = 2

	if self:GetReloading() then
		if self:GetBuff_Override("Override_ReloadPos") or t.ReloadPos then target.pos = t.ReloadPos end
		if self:GetBuff_Override("Override_ReloadAng") or t.ReloadAng then target.ang = t.ReloadAng end
	end

	local vm_right   = GetConVar("arccw_vm_right"):GetFloat()
	local vm_up      = GetConVar("arccw_vm_up"):GetFloat()
	local vm_forward = GetConVar("arccw_vm_forward"):GetFloat()
	local vm_fov     = GetConVar("arccw_vm_fov"):GetFloat()

	local crouching = owner:Crouching() or owner:KeyDown(IN_DUCK)
	local crotchTime = t.VM_CrouchTime -- lul
	local uncrotchTime = t.VM_UncrouchTime

	--[[
		This is ugly, holy fuck

		Quick logic rundown:
			* If uncrotchTime is -1, don't even calculate uncrouch frac

			*   If we're crouched and this is our first predicted frame in which we are crouched:
					* Store when we crouched
					* Store how far our VM was already gone to crouch (in the event of repeated crouches)
						- We do this by simulating logic from the other state's `crouchFrac` calculation
						- Thank god we only need to do it once
					* Set uncrotchTime to 0 so we'll start listening for uncrouching

			*   If we're uncrouched and this is our first predicted frame in which we are uncrouched:
					* Store when we crouched
					* Store how far our VM was already gone to crouch (same principle)

			*   When calculating this frame's crouch fraction, we pass how far we've gone in into the calcCrouchFrac
				function as a time multiplier; so if we've only uncrouched to 70% crouch fraction and then crouched again,
				then it'll only take us 30% of the time to crouch back

			*   If we're uncrouched and crouchFrac reached 0, that means we've uncrouched completely and we
				don't need to recalculate crouchFrac every frame until we crouch again, so if we set uncrotchTime to -1
				then it won't recalculate until next crouch even
	]]

	if not crouching and uncrotchTime ~= -1 then
		if firstpred and uncrotchTime == 0 then
			-- calc crouch frac from which we'll start
			t.VM_CrouchFrac = calcCrouchFrac(t, UCT, sightTime, 1 - t.VM_CrouchFrac, false) * (1 - t.VM_CrouchFrac) + t.VM_CrouchFrac
			t.VM_UncrouchTime = UCT
			uncrotchTime = UCT
		end


		local crouchFrac = (1 - calcCrouchFrac(t, UCT, sightTime, t.VM_CrouchFrac, true)) * t.VM_CrouchFrac

		target.down = Lerp(crouchFrac, target.down, 0)

		if self:GetBuff("CrouchPos", true) then
			LerpSource(crouchFrac, target.pos, t.CrouchPos)
		end
		if self:GetBuff("CrouchAng", true) then
			LerpSource(crouchFrac, target.ang, t.CrouchAng)
		end

		if firstpred then
			t.VM_CrouchTime = 0
			if crouchFrac == 0 then
				t.VM_UncrouchTime = -1 -- don't listen to uncrouch anymore; we've uncrouched completely
			end
		end

	elseif crouching then

		if firstpred and crotchTime == 0 then
			t.VM_CrouchFrac = (1 - calcCrouchFrac(t, UCT, sightTime, t.VM_CrouchFrac, true)) * t.VM_CrouchFrac
			t.VM_CrouchTime = UCT
			crotchTime = UCT

			t.VM_UncrouchTime = 0 -- make us listen to the uncrouch
		end

		local crouchFrac = calcCrouchFrac(t, UCT, sightTime, 1 - t.VM_CrouchFrac, false) * (1 - t.VM_CrouchFrac) + t.VM_CrouchFrac

		target.down = Lerp(crouchFrac, target.down, 0)

		if self:GetBuff("CrouchPos", true) then
			LerpSource(crouchFrac, target.pos, t.CrouchPos)
		end
		if self:GetBuff("CrouchAng", true) then
			LerpSource(crouchFrac, target.ang, t.CrouchAng)
		end
	end

	local inBipod = self:InBipod()
	local bipodTime = 0.8
	local bipodDelta = inBipod and
							easeOut( (UCT - t.VM_EnteredBipod) / bipodTime ) or
							1 - easeOut( (UCT - t.VM_ExitedBipod) / bipodTime * 1.5 )

	if bipodDelta > 0 then
		if !t.BipodAngle then
			t.BipodPos = self:GetOwner():EyePos()
			t.BipodAngle = self:GetOwner():EyeAngles()
		end

		local BEA = owner:EyeAngles()
		BEA:Sub(t.BipodAngle)
		BEA:Mul(-1)

		local irons = self:GetActiveSights()
		local dlt = bipodDelta

		if irons.Pos then
			LerpSource(dlt, target.pos, irons.Pos)
		end
		if irons.Ang then
			LerpSource(dlt, target.ang, irons.Ang)
		end

		local r, f, u = BEA:Right(), BEA:Forward(), BEA:Up()
		local bx, by, bz = t.InBipodMult:Unpack()
		local mx, my, mz = t.InBipodPos:Unpack()

		r:Mul(mx * bx * dlt)
		f:Mul(my * by * dlt)
		u:Mul(mz * bz * dlt)

		target.pos:Add(r)
		target.pos:Add(f)
		target.pos:Add(u)

		target.sway = 0.2
	end

	addElem(target.pos, vm_right, vm_forward, vm_up)

	local inSightTime, outSightTime = t.LastEnterSightTimeUnpred, t.LastExitSightTimeUnpred

	local svSightTime = self:GetSightTimeChanged()
	local sighted   = state == ArcCW.STATE_SIGHTS or (UCT - math.max(outSightTime, svSightTime)) < sightTime

	local sightedFrac = 0
	local sightFrom = t.VM_SightsChange

	if sighted then
		local time
		local outSight = outSightTime >= inSightTime

		if svSightTime > math.max(inSightTime, outSightTime) then -- desynced; use server data
			time = svSightTime
			outSight = state ~= ArcCW.STATE_SIGHTS
		end

		if outSight then
			time = time or outSightTime
			sightedFrac = calculateSwitchableFrac(sightFrom, 0, UCT - outSightTime, sightTime)
		else
			time = time or inSightTime
			sightedFrac = calculateSwitchableFrac(sightFrom, 1, UCT - inSightTime, sightTime)
		end
	end

	t.VM_SightsCurrent = sightedFrac


	-- *2 makes no sense but works... eh?
	local recovery = self:GetSprintTime() * 2 -- (t.VM_UseSightTime and t.VM_SprintRecovery * sightTime) or t.VM_SprintRecovery
	local sprinted  = state == ArcCW.STATE_SPRINT or (UCT - t.LastExitSprintTimeUnpred) < recovery
	local sprintFrac = 0
	local sprinting = t.LastExitSprintTimeUnpred < t.LastEnterSprintTimeUnpred

	if sprinted then
		local from = t.VM_SprintChange

		if not sprinting then
			-- lerping [0 <- x <- 1]
			sprintFrac = calculateSwitchableFrac(from, 0, UCT - t.LastExitSprintTimeUnpred, recovery)
		else
			-- lerping [0 -> x -> 1]
			sprintFrac = calculateSwitchableFrac(from, 1, UCT - t.LastEnterSprintTimeUnpred, recovery / 2)
		end
	end


	t.VM_SprintCurrent = sprintFrac

	local custRecovery = 0.3
	local holstered = self:GetCurrentFiremode().Mode == 0
	local cust = self:IsCustomizing() or (UCT - t.LastExitCustomize) < custRecovery
	local custFrac = 0

	if cust then
		local from = t.VM_CustChange
		local exit = t.LastExitCustomize >= t.LastEnterCustomize

		if exit then
			-- lerping [0 <- x <- 1]
			custFrac = calculateSwitchableFrac(from, 0, UCT - t.LastExitCustomize, custRecovery)
		else
			-- lerping [0 -> x -> 1]
			custFrac = calculateSwitchableFrac(from, 1, UCT - t.LastEnterCustomize, custRecovery)
		end
	end

	t.VM_CustCurrent = custFrac

	if cust then
		-- target.pos:Zero()
		-- target.ang:Zero()

		target.down = Lerp(custFrac, target.down, 1)
		target.sway = Lerp(custFrac, target.sway, 3)
		target.bob  = Lerp(custFrac, target.bob, 1)

		local mx, my = input.GetCursorPos()

		mx = 2 * mx / ScrW()
		my = 2 * my / ScrH()

		tempVec:Set(self:GetBuff("CustomizePos"))
		tempAng:Set(self:GetBuff("CustomizeAng"))

		tempVec[1] = tempVec[1] + mx
		tempVec[3] = tempVec[3] + my

		tempAng[2] = tempAng[2] + my * 2
		tempAng[3] = tempAng[3] + mx * 2

		tempVec:Mul(custFrac)
		tempAng:Mul(custFrac)

		if self.InAttMenu then tempAng[2] = tempAng[2] - 5 end

		target.pos:Add(tempVec)
		target.ang:Add(tempAng)
	end

	if (sprinted and !(self:GetBuff_Override("Override_ShootWhileSprint") or t.ShootWhileSprint)) or holstered then
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

		local sf = sprintFrac
		local addp = 0

		if recovery > 0.8 then
			local angFr = math.RemapClamp(sprintFrac, 0, math.max(recovery * 0.6, 0.6), 1, 0)
			local awv = math.sin(angFr * math.pi * 2)
			local angOff = sprinting and 0 or (awv > 0 and awv / 4 or awv) * -16
			print(angOff, sprintFrac)
			addp = angOff
			
			if not sprinting then
				sf = Ease(sf, 0.6) -- slow down the beginning
			end
		end

		LerpSource(1 - sf, target.pos, prePos)

		target.ang:Set(holstered and (hang or sang) or (sang or hang))

		if ang.p < -15 then target.ang.p = target.ang.p + ang.p + 15 end

		target.ang.p = m_clamp(target.ang.p + addp, -80, 80)
		LerpSource(1 - sf, target.ang, preAng)
	end

	if sightedFrac > 0 then
		local irons = self:GetActiveSights()
		local from = t.SwitchedSightsFrom

		target.evpos = sharedEVVector
		target.evang = sharedEVAng

		local fromEV, fromAng = vector_origin, angle_zero

		local delta = math.min( sightedFrac,
			easeOutCubic( (UCT - t.LastSwitchSightTimeUnpred) / sightTime ),
			1 )

		local sp, sa, sep, sea

		if from then
			sep, sea, sp, sa = unpack(from._SwitchDat)
			target.pos:Set(sp)
			target.ang:Set(sa)
			target.evpos:Set(sep)
			target.evang:Set(sea)

			if from.EVPos then
				fromEV = from.EVPos
			end
			if from.EVAng then
				fromAng = from.EVAng
			end

			target.down = 0
			target.sway = 0.1
			target.bob = 0.1

			LerpSource(delta, target.pos, irons.Pos)
			LerpSource(delta, target.ang, irons.Ang)
		else
			LerpSource(sightedFrac, target.pos, irons.Pos)
			LerpSource(sightedFrac, target.ang, irons.Ang)
		end

		-- we do a little circling
		target.pos[1] = target.pos[1] + math.sin(sightedFrac * math.pi * 2) * 0.7
		target.pos[3] = target.pos[3] + math.sin(sightedFrac * math.pi) * -0.6

		if irons.EVPos then
			LerpInto(delta, fromEV, irons.EVPos, target.evpos)
		else
			target.evpos:Set(vector_origin)
		end

		if irons.EVAng then
			LerpInto(delta, fromAng, irons.EVAng, target.evang)
		else
			target.evang:Set(angle_zero)
		end

		irons._CurPos = target.pos
		irons._CurAng = target.ang
		irons._CurEVPos = target.evpos
		irons._CurEVAng = target.evang

		target.down  = Lerp(sightedFrac, target.down, 0)
		target.sway  = Lerp(sightedFrac, target.sway, 0.1)
		target.bob   = Lerp(sightedFrac, target.bob, 0.1)

		local sightroll = self:GetBuff_Override("Override_AddSightRoll")

		if sightroll then
			LerpSource(sightedFrac, target.ang, irons.Ang)
			target.ang.r = sightroll
		end
	end

	--[[if sprd > 0 and !self:GetBuff("ShootWhileSprint") then
		local hpos, spos = self:GetBuff("HolsterPos", true), self:GetBuff("SprintPos", true)
		local hang, sang = self:GetBuff("HolsterAng", true), self:GetBuff("SprintAng", true)

		target.pos = LerpVector(sprd, target.pos, spos or hpos)
		target.ang = LerpAngle(sprd, target.ang, sang or hang)
	end]]


	-- !! this makes quite a bit of garbage
	local deg = self:BarrelHitWall(true)

	local stanceRecover = self:GetSightTime() ^ 0.4 / 2     -- how fast the stance will recover
	local stanceRuin = self:GetSightTime() ^ 0.2            -- how fast the stance will break

	-- do GCPrint("acw vm calc") return end

	if firstpred then
		if deg > 0 then
			t.VM_LastBarrelRecover = nil
			t.VM_LastBarrelRecoverFrom = nil
			t.VM_LastBarrelHit = t.VM_LastBarrelHit or UCT
			t.VM_MaxBarrelFrac = math.max(t.VM_MaxBarrelFrac - FrameTime() / stanceRecover, deg)
		else
			t.VM_LastBarrelHit = nil
			t.VM_LastBarrelRecover = t.VM_LastBarrelRecover or UCT
			t.VM_LastBarrelRecoverFrom = t.VM_LastBarrelRecoverFrom or t.VM_BarrelWallFrac
		end
	end

	if t.VM_LastBarrelRecover then
		t.VM_BarrelWallFrac = t.VM_LastBarrelRecoverFrom * (1 - easeOut( (UCT - t.VM_LastBarrelRecover) / stanceRecover, 1 ))
		t.VM_MaxBarrelFrac = t.VM_BarrelWallFrac
	else
		t.VM_BarrelWallFrac = t.VM_MaxBarrelFrac * easeOut( (UCT - t.VM_LastBarrelHit) / stanceRuin, 1 )
	end

	if t.VM_BarrelWallFrac > 0 then
		local fr = t.VM_BarrelWallFrac

		LerpSource(fr, target.pos, t.HolsterPos)
		LerpSource(fr, target.ang, t.HolsterAng)

		local int = fr * 2

		target.down = target.down + int
		target.sway = target.sway + int
		target.bob  = target.bob + int
	end

	if !isangle(target.ang) then
		target.ang = Angle(target.ang)
	end

	if t.InProcDraw then
		t.InProcHolster = false

		local delta = m_clamp((CT - t.ProcDrawTime) / (0.25 * self:GetBuff_Mult("Mult_DrawTime")), 0, 1)

		targetpos  = LerpVector(delta, Vector(0, 0, -5), target.pos)
		targetang  = LerpAngle(delta, Angle(-70, 30, 0), target.ang)
		targetdown = target.down
		targetsway = target.sway
		targetbob  = target.bob

		if delta == 1 then t.InProcDraw = false end
	end

	if t.InProcHolster then
		t.InProcDraw = false

		local delta = 1 - m_clamp((CT - t.ProcHolsterTime) / (0.25 * self:GetBuff_Mult("Mult_DrawTime")), 0, 1)

		target.pos = LerpVector(delta, Vector(0, 0, -5), target.pos)
		target.ang = LerpAngle(delta, Angle(-70, 30, 10), target.ang)
		target.down = target.down
		target.sway = target.sway
		target.bob = target.bob

		if delta == 0 then t.InProcHolster = false end
	end

	if t.InProcBash then
		t.InProcDraw = false

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

	--local randVec = VectorRand()
	--randVec:Mul(self.RecoilAmount * 0.2)

	--target.pos:Add(randVec)

	local speed = target.speed or 3

	local coolsway = GetConVar("arccw_vm_coolsway"):GetBool()

	lookxmult = GetConVar("arccw_vm_look_xmult"):GetFloat()
	lookymult = GetConVar("arccw_vm_look_ymult"):GetFloat()

	swayxmult = GetConVar("arccw_vm_sway_xmult"):GetFloat()
	swayymult = GetConVar("arccw_vm_sway_ymult"):GetFloat()
	swayzmult = GetConVar("arccw_vm_sway_zmult"):GetFloat()
	swayspeed = GetConVar("arccw_vm_sway_speedmult"):GetFloat()
	swayrotate = GetConVar("arccw_vm_sway_rotatemult"):GetFloat()

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

	t.SwayScale = (coolsway and 0) or actual.sway
	t.BobScale  = (coolsway and 0) or actual.bob

	if coolsway then
		local temp = swayzmult
		swayzmult = swayymult or 1
		swayymult = swayxmult or 1
		swayxmult = temp or 1

		local npos, nang = self:GetVMPosition(oldpos, oldang)
		pos:Set(npos)
		ang:Set(nang)
	end

	local OF = oldang:ToForward(dirVec)

	local bk = 1 - Ease(self:GetRecoilFrac(), 0.3)
	OF:Mul(-math.min(bk, 1) * math.max(0.5, self:GetMaxRecoil()))

	--OF:Mul(-math.min(self.RecoilPunchBack, 1) * 1.5)
	pos:Add(OF)

	-- position recoil only if not aiming through irons
	local sght = self:GetActiveSights()
	local rec = self:GetAimRecoil(true)

	if sght and sght.HolosightModel and rec ~= 0 then
		local OU = oldang:ToUp(dirVec)
		OU:Mul(rec / 4)

		pos:Add(OU)
	end

	local vpa = self:GetOurViewPunchAngles() -- horizontal recoil of viewpunch looks shite
	vpa[1] = 0
	vpa:Mul(0.5) -- (1 - this)% of recoil is kept

	oldang:Add(recoilMethod(self))
	oldang:Add(vpa)

	local aepx, aepy, aepz = actual.evpos:Unpack()

	--[[ang:RotateAroundAxis(OR,   actual.ang[1] + actual.evang[1])
	ang:RotateAroundAxis(OU,   actual.ang[2] + actual.evang[2])
	ang:RotateAroundAxis(OF,   actual.ang[3] + actual.evang[3])]]

	local OR = oldang:ToRight(dirVec)
		ang:RotateAroundAxis(OR,   actual.ang[1] + actual.evang[1])

		OR:Mul(aepx)
		pos:Add(OR)

	local OF = oldang:ToForward(dirVec)
		ang:RotateAroundAxis(OF,   actual.ang[3] + actual.evang[3])

		OF:Mul(aepy)
		pos:Add(OF)


	local OU = oldang:ToUp(dirVec)
		ang:RotateAroundAxis(OU,   actual.ang[2] + actual.evang[2])

		OU:Mul(aepz)
		pos:Add(OU)

	ang:Sub(recoilMethod(self))
	ang:Add(vpa) -- i have no clue why adding it twice cancels it out bro

	-- t.ShakeAngle:Mul(1)
	ang:Add(t.ShakeAngle)

	local apx, apy, apz = actual.pos:Unpack()

	ang:ToRight(dirVec):Mul(apx)
	pos:Add(dirVec)

	ang:ToForward(dirVec):Mul(apy)
	pos:Add(dirVec)

	ang:ToUp(dirVec):Mul(apz)
	pos:Add(dirVec)

	pos[3] = pos[3] - actual.down


	if coolsway then
		LerpSource(m_min(FT * 100, 1), lasteyeangles, eyeangles)
	end
	-- end

	if gunbone then
		local magnitude = Lerp(sgtd, 0.1, 1)
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

	GCPrint("acw vm calc")
	return pos, ang
end

local cv, ca = Vector(), Angle()
local ccv, cca = Vector(), Angle()

local offAng = Angle()

function SWEP:GetViewModelPosition(pos, ang)
	--[[if IsFirstTimePredicted() then
		cv:Set(pos) ca:Set(ang)
		self:CalculateVMPos(pos, ang)
		cv:Sub(pos) ca:Sub(ang)
		return pos, ang
	else
		pos:Sub(cv) ang:Sub(ca)
		return pos, ang
	end]]

	--cv:Set(pos) ca:Set(ang)
	--ccv:Set(pos) cca:Set(ang)
	
	self:CalculateVMPos(pos, ang)

	return pos, ang
end


function SWEP:ShouldCheapWorldModel()
	local lp = LocalPlayer()

	if lp:GetObserverMode() == OBS_MODE_IN_EYE and lp:GetObserverTarget() == self:GetOwner() then
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

	self:DrawCustomModel(true)

	self:DoLaser(true)

	if self:ShouldGlint() then self:DoScopeGlint()  end

	if !self.CertainAboutAtts and (not self.SentReq or CurTime() - self.SentReq > 1) then
		net.Start("arccw_rqwpnnet")
		net.WriteEntity(self)
		net.SendToServer()
		self.SentReq = CurTime()
	end
end

local b = bench("predraw", 600)
local v1, a1 = Vector(), Angle()
local v2, a2 = Vector(), Angle()

function SWEP:StartVM3D()
	cam.Start3D(nil, nil, self.CurrentViewModelFOV or self.ViewModelFOV, nil, nil, nil, nil, 1.5, 15000)
	--EyePos(), EyeAngles(), self.CurrentViewModelFOV or self.ViewModelFOV, nil, nil, nil, nil, 1.5, 15000)
end


local st = false
local mx = Matrix()

function SWEP:PreDrawViewModel(vm)
	--b:Open()
	GCMark("acw vm pre")
	if ArcCW.VM_OverDraw then return end
	if !vm then return end

	--[[v1:Set(vm:GetPos()) a1:Set(vm:GetAngles())
	v2:Set(v1) a2:Set(a1)

	self:CalculateVMPos(v1, a1)]]

	if self:IsCustomizing() then self:BlurNotWeapon() end

	if GetConVar("arccw_cheapscopesautoconfig"):GetBool() then
		local fps    = 1 / FrameTime()
		local lowfps = fps <= 45

		GetConVar("arccw_cheapscopes"):SetBool(lowfps)

		GetConVar("arccw_cheapscopesautoconfig"):SetBool(false)
	end

	local asight = self:GetActiveSights()

	if self:GetSightDelta() < 1 and asight.Holosight then
		ArcCW:DrawPhysBullets()
	end

	if false and GetConVar("arccw_cheapscopes"):GetBool() and self:GetSightDelta() < 1 and asight.MagnifiedOptic then
		self:FormCheapScope()
	end

	if false and self:GetSightDelta() < 1 and asight.ScopeTexture then
		self:FormCheapScope()
	end

	--[[for k,v in pairs(calc) do
		if v[1] == vm:GetPos() and v[2] == vm:GetAngles() then
			print(k, CurTime())
		end
	end]]

	self:StartVM3D()
	cam.IgnoreZ(true)

	self:DrawCustomModel(false) -- ~7kb garbage per call

	self:DoLHIK() -- !! expensive !!  ~3.5 garbage per call
	--b:Close():print()

	st = true
	GCPrint("acw vm pre")

	--return true
end

local b = bench("postdraw", 600)

function SWEP:PostDrawViewModel(vm)
	--b:Open()
	GCMark("acw vm post")
	if ArcCW.VM_OverDraw then return end
	if not st then return end

	render.SetBlend(1)

	cam.End3D()

	self:StartVM3D()

	cam.IgnoreZ(true)

	if ArcCW.Overdraw then
		ArcCW.Overdraw = false
	else
		self:DoLaser() -- !! expensive !!
		self:DoHolosight()
	end

	cam.End3D()
	--b:Close():print()
	GCPrint("acw vm post")
end