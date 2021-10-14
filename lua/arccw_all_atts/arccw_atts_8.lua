local Material = ArcCW.AttachmentMat

------
-- mw2_ubgl_masterkey.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_ubgl_masterkey")

	att.PrintName = "Shotgun"
	att.Icon = Material("entities/acwatt_mw2_ubgl_masterkey.png", "smooth")
	att.Description = "Weapon-exclusive underbarrel shotgun with its own unique animations."
	att.Desc_Pros = {
		"pro.ubsg",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
		"info.toggleubgl"
	}
	att.AutoStats = true
	att.Slot = "mw2_ubgl"

	att.SortOrder = 1738 - 0.1

	att.MountPositionOverride = 0

	att.UBGL = true
	att.UBGL_BaseAnims = true

	att.UBGL_PrintName = "UB (BUCK)"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_m3"
	att.UBGL_ClipSize = 4
	att.UBGL_Ammo = "buckshot"
	att.UBGL_RPM = 1200
	att.UBGL_Recoil = 0
	att.UBGL_Capacity = 4

	att.AddSuffix = " w/ Shotgun"

	att.Hook_ShouldNotSight = function(wep)
		return wep:GetInUBGL()
	end

	local function Ammo(wep)
		return wep.Owner:GetAmmoCount("buckshot")
	end

	att.UBGL_Fire = function(wep, ubgl)
		if wep:GetMW2Masterkey_Reloading() then
			MW2Masterkey_ReloadFinish(wep)
			return
		end
		if wep:GetMW2Masterkey_NeedPump() then return end
		if wep:Clip2() <= 0 then return end

		wep:PlayAnimation("alt_fire_masterkey", 1, true, nil, nil, nil, true)
	    wep:SetWeaponOpDelay(CurTime() + 0.43)

		wep.Owner:FireBullets({
			Src = wep.Owner:EyePos(),
			Num = 6,
			Damage = 25,
			Force = 2,
			Attacker = wep.Owner,
			Dir = wep.Owner:EyeAngles():Forward(),
			Spread = Vector(0.1, 0.1, 0),
			Callback = function(_, tr, dmg)
				local dist = (tr.HitPos - tr.StartPos):Length() * ArcCW.HUToM

				local dmgmax = 25
				local dmgmin = 0

				local delta = dist / 1750 * 0.025

				delta = math.Clamp(delta, 0, 1)

				local amt = Lerp(delta, dmgmax, dmgmin)

				dmg:SetDamage(amt)
			end
		})

		wep:EmitSound("weapons/fesiugmw2/fire/shot_attach.wav", 100)

		wep:SetClip2(wep:Clip2() - 1)

		wep:DoEffects()
		wep:SetMW2Masterkey_NeedPump(true)
	end

	att.UBGL_Reload = function(wep, ubgl)
		if wep:Clip2() >= 4 then return end
		if Ammo(wep) <= 0 then return end
		if wep:GetMW2Masterkey_Reloading() then return end

		MW2Masterkey_ReloadStart(wep)
		wep:SetMW2Masterkey_Reloading(true)
	end

	att.Hook_Think = function(wep)
		if wep:GetMW2Masterkey_NeedPump() and wep:GetWeaponOpDelay() <= CurTime() and wep:Clip2() > 0 and !wep:GetMW2Masterkey_Reloading() and !wep.Owner:KeyDown(IN_ATTACK) then
			wep:PlayAnimation("alt_cycle_masterkey", 1, true, nil, nil, nil, true)
			wep:SetReloading(CurTime() + 15/30)
			wep:SetMW2Masterkey_NeedPump(false)
		end
		if wep:GetMW2Masterkey_Reloading() and wep:GetMW2Masterkey_ReloadingTimer() < CurTime() and wep:Clip2() >= 4 then
			MW2Masterkey_ReloadFinish(wep)
		elseif wep:GetMW2Masterkey_Reloading() and wep:GetMW2Masterkey_ReloadingTimer() < CurTime() and wep:Clip2() < 4 then
			MW2Masterkey_ReloadLoop(wep)
		end

	    if wep:GetMW2Masterkey_ShellInsertTime() < CurTime() and wep:GetMW2Masterkey_ShellInsertTime() != 0 then
		    MW2Masterkey_InsertShell(wep)
	        wep:SetMW2Masterkey_ShellInsertTime(0)
	    end
	end

	function MW2Masterkey_ReloadStart(wep)
		wep:PlayAnimation("alt_reload_start_masterkey", 1, true, nil, nil, nil, true)
		wep:SetReloading(CurTime() + 1)
		wep:SetMW2Masterkey_ReloadingTimer(CurTime() + 1)
	    wep:SetMW2Masterkey_ShellInsertTime(CurTime() + 0.6)
		wep:SetMW2Masterkey_Reloading(true)
	end

	function MW2Masterkey_ReloadLoop(wep)
		wep:PlayAnimation("alt_reload_loop_masterkey", 1, true, nil, nil, nil, true)
		wep:SetReloading(CurTime() + 0.75)
		wep:SetMW2Masterkey_ReloadingTimer(CurTime() + 0.75)
	    wep:SetMW2Masterkey_ShellInsertTime(CurTime() + 0.55)
	end

	function MW2Masterkey_ReloadFinish(wep)
		wep:PlayAnimation("alt_reload_finish_masterkey", 1, true, nil, nil, nil, true)
		wep:SetReloading(CurTime() + 1.35)
		wep:SetMW2Masterkey_Reloading(false)
		wep:SetMW2Masterkey_NeedPump(false)
	end

	function MW2Masterkey_InsertShell(wep)
		wep.Owner:RemoveAmmo(1, "buckshot")
		wep:SetClip2(wep:Clip2() + 1)
	end

	att.Mult_SightTime = 1.25
	att.Mult_SpeedMult = 0.8
	att.Mult_SightedSpeedMult = 0.85
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_wepcamo_arctic.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_wepcamo_arctic")

	att.PrintName = "Arctic"
	att.Icon = Material("entities/mw2_wepcamo_arctic.png", "smooth"
	)
	att.Description = "Arctic camouflage finish."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Slot = "mw2_wepcamo"
	att.Free = true

	att.ActivateElements = {"wepcamo-arctic"}

	att.SortOrder = 2 *-1
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_wepcamo_blackout.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_wepcamo_blackout")

	att.PrintName = "Blackout"
	att.Icon = Material("entities/mw2_wepcamo_blackout.png", "smooth"
	)
	att.Description = "Pure black paint finish.\nUnofficial."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Slot = "mw2_wepcamo"
	att.Free = true

	att.ActivateElements = {"wepcamo-blackout"}

	att.SortOrder = 10 *-1
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_wepcamo_bluetiger.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_wepcamo_bluetiger")

	att.PrintName = "Blue Tiger"
	att.Icon = Material("entities/mw2_wepcamo_bluetiger.png", "smooth"
	)
	att.Description = "Blue tiger stripe camouflage finish."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Slot = "mw2_wepcamo"
	att.Free = true

	att.ActivateElements = {"wepcamo-bluetiger"}

	att.SortOrder = 6 *-1
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_wepcamo_bushdweller.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_wepcamo_bushdweller")

	att.PrintName = "Bushdweller"
	att.Icon = Material("entities/mw2_wepcamo_bushdweller.png", "smooth"
	)
	att.Description = "Classic woodland camouflage finish.\nUnofficial."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Slot = "mw2_wepcamo"
	att.Free = true

	att.ActivateElements = {"wepcamo-bushdweller"}

	att.SortOrder = 11 *-1
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_wepcamo_desert.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_wepcamo_desert")

	att.PrintName = "Desert"
	att.Icon = Material("entities/mw2_wepcamo_desert.png", "smooth"
	)
	att.Description = "Tan desert camouflage finish."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Slot = "mw2_wepcamo"
	att.Free = true

	att.ActivateElements = {"wepcamo-desert"}

	att.SortOrder = 1 *-1
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_wepcamo_digital.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_wepcamo_digital")

	att.PrintName = "Digital"
	att.Icon = Material("entities/mw2_wepcamo_digital.png", "smooth"
	)
	att.Description = "Digtial camouflage finish."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Slot = "mw2_wepcamo"
	att.Free = true

	att.ActivateElements = {"wepcamo-digital"}

	att.SortOrder = 4 *-1
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_wepcamo_fall.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_wepcamo_fall")

	att.PrintName = "Fall"
	att.Icon = Material("entities/mw2_wepcamo_fall.png", "smooth"
	)
	att.Description = "Orange fall camouflage finish."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Slot = "mw2_wepcamo"
	att.Free = true

	att.ActivateElements = {"wepcamo-fall"}

	att.SortOrder = 8 *-1
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_wepcamo_redtiger.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_wepcamo_redtiger")

	att.PrintName = "Red Tiger"
	att.Icon = Material("entities/mw2_wepcamo_redtiger.png", "smooth"
	)
	att.Description = "Red tiger stripe camouflage finish."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Slot = "mw2_wepcamo"
	att.Free = true

	att.ActivateElements = {"wepcamo-redtiger"}

	att.SortOrder = 7 *-1
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_wepcamo_thunderstorm.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_wepcamo_thunderstorm")

	att.PrintName = "Thunderstorm"
	att.Icon = Material("entities/mw2_wepcamo_thunderstorm.png", "smooth"
	)
	att.Description = "Flashy.\nUnofficial."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Slot = "mw2_wepcamo"
	att.Free = true

	att.ActivateElements = {"wepcamo-thunderstorm"}

	att.SortOrder = 12 *-1
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_wepcamo_urban.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_wepcamo_urban")

	att.PrintName = "Urban"
	att.Icon = Material("entities/mw2_wepcamo_urban.png", "smooth"
	)
	att.Description = "Red urban camouflage finish."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Slot = "mw2_wepcamo"
	att.Free = true

	att.ActivateElements = {"wepcamo-urban"}

	att.SortOrder = 5 *-1
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_wepcamo_whiteout.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_wepcamo_whiteout")

	att.PrintName = "Whiteout"
	att.Icon = Material("entities/mw2_wepcamo_whiteout.png", "smooth"
	)
	att.Description = "Pure white paint finish.\nUnofficial."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Slot = "mw2_wepcamo"
	att.Free = true

	att.ActivateElements = {"wepcamo-whiteout"}

	att.SortOrder = 9 *-1
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_wepcamo_woodland.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_wepcamo_woodland")

	att.PrintName = "Woodland"
	att.Icon = Material("entities/mw2_wepcamo_woodland.png", "smooth"
	)
	att.Description = "Green woodland camouflage finish."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Slot = "mw2_wepcamo"
	att.Free = true

	att.ActivateElements = {"wepcamo-woodland"}

	att.SortOrder = 3 *-1
	ArcCW.LoadAttachmentType(att)
