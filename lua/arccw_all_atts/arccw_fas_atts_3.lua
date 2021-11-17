local Material = ArcCW.AttachmentMat

------
-- mifl_fas2_g3_mag_10_32.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g3_mag_10_32")

	att.PrintName = "32-Round 10mm"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_mag_10mm.png", "mips smooth")
	att.Description = "Pistol caliber conversion for the G3. 10mm rounds have balanced damage at range compared to .45."
	att.SortOrder = 2.5
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g3_mag"

	att.Override_ClipSize = 32

	-- 10mm
	att.Mult_Damage = 0.5
	att.Mult_DamageMin = 0.5
	att.Mult_Recoil = 0.3
	att.Mult_RecoilSide = 0.3
	att.Mult_Penetration = 0.4
	att.Mult_Range = 0.5
	att.Mult_RPM = 1.2
	att.Override_Ammo = "pistol"
	att.Override_Trivia_Calibre = "10mm Auto"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/g3/g3_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/mp5/30.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/g3/g3_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/mp5/30sd.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g3_mag_45_25.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g3_mag_45_25")

	att.PrintName = "30-Round .45 ACP"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_mag_20.png", "mips smooth")
	att.Description = "Pistol caliber conversion for the G3. .45 ACP rounds are slightly more powerful up close than 10mm."
	att.SortOrder = 2
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g3_mag"

	att.Override_ClipSize = 30

	-- .45
	att.Mult_Damage = 0.6
	att.Mult_DamageMin = 0.4
	att.Mult_Recoil = 0.3
	att.Mult_RecoilSide = 0.3
	att.Mult_Penetration = 0.4
	att.Mult_Range = 0.5
	att.Mult_RPM = 1.2
	att.Override_Ammo = "pistol"
	att.Override_Trivia_Calibre = ".45 ACP"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/g3/g3_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/mp5/45.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/g3/g3_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/mp5/45sd.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g3_mag_556_20.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g3_mag_556_20")

	att.PrintName = "20-Round 5.56mm"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_ammo_20.png", "mips smooth")
	att.Description = "Straight magazine for the 5.56mm HK33. Light, but not a lot of ammo."
	att.SortOrder = 5.2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g3_mag"

	att.Override_ClipSize = 20

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Mult_ReloadTime = 0.9

	-- 5.56
	att.Mult_Damage = 0.6
	att.Mult_DamageMin = 0.4
	att.Mult_Recoil = 0.5
	att.Mult_RecoilSide = 0.5
	att.Mult_Penetration = 0.6
	att.Mult_Range = 0.5
	att.Mult_RPM = 1.1
	att.Override_Ammo = "smg1"
	att.Override_Trivia_Class = "Assault Rifle"
	att.Override_Trivia_Calibre = "5.56x45mm NATO"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2_custom/g3/556.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2_custom/g3/556sd.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g3_mag_556_30.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g3_mag_556_30")

	att.PrintName = "30-Round 5.56mm"
	att.Icon = Material("entities/arccw_mifl_fas2_g3_mag_556_30.png", "mips smooth")
	att.Description = "Convert the weapon into a HK33, firing a less powerful intermediate cartridge."
	att.SortOrder = 5.3
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g3_mag"

	att.Override_ClipSize = 30

	-- 5.56
	att.Mult_Damage = 0.6
	att.Mult_DamageMin = 0.4
	att.Mult_Recoil = 0.5
	att.Mult_RecoilSide = 0.5
	att.Mult_Penetration = 0.6
	att.Mult_Range = 0.5
	att.Mult_RPM = 1.1
	att.Override_Ammo = "smg1"
	att.Override_Trivia_Class = "Assault Rifle"
	att.Override_Trivia_Calibre = "5.56x45mm NATO"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2_custom/g3/556.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2_custom/g3/556sd.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g3_mag_556_75.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g3_mag_556_75")

	att.PrintName = "60-Round 5.56mm"
	att.Icon = Material("entities/arccw_mifl_fas2_g3_mag_762_50.png", "mips smooth")
	att.Description = "Convert the weapon into a HK33, firing a less powerful intermediate cartridge from a cumbersome drum magazine."
	att.SortOrder = 5.3
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g3_mag"

	att.Override_ClipSize = 60

	att.Mult_MoveSpeed = 0.8
	att.Mult_SightTime = 1.5
	att.Mult_ReloadTime = 1.2

	-- 5.56
	att.Mult_Damage = 0.6
	att.Mult_DamageMin = 0.4
	att.Mult_Recoil = 0.5
	att.Mult_RecoilSide = 0.5
	att.Mult_Penetration = 0.6
	att.Mult_Range = 0.5
	att.Mult_RPM = 1.1
	att.Override_Ammo = "smg1"
	att.Override_Trivia_Class = "Assault Rifle"
	att.Override_Trivia_Calibre = "5.56x45mm NATO"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2_custom/g3/556.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2_custom/g3/556sd.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g3_mag_762_10.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g3_mag_762_10")

	att.PrintName = "10-Round 7.62mm"
	att.Icon = Material("entities/arccw_mifl_fas2_g3_mag_762_10.png", "mips smooth")
	att.Description = "Reduced capacity magazine used in marksman roles."
	att.SortOrder = 7.1
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g3_mag"

	att.Override_ClipSize = 10

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Mult_ReloadTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g3_mag_762_30.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g3_mag_762_30")

	att.PrintName = "30-Round 7.62mm"
	att.Icon = Material("entities/arccw_mifl_fas2_g3_mag_762_30.png", "mips smooth")
	att.Description = "Straight extended magazine for the G3. Not very comfortable to use."
	att.SortOrder = 7.3
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g3_mag"

	att.Override_ClipSize = 30

	att.Mult_MoveSpeed = 0.9
	att.Mult_SightTime = 1.15
	att.Mult_ReloadTime = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g3_mag_762_50.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g3_mag_762_50")

	att.PrintName = "50-Round 7.62mm"
	att.Icon = Material("entities/arccw_mifl_fas2_g3_mag_762_50.png", "mips smooth")
	att.Description = "Small drum magazine for the G3. Lots of bullets weighs the weapon down noticably."
	att.SortOrder = 7.5
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g3_mag"

	att.Override_ClipSize = 50

	att.Mult_MoveSpeed = 0.8
	att.Mult_SightTime = 1.5
	att.Mult_ReloadTime = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_g3_stock_psg1.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_g3_stock_psg1")

	att.PrintName = "Heavy Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_g3_stock_heavy.png", "mips smooth")
	att.Description = "Even heavier stock offers great recoil management."
	att.SortOrder = 11
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_g3_stock"

	att.Mult_SightTime = 1.2
	att.Mult_Recoil = 0.75
	att.Mult_RecoilSide = 0.5
	att.Mult_SightedSpeedMult = 0.8
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_integral_lhik.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_integral_lhik")

	att.PrintName = "You aren't supposed to see this"
	att.Icon = Material("entities/arccw_mifl_fas2_famas_hg_kurz.png", "mips smooth")
	att.Description = ""
	att.SortOrder = -2000000

	att.Slot = "mifl_integral_lhik_fas2"

	att.LHIK = true
	att.LHIK_Priority = -3

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_sd.mdl"

	att.ModelOffset = Vector(0, 0.5, 0)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ks23_barrel_b.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ks23_barrel_b")

	att.PrintName = "Colossal Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_ks23_barrel_big.png", "smooth")
	att.Description = "Weighted barrel that can reduce recoil even on high powered cartridges. And you thought 23mm is wide."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 6

	att.Slot = "mifl_fas2_ks23_barrel"
	att.AutoStats = true

	att.Mult_AccuracyMOA = 0.6
	att.Mult_Recoil = 0.75
	att.Mult_SpeedMult = 0.85
	att.Mult_SightTime = 1.5
	att.Mult_MoveDispersion = 1.5
	att.Mult_ReloadTime = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ks23_barrel_k.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ks23_barrel_k")

	att.PrintName = "Kurz Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_ks23_barrel_k.png", "smooth")
	att.Description = "Shortened barrel that improves handling at the cost of accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 5

	att.Slot = {"mifl_fas2_ks23_barrel", "mifl_fas2_m3_barrel"}
	att.AutoStats = true

	att.Mult_AccuracyMOA = 1.25
	att.Mult_SpeedMult = 1.05
	att.Mult_SightTime = 0.75
	att.Mult_MoveDispersion = 0.75
	att.Mult_ReloadTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ks23_barrel_l.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ks23_barrel_l")

	att.PrintName = "Long Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_ks23_barrel_l.png", "smooth")
	att.Description = "Extended barrel that improves accuracy but is hard to handle."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 5

	att.Slot = {"mifl_fas2_ks23_barrel", "mifl_fas2_m3_barrel"}
	att.AutoStats = true

	att.Mult_AccuracyMOA = 0.75
	att.Mult_SpeedMult = 0.9
	att.Mult_SightTime = 1.25
	att.Mult_MoveDispersion = 1.25
	att.Mult_ReloadTime = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ks23_barrel_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ks23_barrel_sd")

	att.PrintName = "Whisper Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_ks23_barrel_sd.png", "smooth")
	att.Description = "Big and lengthy suppressed barrel. Halve the profile."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 5.8

	att.Slot = {"mifl_fas2_ks23_barrel", "mifl_fas2_m3_barrel"}
	att.AutoStats = true

	att.Mult_AccuracyMOA = 0.675
	att.Mult_Recoil = 0.85
	att.Mult_SpeedMult = 0.9
	att.Mult_SightTime = 1.25
	att.Mult_MoveDispersion = 1.05
	att.Mult_ReloadTime = 1.05
	att.Mult_SightedSpeedMult = 0.8

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Mult_ShootPitch = 1.8
	att.Mult_ShootVol = 0.5
	att.Mult_Range = 1.2
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ks23_stock_k.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ks23_stock_k")

	att.PrintName = "Sawn-off Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_ks23_frame_k.png", "smooth")
	att.Description = "Cut off the stock of the weapon leaving only a handle."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 5

	att.Slot = "mifl_fas2_ks23_stock"
	att.AutoStats = true

	att.Mult_Recoil = 1.8
	att.Mult_RecoilSide = 1.5
	att.Mult_SightTime = 0.75
	att.Mult_DrawTime = 0.75
	att.Mult_HolsterTime = 0.75

	att.Mult_SightedSpeedMult = 1.5
	att.Mult_MoveSpeed = 1.25
	att.Mult_ReloadTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ks23_tube_12.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ks23_tube_12")

	att.PrintName = "6-Round 12 Gauge Tube"
	att.Icon = Material("entities/arccw_mifl_fas2_ks23_tube_12.png", "smooth mips")
	att.Description = "Convert the weapon to fire weaker 12 Gauge rounds."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = -12

	att.Slot = "mifl_fas2_ks23_mag"
	att.AutoStats = true

	att.Override_ClipSize = 6
	att.Mult_ReloadTime = 0.8
	att.Mult_SightTime = 0.8

	-- 23mm -> 12G
	att.Mult_Damage = 0.5
	att.Mult_DamageMin = 0.5
	att.Mult_Range = 0.8
	att.Mult_Recoil = 0.8
	att.Mult_RecoilSide = 0.5
	att.Mult_AccuracyMOA = 0.85

	att.Override_Num = 16

	att.Override_ShellModel = "models/weapons/arccw/mifl/fas2/shell/buck.mdl"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ks23_tube_50.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ks23_tube_50")

	att.PrintName = "2-Round 50.BMG Tube"
	att.Icon = Material("entities/arccw_mifl_fas2_ks23_tube_50.png", "smooth mips")
	att.Description = "Convert the weapon to fire .50 BMG rounds. Despite its apparent power, this caliber is actually half as large compared to 23mm diameter-wise."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 5

	att.Slot = "mifl_fas2_ks23_mag"
	att.AutoStats = true

	att.Override_ClipSize = 2

	-- 23mm -> .50 BMG
	att.Mult_Damage = 0.7
	att.Mult_Range = 2
	att.Mult_Recoil = 1.25
	att.Mult_RecoilSide = 1.5
	att.Mult_Penetration = 15
	att.Mult_AccuracyMOA = 0.1
	att.Override_Num = 1
	att.Override_Ammo = "SniperPenetratedRound"
	att.Override_IsShotgun = false
	att.Override_IsShotgun_Priority = 1000

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2/m82/m82_fire1.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2/m82/m82_whisper.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ks23_tube_x.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ks23_tube_x")

	att.PrintName = "5-Round 23mm Tube"
	att.Icon = Material("entities/arccw_mifl_fas2_ks23_tube_23x.png", "smooth")
	att.Description = "Medium length tube magazine."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 50

	att.Slot = "mifl_fas2_ks23_mag"
	att.AutoStats = true

	att.Override_ClipSize = 5
	att.Mult_ReloadTime = 1.05
	att.Mult_SightTime = 1.05
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ks23_tube_x_12.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ks23_tube_x_12")

	att.PrintName = "8-Round 12 Gauge Tube"
	att.Icon = Material("entities/arccw_mifl_fas2_ks23_tube_12x.png", "smooth")
	att.Description = "Medium length tube magazine that loads 12 Gauge rounds."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = -12

	att.Slot = "mifl_fas2_ks23_mag"
	att.AutoStats = true

	att.Override_ClipSize = 8
	att.Mult_ReloadTime = 0.9
	att.Mult_SightTime = 0.9

	att.Mult_Damage = 0.5
	att.Mult_DamageMin = 0.5
	att.Mult_Range = 0.8
	att.Mult_Recoil = 0.8
	att.Mult_RecoilSide = 0.5
	att.Mult_AccuracyMOA = 0.85

	att.Override_Num = 16

	att.Override_ShellModel = "models/weapons/arccw/mifl/fas2/shell/buck.mdl"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ks23_tube_x_50.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ks23_tube_x_50")

	att.PrintName = "4-Round 50.BMG Tube"
	att.Icon = Material("entities/arccw_mifl_fas2_ks23_tube_50x.png", "smooth")
	att.Description = "Medium length tube magazine that loads .50 BMG rounds."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 5

	att.Slot = "mifl_fas2_ks23_mag"
	att.AutoStats = true

	att.Override_ClipSize = 4
	att.Mult_ReloadTime = 1.05
	att.Mult_SightTime = 1.05

	-- 23mm -> .50 BMG
	att.Mult_Damage = 0.7
	att.Mult_Range = 2
	att.Mult_Recoil = 1.25
	att.Mult_RecoilSide = 1.5
	att.Mult_Penetration = 15
	att.Mult_AccuracyMOA = 0.1
	att.Override_Num = 1
	att.Override_Ammo = "SniperPenetratedRound"
	att.Override_IsShotgun = false
	att.Override_IsShotgun_Priority = 1000

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2/m82/m82_fire1.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2/m82/m82_whisper.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ks23_tube_xx.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ks23_tube_xx")

	att.PrintName = "7-Round 23mm Tube"
	att.Icon = Material("entities/arccw_mifl_fas2_ks23_tube_23xx.png", "smooth")
	att.Description = "Long tube magazine."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 50

	att.Slot = "mifl_fas2_ks23_mag"
	att.AutoStats = true

	att.Override_ClipSize = 7

	att.Mult_ReloadTime = 1.1
	att.Mult_SightTime = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ks23_tube_xx_12.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ks23_tube_xx_12")

	att.PrintName = "12-Round 12 Gauge Tube"
	att.Icon = Material("entities/arccw_mifl_fas2_ks23_tube_12xx.png", "smooth")
	att.Description = "Long tube magazine that loads 12 Gauge rounds."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = -11

	att.Slot = "mifl_fas2_ks23_mag"
	att.AutoStats = true

	att.Override_ClipSize = 12

	att.Mult_Damage = 0.5
	att.Mult_DamageMin = 0.5
	att.Mult_Range = 0.8
	att.Mult_Recoil = 0.8
	att.Mult_RecoilSide = 0.5
	att.Mult_AccuracyMOA = 0.85

	att.Override_Num = 16

	att.Override_ShellModel = "models/weapons/arccw/mifl/fas2/shell/buck.mdl"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_ks23_tube_xx_50.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_ks23_tube_xx_50")

	att.PrintName = "6-Round 50.BMG Tube"
	att.Icon = Material("entities/arccw_mifl_fas2_ks23_tube_50xx.png", "smooth")
	att.Description = "Long tube magazine that loads .50 BMG rounds."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 5

	att.Slot = "mifl_fas2_ks23_mag"
	att.AutoStats = true

	att.Override_ClipSize = 6
	att.Mult_ReloadTime = 1.1
	att.Mult_SightTime = 1.1

	-- 23mm -> .50 BMG
	att.Mult_Damage = 0.7
	att.Mult_Range = 2
	att.Mult_Recoil = 1.25
	att.Mult_RecoilSide = 1.5
	att.Mult_Penetration = 15
	att.Mult_AccuracyMOA = 0.1
	att.Override_Num = 1
	att.Override_Ammo = "SniperPenetratedRound"
	att.Override_IsShotgun = false
	att.Override_IsShotgun_Priority = 1000

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2/m82/m82_fire1.wav" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_mifl/fas2/m82/m82_whisper.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_left_hand_shield.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_left_hand_shield")

	att.PrintName = "Shield"
	att.Icon = Material("entities/arccw_mifl_lhand_shield.png", "smooth")
	att.Description = "SHOE"
	att.Hidden = true
	att.Desc_Pros = {
	    "may or may not block bullets",
	}
	att.Desc_Cons = {
	    "- Cannot use ironsights"
	}
	att.AutoStats = true
	att.Mult_HipDispersion = 2
	att.Slot = "mifl_fas2_lhand_shield"

	att.ModelOffset = Vector(10, -7, -7)

	att.GivesFlags = {"handlocked"}

	att.ShieldCorrectAng = Angle(0, 0, 0)
	att.ShieldCorrectPos = Vector(0, 0, 5)

	att.SortOrder = 1

	att.AddSuffix = " Ballista" -- busta lookin ass ---

	att.Model = "models/weapons/arccw/mifl_atts/fas2/left_shield.mdl"

	att.ModelIsShield = true --- fuck does this do ???? ---
	att.ShieldBone = "ValveBiped.Bip01_L_Hand"

	att.LHIK = true
	att.LHIK_Animation = true
	att.LHIK_MovementMult = 0 -- fuck is this ? --

	att.UBGL = true

	att.Hook_ShouldNotSight = function(wep)
	    return true
	end

	att.Hook_Think = function(wep)
	    if !IsFirstTimePredicted() then return end
	    if wep:GetOwner():KeyPressed(IN_RELOAD) then --- only reload :troll: ---
	        wep:SetInUBGL(false)
	        wep:ReloadUBGL()
	        --wep:Reload()
	    end
	end

	--- nopog ---

	att.UBGL_Reload = function(wep, ubgl) ---- how 2 no play reload anim when clip1 = full halp ????? ----

	    wep:Reload()
	        wep:DoLHIKAnimation("reload", 130/60)
	        wep:SetNextSecondaryFire(CurTime() + 130/60)
	        wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/gso/glock18/glock_clipout.wav", 	t = 13/60},	--- woooosh ---	
	        })
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m11_mag_16.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m11_mag_16")

	att.PrintName = "16-Round .380 ACP"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_ammo_32.png", "smooth")
	att.Description = "Small flush magazine that increase handling. Halve the capacity."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 2

	att.Override_ClipSize = 16

	att.Mult_ReloadTime = 0.85
	att.Mult_SightTime = 0.8
	att.Mult_SpeedMult = 1.1

	att.Slot = "mifl_fas2_m11_mag"
	att.AutoStats = true

	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m11_mag_48.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m11_mag_48")

	att.PrintName = "48-Round .380 ACP"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_ammo_32.png", "smooth")
	att.Description = "Extended magazine for the MAC-11."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 2

	att.Override_ClipSize = 48

	att.Mult_ReloadTime = 1.1
	att.Mult_SightTime = 1.15
	att.Mult_SpeedMult = 0.9

	att.Slot = "mifl_fas2_m11_mag"
	att.AutoStats = true

	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m11_mag_64.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m11_mag_64")

	att.PrintName = "64-Round .380 ACP"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_ammo_50.png", "smooth")
	att.Description = "Big drum magazine that doubles the capacity. Has an drastic impact on handling."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 2

	att.Override_ClipSize = 64

	att.Mult_ReloadTime = 1.2
	att.Mult_SightTime = 1.25
	att.Mult_SpeedMult = 0.8

	att.Slot = "mifl_fas2_m11_mag"
	att.AutoStats = true

	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m11_muz_a1.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m11_muz_a1")

	att.PrintName = "'Nam Shroud"
	att.Icon = Material("entities/arccw_mifl_fas2_m11_muz_a1.png", "smooth")
	att.Description = "Barrel shroud similar to the M16A1. The extra weight of the shroud reduces recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 6

	att.Slot = "mifl_fas2_m11_muz"
	att.AutoStats = true

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Mult_Range = 2
	att.Mult_Recoil = 0.5
	att.Mult_AccuracyMOA = 0.75

	att.Mult_SightTime = 1.5
	att.Mult_HipDispersion = 1.5
	att.Mult_SpeedMult = 0.9
	att.Mult_SightedSpeedMult = 0.8

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_k.mdl"

	att.ModelOffset = Vector(5, -0.4, -0.2)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m11_muz_a2.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m11_muz_a2")

	att.PrintName = "G.I. Shroud"
	att.Icon = Material("entities/arccw_mifl_fas2_m11_muz_a2.png", "smooth")
	att.Description = "Barrel shroud similar in appearance to M16A2."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 5

	att.Slot = "mifl_fas2_m11_muz"
	att.AutoStats = true

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Mult_Range = 2
	att.Mult_Recoil = 0.75
	att.Mult_AccuracyMOA = 0.75

	att.Mult_SightTime = 1.3
	att.Mult_HipDispersion = 1.3
	att.Mult_SpeedMult = 0.95
	att.Mult_SightedSpeedMult = 0.9

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_sd.mdl"

	att.ModelOffset = Vector(5, 0.2, 0)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m11_muz_k.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m11_muz_k")

	att.PrintName = "Kurz Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_m11_muz_k.png", "smooth")
	att.Description = "Reduces the barrel length even further. Accuracy can go out the window."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = -1

	att.Slot = "mifl_fas2_m11_muz"
	att.AutoStats = true

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_AccuracyMOA = 3

	att.Mult_SightTime = 0.8
	att.Mult_HipDispersion = 1

	att.Mult_RPM = 1.2
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m11_muz_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m11_muz_long")

	att.PrintName = "Extended Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_m11_muz_l.png", "smooth")
	att.Description = "A long carbine barrel for the MAC-11. Reduces fire rate."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 4

	att.Mult_Range = 2
	att.Mult_Recoil = 0.75
	att.Mult_AccuracyMOA = 0.75

	att.Mult_SightTime = 1.25
	att.Mult_HipDispersion = 1.25

	att.Mult_RPM = 0.9

	att.Slot = "mifl_fas2_m11_muz"
	att.AutoStats = true

	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m11_muz_m4.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m11_muz_m4")

	att.PrintName = "Carbine Shroud"
	att.Icon = Material("entities/arccw_mifl_fas2_m11_muz_m4.png", "smooth")
	att.Description = "Barrel shroud with side rails."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 1

	att.Slot = "mifl_fas2_m11_muz"
	att.AutoStats = true

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.8
	att.Mult_AccuracyMOA = 0.8

	att.Mult_SightTime = 1.2
	att.Mult_HipDispersion = 1.2

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_k.mdl"

	att.ModelOffset = Vector(5, -0.2, 0)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m11_muz_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m11_muz_sd")

	att.PrintName = "Whisper Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_m11_muz_sd.png", "smooth")
	att.Description = "The specifically-designed suppressor for the MAC-11, turned up to eleven. It is bigger, quieter, and more cumbersome than ever imagined."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 2

	att.Slot = "mifl_fas2_m11_muz"
	att.AutoStats = true

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Mult_ShootPitch = 1.5
	att.Mult_ShootVol = 0.6
	att.Mult_Range = 1.5
	att.Mult_SightTime = 1.5
	att.Mult_HipDispersion = 1.25
	att.Mult_AccuracyMOA = 0.5

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_sd.mdl"

	att.ModelOffset = Vector(4, -0.2, -0.5)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m11_muz_thomp.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m11_muz_thomp")

	att.PrintName = "Sweeper Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_m11_muz_thomp.png", "smooth")
	att.Description = "Mainly cosmetic barrel and wooden handguard that resembles a Thompson submachine gun."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 3

	att.Slot = "mifl_fas2_m11_muz"
	att.AutoStats = true

	att.Mult_Range = 2
	att.Mult_Recoil = 0.5
	att.Mult_AccuracyMOA = 0.75

	att.Mult_SightTime = 1.5
	att.Mult_HipDispersion = 1
	att.Mult_SpeedMult = 0.9
	att.Mult_SightedSpeedMult = 0.8

	att.Mult_RPM = 0.75

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_felin.mdl"

	att.ModelOffset = Vector(0.5, -0.3, -1.8)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m11_rail.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m11_rail")

	att.PrintName = "RIS Mount"
	att.Icon = Material("entities/arccw_mifl_fas2_m11_rail.png", "smooth")
	att.Description = "Alternative sight option for your modernise pleasure. Comes with a glowing sight"
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 69^420

	att.Slot = "mifl_fas2_m11_optic"
	att.AutoStats = true

	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m1911_mag14.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m1911_mag14")

	att.PrintName = "17-Round .45ACP"
	att.Icon = Material("entities/arccw_mifl_fas2_m1911_mag_14.png", "mips smooth")
	att.Description = "Long straight magazine used by tankers and pilots increases ammo capacity."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 17
	att.AutoStats = true
	att.Slot = {"mifl_fas2_m1911_mag"}

	att.Override_ClipSize = 17

	att.Mult_MoveSpeed = 0.98
	att.Mult_SightTime = 1.05
	att.Mult_ReloadTime = 1.15

	att.Mult_VisualRecoilMult = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m1911_mag50.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m1911_mag50")

	att.PrintName = "50-Round 9mm"
	att.Icon = Material("entities/arccw_mifl_fas2_m1911_mag_50.png", "mips smooth")
	att.Description = "Drum magazine holding 50 rounds effectively reduces the need to reload but adds unecessary bulk. Weaker round but maybe it's worth it."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 50
	att.AutoStats = true
	att.Slot = {"mifl_fas2_m1911_mag"}

	att.Override_ClipSize = 50

	att.Mult_Damage = 0.8
	att.Mult_DamageMin = 0.7
	att.Mult_MoveSpeed = 0.92
	att.Mult_SightTime = 1.1
	att.Mult_ReloadTime = 1.3

	att.Mult_Recoil = 0.92
	att.Mult_RecoilSide = 0.92
	att.Mult_VisualRecoilMult = 0.8

	att.Override_Trivia_Calibre = "9x19mm Parabellum"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m1911_slide_2x.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m1911_slide_2x")

	att.PrintName = "Double Frame"
	att.Icon = Material("entities/arccw_mifl_fas2_m1911_slide_af.png", "mips smooth")
	att.Description = "Twice the gun for twice the firepower."
	att.SortOrder = 12
	att.Desc_Pros = {
	"pro.fas2.double_barrel"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m1911_slide"

	att.Mult_Damage = 2
	att.Mult_DamageMin = 2
	att.Mult_Recoil = 1.8
	att.Mult_RecoilSide = 1.7
	att.Mult_VisualRecoilMult = 1.5
	att.Mult_SightTime = 1.3
	att.Mult_AccuracyMOA = 2
	att.Mult_DrawTime = 1.3
	att.Mult_HipDispersion = 1.5
	att.Mult_RPM = 0.75

	att.Mult_ShootPitch = 0.7

	att.Override_Num = 2
	att.Override_AmmoPerShot = 2
	att.Override_ChamberSize = 2

	att.Override_ClipSize = 14
	att.Override_ClipSize_Priority = 0.1
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m1911_slide_alyx.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m1911_slide_alyx")

	att.PrintName = "Overlord Slide"
	att.Icon = Material("entities/arccw_mifl_fas2_m1911_slide_alyx.png", "mips smooth")
	att.Description = "Custom-made burst-fire mechanism and recoil dampener using Combine dark matter technology. Recoil is greatly reduced until the seventh shot."
	att.SortOrder = 7
	att.AutoStats = true
	att.Slot = "mifl_fas2_m1911_slide"
	att.Mult_SightTime = 1.2
	att.Mult_DrawTime = 1.2
	att.Add_BarrelLength = 4
	att.Mult_Recoil = 0.7
	att.Mult_RPM = 2.75
	att.Mult_ShootPitch = 0.95
	att.Desc_Pros = {
	    "pro.fas2.saf"
	}
	att.Desc_Cons = {
		"con.fas2.saf"
	}
	att.Override_Firemodes = {
	    {
	        Mode = -7,
	        PostBurstDelay = 0.25,
	        CustomBars = "----!"
	    },
	    {
	        Mode = 1
	    },
	    {
	        Mode = 0
	    }
	}

	att.Hook_FiremodeBars = function(wep)
	    if wep:GetCurrentFiremode().Mode == -7 then
	        local gbc = wep:GetBurstCount()
	        local ourreturn = ""
	        ourreturn = ourreturn .. ((gbc >= 1 and "-") or "_")
	        ourreturn = ourreturn .. ((gbc >= 2 and "-") or "_")
	        ourreturn = ourreturn .. ((gbc >= 3 and "-") or "_")
	        ourreturn = ourreturn .. ((gbc >= 4 and "-") or "_")
	        ourreturn = ourreturn .. ((gbc >= 5 and "-") or "_")
	        ourreturn = ourreturn .. ((gbc >= 6 and "-") or "_")

	        if gbc >= 7 then
	            ourreturn = "!!!!!!!"
	        else
	            ourreturn = ourreturn .. "!"
	        end

	        return ourreturn
	    end
	end

	att.Hook_ModifyRecoil = function(wep)
	    local thing

	    if wep:GetBurstCount() >= wep:GetBurstLength() then
	        thing = wep:GetBurstCount()
	    else
	        thing = 0.85
	    end

	    return {
	        Recoil = thing,
	        RecoilSide = thing * 0.8,
	        VisualRecoilMult = 0.75
	    }
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m1911_slide_carbine.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m1911_slide_carbine")

	att.PrintName = "Carbine Slide"
	att.Icon = Material("entities/arccw_mifl_fas2_m1911_slide_carbine.png", "mips smooth")
	att.Description = "Longer barrel extends range."
	att.SortOrder = 8
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m1911_slide"

	att.Mult_Range = 1.2
	att.Mult_DamageMin = 2.2
	att.Mult_Recoil = 0.85
	att.Mult_SightTime = 1.15
	att.Mult_AccuracyMOA = 0.5
	att.Mult_DrawTime = 1.15
	att.Mult_HipDispersion = 0.7
	att.Mult_RPM = 0.8

	att.Add_BarrelLength = 14

	att.Mult_ShootPitch = 1.03
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m1911_slide_compact.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m1911_slide_compact")

	att.PrintName = "Compact Slide"
	att.Icon = Material("entities/arccw_mifl_fas2_m1911_slide_compact.png", "mips smooth")
	att.Description = "Shorter barrel and slide reduces range but increases mobility. Also looks adorable!"
	att.SortOrder = 1
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m1911_slide"

	att.Mult_Range = 0.7
	att.Mult_Recoil = 1.2
	att.Mult_SightTime = 0.7
	att.Mult_AccuracyMOA = 1.2
	att.Mult_DrawTime = 0.7
	att.Mult_HipDispersion = 1.3
	att.Mult_RPM = 1.25

	att.Add_BarrelLength = -4

	att.Mult_ShootPitch = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m1911_slide_para.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m1911_slide_para")

	att.PrintName = "Sweeper Kit"
	att.Icon = Material("entities/arccw_mifl_fas2_m1911_slide_sweeper.png", "mips smooth")
	att.Description = "Conversion and extensive modifications effectively turn the weapon into an SMG. Grip is added for controllability."
	att.SortOrder = 10
	att.Desc_Pros = {
	    "pro.fullauto"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m1911_slide"

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_felin.mdl"

	att.Mult_Recoil = 1.15
	att.Mult_Range = 1.7
	att.Mult_SightTime = 1.3
	att.Mult_DrawTime = 1.3

	att.Add_BarrelLength = 10

	att.Mult_RPM = 1.5

	att.Mult_ShootPitch = 0.95

	att.ModelOffset = Vector(2.5, 0, -1.5)

	att.Override_Firemodes = {
	    {
	        Mode = 2
	    },
	    {
	        Mode = 1
	    }
	}

	att.Override_HoldtypeActive = "ar2"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m1911_stock.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m1911_stock")

	att.PrintName = "Thompson Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_m1911_stock.png", "mips smooth")
	att.Description = "Solid stock increases controllability by a lot but suffers from bulkiness."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m1911_stock"

	att.Mult_MoveSpeed = 0.9
	att.Mult_SightedSpeedMult = 0.8
	att.Mult_SightTime = 0.95
	att.Mult_Recoil = 0.85
	att.Mult_MoveDispersion = 0.8
	att.Mult_VisualRecoilMult = 0.65
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m249_barrel_no.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m249_barrel_no")

	att.PrintName = "No Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_m249_hg_xs.png", "mips smooth")
	att.Description = "Shorten the gun by half at the cost of everything, including your humanity."
	att.SortOrder = 8
	att.Desc_Pros = {
		"pro.fas2.xs",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Override_ShootWhileSprint = true
	att.Slot = "mifl_fas2_m249_hg"
	att.Mult_MoveDispersion = 3
	att.Mult_HipDispersion = 1.5
	att.Add_BarrelLength = -10

	att.Mult_Range = 0.6
	att.Mult_Recoil = 1.6
	att.Mult_RecoilSide = 1.5
	att.Mult_SightTime = 0.5
	att.Mult_AccuracyMOA = 2
	att.Mult_RPM = 1.35
	att.Mult_ReloadTime = 0.8
	att.Mult_SpeedMult = 1.2
	att.Mult_SightedSpeedMult = 1.2

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_sd.mdl"

	att.ModelOffset = Vector(0, 0.5, 0)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m249_barrel_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m249_barrel_sd")

	att.PrintName = "Whisper Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_m249_hg_sd.png", "mips smooth")
	att.Description = "Incase you really want to be undetected while laying suppressive fire."
	att.SortOrder = 8
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true

	att.ActivateElements = {"whisperer"}
	att.GivesFlags = {"mifl_fas2_m249_barrel_sd"}

	att.Slot = "mifl_fas2_m249_hg"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Add_BarrelLength = 6

	att.Mult_ShootPitch = 1.35
	att.Mult_ShootVol = 0.8
	att.Mult_AccuracyMOA = 0.75
	att.Mult_Range = 1.2

	att.Mult_SightTime = 1.125

	att.Mult_HipDispersion = 1.3

	att.Add_BarrelLength = 6

	att.Override_PhysTracerProfile = 5

	att.Mult_RPM = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m249_mag_200.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m249_mag_200")

	att.PrintName = "200-Round 5.56mm"
	att.Icon = Material("entities/arccw_mifl_fas2_m249_200.png", "mips smooth")
	att.Description = "Bigger box magazine offers capacity for handling."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 200
	att.AutoStats = true
	att.Slot = "mifl_fas2_m249_mag"

	att.ActivateElements = {"200"}

	att.Mult_MoveSpeed = 0.9
	att.Mult_SightTime = 1.25
	att.Mult_ReloadTime = 1.25

	att.Override_ClipSize = 200
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m249_mag_23.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m249_mag_23")

	att.PrintName = "30-Round 23mm"
	att.Icon = Material("entities/arccw_mifl_fas2_m249_20.png", "mips smooth")
	att.Description = "Converts the weapon into a scary-sounding LMG-shotgun hybrid, making a mess of the room- at the cost of everything else."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 20
	att.AutoStats = true
	att.Slot = "mifl_fas2_m249_mag"

	att.ActivateElements = {"23"}
	att.Mult_Range = 0.5
	att.Mult_Penetration = 0.1
	att.Mult_Damage = 2.5
	att.Mult_DamageMin = 1.5
	att.Mult_AccuracyMOA = 20
	att.Mult_RPM = 0.4
	att.Override_Num = 17

	att.Override_ClipSize = 30
	att.Mult_MoveSpeed = 0.9
	att.Mult_SightTime = 1.25
	att.Mult_ReloadTime = 1.25

	att.Override_Ammo = "buckshot"
	att.Override_Trivia_Calibre = "23mm"
	att.Override_Trivia_Class = "Shotgun"
	att.Override_ShellScale = 0.8
	att.Override_IsShotgun = true

	att.Override_ShellModel = "models/weapons/arccw/mifl/fas2/shell/23mm.mdl"
	att.Mult_ShellScale = 1

	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m249_mag_556_30.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m249_mag_556_30")

	att.PrintName = "30-Round 5.56"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_ammo_60.png", "mips smooth")
	att.Description = "Standard STANAG magazine. Less heavy than the belt."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 30
	att.AutoStats = true
	att.Slot = "mifl_fas2_m249_mag"

	att.ActivateElements = {"30"}

	att.Mult_MoveSpeed = 1.2
	att.Mult_SightTime = 0.7
	att.Override_ClipSize = 30
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m24_hg_82.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m24_hg_82")

	att.PrintName = "Compensated Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_m24_br_82.png", "mips smooth")
	att.Description = "Heavy handguard, barrel and muzzle brake ripped off from a M82. Dampens recoil to the point of non-existence, but it is incredibly heavy."
	att.SortOrder = 10
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m24_hg"

	att.GivesFlags = {"no_muzzle"}

	att.Mult_Recoil = 0.25
	att.Mult_RecoilSide = 0.5
	att.Mult_Range = 1.25
	att.Mult_HipDispersion = 2
	att.Mult_SightTime = 1.5
	att.Mult_AccuracyMOA = 0.5
	att.Mult_SpeedMult = 0.85
	att.Mult_SightedSpeedMult = 0.75

	att.Mult_ShootPitch = 0.75
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m24_hg_jungle.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m24_hg_jungle")

	att.PrintName = "Jungle Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_m24_br_jungle.png", "mips smooth")
	att.Description = "Shortened and suppressed barrel, complete with jungle camoflauge. For when you feel like crawling in the woods, hunting for Charlie."
	att.SortOrder = 6
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m24_hg"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.GivesFlags = {"no_muzzle"}

	att.Mult_ShootPitch = 1.25
	att.Mult_ShootVol = 0.75
	att.Mult_Range = 0.8
	att.Mult_SightTime = 0.9
	att.Mult_HipDispersion = 1.25

	att.Mult_SpeedMult = 1.05
	att.Mult_SightedSpeedMult = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m24_hg_obrez.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m24_hg_obrez")

	att.PrintName = "Obrez Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_m24_br_obrez.png", "mips smooth")
	att.Description = "Still longer than what you're packing down there."
	att.SortOrder = 0
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m24_hg"

	att.Mult_Recoil = 1.5
	att.Mult_AccuracyMOA = 5
	att.Mult_Range = 0.5
	att.Mult_SightTime = 0.5
	att.Mult_CycleTime = 0.8

	att.Mult_SpeedMult = 1.2
	att.Mult_SightedSpeedMult = 1.4
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m24_hg_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m24_hg_sd")

	att.PrintName = "Whisper Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_m24_br_sd.png", "mips smooth")
	att.Description = "Integrated suppressor for the M24. More manuverable than attachable suppressors, but doesn't improve range."
	att.SortOrder = 8
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m24_hg"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.GivesFlags = {"no_muzzle"}

	att.Mult_ShootPitch = 1.4
	att.Mult_ShootVol = 0.7
	--att.Mult_Range = 0.9
	att.Mult_SightTime = 1.25
	att.Mult_HipDispersion = 1.25
	att.Mult_AccuracyMOA = 0.75
	att.Mult_Recoil = 0.8
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m24_hg_valk.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m24_hg_valk")

	att.PrintName = "Valkyrie Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_m24_br_valk.png", "mips smooth")
	att.Description = "Compact integrated suppressor barrel, much more manuverable but suffers in terms of range and firing volume."
	att.SortOrder = 2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m24_hg"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.GivesFlags = {"no_muzzle"}

	att.Mult_ShootPitch = 1.2
	att.Mult_ShootVol = 0.8
	att.Mult_Range = 0.6
	att.Mult_SightTime = 0.75
	att.Mult_HipDispersion = 0.75
	att.Mult_AccuracyMOA = 1.5

	att.Mult_SpeedMult = 1.1
	att.Mult_SightedSpeedMult = 1.2
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m24_mag_23mm.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m24_mag_23mm")

	att.PrintName = "23mm"
	att.Icon = Material("entities/arccw_mifl_fas2_m24_ammo_23.png", "mips smooth")
	att.Description = "In a move that defies all reason and laws of physics, load what is clearly oversized shotgun cartridges into this rifle. How does it fit? Why does it work? Why hasn't someone stopped you? We may never know."
	att.SortOrder = 1
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m24_mag"

	att.Mult_Recoil = 2.5
	att.Mult_RecoilSide = 1.5
	--att.Mult_Range = 0.5
	att.Mult_Penetration = 0.1
	att.Mult_Damage = 2
	att.Mult_DamageMin = 0.5
	att.Mult_AccuracyMOA = 42

	att.Override_Num = 12
	att.Override_Ammo = "buckshot"
	att.Override_Trivia_Calibre = "23mm"
	att.Override_Trivia_Class = "Shotgun"
	att.Override_ShellModel = "models/weapons/arccw/mifl/fas2/shell/23mm.mdl"
	att.Override_ShellScale = 0.9
	att.AddSuffix = " 23mm"
	att.Override_IsShotgun = true

	att.Mult_ReloadTime = 1.1
	att.Mult_CycleTime = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m24_mag_300.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m24_mag_300")

	att.PrintName = ".300 Winchester Magnum"
	att.Icon = Material("entities/arccw_mifl_fas2_m24_ammo_300.png", "mips smooth")
	att.Description = "Rechamber the rifle in .300WM, a more potent hunting cartridge. Has worse performance up-close due to overpenetration."
	att.SortOrder = 2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m24_mag"

	--att.Mult_Damage = 0.9
	att.Mult_DamageMin = 1.4
	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.5

	att.Override_Trivia_Calibre = ".300 Winchester Magnum"
	att.AddSuffix = " .300"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m24_mag_50.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m24_mag_50")

	att.PrintName = ".50 BMG"
	att.Icon = Material("entities/arccw_mifl_fas2_m24_ammo_50.png", "mips smooth")
	att.Description = "Anti-materiel rifle cartridge that somehow found its way into the chamber of an M24. Fortunately for you, the gun barrel is made of unobtainium and won't explode under the worst of circumstances."
	att.SortOrder = 5
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m24_mag"

	att.Mult_Damage = 3.5
	att.Mult_DamageMin = nil --0.5
	att.Mult_Range = 1.25
	att.Mult_Recoil = 5
	att.Mult_RecoilSide = 1.5
	att.Mult_ReloadTime = 1.2
	att.Mult_CycleTime = 1.2

	att.Mult_ShootPitch = 1.25
	att.Mult_ShootVol = 1.2

	att.Override_Ammo = "SniperPenetratedRound"
	att.Override_Trivia_Calibre = ".50 BMG"
	att.AddSuffix = " .50"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/m24/m24_fire1.wav" then return "weapons/arccw_mifl/fas2/m82/m82_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/m24/m24_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/m82/m82_whisper.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m24_mag_9mm.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m24_mag_9mm")

	att.PrintName = "9x19mm"
	att.Icon = Material("entities/arccw_mifl_fas2_m24_ammo_9mm.png", "mips smooth")
	att.Description = "Rechamber the rifle to fire pistol-caliber cartridges. Pathetic as it may be, it can probably still hurt someone's feelings."
	att.SortOrder = 0
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m24_mag"

	att.Override_Ammo = "pistol"
	att.Override_ShellModel = "models/shells/shell_9mm.mdl"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"

	att.Mult_Damage = 0.45
	att.Mult_DamageMin = 0.3
	att.Mult_Range = 0.7

	att.Mult_Recoil = 0.25
	att.Mult_RecoilSide = 0.3

	att.Mult_Penetration = 0.3

	att.Mult_ReloadTime = 0.7
	att.Mult_CycleTime = 0.75

	att.Mult_ShootVol = 0.8
	att.AddSuffix = " 9mm"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/m24/m24_fire1.wav" then return "weapons/arccw_mifl/fas2/mac11/mac11_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/m24/m24_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/mac11/mac11_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m3_barrel_s.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m3_barrel_s")

	att.PrintName = "Breaching Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_m3_barrel_breach.png", "smooth")
	att.Description = "Shorter barrel with a wider bore. More akin to a breaching device. The tiny tube and a lack of an adaptor negates the ability to extend the capacity"
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 5

	att.Slot = {"mifl_fas2_m3_barrel"}
	att.AutoStats = true

	att.Override_ClipSize = 2
	att.Override_Num = 15
	att.Mult_AccuracyMOA = 1.5
	att.Mult_SpeedMult = 1.2
	att.Mult_SightTime = 0.65
	att.Mult_MoveDispersion = 0.65
	att.Mult_ReloadTime = 0.75
	att.Mult_Damage = 1.15
	att.Mult_DamageMin = 1.5
	att.LHIK = true
	att.LHIK_Priority = -20

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_sd.mdl"

	att.ModelOffset = Vector(2, 0.5, 1)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m3_stock_ex.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m3_stock_ex")

	att.PrintName = "Extended Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_m3_grip_ex.png", "smooth")
	att.Description = "Modern sliding stock that improves mobility."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 6

	att.Slot = "mifl_fas2_m3_stock"
	att.AutoStats = true

	att.Mult_Recoil = 1.2
	att.Mult_RecoilSide = 1.25
	att.Mult_SightTime = 0.85
	att.Mult_DrawTime = 0.85
	att.Mult_HolsterTime = 0.85

	att.Mult_SightedSpeedMult = 1.25
	att.Mult_MoveSpeed = 1.15
	att.Mult_ReloadTime = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m3_stock_re.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m3_stock_re")

	att.PrintName = "Rectracted Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_m3_grip_col.png", "smooth")
	att.Description = "Retracted sliding stock improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 5

	att.Slot = "mifl_fas2_m3_stock"
	att.AutoStats = true

	att.Mult_Recoil = 2
	att.Mult_RecoilSide = 1.5
	att.Mult_SightTime = 0.75
	att.Mult_DrawTime = 0.75
	att.Mult_HolsterTime = 0.75

	att.Mult_SightedSpeedMult = 1.35
	att.Mult_MoveSpeed = 1.2
	att.Mult_ReloadTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m3_tube_x.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m3_tube_x")

	att.PrintName = "7-Round 12 Gauge Tube"
	att.Icon = Material("entities/arccw_mifl_fas2_ks23_tube_12x.png", "smooth")
	att.Description = "Medium length tube magazine."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 50

	att.Slot = "mifl_fas2_m3_mag"
	att.AutoStats = true

	att.Override_ClipSize = 7
	att.Mult_ReloadTime = 1.05
	att.Mult_SightTime = 1.05
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m3_tube_xx.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m3_tube_xx")

	att.PrintName = "12-Round 12 Gauge Tube"
	att.Icon = Material("entities/arccw_mifl_fas2_ks23_tube_12xx.png", "smooth")
	att.Description = "Long tube magazine."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 50

	att.Slot = "mifl_fas2_m3_mag"
	att.AutoStats = true

	att.Override_ClipSize = 12

	att.Mult_ReloadTime = 1.1
	att.Mult_SightTime = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_barrel_a1.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_barrel_a1")

	att.PrintName = "A1 Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_hg_a1.png", "mips smooth")
	att.Description = "Antique handguard from the ‘Nam days. Heavy weight reduces recoil significantly."
	att.SortOrder = 11
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m4a1_hg"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 2
	att.Mult_Recoil = 0.5
	att.Mult_AccuracyMOA = 0.6
	att.Mult_SightTime = 1.3
	att.Mult_HipDispersion = 1.3

	att.Mult_ShootPitch = 0.9

	att.Add_BarrelLength = 8
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_barrel_a2.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_barrel_a2")

	att.PrintName = "A2 Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_hg_a2.png", "mips smooth")
	att.Description = "Revised handguard used during the peak of the Cold War. Configured to only fire in 3 round bursts for ammo conservation purposes."
	att.SortOrder = 9
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m4a1_hg"

	att.Mult_MoveSpeed = 0.925

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.8
	att.Mult_AccuracyMOA = 0.7
	att.Mult_SightTime = 1.15
	att.Mult_HipDispersion = 1.15

	att.Add_BarrelLength = 7

	att.Mult_RPM = 1.2

	att.Mult_ShootPitch = 0.9

	att.Override_Firemodes = {
	    {
	        Mode = -3,
	    },
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_barrel_a3.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_barrel_a3")

	att.PrintName = "A3 Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_hg_a2.png", "mips smooth")
	att.Description = "Automatic variant of the A2 handguard, used by select branches of the US military."
	att.SortOrder = 8.9
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m4a1_hg"

	att.Mult_MoveSpeed = 0.925

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.8
	att.Mult_AccuracyMOA = 0.7
	att.Mult_SightTime = 1.15
	att.Mult_HipDispersion = 1.15

	att.Add_BarrelLength = 7

	att.Mult_ShootPitch = 0.9

	att.InvAtt = "mifl_fas2_m4a1_barrel_a2"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_barrel_a4.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_barrel_a4")

	att.PrintName = "A4 Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_hg_a4.png", "mips smooth")
	att.Description = "Modern long barrel and handguard with extended rails."
	att.SortOrder = 10
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m4a1_hg"
	att.GivesFlags = {"allowubgl"}

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 2
	att.Mult_Recoil = 0.7
	att.Mult_AccuracyMOA = 0.6
	att.Mult_SightTime = 1.2
	att.Mult_HipDispersion = 1.2

	att.Add_BarrelLength = 8

	att.Mult_ShootPitch = 0.85
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_barrel_ar2.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_barrel_ar2")

	att.PrintName = "Overlord Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_hg_ar2.png", "mips smooth")
	att.Description = "Salvaged combine technology applied to a traditional ballistic weapon. Accelerates bullet with dark energy, giving it additional range and damage at little cost."
	att.SortOrder = -1
	att.Desc_Pros = {
	    "Selectable underbarrel grenade launcher",
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
		"Double tap +ZOOM to equip/dequip",
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m4a1_hg"

	att.Mult_Range = 1.5
	att.Mult_Damage = 1.3
	att.Mult_DamageMin = 1.3
	att.Mult_Recoil = 1.25
	att.Mult_RecoilSide = 1.5
	att.Mult_RPM = 0.85

	att.Add_BarrelLength = -3

	att.ModelOffset = Vector(2, 0, -1.5)
	att.Override_MuzzleEffect = "ar2_muzzle"

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_k.mdl"

	att.Mult_HipDispersion = 1.25

	att.Mult_ShootPitch = 1.4

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/ar2/fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/mac11/mac11_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/ar2/fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m16a2_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/ar2/fire1.wav" end
	end







	att.UBGL = true

	att.UBGL_PrintName = "AR2 (Energy)"
	att.UBGL_Automatic = false
	att.UBGL_MuzzleEffect = "muzzleflash_m3"
	att.UBGL_ClipSize = 4
	att.UBGL_Ammo = "AR2AltFire"
	att.UBGL_RPM = 60
	att.UBGL_Recoil = 2
	att.UBGL_Capacity = 1

	local function Ammo(wep)
	    return wep.Owner:GetAmmoCount("AR2AltFire")
	end

	att.Hook_LHIK_TranslateAnimation = function(wep, key)
	    if key == "idle" then
	        if wep:GetInUBGL() then
	            return "pose"
	        else
	            return "idle"
	        end
	    end
	end

	att.Hook_OnSelectUBGL = function(wep)
		wep:DoLHIKAnimation("in", 25/60)
	    wep:PlaySoundTable({
	        {s = "Arccw_FAS2_Generic.Cloth_Movement" ,		t = 0},
	    })
	end

	att.Hook_OnDeselectUBGL = function(wep)
		wep:DoLHIKAnimation("out", 25/60)
	    wep:PlaySoundTable({
	        {s = "Arccw_FAS2_Generic.Cloth_Movement" ,		t = 0},
	    })
	end

	att.UBGL_Fire = function(wep, ubgl)
	    if wep:Clip2() <= 0 then return end

	    wep:DoLHIKAnimation("fire", 10/60)

	    wep:FireRocket("arccw_gl_m79_cball", 30000)

	    wep:EmitSound("weapons/irifle/irifle_fire2.wav", 100)

	    wep:SetClip2(wep:Clip2() - 1)

	    wep:DoEffects()
	end

	att.UBGL_Reload = function(wep, ubgl)
	    if wep:Clip2() >= 1 then return end

	    if wep:Clip2() == 0 then

	        wep:DoLHIKAnimation("reload", 60/60)

	        wep:SetNextSecondaryFire(CurTime() + 60/60)

	        wep:PlaySoundTable({
	            {s = "weapons/arccw_mifl/fas2/famas/famas_magout_empty.wav", t = 5/60},
				{s = "weapons/arccw_mifl/fas2/g3/g3_magin.wav",		t = 20/60},
	        })
	    end

	    local reserve = Ammo(wep)

	    reserve = reserve + wep:Clip2()

	    local clip = 1

	    local load = math.Clamp(clip, 0, reserve)

	    wep.Owner:SetAmmo(reserve - load, "AR2AltFire")

	    wep:SetClip2(load)
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_barrel_commando.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_barrel_commando")

	att.PrintName = "Commando Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_hg_cmd.png", "mips smooth")
	att.Description = "Shorter handguard meant for use by action heroes or commando units."
	att.SortOrder = -8
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
		"con.fas2.ubgl"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m4a1_hg"

	att.Mult_MoveSpeed = 1.05

	att.Mult_Range = 0.5
	att.Mult_Recoil = 1.5
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 3
	att.Mult_HipDispersion = 0.8
	att.Mult_RPM = 1.2

	att.Mult_ShootPitch = 1.2

	att.Add_BarrelLength = -7

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_k.mdl"

	att.ModelOffset = Vector(1, -0.5, 1.5)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_barrel_famas.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_barrel_famas")

	att.PrintName = "Fusile Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_hg_famas.png", "mips smooth")
	att.Description = "A FAMAS top piece hotwelded to your gun. The non-functional charging handle only adds insult to injury."
	att.SortOrder = -2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m4a1_hg"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.1
	att.Mult_AccuracyMOA = 1.5
	att.Mult_RPM = 1.4

	att.Add_BarrelLength = -4

	att.ModelOffset = Vector(1, -0.5, 1.5)

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_sd.mdl"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_barrel_heat.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_barrel_heat")

	att.PrintName = "HEAT Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_hg_heat.png", "mips smooth")
	att.Description = "Heat-shielded handguard. Cooling system gives the weapon an edge over the laws of thermal dynamics."
	att.SortOrder = 1
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m4a1_hg"
	att.GivesFlags = {"allowubgl"}

	att.Mult_Range = 1.1
	att.Mult_Recoil = 0.9
	att.Mult_SightTime = 1.2
	att.Mult_AccuracyMOA = 0.9

	att.Add_BarrelLength = 2

	att.Mult_ShootPitch = 0.95


	att.Mult_HeatCapacity = 1.5
	att.Mult_FixTime = 0.5
	att.Mult_HeatDissipation = 1.25
	att.Mult_HeatDelayTime = 0.5
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_barrel_jungle.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_barrel_jungle")

	att.PrintName = "Jungle Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_hg_jungle.png", "mips smooth")
	att.Description = "Long integral suppressor handguard complete with jungle camoflauge. Such fine technology did not exist in the 'Nam days, but don't let a little technality get in the way of your war crimes."
	att.SortOrder = 2
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m4a1_hg"
	att.GivesFlags = {"mifl_fas2_m4a1_barrel_sd"}

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Mult_MoveSpeed = 0.95

	att.Mult_Recoil = 0.8
	att.Mult_AccuracyMOA = 0.75
	att.Mult_Range = 1.5

	att.Mult_SightTime = 1.25
	att.Mult_HipDispersion = 1.5

	att.Mult_ShootPitch = 1.4
	att.Mult_ShootVol = 0.7

	att.Add_BarrelLength = 4
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_barrel_kompact.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_barrel_kompact")

	att.PrintName = "Carbine Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_hg_g36c.png", "mips smooth")
	att.Description = "In the unholy pursuit of adding more polymer to every rifle is born this abomination. It is supposedly lighter, but the benefits are debatable."
	att.SortOrder = -3
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
		"con.fas2.ubgl"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m4a1_hg"

	att.Mult_MoveSpeed = 1.05
	att.Mult_SightedMoveSpeed = 1.1

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.2
	att.Mult_SightTime = 0.75
	att.Mult_AccuracyMOA = 1.5

	att.Add_BarrelLength = -5

	att.Mult_ShootPitch = 1.2
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_barrel_no.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_barrel_no")

	att.PrintName = "No Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_hg_no.png", "mips smooth")
	att.Description = "You seem to have taken a little too much off the front there."
	att.SortOrder = -10
	att.Desc_Pros = {
		"pro.fas2.xs",
	}
	att.Desc_Cons = {
		"con.fas2.ubgl"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m4a1_hg"
	att.Override_ShootWhileSprint = true
	att.Mult_MoveSpeed = 1.15
	att.Mult_SightedMoveSpeed = 1.3
	att.Mult_MoveDispersion = 3
	att.Mult_HipDispersion = 1.5
	att.Mult_Range = 0.4
	att.Mult_Recoil = 1.75
	att.Mult_SightTime = 0.5
	att.Mult_AccuracyMOA = 4
	att.Mult_RPM = 1.15

	att.Add_BarrelLength = -9

	att.ModelOffset = Vector(-5, -4.5, 1.2)

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_m4x.mdl"

	att.Mult_ShootPitch = 1.4
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_barrel_para_a1.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_barrel_para_a1")

	att.PrintName = "Paratrooper Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_hg_a1k.png", "mips smooth")
	att.Description = "Homemade shortened M4 carbine with a M16A1 front and a 5-round burst mechanism."
	att.SortOrder = -6
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
		"con.fas2.ubgl"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m4a1_hg"

	att.Mult_MoveSpeed = 1.05

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.2
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 2
	att.Mult_HipDispersion = 0.9

	att.Mult_ShootPitch = 1.2

	att.Add_BarrelLength = -5

	att.Override_Firemodes = {
	    {
	        Mode = -5,
	        Mult_RPM = 1.5,
	        PostBurstDelay = 0.14
	    },
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_barrel_ribs.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_barrel_ribs")

	att.PrintName = "Covered Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_hg_ris.png", "mips smooth")
	att.Description = "Rail covers, increasing the weight of the weapon and looking good while doing it."
	att.SortOrder = 0
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m4a1_hg"

	att.Mult_SightedSpeedMult = 0.75
	att.Mult_SightTime = 1.1
	att.Mult_Recoil = 0.9
	att.Mult_RecoilSide = 0.75
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_barrel_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_barrel_sd")

	att.PrintName = "Whisper Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_hg_sd.png", "mips smooth")
	att.Description = "Handguard modified to be lighter and more manuverous. Comes with an integrated suppressor."
	att.SortOrder = 0.5
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true

	att.ActivateElements = {"whisperer"}

	att.Slot = "mifl_fas2_m4a1_hg"

	att.GivesFlags = {"mifl_fas2_m4a1_barrel_sd"}

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Mult_ShootPitch = 1.5
	att.Mult_ShootVol = 0.75
	att.Mult_AccuracyMOA = 0.75
	att.Mult_Range = 1.25
	att.Mult_HipDispersion = 1.25

	att.Mult_SightTime = 1.25
	ArcCW.LoadAttachmentType(att)
end

