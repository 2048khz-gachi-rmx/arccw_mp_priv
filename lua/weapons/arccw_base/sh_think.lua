if CLIENT then
	ArcCW.LastWeapon = nil
end

local lastUBGL = 0
local LastAttack2 = false

function SWEP:NextbotThink(owner)
	local ct = CurTime()

	if self:GetMagUpIn() != 0 and ct > self:GetMagUpIn() then
		self:WhenTheMagUpIn()
		self:SetMagUpIn( 0 )
	end
end

function SWEP:Think()
	local owner = self:GetOwner()
	local t = self:GetTable()
	local ct = CurTime()

	if !IsValid(owner) or owner:IsNPC() then return end

	if owner:IsNextBot() then
		self:NextbotThink(owner)
		return
	end

	if --[[IsFirstTimePredicted() and]] CLIENT then
		--print(t._LatestState, CurTime() - t._LatestStateWhen, self:GetNWState())
		if t._LatestStateWhen < ct and self:GetNWState() ~= t._LatestState then
			-- misprediction?
			local key = self:GetNWState() .. "_RestoreHooks"
			if t[key] then
				for k,v in pairs(t[key]) do
					v(self)
				end
			end

			self:SetState(self:GetNWState())
		end
	end

	local vm = owner:GetViewModel()

	t.BurstCount = self:GetBurstCount()

	local sg = self:GetShotgunReloading()
	local rel = self:GetReloading()

	if (sg == 2 or sg == 4) and owner:KeyPressed(IN_ATTACK) then
		self:SetShotgunReloading(sg + 1)
		rel = self:GetReloading()
	elseif (sg >= 2) and self:GetReloadingREAL() <= ct then
		self:ReloadInsert((sg >= 4) and true or false)
		rel = self:GetReloading()
	end

	if CLIENT then
		if ArcCW.LastWeapon != self then
			self:LoadPreset("autosave")
		end

		ArcCW.LastWeapon = self
	end

	self:InBipod()

	if !rel then
		self:SetIsReloading(false)
	end

	-- Adding this delays bolting if the RPM is too low, but removing it may
	-- reintroduce the double pump bug. Increasing the RPM allows you to shoot twice
	-- on many multiplayer servers. Sure would be convenient if everything just worked nicely

	local cfm = self:GetCurrentFiremode()

	if self:GetNeedCycle() and !rel and self:GetWeaponOpDelay() < ct and self:GetNextPrimaryFire() < ct and
			(!GetConVar("arccw_clicktocycle"):GetBool() and (cfm.Mode == 2 or !owner:KeyDown(IN_ATTACK))
			or GetConVar("arccw_clicktocycle"):GetBool() and (cfm.Mode == 2 or owner:KeyPressed(IN_ATTACK))) then
		local anim = self:SelectAnimation("cycle")
		anim = self:GetBuff_Hook("Hook_SelectCycleAnimation", anim) or anim
		local mult = self:GetBuff_Mult("Mult_CycleTime")
		self:PlayAnimation(anim, mult, true, 0, true)
		self:SetNeedCycle(false)
	end

	if self:GetGrenadePrimed() and !owner:KeyDown(IN_ATTACK) and (!game.SinglePlayer() or SERVER) then
		self:Throw()
	end

	if self:GetGrenadePrimed() and self.GrenadePrimeTime > 0 then
		local heldtime = (ct - self.GrenadePrimeTime)

		local ft = self:GetBuff_Override("Override_FuseTime") or self.FuseTime

		if ft and (heldtime >= ft) and (!game.SinglePlayer() or SERVER) then
			self:Throw()
		end
	end

	if owner:KeyReleased(IN_USE) then
		if self:InBipod() then
			self:ExitBipod()
		else
			self:EnterBipod()
		end
	end

	if self:GetBuff_Override("Override_TriggerDelay", self.TriggerDelay) then
		self:DoTriggerDelay()
	end

	if cfm.RunawayBurst and self:Clip1() > 0 then
		if t.BurstCount > 0 then
			self:PrimaryAttack()
		end

		if t.BurstCount == self:GetBurstLength() then
			self:SetBurstCount(0)
			if !cfm.AutoBurst then
				self.Primary.Automatic = false
			end
		end
	end

	if owner:KeyReleased(IN_ATTACK) then
		if !cfm.RunawayBurst then
			self:SetBurstCount(0)
		end

		if cfm.Mode < 0 and !cfm.RunawayBurst then
			local postburst = cfm.PostBurstDelay or 0

			if (ct + postburst) > self:GetWeaponOpDelay() then
				--self:SetNextPrimaryFire(ct + postburst)
				self:SetWeaponOpDelay(ct + postburst * self:GetBuff_Mult("Mult_PostBurstDelay") + self:GetBuff_Add("Add_PostBurstDelay"))
			end
		end
	end

	local passed = ct - self:GetBurstStoppedTime()
	if ct > self:GetNextPrimaryFire() and t.BurstCount == 0 then
		local fr = Ease(math.RemapClamp(passed, 0, self:GetSightTime() * 2, 1, 0), 2.3)
		self:SetBurstCountWear(math.max(self:GetBurstStopped() * fr, 0))
	end

	if self:InSprint(true) and self:GetState() != ArcCW.STATE_SPRINT then
		self:EnterSprint()
	elseif !self:InSprint(true) and self:GetState() == ArcCW.STATE_SPRINT then
		self:ExitSprint()
	end

	if owner and owner:GetInfoNum("arccw_automaticreload", 0) == 1 and
			self:Clip1() == 0 and !rel and
			CurTime() > self:GetNextPrimaryFire() + 0.2 then
		self:Reload()
	end

	if owner:GetInfoNum("arccw_altfcgkey", 0) == 1 and owner:KeyPressed(IN_RELOAD) and owner:KeyDown(IN_USE) then
		if (lastfiremode or 0) + 0.1 < CurTime() then
			lastfiremode = CurTime()
			if CLIENT then
				net.Start("arccw_firemode")
				net.SendToServer()
				self:ChangeFiremode()
			end
		end
	elseif (!(self:GetBuff_Override("Override_ReloadInSights") or self.ReloadInSights) and (rel or owner:KeyDown(IN_RELOAD))) then
		if !(self:GetBuff_Override("Override_ReloadInSights") or self.ReloadInSights) and self:GetReloading(true) then
			self:ExitSights()
		end
	end

	if owner:GetInfoNum("arccw_altubglkey", 0) == 1 and self:GetBuff_Override("UBGL") and owner:KeyDown(IN_USE) then
		if owner:KeyDown(IN_ATTACK2) and CLIENT then
			if (lastUBGL or 0) + 0.25 > CurTime() then return end
			lastUBGL = CurTime()
			if self:GetInUBGL() then
				net.Start("arccw_ubgl")
				net.WriteBool(false)
				net.SendToServer()

				self:DeselectUBGL()
			else
				net.Start("arccw_ubgl")
				net.WriteBool(true)
				net.SendToServer()

				self:SelectUBGL()
			end
		end
	elseif self:GetBuff_Hook("Hook_ShouldNotSight") and (self:GetState() == ArcCW.STATE_SIGHTS) then
		self:ExitSights()
	else

		local sighted = self:GetState() == ArcCW.STATE_SIGHTS
		local toggle = owner:GetInfoNum("arccw_toggleads", 0) >= 1
		local suitzoom = owner:KeyDown(IN_ZOOM)
		local sp_cl = game.SinglePlayer() and CLIENT

		-- if in singleplayer, client realm should be completely ignored
		if toggle and !sp_cl then
			if owner:KeyPressed(IN_ATTACK2) then
				if sighted then
					self:ExitSights()
				elseif !suitzoom then
					self:EnterSights()
				end
			elseif suitzoom and sighted then
				self:ExitSights()
			end
		elseif !toggle then
			if (owner:KeyDown(IN_ATTACK2) and !suitzoom) and !sighted then
				self:EnterSights()
			elseif (!owner:KeyDown(IN_ATTACK2) or suitzoom) and sighted then
				self:ExitSights()
			end
		end

	end

	--if (CLIENT or game.SinglePlayer()) and (IsFirstTimePredicted() or game.SinglePlayer()) then
		self:ProcessRecoil()
	--end

	if CLIENT and IsValid(vm) then
		local vec1 = Vector(1, 1, 1)
		local vec0 = vec1 * 0

		for i = 1, vm:GetBoneCount() do
			vm:ManipulateBoneScale(i, vec1)
		end

		for i, k in pairs(self:GetBuff_Override("Override_CaseBones", self.CaseBones) or {}) do
			if !isnumber(i) then continue end
			for _, b in pairs(istable(k) and k or {k}) do
				local bone = vm:LookupBone(b)

				if !bone then continue end

				if self:GetVisualClip() >= i then
					vm:ManipulateBoneScale(bone, vec1)
				else
					vm:ManipulateBoneScale(bone, vec0)
				end
			end
		end

		for i, k in pairs(self:GetBuff_Override("Override_BulletBones", self.BulletBones) or {}) do
			if !isnumber(i) then continue end
			for _, b in pairs(istable(k) and k or {k}) do
				local bone = vm:LookupBone(b)

				if !bone then continue end

				if self:GetVisualBullets() >= i then
					vm:ManipulateBoneScale(bone, vec1)
				else
					vm:ManipulateBoneScale(bone, vec0)
				end
			end
		end

		for i, k in pairs(self:GetBuff_Override("Override_StripperClipBones", self.StripperClipBones) or {}) do
			if !isnumber(i) then continue end
			for _, b in pairs(istable(k) and k or {k}) do
				local bone = vm:LookupBone(b)

				if !bone then continue end

				if self:GetVisualLoadAmount() >= i then
					vm:ManipulateBoneScale(bone, vec1)
				else
					vm:ManipulateBoneScale(bone, vec0)
				end
			end
		end
	end

	self:DoHeat()

	if CLIENT then
		if IsValid(ArcCW.InvHUD) then
			ArcCW.InvHUD:PredThink()
		end
	end

	for i, k in pairs(self.Attachments) do
		if !k.Installed then continue end
		local atttbl = ArcCW.AttachmentTable[k.Installed]
		if not atttbl then continue end

		if atttbl.DamagePerSecond then
			local dmg = atttbl.DamagePerSecond * FrameTime()

			self:DamageAttachment(i, dmg)
		end
	end

	if CLIENT and IsFirstTimePredicted() then
		self:DoOurViewPunch()
	end

	if self.Throwing and self:Clip1() == 0 and self:Ammo1() > 0 then
		self:SetClip1(1)
		owner:SetAmmo(self:Ammo1() - 1, self.Primary.Ammo)
	end

	-- self:RefreshBGs()

	if self:GetMagUpIn() != 0 and ct > self:GetMagUpIn() then
		self:WhenTheMagUpIn()
		self:SetMagUpIn( 0 )
	end

	self:GetBuff_Hook("Hook_Think")

	-- Running this only serverside in SP breaks animation processing and causes CheckpointAnimation to !reset.
	--if SERVER or !game.SinglePlayer() then
		self:ProcessTimers()
	--end


	if self:GetNextIdle() != 0 and self:GetNextIdle() <= ct then
		if self.FullyHolstered then
			-- Bruh
			return
		end

		self:SetNextIdle(0)
		self:PlayIdleAnimation(true)
	end