end

------
-- mw2_wepedit_ak47_cod.lua
------

do
	local att = {}
	ArcCW.SetShortName("mw2_wepedit_ak47_cod")

	att.PrintName = "Of Wood and Steel"
	att.Icon = Material("entities/acwatt_mw2_wepedit_ak47_cod.png", "smooth"
	)
	att.Description = "Call of Duty 4's AK-47, loaded into memory in MW2 Multiplayer."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Slot = "mw2_wepedit_ak47"
	att.Free = true

	att.ActivateElements = {"wepcamo-ak47_cod4","altirons"}

	att.SortOrder = 20 *-1

	att.Hook_GetShootSound = function(wep, sound)
	    if sound == "weapons/fesiugmw2/fire/ak47.wav" then return "weapons/fesiugmw2/organizelater/weap_ak47_slst_3.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_acog.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_acog")

	att.PrintName = "ACOG (3x)"
	att.Icon = Material("entities/acwatt_optic_acog.png")
	att.Description = "Magnified medium-range optic. ACOG stands for 'Advanced Combat Optical Gunsight'."

	att.SortOrder = 3

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw/atts/acog.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(-0.025, 12, -1.403),
	        Ang = Angle(0, 0, 0),
	        Magnification = 2,
	        IgnoreExtra = true
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/acog.png")
	att.HolosightFlare = Material("hud/scopes/acog_flare.png")
	att.HolosightSize = 10
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw/atts/acog_hsp.mdl"
	att.Colorable = true

	att.HolosightBlackbox = true

	att.HolosightMagnification = 3

	att.Mult_SightTime = 1.12
	att.Mult_SightedSpeedMult = 0.92
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_aimpoint.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_aimpoint")

	att.PrintName = "Aimpoint (RDS)"
	att.Icon = Material("entities/acwatt_optic_aimpoint.png")
	att.Description = "Tube-based red dot sight for rifles."

	att.SortOrder = 0

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw/atts/aimpoint.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 7, -1.43107 * 0.75),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("holosights/dot.png")
	att.HolosightSize = 0.3
	att.HolosightBone = "holosight"

	att.Mult_SightTime = 1.05

	att.Colorable = true
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_aug_scope.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_aug_scope")

	att.PrintName = "Integral Scope (1.5-3x)"
	att.Icon = Material("entities/acwatt_optic_aug_scope.png")
	att.Description = "Integrated scope designed specifically for a single weapon. Superior ergonomics compared to modular scopes. Includes a backup iron sight."

	att.SortOrder = 100

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "info.togglesight"
	}
	att.AutoStats = true
	att.Slot = "optic_aug_scope"

	att.Model = "models/weapons/arccw/atts/augscope.mdl"

	att.DroppedModel = "models/Items/BoxSRounds.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0.02, 10.064, -6.738),
	        Ang = Angle(0, -2.842, -10.853),
	        Magnification = 2,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 3,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
	        HolosightBone = "scope",
	        HolosightData = {
	            Holosight = true,
	            HolosightReticle = Material("hud/scopes/circle.png"),
	            HolosightNoFlare = true,
	            HolosightSize = 15,
	            HolosightBlackbox = true,
	            HolosightMagnification = 3,
	            HolosightMagnificationMin = 1.5,
	            HolosightMagnificationMax = 3,
	            Colorable = true,
	            HolosightPiece = true
	        },
	        IgnoreExtra = true,
	    },
	    {
	        Pos = Vector(0.05, 10.064, -7.4),
	        Ang = Angle(0.5, -3.1, -10.853),
	        Magnification = 1.1,
	    },
	}

	att.ScopeGlint = true

	att.HolosightPiece = "models/weapons/arccw/atts/augscope_hsp.mdl"

	att.Mult_SightTime = 1.05
	att.Mult_SightedSpeedMult = 0.95
	att.Mult_SpeedMult = 0.97
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_cheytacscope.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_cheytacscope")

	att.PrintName = "CheyTac (2-4.3x)"
	att.Icon = Material("entities/acwatt_optic_cheytacscope.png", "smooth")
	att.Description = "Good scope. Gooood scope."

	att.SortOrder = 4.3

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"optic","optic_sniper"}

	att.Model 			= "models/weapons/arccw/fesiugmw2/atts/cheytacscope_3b.mdl"
	att.HolosightPiece 	= "models/weapons/arccw/fesiugmw2/atts/cheytacscope_2b_hsp.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 12, -1.5),
	        Ang = Angle(0, 0, 0),
	        ViewModelFOV = 65 / 2.25,
	        Magnification = 2.25,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 6,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
	        IgnoreExtra = true
	    }
	}

	att.ScopeGlint = true

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/m40a3.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 25
	att.HolosightBone = "holosight"
	att.Colorable = false

	att.HolosightMagnification = 4.3
	att.HolosightBlackbox = true

	att.HolosightMagnificationMin = 2
	att.HolosightMagnificationMax = 4.3

	att.Mult_SightTime = 1.15
	att.Mult_SightedSpeedMult = 0.9
	att.Mult_SpeedMult = 0.98
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_delta.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_delta")

	att.PrintName = "Delta (LP)"
	att.Icon = Material("entities/acwatt_optic_delta.png")
	att.Description = "Low-profile red dot sight for pistols, with dot reticle."

	att.SortOrder = -0.5

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic_lp"

	att.Model = "models/weapons/arccw/atts/delta.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 7, -0.7),
	        Ang = Angle(0, -0.1, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("holosights/dot.png")
	att.HolosightSize = 0.4
	att.HolosightBone = "holosight"

	att.Colorable = true
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_delta_backup.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_delta_backup")

	att.PrintName = "Canted Delta (RDS)"
	att.Icon = Material("entities/acwatt_optic_delta.png")
	att.Description = "Backup red dot sight on 45 degree mount for use in combination with magnified optics."
	att.InvAtt = "optic_delta"

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "info.togglesight"
	}
	att.AutoStats = true
	att.Slot = "backup"

	att.Model = "models/weapons/arccw/atts/backup.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0.2, 14, -1.45),
	        Ang = Angle(0, 0, 45),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("holosights/dot.png")
	att.HolosightSize = 0.4
	att.HolosightBone = "holosight"

	att.Mult_SightTime = 1.1

	att.Colorable = true
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_docter.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_docter")

	att.PrintName = "Docter (LP)"
	att.Icon = Material("entities/acwatt_optic_docter.png")
	att.Description = "Low-profile pistol sight with triangular sight."

	att.SortOrder = -0.5

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic_lp"

	att.Model = "models/weapons/arccw/atts/docter.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 7, -0.579),
	        Ang = Angle(0, -0.1, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("holosights/delta.png")
	att.HolosightSize = 0.5
	att.HolosightBone = "holosight"

	att.Colorable = true
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_farview.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_farview")

	att.PrintName = "Farview (4-9x)"
	att.Icon = Material("entities/acwatt_optic_farview.png")
	att.Description = "High-magnification sniper rifle scope for long range combat."

	att.SortOrder = 9

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic_sniper"

	att.GivesFlags = {"hugesight"}

	att.Model = "models/weapons/arccw/atts/farview.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 18, -1.5),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.8,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 12,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
	        IgnoreExtra = true
	    }
	}

	att.ScopeGlint = true

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/mildot.png", "smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 32
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw/atts/farview_hsp.mdl"
	att.Colorable = true

	att.HolosightMagnification = 3
	att.HolosightBlackbox = true

	att.HolosightConstDist = 64

	att.HolosightMagnificationMin = 3
	att.HolosightMagnificationMax = 9

	att.Mult_SightTime = 1.35
	att.Mult_SightedSpeedMult = 0.8
	att.Mult_SpeedMult = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_hamr.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_hamr")

	att.PrintName = "HAMR (2.7x)"
	att.Icon = Material("entities/acwatt_optic_hamr.png")
	att.Description = "Zoom scope with integrated red dot sight. Slightly heavier than similar scopes."

	att.SortOrder = 2.7

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "info.togglesight"
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw/atts/hamr.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 20, -1.525),
	        Ang = Angle(0, 0, 0),
	        Magnification = 2,
	        ScopeMagnification = 2.7,
	        HolosightBone = "scope",
	        HolosightData = {
	            Holosight = true,
	            HolosightMagnification = 2.7,
	            HolosightReticle = Material("hud/scopes/hamr.png"),
	            HolosightNoFlare = true,
	            HolosightSize = 8,
	            HolosightBlackbox = true,
	            Colorable = true,
	            HolosightPiece = "models/weapons/arccw/atts/hamr_hsp.mdl"
	        },
	        IgnoreExtra = true
	    },
	    {
	        Pos = Vector(0, 10, -3.05),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.5,
	        HolosightBone = "holosight",
	        HolosightData = {
	            Holosight = true,
	            HolosightReticle =  Material("holosights/dot.png"),
	            HolosightSize = 0.5,
	            Colorable = true,
	            HolosightNoHSP = true
	        }
	    },
	}

	att.Holosight = true
	att.HolosightPiece = "models/weapons/arccw/atts/hamr_hsp.mdl"

	att.Mult_SightTime = 1.15
	att.Mult_SightedSpeedMult = 0.9

	att.ColorOptionsTable = {
	    Color(255, 50, 50),
	    Color(50, 255, 50)
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_holo.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_holo")

	att.PrintName = "Holographic (HOLO)"
	att.Icon = Material("entities/acwatt_optic_holo.png")
	att.Description = "Boxy holographic sight designed for rifles."

	att.SortOrder = 0.5

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw/atts/eotech.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 7, -1.433),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.25,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("holosights/eotech.png", "mips smooth")
	att.HolosightFlare = Material("holosights/eotech_flare.png", "mips smooth")
	att.HolosightSize = 1.5
	att.HolosightBone = "holosight"
	att.Colorable = true

	att.Mult_SightTime = 1.075
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_hunter.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_hunter")

	att.PrintName = "Hunter (2-5x)"
	att.Icon = Material("entities/acwatt_optic_hunter.png")
	att.Description = "Adjustable medium-long range sniper optic."

	att.SortOrder = 5

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic_sniper"

	att.Model = "models/weapons/arccw/atts/hunter.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 15, -1.055),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.8,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 6,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
	        IgnoreExtra = true
	    }
	}

	att.ScopeGlint = true

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/duplex.png")
	att.HolosightNoFlare = true
	att.HolosightSize = 14
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw/atts/hunter_hsp.mdl"
	att.Colorable = true

	att.HolosightMagnification = 3
	att.HolosightBlackbox = true

	att.HolosightMagnificationMin = 2
	att.HolosightMagnificationMax = 5

	att.Mult_SightTime = 1.15
	att.Mult_SightedSpeedMult = 0.9
	att.Mult_SpeedMult = 0.98
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_irons_alt.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_irons_alt")

	att.PrintName = "Precision Irons"
	att.Icon = Material("entities/acwatt_optic_irons_alt.png")
	att.Description = "Alternate iron sight set up for greater precision but with a reduced field of view."

	att.SortOrder = 100
	att.Free = true

	att.Desc_Pros = {
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	    "con.fov"
	}
	att.Slot = "irons_alt"
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_kobra.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_kobra")

	att.PrintName = "Kobra (HOLO)"
	att.Icon = Material("entities/acwatt_optic_kobra.png")
	att.Description = "Russian holographic sight with three-prong reticle."

	att.SortOrder = 0.5

	att.ModelOffset = Vector(0, 0, -0.1)

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw/atts/kobra.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 7, -1.011),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.25,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("holosights/kobra.png", "smooth")
	att.HolosightFlare = Material("holosights/kobra_flare.png", "smooth")
	att.HolosightSize = 2
	att.HolosightBone = "holosight"

	att.Mult_SightTime = 1.05

	att.Colorable = true
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_m82scope.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_m82scope")

	att.PrintName = "Barrett (2-4.3x)"
	att.Icon = Material("entities/acwatt_optic_m82scope.png", "smooth")
	att.Description = "Good scope. Gooood scope."

	att.SortOrder = 4.3

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"optic","optic_sniper"}

	att.Model 			= "models/weapons/arccw/fesiugmw2/atts/m82_4.mdl"
	att.HolosightPiece 	= "models/weapons/arccw/fesiugmw2/atts/m82_3_hsp.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0.0231, 11, -1.01),
	        Ang = Angle(0, 0, 0),
	        ViewModelFOV = 65 / 2.25,
	        Magnification = 2.25,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 6,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
	        IgnoreExtra = true
	    }
	}

	att.ScopeGlint = true

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/m40a3.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 25
	att.HolosightBone = "holosight"
	att.Colorable = false

	att.HolosightMagnification = 4.3
	att.HolosightBlackbox = true

	att.HolosightMagnificationMin = 2
	att.HolosightMagnificationMax = 4.3

	att.Mult_SightTime = 1.15
	att.Mult_SightedSpeedMult = 0.9
	att.Mult_SpeedMult = 0.98

	att.ModelOffset = Vector(-2.6, 0, -0.55)
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_magnus.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_magnus")

	att.PrintName = "Magnus (3-6x)"
	att.Icon = Material("entities/acwatt_optic_magnus.png")
	att.Description = "Sniper rifle optic with the ability to be adjusted between long and medium range magnification options."

	att.SortOrder = 6

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic_sniper"

	att.Model = "models/weapons/arccw/atts/magnus.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 15, -1.489),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.8,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 6,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
	        IgnoreExtra = true
	    }
	}

	att.ScopeGlint = true

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/rangefinder.png", "smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 15
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw/atts/magnus_hsp.mdl"
	att.Colorable = true

	att.HolosightMagnification = 3
	att.HolosightBlackbox = true

	att.HolosightMagnificationMin = 3
	att.HolosightMagnificationMax = 6

	att.Mult_SightTime = 1.25
	att.Mult_SightedSpeedMult = 0.85
	att.Mult_SpeedMult = 0.94
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_micro.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_micro")

	att.PrintName = "Micro (2x)"
	att.Icon = Material("entities/acwatt_optic_micro.png")
	att.Description = "Miniature optic intended for low-magnification applications and close combat. Very lightweight."

	att.SortOrder = 2

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw/atts/micro.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 10, -1.489),
	        Ang = Angle(0, 0, 0),
	        Magnification = 2,
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/circle.png", "smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 10
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw/atts/micro_hsp.mdl"

	att.HolosightMagnification = 2
	att.HolosightBlackbox = true

	att.Mult_SightTime = 1.08
	att.Mult_SightedSpeedMult = 0.94
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_mrs.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_mrs")

	att.PrintName = "MRS (HOLO)"
	att.Icon = Material("entities/acwatt_optic_mrs.png")
	att.Description = "Holographic sight with circle-cross reticle. Wide lens and open sight reticle make this sight optimal for close-range combat."

	att.SortOrder = 0.5

	att.ModelOffset = Vector(0, 0, -0.2)

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw/atts/mrs.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 4, -1.278),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("holosights/mrs.png", "smooth")
	att.HolosightFlare = Material("holosights/mrs_flare.png", "smooth")
	att.HolosightSize = 1.5
	att.HolosightBone = "holosight"

	att.Mult_SightTime = 1.05

	att.Colorable = true
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_mrs_dot.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_mrs_dot")

	att.PrintName = "MRS (RDS)"
	att.Icon = Material("entities/acwatt_optic_mrs.png")
	att.Description = "Holographic sight with dot reticle. Wide lens makes this sight optimal for close-range combat."

	att.SortOrder = 0

	att.ModelOffset = Vector(0, 0, -0.2)

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw/atts/mrs.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 4, -1.278),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}

	att.InvAtt = "optic_mrs"

	att.Holosight = true
	att.HolosightReticle = Material("holosights/dot.png")
	att.HolosightSize = 0.3
	att.HolosightBone = "holosight"

	att.Mult_SightTime = 1.05

	att.Colorable = true
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_mw2_acog.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_mw2_acog")

	att.PrintName = "ACOG (2.1x)"
	att.Icon = Material("entities/acwatt_optic_mw2_acog.png", "smooth")
	att.Description = "Magnified medium-range optic. ACOG stands for 'Advanced Combat Optical Gunsight'."

	att.SortOrder = 2.1

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "info.togglesight"
	}
	att.AutoStats = true
	att.Slot = {"optic"}

	att.Model = "models/weapons/arccw/fesiugmw2/atts/scopes/acog_2.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 10, -0.98),
	        Ang = Angle(0, 0, 0),
	        ViewModelFOV = 65 / 2.1,
	        Magnification = 2.1,
	        IgnoreExtra = true
	    },
	    {
	        Pos = Vector(0.62, 10, -1.5),
	        Ang = Angle(-0.8, 0, 0),
	        ViewModelFOV = 65 / 1.3,
	        Magnification = 1.3,
	        IgnoreExtra = true
	    },
	}

	att.ModelOffset = Vector(-1, 0, -0.1)

	att.Holosight = false

	att.Mult_SightTime = 1.12
	att.Mult_SightedSpeedMult = 0.92

	att.Hook_ModifyRecoil = function(wep)
	    return {VisualRecoilMult = wep:GetSightDelta()}
	end

	att.AddSuffix = " ACOG"
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_mw2_augscope.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_mw2_augscope")

	att.PrintName = "Swavorski (2.1x)"
	att.Icon = Material("entities/acwatt_optic_mw2_augscope.png", "smooth")
	att.Description = "Integrated telescopic scope created for the AUG."

	att.SortOrder = 2.1

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"optic"}

	att.Model = "models/weapons/arccw/fesiugmw2/atts/scopes/swavorski_base_2b.mdl"
	att.ModelOffset = Vector(-1, 0, 0)

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 11, -1.62),
	        Ang = Angle(0, 0, 0),
	        ViewModelFOV = 65 / 1.6,
	        Magnification = 1.6,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 12,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
	        IgnoreExtra = true
	    }
	}

	att.ScopeGlint = false

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/m40a3.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 14
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw/fesiugmw2/atts/scopes/swavorski_lens_2b.mdl"
	att.Colorable = false

	att.HolosightMagnification = 2.16
	att.HolosightBlackbox = true

	att.HolosightConstDist = 64

	att.Mult_SightTime = 1.12
	att.Mult_SightedSpeedMult = 0.92

	att.ModelRotate = Angle(0, 90, 0)

	att.AddSuffix = " Swavorski"
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_mw2_augscope_int.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_mw2_augscope_int")

	att.PrintName = "Swavorski INT (2.1x)"
	att.Icon = Material("entities/acwatt_optic_mw2_augscope.png", "smooth")
	att.Description = "Integrated telescopic scope created for the AUG."

	att.SortOrder = 1738

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"mw2_augscope"}
	att.InvAtt = "optic_mw2_augscope"

	att.Model = "models/weapons/arccw/fesiugmw2/atts/scopes/swavorski_base_2b.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 10, -1.62),
	        Ang = Angle(0, 0, 0),
	        ViewModelFOV = 65 / 1.6,
	        Magnification = 1.6,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 12,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
	        IgnoreExtra = true
	    }
	}

	att.ScopeGlint = false

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/m40a3.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 14
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw/fesiugmw2/atts/scopes/swavorski_lens_2b.mdl"
	att.Colorable = false

	att.HolosightMagnification = 2.16
	att.HolosightBlackbox = true

	att.HolosightConstDist = 64

	att.Mult_SightTime = 1.12
	att.Mult_SightedSpeedMult = 0.92

	att.ModelRotate = Angle(0, 90, 0)

	att.AddSuffix = " Swavorski"
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_mw2_holographic.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_mw2_holographic")

	att.PrintName = "Holographic Sight (HOLO)"
	att.Icon = Material("entities/acwatt_optic_mw2_eotech.png", "smooth")
	att.Description = "Boxy holographic sight used by special forces."

	att.SortOrder = 0.5

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"optic","optic_lp"}

	att.Model = "models/weapons/arccw/fesiugmw2/atts/scopes/eotech_1.mdl"
	att.ModelOffset = Vector(-1, 0, -0.1)

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 10, -1.16),
	        Ang = Angle(0, 0, 0),
	        ViewModelFOV = 65 / 1.3,
	        Magnification = 1.3,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        IgnoreExtra = true,
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("holosights/mw2_holo.png", "mips smooth")
	att.HolosightFlare = Material("holosights/mw2_holo_flare.png", "mips smooth")
	att.HolosightSize = 0.7
	att.HolosightBone = "holosight"

	att.Mult_SightTime = 1.075

	att.Colorable = true

	att.AddSuffix = " Holographic"
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_mw2_mars.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_mw2_mars")

	att.PrintName = "MARS (RDS)"
	att.Icon = Material("entities/acwatt_optic_mw2_mars.png", "smooth")
	att.Description = "Funny moon sight."

	att.SortOrder = 0

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model 			= "models/weapons/arccw/fesiugmw2/atts/scopes/mars_4.mdl"
	att.ModelOffset = Vector(-0.7, 0, -0.25)

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 10, -1.48),
	        Ang = Angle(0, 0, 0),
	        ViewModelFOV = 65 / 1.3,
	        Magnification = 1.3,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        IgnoreExtra = true,
	    }
	}

	att.ScopeGlint = false

	att.Holosight = true
	att.HolosightReticle = Material("holosights/mw2_reddot.png", "mips smooth")
	att.HolosightSize = 0.33
	att.HolosightBone = "holosight"

	att.Colorable = true

	att.Mult_SightTime = 1.05

	att.AddSuffix = " MARS"
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_mw2_mp5krearsight.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_mw2_mp5krearsight")

	att.PrintName = "Rearsight"
	att.Icon = Material("entities/acwatt_optic_mw2_mp5krearsight.png", "smooth")
	att.Description = "Alternative set of ironsights. Well, the addition of some."

	att.SortOrder = 100

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mw2_steyrrearsight"
	att.MountPositionOverride = 0

	att.Model = "models/weapons/arccw/fesiugmw2/atts/scopes/mp5k_rearsight_1.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 6.026, -0.5),
	        Ang = Angle(0.8, 0, 0),
	        ViewModelFOV = 65 / 1.3,
	        Magnification = 1.3,
	        IgnoreExtra = true
	    },
	}

	att.ModelOffset = Vector(-0.5, 0, -0.4)
	att.ModelScale  = Vector(0.9, 0.9, 0.9)

	att.Holosight = false
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_mw2_rds.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_mw2_rds")

	att.PrintName = "Red Dot Sight (RDS)"
	att.Icon = Material("entities/acwatt_optic_mw2_reddot.png", "smooth")
	att.Description = "Thin red dot sight used by special forces."

	att.SortOrder = 0

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"optic","optic_lp"}

	att.Model = "models/weapons/arccw/fesiugmw2/atts/scopes/reddot_2d.mdl"
	att.ModelOffset = Vector(-1, 0, -0.1)

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 10, -0.8),
	        Ang = Angle(0, 0, 0),
	        ViewModelFOV = 65 / 1.3,
	        Magnification = 1.3,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        IgnoreExtra = true,
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("holosights/mw2_reddot.png", "mips smooth")
	att.HolosightSize = 0.33
	att.HolosightBone = "holosight"

	att.Mult_SightTime = 1.05

	att.Colorable = true

	att.AddSuffix = " RDS"
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_mw2_susat.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_mw2_susat")

	att.PrintName = "SUSAT (2.1x)"
	att.Icon = Material("entities/acwatt_optic_mw2_susat.png", "smooth")
	att.Description = "Magnified medium-range optic that's just a worse ACOG"

	att.SortOrder = 2.1

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "info.togglesight"
	}
	att.AutoStats = true
	att.Slot = {"optic"}

	att.Model = "models/weapons/arccw/fesiugmw2/atts/scopes/susat_3.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(-0.015, 10, -1.54),
	        Ang = Angle(0, 0, 0),
	        ViewModelFOV = 65 / 2.1,
	        Magnification = 2.1,
	        IgnoreExtra = true
	    },
	    {
	        Pos = Vector(0, 10, -2.6),
	        Ang = Angle(1, 0, 0),
	        ViewModelFOV = 65 / 1.3,
	        Magnification = 1.3,
	        IgnoreExtra = true
	    },
	}

	att.ModelOffset = Vector(-0.35, 0, -0.32)

	att.Holosight = false

	att.Mult_SightTime = 1.12
	att.Mult_SightedSpeedMult = 0.92

	att.Hook_ModifyRecoil = function(wep)
	    return {VisualRecoilMult = wep:GetSightDelta()}
	end

	att.AddSuffix = " SUSAT"
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_mw2_thermal.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_mw2_thermal")

	att.PrintName = "Thermal (FLIR)"
	att.Icon = Material("entities/acwatt_optic_mw2_thermal.png", "smooth")
	att.Description = "thermal scope"

	att.SortOrder = 50

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	    "autostat.thermal"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model =				"models/weapons/arccw/fesiugmw2/atts/scopes/thermal_base.mdl"
	att.HolosightPiece =	"models/weapons/arccw/fesiugmw2/atts/scopes/thermal_lens.mdl"
	att.ModelOffset = Vector(0, 0, -0.2)

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 6.5, -0.8),
	        Ang = Angle(0, 0, 0),
	        ViewModelFOV = 65 / 1.9,
	        Magnification = 1.9,
	        Thermal = true,
	        IgnoreExtra = true,
	    }
	}

	att.ScopeGlint = true

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/mw2_thermal.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 16
	att.HolosightBone = "holosight"

	att.HolosightMagnification = 2.1
	att.HolosightBlackbox = true

	att.HolosightConstDist = 42

	att.Mult_SightTime = 1.2
	att.Mult_SightedSpeedMult = 0.85
	att.Mult_SpeedMult = 0.95

	att.AddSuffix = " Thermal"
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_mw2_tuna.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_mw2_tuna")

	att.PrintName = "Tuna (RDS)"
	att.Icon = Material("entities/acwatt_optic_tuna.png", "smooth")
	att.Description = "Integrated telescopic scope created for the F2000."

	att.SortOrder = 0

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model 			= "models/weapons/arccw/fesiugmw2/atts/scopes/tuna_2.mdl"
	att.ModelOffset = Vector(-1, 0, -0.3)

	att.AdditionalSights = {
	    {
	        Pos = Vector(-0, 10, -1),
	        Ang = Angle(0, 0, 0),
	        ViewModelFOV = 65 / 1.3,
	        Magnification = 1.3,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        IgnoreExtra = true,
	    }
	}

	att.ScopeGlint = false

	att.Holosight = true
	att.HolosightReticle = Material("holosights/mw2_reddot.png", "mips smooth")
	att.HolosightSize = 0.3
	att.HolosightBone = "holosight"

	att.Colorable = true

	att.Mult_SightTime = 1.05

	att.AddSuffix = " Tuna"
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_okp.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_okp")

	att.PrintName = "OKP-7 (HOLO)"
	att.Icon = Material("entities/acwatt_optic_okp.png")
	att.Description = "Russian holographic sight with chevron reticle."

	att.SortOrder = 0.5

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw/atts/okp.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 7, -0.867),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("holosights/okp7.png")
	att.HolosightNoFlare = true
	att.HolosightSize = 1.8
	att.HolosightBone = "holosight"

	att.Mult_SightTime = 1.05

	att.Colorable = true
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_p90_ring.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_p90_ring")

	att.PrintName = "Integral Ring (HOLO)"
	att.Icon = Material("entities/acwatt_optic_p90_ring.png")
	att.Description = "Integrated scope designed specifically for a single weapon. Superior ergonomics compared to modular scopes."

	att.SortOrder = 100

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.Slot = "optic_p90_ring"

	att.Model = "models/weapons/arccw/atts/p90_ringsight.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(-0.1, 0, -7.45),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/p90ring.png")
	att.HolosightNoFlare = true
	att.HolosightSize = 1.5
	att.HolosightBone = "holosight"
	att.Colorable = true

	att.Mult_SightTime = 1
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_reflex.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_reflex")

	att.PrintName = "Reflex (RDS)"
	att.Icon = Material("entities/acwatt_optic_reflex.png")
	att.Description = "Lightweight reflex sight for rifles. Small frame allows for high ergonomics."

	att.SortOrder = 0

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw/atts/reflex.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 5, -1.208),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("holosights/dot.png")
	att.HolosightSize = 0.3
	att.HolosightBone = "holosight"

	att.Mult_SightTime = 1.025

	att.Colorable = true
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_t1.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_t1")

	att.PrintName = "T-1 (LP)"
	att.Icon = Material("entities/acwatt_optic_t1.png")
	att.Description = "Mid-profile red dot sight with magnification properties."

	att.SortOrder = -0.5

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic_lp"

	att.Model = "models/weapons/arccw/atts/t1.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 4, -0.594),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.4,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("holosights/dot.png")
	att.HolosightSize = 0.3
	att.HolosightBone = "holosight"

	att.HolosightMagnification = 1

	att.Mult_SightTime = 1.03

	att.Colorable = true
	ArcCW.LoadAttachmentType(att)
