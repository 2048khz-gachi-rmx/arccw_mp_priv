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
local swayxmult, swayymult, swayzmult, swayspeed = 1, 1, 1, 1
local swayangx_lerp, swayangy_lerp, swayangz_lerp = 0, 0, 0

local lookxmult, lookymult = 1, 1
SWEP.VMPos = Vector()
SWEP.VMAng = Angle()
SWEP.VMPosOffset = Vector()
SWEP.VMAngOffset = Angle()

SWEP.VMPosOffset_Lerp = Vector()
SWEP.VMAngOffset_Lerp = Angle()

SWEP.VMLookLerp = Angle()

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

local coolswayCT = 0
local function LerpC(t,a,b,powa)

return a + (b - a) * math.pow(t,powa)

end

function SWEP:Move_Process(EyePos, EyeAng, velocity)
	local VMPos, VMAng = self.VMPos, self.VMAng
	local VMPosOffset, VMAngOffset = self.VMPosOffset, self.VMAngOffset
	local VMPosOffset_Lerp, VMAngOffset_Lerp = self.VMPosOffset_Lerp, self.VMAngOffset_Lerp
	local FT = (game.SinglePlayer() and FrameTime()) or RealFrameTime()*0.5308
	local sightedmult = (self:GetState() == ArcCW.STATE_SIGHTS and 0.1) or 1

	VMPos:Set(EyePos)
	VMAng:Set(EyeAng)

	VMPosOffset.x = self:GetOwner():GetVelocity().z*0.0015 * sightedmult
	VMPosOffset.y = math.Clamp(velocity.y*-0.004, -1, 1) * sightedmult

	VMPosOffset_Lerp.x = Lerp(8*FT, VMPosOffset_Lerp.x, VMPosOffset.x)
	VMPosOffset_Lerp.y = Lerp(8*FT, VMPosOffset_Lerp.y, VMPosOffset.y)

	VMAngOffset.x = math.Clamp(VMPosOffset.x * 8, -4, 4)
	VMAngOffset.y = VMPosOffset.y * ((game.SinglePlayer() and 5) or -1)
	VMAngOffset.z = VMPosOffset.y * 0.5 + (VMPosOffset.x * -5)

	VMAngOffset_Lerp.x = LerpC(10*FT, VMAngOffset_Lerp.x, VMAngOffset.x, 0.75)
	VMAngOffset_Lerp.y = LerpC(5*FT, VMAngOffset_Lerp.y, VMAngOffset.y, 0.6)
	VMAngOffset_Lerp.z = Lerp(25*FT, VMAngOffset_Lerp.z, VMAngOffset.z)

	VMPos:Add(VMAng:Up() * VMPosOffset_Lerp.x)
	VMPos:Add(VMAng:Right() * VMPosOffset_Lerp.y)

	VMAng:Add(VMAngOffset_Lerp)

end