end

local function easeOut(x, intensity)
	intensity = (intensity and -intensity * 10) or -15 -- values < 1 not recommended
	return (x <= 0 and 0) or (x == 1 and 1) or 1 - (2 ^ (intensity * x))
end

local function easeOutCubic(x)
	return 1 - (1 - x) ^ 3
end


function SWEP:GetRecoilTimeFrac(recTime, unpred)
	local when = unpred and self.UnpredRecoiledWhen or self:GetRecoiledWhen()
	local now = CurTime()
	local passed = now - when

	return math.Clamp(passed / (recTime or self.RecoilTRecovery), 0, 1)
end

function SWEP:GetAimRecoil(unpred, linear)
	local fr, v, h = self:LetMeHandleTheRecoil(unpred)
	local recRiseFr = 0.2

	local recoverTime = math.min(self:GetFiringDelay(), 0.1) * 1.1 -- recovery will look weird on slow-firing guns
															-- (like the csgo deagle)

	fr = self:GetRecoilTimeFrac(recoverTime / recRiseFr, unpred)

	local recFrac
	local from, to = 0, v

	if fr < recRiseFr then
		recFrac = Ease(math.Remap(fr, 0, recRiseFr, 0, 1), 0.2)
		to = v
		from = self.LastAimRecoil or 0
	else
		recFrac = 1 - Ease(1 - math.Remap(fr, recRiseFr, 1, 1, 0), 0.4)
		to = v
		from = 0
	end

	local m = 1
	-- uncomment for tarkov recoil, lol
	--local m = 3 - math.min(2, self:GetBurstCountWear() * 0.4)
	--m = math.sin( math.min(math.pi * 1.5, self:GetBurstCountWear() / 2) ) * 2
	--m = linear and 1 or m

	local rec = math.Round(math.max(Lerp(recFrac, from, to), 0), 5) * m
	local sideRec = math.Round(math.max(h * recFrac, 0), 5) * m

	return rec, sideRec, recFrac, from, to