end

------
-- optic_vampire.lua
------

do
	local att = {}
	ArcCW.SetShortName("optic_vampire")

	att.PrintName = "Vampire (FLIR)"
	att.Icon = Material("entities/acwatt_optic_vampire.png")
	att.Description = "Heavy infrared thermal vision scope. Capable of highlighting targets in white. Complex electronics require bulky chassis."

	att.SortOrder = 50

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom",
	    "autostat.thermal"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw/atts/vampire.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 14, -1.55),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.75,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 4,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
	        Thermal = true,
	        IgnoreExtra = true,
	    }
	}

	att.ScopeGlint = true

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/thermal.png", "smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 16
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw/atts/vampire_hsp.mdl"

	att.HolosightMagnification = 2
	att.HolosightBlackbox = true

	att.HolosightConstDist = 42

	att.HolosightMagnificationMin = 1.1
	att.HolosightMagnificationMax = 3

	att.Mult_SightTime = 1.4
	att.Mult_SightedSpeedMult = 0.75
	att.Mult_SpeedMult = 0.875
	ArcCW.LoadAttachmentType(att)
end

------
-- perk_extendedmags.lua
------

do
	local att = {}
	ArcCW.SetShortName("perk_extendedmags")

	att.PrintName = "American Action Hero"
	att.Icon = Material("entities/acwatt_perk_extendedmags.png")
	att.Description = "High-capacity magazines allow for more time before needing to reload, but slow down reloading and add weight."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"ammo_shotgun", "ammo_bullet"}

	att.Mult_ReloadTime = 1.25
	att.MagExtender = true

	att.ActivateElements = {"extendedmag"}

	att.Mult_SightTime = 1.15

	att.Mult_HipDispersion = 1.25

	att.Hook_Compatible = function(wep)
	    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- perk_fastreload.lua