local stepend = math.pi*4
function SWEP:Step_Process(EyePos,EyeAng, velocity)
	local CT = CurTime()
	if CT > coolswayCT then
		coolswayCT = CT
	else
		return
	end

	local VMPos, VMAng = self.VMPos, self.VMAng
	local VMPosOffset, VMAngOffset = self.VMPosOffset, self.VMAngOffset
	local VMPosOffset_Lerp, VMAngOffset_Lerp = self.VMPosOffset_Lerp, self.VMAngOffset_Lerp
	velocity = math.min(velocity:Length(), 500)
	if self:GetState() == ArcCW.STATE_SPRINT then
		velocity = velocity * 1.25
	end
	local delta = math.abs(self.StepBob*2/(stepend)-1)
	local FT = (game.SinglePlayer() and FrameTime()) or RealFrameTime()*2
	local FTMult = 300 * FT
	local sightedmult = (self:GetState() == ArcCW.STATE_SIGHTS and 0.25) or 1
	local sprintmult = (self:GetState() == ArcCW.STATE_SPRINT and 2) or 1
	local onground = self:GetOwner():OnGround()
	self.StepBob = self.StepBob + (velocity * 0.00015 + (math.pow(delta, 0.01)*0.03)) * swayspeed * (FTMult)

	if self.StepBob >= stepend then
		self.StepBob = 0
		self.StepRandomX = 1 --math.Rand(1,1.5)
		self.StepRandomY = 1 --math.Rand(1,1.5)
	end

	if velocity == 0 then
		self.StepBob = 0
	end

	if onground then
		VMPosOffset.x = (math.sin(self.StepBob) * velocity * 0.000375 * sightedmult * swayxmult) * self.StepRandomX
		VMPosOffset.y = (math.sin(self.StepBob * 0.5) * velocity * 0.0005 * sightedmult * sprintmult * swayymult) * self.StepRandomY
		VMPosOffset.z = math.sin(self.StepBob * 0.75) * velocity * 0.002 * sightedmult * swayzmult
	end

	local firstPred = IsFirstTimePredicted()
	if firstPred then
		VMPosOffset_Lerp.x = Lerp(16*FT, VMPosOffset_Lerp.x, VMPosOffset.x)
		VMPosOffset_Lerp.y = Lerp(4*FT, VMPosOffset_Lerp.y, VMPosOffset.y)
		VMPosOffset_Lerp.z = Lerp(2*FT, VMPosOffset_Lerp.z, VMPosOffset.z)
	end

	VMAngOffset.x = VMPosOffset_Lerp.x * 2
	VMAngOffset.y = VMPosOffset_Lerp.y * -7.5
	VMAngOffset.z = VMPosOffset_Lerp.y * 5


	VMPos:Add(VMAng:Up() * VMPosOffset_Lerp.x)
	VMPos:Add(VMAng:Right() * VMPosOffset_Lerp.y)
	VMPos:Add(VMAng:Forward() * VMPosOffset_Lerp.z)

	VMAng:Add(VMAngOffset)
end

function SWEP:Breath_Health()
	local owner = self:GetOwner()
	if !IsValid(owner) then return end
	local health = owner:Health()
	local maxhealth = owner:GetMaxHealth()

	self.Breath_Intensity = math.Clamp( maxhealth / health, 0, 2 )
	self.Breath_Rate = math.Clamp( ((maxhealth*0.5) / health ), 1, 1.5 )
end

function SWEP:Breath_StateMult()
	local owner = self:GetOwner()
	if !IsValid(owner) then return end
	local sightedmult = (self:GetState() == ArcCW.STATE_SIGHTS and 0.05) or 1

	self.Breath_Intensity = self.Breath_Intensity * sightedmult
end

function SWEP:Breath_Process(EyePos, EyeAng)
	local VMPos, VMAng = self.VMPos, self.VMAng
	local VMPosOffset, VMAngOffset = self.VMPosOffset, self.VMAngOffset

	self:Breath_Health()
	self:Breath_StateMult()
	VMPosOffset.x = (math.sin(CurTime() * 2 * self.Breath_Rate) * 0.1) * self.Breath_Intensity
	VMPosOffset.y = (math.sin(CurTime() * 2.5 * self.Breath_Rate) * 0.025) * self.Breath_Intensity

	VMAngOffset.x = VMPosOffset.x * 1.5
	VMAngOffset.y = VMPosOffset.y * 2

	VMPos:Add(VMAng:Up() * VMPosOffset.x)
	VMPos:Add(VMAng:Right() * VMPosOffset.y)

	VMAng:Add(VMAngOffset)

end

function SWEP:Look_Process(EyePos, EyeAng)
	local t = self:GetTable()

	local VMPos, VMAng = t.VMPos, t.VMAng
	local VMPosOffset, VMAngOffset = t.VMPosOffset, t.VMAngOffset
	local FT = FrameTime()
	local sightedmult = (self:GetState() == ArcCW.STATE_SIGHTS and 0.25) or 1

	local firstPred = IsFirstTimePredicted()
	if firstPred then
		t.SmoothEyeAng = LerpAngle(0.2, t.SmoothEyeAng, EyeAng - t.LastEyeAng)
	end

	VMPosOffset.x = -t.SmoothEyeAng.x * -1 * sightedmult * lookxmult
	VMPosOffset.y = t.SmoothEyeAng.y * 0.5 * sightedmult * lookymult

	VMAngOffset.x = VMPosOffset.x * 2.5
	VMAngOffset.y = VMPosOffset.y * 1.25
	VMAngOffset.z = VMPosOffset.y * 2

	if firstPred then
		t.VMLookLerp.y = Lerp(FT*10, t.VMLookLerp.y, VMAngOffset.y * 1.5 + t.SmoothEyeAng.y)
	end

	VMAng.y = VMAng.y - t.VMLookLerp.y

	VMPos:Add(VMAng:Up() * VMPosOffset.x)
	VMPos:Add(VMAng:Right() * VMPosOffset.y)

	VMAng:Add(VMAngOffset)