end

function SWEP:LetMeHandleTheRecoil(unpred)
	return unpred and self.UnpredRecoilFrac or self:GetRecoilFrac(),
		self:GetMaxRecoil(), self:GetMaxSideRecoil()
end

function SWEP:ProcessRecoil()
	if self:GetMaxRecoil() == 0 then
		self:SetRecoil( 0 )
		self:SetSideRecoil( 0 )
		self:RecalculatePunch()
		return
	end

	-- linear; only the end users should use ease
	local t = self:GetRecoilTimeFrac()
	self:SetRecoilFrac(t)

	self.UnpredRecoilFrac = IsFirstTimePredicted() and t or self.UnpredRecoilFrac

	local recFrac = 1 - t

	local newRec = math.Round(math.max(self:GetMaxRecoil() * recFrac, 0), 5)
	local newSideRec = math.Round(math.max(self:GetMaxSideRecoil() * recFrac, 0), 5)

	--if IsFirstTimePredicted() then print(self:GetMaxRecoil()) end
	self:SetRecoil( newRec )
	self:SetSideRecoil( newSideRec )

	if recFrac == 0 then
		-- self:SetMaxRecoil(0)
		self:SetRecoil( 0 )
	end

	if recFrac == 0 then
		-- self:SetMaxSideRecoil(0)
		self:SetSideRecoil( 0 )
	end

	self:RecalculatePunch()