------

do
	local att = {}
	ArcCW.SetShortName("perk_fastreload")

	att.PrintName = "Rushed Reloading"
	att.Icon = Material("entities/acwatt_perk_fastreload.png")
	att.Description = "Improves reloading speed by 15% through improved magwell design."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "perk"

	att.Mult_ReloadTime = 0.85
	ArcCW.LoadAttachmentType(att)
end

------
-- perk_fmj.lua
------

do
	local att = {}
	ArcCW.SetShortName("perk_fmj")

	att.PrintName = "FMJ"
	att.Icon = Material("entities/acwatt_perk_fmj.png", "smooth")
	att.Hidden = true
	att.Desc_Cons = {
		"Increased muzzle flash",
	}
	att.Description = "Increased bullet penetration."
	att.AutoStats = true
	att.Ignore = false
	att.Slot = "perk"

	att.Mult_Penetration = 2
	att.Override_MuzzleEffect = "muzzleflash_pistol_deagle"
	ArcCW.LoadAttachmentType(att)
end

------
-- perk_heatair.lua
------

do
	local att = {}
	ArcCW.SetShortName("perk_heatair")

	att.PrintName = "Air Time"
	att.Icon = Material("entities/acwatt_perk_heatair.png", "smooth mips")
	att.Description = "Let it air! Heat will dissipate almost instantly, but slower. In addition, heat is vented from the gun and converted back into gas, increasing the cyclic rate."

	att.Desc_Pros = {"pro.gsoe.heat_fast"}

	att.Desc_Cons = {}

	att.Slot = {"perk", "go_perk"}

	att.NotForNPC = true
	att.SortOrder = 1
	att.AutoStats = true
	att.Mult_HeatDelayTime = 0.15
	att.Mult_HeatDissipation = 0.5
	att.Mult_HeatCapacity = 0.5

	att.Hook_Compatible = function(wep)
	    if not (wep.Jamming or wep:GetBuff_Override("Override_Jamming")) then return false end
	end

	att.M_Hook_Mult_RPM = function(wep, data)
	    data.mult = (data.mult + (wep:GetHeat() / wep:GetMaxHeat()) * 0.5)
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- perk_heatcap.lua
------