end

function SWEP:GetVMPosition(EyePos, EyeAng)
	local velocity = self:GetOwner():GetVelocity()
	velocity = WorldToLocal(velocity, angle_zero, vector_origin, EyeAng)
	self:Move_Process(EyePos, EyeAng, velocity)
	self:Step_Process(EyePos, EyeAng, velocity)
	self:Breath_Process(EyePos, EyeAng)
	self:Look_Process(EyePos, EyeAng)

	self.LastEyeAng = EyeAng
	self.LastEyePos = EyePos
	self.LastVelocity = velocity
	return self.VMPos, self.VMAng
end

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

local function easeOutCubic(x)
	return 1 - (1 - x) ^ 3
end

local function easeOutCirc(x)
	return math.sqrt(1 - ((x - 1) ^ 2))
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

-- i didn't forget ;)

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
	local add = easeOutCubic(frac) * needAdd

	local sign = (from < to and 1) or -1

	return math[from < to and "min" or "max"] (from + add * sign, to)
end

local recoilAng = Angle()

local function recoilMethod(self)
	recoilAng[1] = self:GetRecoil() * 0.8

	return recoilAng -- self:GetOurViewPunchAngles()
end

function SWEP:GetViewModelPosition(pos, ang)
	-- b:Open()

	local owner = self:GetOwner()
	local t = self:GetTable()

	if !IsValid(owner) or !owner:Alive() then return end

	-- local SP = game.SinglePlayer()

	local CT = CurTime()
	local UCT = UnPredictedCurTime()
	local FT = FrameTime()
	local firstpred = IsFirstTimePredicted()

	local gunbone, gbslot = self:GetBuff_Override("LHIK_GunDriver")

	local oldpos, oldang = Vector(), Angle()

	-- local asight = self:GetActiveSights()
	local state  = self:GetState()

	local sightTime = self:GetSightTime()

	local sgtd = self:GetSightDelta()

	oldpos:Set(pos)
	oldang:Set(ang)

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
							easeOut( (UnPredictedCurTime() - self.VM_EnteredBipod) / bipodTime ) or
							1 - easeOut( (UnPredictedCurTime() - self.VM_ExitedBipod) / bipodTime * 1.5 )

	if bipodDelta > 0 then
		if !t.BipodAngle then
			t.BipodPos = self:GetOwner():EyePos()
			t.BipodAngle = self:GetOwner():EyeAngles()
		end

		local BEA = self.BipodAngle - owner:EyeAngles()

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

	local sighted   = state == ArcCW.STATE_SIGHTS or (UCT - outSightTime) < sightTime

	--[[(t.Sighted or state == ArcCW.STATE_SIGHTS or
		(UCT - inSightTime) < sightTime)]]
	local sightedFrac = 0
	local sightFrom = t.VM_SightsChange

	if sighted then
		if outSightTime >= inSightTime then
			sightedFrac = calculateSwitchableFrac(sightFrom, 0, UCT - outSightTime, sightTime)
		else
			sightedFrac = calculateSwitchableFrac(sightFrom, 1, UCT - inSightTime, sightTime)
		end
	end

	t.VM_SightsCurrent = sightedFrac

	local recovery = self:GetSprintTime() -- (t.VM_UseSightTime and t.VM_SprintRecovery * sightTime) or t.VM_SprintRecovery
	local sprinted  = state == ArcCW.STATE_SPRINT or (UCT - t.LastExitSprintTimeUnpred) < recovery
	local sprintFrac = 0


	if sprinted then

		local from = t.VM_SprintChange
		local exit = t.LastExitSprintTimeUnpred >= t.LastEnterSprintTimeUnpred

		if exit then
			-- lerping [0 <- x <- 1]
			sprintFrac = calculateSwitchableFrac(from, 0, UCT - t.LastExitSprintTimeUnpred, recovery)
		else
			-- lerping [0 -> x -> 1]
			sprintFrac = calculateSwitchableFrac(from, 1, UCT - t.LastEnterSprintTimeUnpred, recovery)
		end

	end

	t.VM_SprintCurrent = sprintFrac

	local holstered = self:GetCurrentFiremode().Mode == 0

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
			local from = t.SwitchedSightsFrom

			target.evpos = sharedEVVector
			target.evang = sharedEVAng

			local fromEV, fromAng = vector_origin, angle_zero

			if from then
				target.pos:Set(from._SwitchPos)
				target.ang:Set(from._SwitchAng)

				if from.EVPos then
					fromEV = from.EVPos
				end
				if from.EVAng then
					fromAng = from.EVAng
				end

				target.down = 0
				target.sway = 0.1
				target.bob = 0.1
			end

			LerpSource(sightedFrac, target.pos, irons.Pos)
			LerpSource(sightedFrac, target.ang, irons.Ang)

			local delta = math.min( sightedFrac,
				easeOutCubic( (UCT - t.LastSwitchSightTimeUnpred) / sightTime ),
				1 )

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

			irons._CurPos = target.evpos
			irons._CurAng = target.evang

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

	--[[if sprd > 0 and !self:GetBuff("ShootWhileSprint") then
		local hpos, spos = self:GetBuff("HolsterPos", true), self:GetBuff("SprintPos", true)
		local hang, sang = self:GetBuff("HolsterAng", true), self:GetBuff("SprintAng", true)

		target.pos = LerpVector(sprd, target.pos, spos or hpos)
		target.ang = LerpAngle(sprd, target.ang, sang or hang)
	end]]

	local deg = self:BarrelHitWall(true)

	local stanceRecover = self:GetSightTime() ^ 0.4 / 2     -- how fast the stance will recover
	local stanceRuin = self:GetSightTime() ^ 0.2            -- how fast the stance will break

	if firstpred then
		if deg > 0 then
			self.VM_LastBarrelRecover = nil
			self.VM_LastBarrelRecoverFrom = nil
			self.VM_LastBarrelHit = self.VM_LastBarrelHit or UCT
			self.VM_MaxBarrelFrac = math.max(self.VM_MaxBarrelFrac - FrameTime() / stanceRecover, deg)
		else
			self.VM_LastBarrelHit = nil
			self.VM_LastBarrelRecover = self.VM_LastBarrelRecover or UCT
			self.VM_LastBarrelRecoverFrom = self.VM_LastBarrelRecoverFrom or self.VM_BarrelWallFrac
		end
	end

	if self.VM_LastBarrelRecover then
		self.VM_BarrelWallFrac = self.VM_LastBarrelRecoverFrom * (1 - easeOut( (UCT - self.VM_LastBarrelRecover) / stanceRecover, 1 ))
		self.VM_MaxBarrelFrac = self.VM_BarrelWallFrac
	else
		self.VM_BarrelWallFrac = self.VM_MaxBarrelFrac * easeOut( (UCT - self.VM_LastBarrelHit) / stanceRuin, 1 )
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

		targetpos  = LerpVector(delta, Vector(0, 0, -5), target.pos)
		targetang  = LerpAngle(delta, Angle(-70, 30, 0), target.ang)
		targetdown = target.down
		targetsway = target.sway
		targetbob  = target.bob

		if delta == 1 then self.InProcDraw = false end
	end

	if self.InProcHolster then
		self.InProcDraw = false

		local delta = 1 - m_clamp((CT - self.ProcHolsterTime) / (0.25 * self:GetBuff_Mult("Mult_DrawTime")), 0, 1)

		target.pos = LerpVector(delta, Vector(0, 0, -5), target.pos)
		target.ang = LerpAngle(delta, Angle(-70, 30, 10), target.ang)
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

	--[[if coolsway then
		eyeangles = owner:EyeAngles()

		local sightmult = ((sighted and 0.1) or 1)
		local sprintmult = (sprinted and 3 * sprintFrac or 0) + 1

		local strafing = owner:KeyDown(IN_MOVELEFT) or owner:KeyDown(IN_MOVERIGHT)

		local vel = owner:GetVelocity()
		local velup = math.Clamp(vel.z, -300, 300)
		local velmult = math.Clamp(vel:Length() / 170, 0.1,2)
		local pi = math.Clamp(math.pi * math.Round(velmult) * swayspeed, 1, 6)
		local movmt = (UCT * pi) / 0.5
		local movmtcomp = ((UCT * pi) - 0.25) / 0.5

		local xangdiff = m_angdif(eyeangles.x, lasteyeangles.x) * lookxmult
		local yangdiff = m_angdif(eyeangles.y, lasteyeangles.y) * lookymult
		local rollamount = (strafing and vel:Angle().y) or eyeangles.y
		local rollangdiff = math.Clamp(m_angdif(eyeangles.y, rollamount ) / 180 * pi, -7, 7)

		coolswaypos[1] = (0.25 * velmult) * m_cos(movmtcomp) * sprintmult * swayxmult * sightmult
		coolswaypos[2] = -math.abs((1 * velmult) * m_cos(movmtcomp)) * swayymult * sightmult
		coolswaypos[3] = -math.abs((0.25 * velmult) * m_cos(movmtcomp)) * swayzmult * sightmult

		local l_swayangx_lerp = f_lerp(0.25, swayangx_lerp, xangdiff * sightmult)
		local l_swayangy_lerp = f_lerp(0.25, swayangy_lerp, yangdiff * sightmult)
		local l_swayangz_lerp = f_lerp(0.025, swayangz_lerp, rollangdiff)

		if firstpred then
			swayangx_lerp = l_swayangx_lerp
			swayangy_lerp = l_swayangy_lerp
			swayangz_lerp = l_swayangz_lerp
		end

		coolswayang.x = (math.abs((0.5 * velmult) * m_sin(movmt)) + swayangx_lerp * swayxmult) + (velup * -0.01 * swayzmult)
		coolswayang.y = ((0.25 * velmult) * m_cos(movmt) * swayymult)
		coolswayang.z = (math.min((2.5 * velmult) * m_cos(movmt), 0) + swayangy_lerp - swayangz_lerp * swayzmult) * swayrotate

		target.ang:Add(coolswayang)
		target.pos:Add(coolswaypos)
	end]]


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
	if coolsway then
		swayxmult = GetConVar("arccw_vm_sway_zmult"):GetFloat() or 1
		swayymult = GetConVar("arccw_vm_sway_xmult"):GetFloat() or 1
		swayzmult = GetConVar("arccw_vm_sway_ymult"):GetFloat() or 1
		swayspeed = GetConVar("arccw_vm_sway_speedmult"):GetFloat() or 1

		lookxmult = GetConVar("arccw_vm_look_xmult"):GetFloat() or 1
		lookymult = GetConVar("arccw_vm_look_ymult"):GetFloat() or 1
		local npos, nang = self:GetVMPosition(oldpos, oldang)
		pos:Set(npos)
		ang:Set(nang)
	end

	--oldang:Add(recoilMethod(self))
	
	--pos:Add( math.min(self.RecoilPunchBack, 1) * -oldang:Forward() )

	--pos:Add( self.RecoilPunchSide * oldang:Right() )
	-- upward recoil is terrible on some guns, wtf?
	--pos:Add( self.RecoilPunchUp   * -oldang:Up() )

	--oldang:Add(recoilMethod(self))

	oldang:Add(recoilMethod(self))

	ang:RotateAroundAxis(oldang:Right(),   actual.ang.x)
	ang:RotateAroundAxis(oldang:Up(),      actual.ang.y)
	ang:RotateAroundAxis(oldang:Forward(), actual.ang.z)

	ang:RotateAroundAxis(oldang:Right(),   actual.evang.x)
	ang:RotateAroundAxis(oldang:Up(),      actual.evang.y)
	ang:RotateAroundAxis(oldang:Forward(), actual.evang.z)

	ang:Sub(recoilMethod(self))

	pos:Add( ang:Right()   * actual.evpos.x)
	pos:Add( ang:Forward() * actual.evpos.y)
	pos:Add( ang:Up()      * actual.evpos.z)

	pos:Add( actual.pos.x * ang:Right() )
	pos:Add( actual.pos.y * ang:Forward() )
	pos:Add( actual.pos.z * ang:Up() )

	

	pos[3] = pos[3] - actual.down

	--ang:Sub(recoilMethod(self))

	-- this is the desyncing angle: modifying it here will offset the crosshair from its' intended target
	--ang = ang - recoilMethod(self) --self:GetOurViewPunchAngles() * Lerp(1 - sightedFrac, -0.5, -3)
	
	-- if IsFirstTimePredicted() then

	self.ActualVMData = actual
	if coolsway then lasteyeangles = LerpAngle(m_min(FT * 100, 1), lasteyeangles, eyeangles) end
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

	--b:Close():print()

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