end

function SWEP:AddRecoil(amt)

end

function SWEP:InSprint()
	local owner = self:GetOwner()
	if !owner:KeyDown(IN_SPEED) then return false end
	if !owner:OnGround() then return false end

	local sm = self.SpeedMult * self:GetBuff_Mult("Mult_SpeedMult") * self:GetBuff_Mult("Mult_MoveSpeed")

	sm = math.Clamp(sm, 0, 1)

	local sprintspeed = owner:GetRunSpeed() * sm
	local walkspeed = owner:GetWalkSpeed() * sm

	local curspeed = owner:GetVelocity():Length()

	if TTT2 and owner.isSprinting == true then
		return (owner.sprintProgress or 0) > 0 and owner:KeyDown(IN_SPEED) and curspeed > walkspeed and owner:OnGround()
	end

	if curspeed < Lerp(0.25, walkspeed, sprintspeed) then return false end

	return true
end

SWEP.LastTriggerTime = 0
SWEP.LastTriggerDuration = 0
function SWEP:GetTriggerDelta()
	if self.LastTriggerTime == -1 then return 0 end
	return math.Clamp((CurTime() - self.LastTriggerTime) / self.LastTriggerDuration, 0, 1)
end

function SWEP:DoTriggerDelay()
	local shouldHold = self:GetOwner():KeyDown(IN_ATTACK) and (!self.Sprinted or self:GetState() != ArcCW.STATE_SPRINT)

	if self.LastTriggerTime == -1 then
		if !shouldHold then
			self.LastTriggerTime = 0 -- Good to fire again
			self.LastTriggerDuration = 0
		end
		return
	end

	if self:GetBurstCount() > 0 and self:GetCurrentFiremode().Mode == 1 then
		self.LastTriggerTime = -1 -- Cannot fire again until trigger released
		self.LastTriggerDuration = 0
	elseif self.LastTriggerTime > 0 and !shouldHold then
		-- Attack key is released. Stop the animation and clear progress
		local anim = self:SelectAnimation("untrigger")
		if anim then
			self:PlayAnimation(anim, self:GetBuff_Mult("Mult_TriggerDelayTime"), true, 0)
			--self:SetNextPrimaryFire(CurTime() + self:GetAnimKeyTime(anim))
		else
			self:PlayIdleAnimation(true)
		end
		self.LastTriggerTime = 0
		self.LastTriggerDuration = 0
		return
	elseif self:GetNextPrimaryFire() < CurTime() and self.LastTriggerTime == 0 and shouldHold then
		-- We haven't played the animation yet. Pull it!
		local anim = self:SelectAnimation("trigger")
		self:PlayAnimation(anim, self:GetBuff_Mult("Mult_TriggerDelayTime"), true, 0)
		self.LastTriggerTime = CurTime()
		self.LastTriggerDuration = self:GetAnimKeyTime(anim, true) * self:GetBuff_Mult("Mult_TriggerDelayTime")
	end
end