do
	local att = {}
	ArcCW.SetShortName("perk_heatcap")

	att.PrintName = "Man On Fire"
	att.Icon = Material("entities/acwatt_perk_heatcap.png", "smooth mips")
	att.Description = "Handle the heat! Heat capacity and disspiation rate is boosted, but heat reduces the cyclic rate."
	att.Desc_Pros = {}
	att.Desc_Cons = {} -- "con.gsoe.heat_slow"
	att.Slot = {"perk", "go_perk"}

	att.NotForNPC = true

	att.SortOrder = 1

	att.AutoStats = true
	att.Mult_HeatCapacity = 1.5
	att.Mult_HeatDissipation = 1.5
	--att.Mult_FixTime = 0.5
	--att.Override_HeatFix = true

	att.Hook_Compatible = function(wep)
	    if !(wep.Jamming or wep:GetBuff_Override("Override_Jamming")) then return false end
	end

	--[[]
	att.M_Hook_Mult_RPM = function(wep, data)
	    data.mult = (data.mult - (wep:GetHeat() / wep:GetMaxHeat()) * 0.25 )
	end
	]]
	ArcCW.LoadAttachmentType(att)
end

------
-- perk_heatcool.lua
------

do
	local att = {}
	ArcCW.SetShortName("perk_heatcool")

	att.PrintName = "Cool Head"
	att.Icon = Material("entities/acwatt_perk_heatcool.png", "smooth mips")
	att.Description = "Stay cool! Heat will dissipate quicker and sooner."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Slot = {"perk", "go_perk"}

	att.NotForNPC = true

	att.SortOrder = 1

	att.AutoStats = true
	att.Mult_HeatDelayTime = 0.7
	att.Mult_HeatDissipation = 1.5

	att.Hook_Compatible = function(wep)
	    if !(wep.Jamming or wep:GetBuff_Override("Override_Jamming")) then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- perk_heatfix.lua
------

do
	local att = {}
	ArcCW.SetShortName("perk_heatfix")

	att.PrintName = "Hot Wrench"
	att.Icon = Material("entities/acwatt_perk_heatfix.png", "smooth mips")
	att.Description = "Just bang on it! Overheating will be fixed instantly, but heat vents slower."
	att.Desc_Pros = {
	    "pro.gsoe.heat_fix"
	}
	att.Desc_Cons = {
	}
	att.Slot = {"perk", "go_perk"}

	att.NotForNPC = true

	att.SortOrder = 1

	att.AutoStats = true
	att.Mult_HeatDissipation = 0.5
	-- att.Mult_FixTime = 0.75
	att.Override_HeatFix = true

	att.Hook_Compatible = function(wep)
	    if !(wep.Jamming or wep:GetBuff_Override("Override_Jamming")) or !wep.Animations.fix then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- perk_heatoverdrive.lua
------

do
	local att = {}
	ArcCW.SetShortName("perk_heatoverdrive")

	att.PrintName = "Overdrive"
	att.Icon = Material("entities/acwatt_perk_heatair.png", "smooth mips")
	att.Description = "Insanely destructive modification to the weapon that enables it to tolerate insane amounts of weapon heat, spewing fire on both the user and the enemy as it goes."

	att.Desc_Pros = {
	    "pro.gsoe.overdrive.1",
	    "pro.gsoe.overdrive.2",
	    "pro.gsoe.overdrive.3",
	}

	att.Desc_Cons = {
	    "con.gsoe.overdrive.1",
	    "con.gsoe.overdrive.2",
	    "con.gsoe.overdrive.3",
	}

	att.Desc_Neutrals = {
	    "desc.gsoe.overdrive.1",
	    "desc.gsoe.overdrive.2",
	}

	att.Slot = {"perk", "go_perk"}

	att.NotForNPC = true
	att.SortOrder = 1
	att.AutoStats = true

	att.Ignore = false
	att.NoRandom = true

	att.Override_HeatLockout = false
	att.Override_HeatLockout_Priority = 100
	att.Override_HeatFix = false

	att.Mult_HeatDelayTime = 2
	att.Mult_HeatDissipation = 0.5

	att.GSOE_Overdrive = true

	att.Hook_Compatible = function(wep)
	    if not (wep.Jamming or wep:GetBuff_Override("Override_Jamming")) then return false end
	end

	att.Hook_Overheat = function(wep)
	    return true -- :troll:
	end

	att.M_Hook_Mult_HeatDissipation = function(wep, data)
	    if wep:GetHeat() >= wep:GetMaxHeat() then
	        data.mult = data.mult * (1 - math.Clamp(wep:GetHeat() / wep:GetMaxHeat() * 0.3, 0, 0.9))
	    end
	    if not wep:GetBuff_Override("GSOE_API") and wep:GetReloading() then
	        data.mult = data.mult * 0.25
	    end
	end

	att.Hook_AddShootSound = function(wep, data)
	    local pers = wep:GetHeat() / wep:GetMaxHeat()
	    if pers >= 1 and pers < 3 then
	        wep:EmitSound("arccw_go/oapi_hot.wav", data.volume, 100 + 45 * math.Clamp(pers - 1, 0, 2), pers, CHAN_STATIC)
	    end
	end

	att.Hook_ModifyRPM = function(wep, delay)
	    if wep:GetHeat() >= wep:GetMaxHeat() then
	        return delay * (1 + math.Clamp((wep:GetHeat() / wep:GetMaxHeat() - 1) * 0.25, 0, 0.5))
	    end
	end

	att.M_Hook_Mult_AccuracyMOA = function(wep, data)
	    if wep:GetHeat() >= wep:GetMaxHeat() then
	        data.mult = (data.mult + math.Clamp((wep:GetHeat() / wep:GetMaxHeat() - 1) * 3, 0, 9))
	    end
	end

	att.M_Hook_Mult_HipDispersion = function(wep, data)
	    if wep:GetHeat() >= wep:GetMaxHeat() then
	        data.mult = (data.mult + math.Clamp((wep:GetHeat() / wep:GetMaxHeat() - 1) * 1.5, 0, 3))
	    end
	end

	--[[]
	att.A_Hook_Add_SightsDispersion = function(wep, data)
	    if wep:GetHeat() >= wep:GetMaxHeat() then
	        data.add = (data.add + math.Clamp((wep:GetHeat() / wep:GetMaxHeat() - 1) * 100, 0, 400))
	    end
	end
	]]

	att.Hook_BulletHit = function(wep, data)
	    if CLIENT or not IsValid(wep:GetOwner()) then return end
	    if wep:GetHeat() >= wep:GetMaxHeat() then
	        data.damage = data.damage * ((wep:GetHeat() / wep:GetMaxHeat() - 1) * 0.3 + 1)

	        if IsValid(data.tr.Entity) and math.random() <= (wep:GetHeat() / wep:GetMaxHeat() - 1) / 2
	                and (data.tr.Entity.ArcCW_GSOE_Ignited or 0) ~= CurTime() then
	            data.tr.Entity.ArcCW_GSOE_Ignited = CurTime()
	            data.tr.Entity:Ignite(3)
	        end

	    end
	end

	att.Hook_PostFireBullets = function(wep)
	    if CLIENT or not IsValid(wep:GetOwner()) then return end
	    if wep:GetHeat() >= wep:GetMaxHeat() * 5 then
	        wep:SetHeat(0)
	        local dmg = DamageInfo()
	        dmg:SetDamage(500)
	        dmg:SetDamageType(DMG_BLAST)
	        dmg:SetInflictor(wep)
	        dmg:SetAttacker(wep:GetOwner())
	        util.BlastDamageInfo(dmg, wep:GetOwner():GetPos(), 512)
	        for i = 1, 10 do
	            local cloud = ents.Create( "arccw_go_fire" )
	            if not IsValid(cloud) then return end
	            local vel = Vector(math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-1, 1)) * 1500
	            cloud.Order = i
	            cloud:SetPos(wep:GetOwner():GetPos() + VectorRand() + Vector(0, 0, 32))
	            cloud:SetAbsVelocity(vel)
	            cloud:SetOwner(wep:GetOwner())
	            cloud:Spawn()
	        end
	        wep:EmitSound("arccw_go/incgrenade/inc_grenade_detonate_2.wav", 120, 90, 1, CHAN_STATIC)
	        SafeRemoveEntity(wep)
	    elseif wep:GetHeat() >= wep:GetMaxHeat() * 3 then
	        -- FIRE EXPLOSION
	        wep:EmitSound("arccw_go/oapi_hot.wav", 100, 150, 1, CHAN_STATIC)
	        local dmg = DamageInfo()
	        dmg:SetDamage(math.Round(wep:GetHeat() / wep:GetMaxHeat() * 3))
	        dmg:SetDamageType(DMG_BURN)
	        dmg:SetInflictor(wep)
	        dmg:SetAttacker(wep:GetOwner())
	        util.BlastDamageInfo(dmg, wep:GetOwner():GetPos(), 256)
	        if math.random() <= 0.25 then
	            local cloud = ents.Create( "arccw_go_fire" )
	            if not IsValid(cloud) then return end
	            local vel = Vector(math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-1, 1)) * 1500
	            cloud:SetPos(wep:GetOwner():GetPos() + VectorRand() + Vector(0, 0, 32))
	            cloud:SetAbsVelocity(vel)
	            cloud:SetOwner(wep:GetOwner())
	            cloud:Spawn()
	            wep:EmitSound("arccw_go/molotov/fire_ignite_5.wav", 100, 100, 1, CHAN_STATIC)
	        end
	        wep:GetOwner():Ignite(2)
	    elseif wep:GetHeat() >= wep:GetMaxHeat() * 2 then
	        local dmg = DamageInfo()
	        dmg:SetDamage(math.Round(wep:GetHeat() / wep:GetMaxHeat()) - 1)
	        dmg:SetDamageType(DMG_BURN)
	        dmg:SetInflictor(wep)
	        dmg:SetAttacker(wep:GetOwner())
	        wep:GetOwner():TakeDamageInfo(dmg)
	    end
	end

	local mat_grad = Material("arccw/gsoe_oapi_heat.png", "mips smooth")

	att.Hook_DrawHUD = function(wep)
	    local pers = wep:GetHeat() / wep:GetMaxHeat()
	    local thres = 0.8
	    if pers >= thres then
	        surface.SetDrawColor(255, 0, 0, math.Clamp((pers - thres) * 255 / (3 - thres), 0, 255))
	        surface.SetMaterial(mat_grad)
	        surface.DrawTexturedRect(ScrW() / 2, ScrH() / 2, ScrW() / 2, ScrH() / 2)
	    end
	end

	att.Hook_GetHUDData = function(wep, data)
	    local pers = wep:GetHeat() / wep:GetMaxHeat()
	    if pers >= 1 then
	        data.heat_name = ArcCW.GetTranslation("ui.gsoe.overdrive")
	        for i = 1, math.floor((pers - 1) * 2) + 1 do data.heat_name = data.heat_name .. "!" end
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- perk_last.lua
------

do
	local att = {}
	ArcCW.SetShortName("perk_last")

	att.PrintName = "Memento Mori"
	att.Icon = Material("entities/acwatt_perk_last.png")
	att.Description = "Significant damage multiplier at the cost of being able to fire only one round at a time, extremely slow reloading, and damage at range. It's got to be personal."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.perk_last",
	}
	att.AutoStats = true
	att.Slot = "perk"

	att.NotForNPC = true

	att.Override_ChamberSize = 0

	att.Mult_Damage = 2.5
	att.Mult_DamageMin = 0.1
	att.Mult_Range = 0.5

	att.Mult_ReloadTime = 1.5

	att.Hook_GetCapacity = function(wep, cap)
	    return 1
	end

	att.Hook_Compatible = function(wep)
	    if (wep.RegularClipSize or wep.Primary.ClipSize) == 1 then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- perk_lightweight.lua
------

do
	local att = {}
	ArcCW.SetShortName("perk_lightweight")

	att.PrintName = "Light Frame"
	att.Icon = Material("entities/acwatt_perk_lightweight.png")
	att.Description = "Lightened frame allows faster movement and aiming, but worsens recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "perk"

	att.Mult_SpeedMult = 1.15
	att.Mult_SightTime = 0.9
	att.Mult_Recoil = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- perk_owyn.lua
------

do
	local att = {}
	ArcCW.SetShortName("perk_owyn")

	att.PrintName = "Make It Count"
	att.Icon = Material("entities/acwatt_perk_owyn.png")
	att.Description = "The last bullet in your magazine does up to double bonus damage based on capacity."
	att.Desc_Pros = {
	    "pro.perk_owyn"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "info.perk_owyn"
	}
	att.AutoStats = true
	att.Slot = "perk"

	att.NotForNPC = true

	--att.Mult_AccuracyMOA = 1.2
	--att.Mult_ReloadTime = 1.1

	att.Hook_Compatible = function(wep)
	    if wep.RegularClipSize <= 2 or wep.ShotgunReload or wep.Num > 1 then return false end
	end

	att.Hook_BulletHit = function(wep, data)
	    if CLIENT then return end

	    if wep:Clip1() == 1 then
	        data.damage = data.damage * (1 + math.Clamp(wep:GetCapacity() / 60, 0.2, 1))
	        wep.Owner:EmitSound("ambient/alarms/warningbell1.wav", 60, 110)
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- perk_quickdraw.lua
------

do
	local att = {}
	ArcCW.SetShortName("perk_quickdraw")

	att.PrintName = "Bodyguard"
	att.Icon = Material("entities/acwatt_perk_quickdraw.png")
	att.Description = "A sling system helps with drawing more quickly, as well as firing from the hip. However, it is more difficult to use when aiming."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "perk"

	att.Mult_DrawTime = 0.4
	att.Mult_HolsterTime = 0.4
	att.Mult_HipDispersion = 0.8
	att.Mult_SightedSpeedMult = 0.8
	ArcCW.LoadAttachmentType(att)
end

------
-- perk_refund.lua
------

do
	local att = {}
	ArcCW.SetShortName("perk_refund")

	att.PrintName = "Never Stop Shooting"
	att.Icon = Material("entities/acwatt_perk_refund.png")
	att.Description = "Shots which successfully hit have a 50% chance to be refunded to your reserve ammo."
	att.Desc_Pros = {
	    "+ Chance to refund shots"
	}
	att.Desc_Cons = {
	}
	att.Slot = "perk"

	att.Hook_BulletHit = function(wep, data)
	    if CLIENT then return end

	    if math.Rand(0, 100) > 50 then return end

	    local ent = data.tr.Entity

	    if ent then
	        if wep.Owner:IsNPC() then
	            wep:SetClip1(wep:Clip1() + 1)
	            return
	        end

	        if ent.Health and ent:Health() > 0 then
	            wep.Owner:GiveAmmo(1, wep.Primary.Ammo, true)
	        end
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- perk_roulette.lua
------

do
	local att = {}
	ArcCW.SetShortName("perk_roulette")

	att.PrintName = "Russian Roulette"
	att.Icon = Material("entities/acwatt_perk_roulette.png")
	att.Description = "Simulate the most dangerous game. Load only one shot into your gun, with each shot having a 1/6 chance to actually go off. Cannot point at self."
	att.Ignore = true
	att.Desc_Pros = {
	    "+ Thrilling Game of Chance"
	}
	att.Desc_Cons = {
	    "- One round only",
	    "- 1/6 chance to fire"
	}
	att.Free = true
	att.Slot = "perk_revolver"

	att.NotForNPC = true

	att.Override_ChamberSize = 0

	att.Hook_GetCapacity = function(wep, cap)
	    return 1
	end

	att.Hook_FireBullets = function(wep, data)
	    if math.random(1, 6) > 1 then
	        wep:DryFire()
	        data.Num = 0
	    end

	    return data
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- perk_slam.lua
------

do
	local att = {}
	ArcCW.SetShortName("perk_slam")

	att.PrintName = "Slamfire"
	att.Icon = Material("entities/acwatt_fcg_auto.png")
	att.Description = "Modifications to the pump allows for an immediate followup shot after cycling while holding the trigger. Grants pesudo-automatic firing and increases cycle speed."
	att.Desc_Pros = {
	    "+ Slamfire",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "ammo_shotgun"

	att.Ignore = true

	att.Override_Firemodes = {
	    {
	        Mode = 2,
	        PrintName = "SLAM"
	    },
	    {
	        Mode = 0
	    }
	}

	att.Mult_RecoilSide = 1.5
	att.Mult_ReloadTime = 1.3
	att.Mult_CycleTime = 0.8

	att.Hook_Compatible = function(wep)
	    if not wep.ManualAction then return false end
	end

	att.Hook_SelectCycleAnimation = function(wep, anim)
	    if wep.Animations["slam"] then return "slam" end
	end

	--[[ replace sh_think.lua line 10+ with the following
	   if (self.Primary.Automatic or !self:GetOwner():KeyDown(IN_ATTACK)) and self:GetNWBool("cycle", false) and !self:GetNWBool("reloading", false) then
	      local anim = "cycle"
	      if self:GetNWInt("state") == ArcCW.STATE_SIGHTS and self.Animations.cycle_iron then
	         anim = "cycle_iron"
	      end
	      anim = self:GetBuff_Hook("Hook_SelectCycleAnimation", anim) or anim
	      local mult = self:GetBuff_Mult("Mult_CycleTime")
	      self:PlayAnimation(anim, mult, false, 0, true)
	      self:SetNWBool("cycle", false)
	   end
	]]
	ArcCW.LoadAttachmentType(att)
end

------
-- perk_underwater.lua
------

do
	local att = {}
	ArcCW.SetShortName("perk_underwater")

	att.PrintName = "Diver"
	att.Icon = Material("entities/acwatt_perk_underwater.png")
	att.Description = "Allows gun to shoot underwater."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "perk"

	att.Override_CanFireUnderwater = true

	att.Hook_Compatible = function(wep)
	    if wep.CanFireUnderwater then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

