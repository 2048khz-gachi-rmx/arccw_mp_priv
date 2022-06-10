local Material = ArcCW.AttachmentMat

------
-- go_supp_nt4.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_supp_nt4")

	att.PrintName = "NT-4 Suppressor"
	att.Icon = Material("entities/acwatt_go_supp_nt4.png", "mips smooth")
	att.Description = "Lightweight tactical suppressor. Reduces audible report with no significant bulk. However, it has a negative impact on weapon performance."

	att.SortOrder = 1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.SortOrder = 15

	att.Model = "models/weapons/arccw_go/atts/supp_ntr.mdl"

	att.ModelScale = Vector(1.25, 1.25, 1.25)

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true

	att.Mult_ShootPitch = 1.1
	att.Mult_ShootVol = 0.75
	att.Mult_Range = 0.9

	att.Add_BarrelLength = 8

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_supp_osprey.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_supp_osprey")

	att.PrintName = "Osprey Suppressor"
	att.Icon = Material("entities/acwatt_go_supp_osprey.png", "mips smooth")
	att.Description = "Large sound suppressor with ballistic-enhancing qualities. Can be used on shotguns."

	att.Desc_Pros = {}
	att.Desc_Cons = {}

	att.AutoStats = true
	att.Slot = "muzzle"

	att.SortOrder = 20

	att.Model = "models/weapons/arccw_go/atts/supp_osprey.mdl"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true

	att.Mult_ShootPitch = 1
	att.Mult_ShootVol = 0.85
	att.Mult_AccuracyMOA = 0.95
	att.Mult_Range = 1.05

	att.Mult_SightTime = 1.05
	--att.Mult_HipDispersion = 1.15

	att.Add_BarrelLength = 4

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_supp_osprey_shot.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_supp_osprey_shot")

	att.PrintName = "Osprey Suppressor"
	att.Icon = Material("entities/acwatt_go_supp_osprey.png", "mips smooth")
	att.Description = "Large sound suppressor with ballistic-enhancing qualities. Somewhat cumbersome. Can be used on shotguns."

	att.SortOrder = 2

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.InvAtt = "go_supp_osprey"

	att.SortOrder = 15

	att.Model = "models/weapons/arccw_go/atts/supp_osprey.mdl"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true

	att.Mult_ShootPitch = 0.9
	att.Mult_ShootVol = 0.75
	att.Mult_SightTime = 1.15

	att.Add_BarrelLength = 16

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_supp_pbs1.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_supp_pbs1")

	att.PrintName = "PBS-1 Suppressor"
	att.Icon = Material("entities/acwatt_go_supp_pbs1.png", "mips smooth")
	att.Description = "Huge suppressor that makes shots whisper-quiet and enhances muzzle velocity. However, it is very bulky."

	att.SortOrder = 3

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.SortOrder = 17

	att.Model = "models/weapons/arccw_go/atts/supp_pbs1.mdl"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true

	-- pbs-1: better ballistics, worse handling than monster
	-- better for stationary

	att.Mult_ShootPitch = 0.9
	att.Mult_ShootVol = 0.75
	att.Mult_AccuracyMOA = 0.6
	att.Mult_Range = 1.4
	att.Mult_Recoil = 0.9
	att.Mult_RecoilSide = 0.85
	att.Mult_MoveDispersion = 1.4

	att.Mult_SightTime = 1.5
	att.Mult_HipDispersion = 1.5

	att.Add_BarrelLength = 12

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_supp_pbs4.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_supp_pbs4")

	att.PrintName = "PBS-4 Suppressor"
	att.Icon = Material("entities/acwatt_go_supp_pbs4.png", "mips smooth")
	att.Description = "Large sound suppressor with ballistic-enhancing qualities. Somewhat cumbersome. Russian equivalent to the QDSS."

	att.SortOrder = 2

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.SortOrder = 15

	att.Model = "models/weapons/arccw_go/atts/supp_pbs4.mdl"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true

	att.Mult_ShootPitch = 1
	att.Mult_ShootVol = 0.75
	att.Mult_AccuracyMOA = 0.8
	att.Mult_Range = 1.1

	att.Mult_SightTime = 1.1
	att.Mult_HipDispersion = 1.15

	att.Add_BarrelLength = 8

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_supp_qdss.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_supp_qdss")

	att.PrintName = "QDSS Suppressor"
	att.Icon = Material("entities/acwatt_go_supp_qdss.png", "mips smooth")
	att.Description = "Large sound suppressor with ballistic-enhancing qualities. Somewhat cumbersome."

	att.SortOrder = 2

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.SortOrder = 15

	att.Model = "models/weapons/arccw_go/atts/supp_rif.mdl"

	att.OffsetAng = Angle(0, 0, 0)

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true

	att.Mult_ShootPitch = 1
	att.Mult_ShootVol = 0.75
	att.Mult_AccuracyMOA = 0.8
	att.Mult_Range = 1.1

	att.Mult_SightTime = 1.1
	att.Mult_HipDispersion = 1.15

	att.Add_BarrelLength = 8

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_supp_rotor43.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_supp_rotor43")

	att.PrintName = "Rotor43 Suppressor"
	att.Icon = Material("entities/acwatt_go_supp_rotor43.png", "mips smooth")
	att.Description = "Huge suppressor that makes shots whisper-quiet and enhances muzzle velocity. However, it is very bulky. Can be used on shotguns."

	att.SortOrder = 3

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.SortOrder = 18

	att.Model = "models/weapons/arccw_go/atts/supp_large.mdl"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true

	att.Mult_ShootVol = 0.75
	att.Mult_AccuracyMOA = 0.85
	att.Mult_Range = 1.15
	att.Mult_Recoil = 0.9
	att.Mult_MoveDispersion = 1.15

	att.Mult_HipDispersion = 1.2
	att.Mult_SightTime = 1.35

	att.Add_BarrelLength = 8

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_supp_rotor43_shot.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_supp_rotor43_shot")

	att.PrintName = "Rotor43 Suppressor"
	att.Icon = Material("entities/acwatt_go_supp_rotor43.png", "mips smooth")
	att.Description = "Huge suppressor that makes shots whisper-quiet. However, it is very bulky. Can be used on shotguns."

	att.SortOrder = 3

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.InvAtt = "go_supp_rotor43"

	att.SortOrder = 15

	att.Model = "models/weapons/arccw_go/atts/supp_large.mdl"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true

	att.Mult_ShootPitch = 0.9
	att.Mult_ShootVol = 0.75
	att.Mult_SightTime = 1.15

	att.Add_BarrelLength = 16

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_supp_ssq.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_supp_ssq")

	att.PrintName = "SSQ Suppressor"
	att.Icon = Material("entities/acwatt_go_supp_ssq.png", "mips smooth")
	att.Description = "Lightweight tactical suppressor. Reduces audible report with no significant bulk. However, it has a negative impact on weapon performance. 'SSQ' stands for 'Silencer, Super Quiet'."

	att.SortOrder = 1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.SortOrder = 19

	att.Model = "models/weapons/arccw_go/atts/supp_ssq.mdl"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true

	att.Mult_ShootPitch = 1
	att.Mult_ShootVol = 0.8
	att.Mult_AccuracyMOA = 0.9
	att.Mult_Range = 1.1
	att.Mult_Recoil = 0.95
	att.Mult_MoveDispersion = 1.1

	att.Mult_SightTime = 1.15
	--att.Mult_HipDispersion = 1.15

	att.Add_BarrelLength = 6

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_supp_tgpa.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_supp_tgpa")

	att.PrintName = "TGP-A Suppressor"
	att.Icon = Material("entities/acwatt_go_supp_tgpa.png", "mips smooth")
	att.Description = "Lightweight tactical suppressor. Reduces audible report with no significant bulk. However, it has a negative impact on weapon performance. Russian equivalent to the NT-4."

	att.SortOrder = 1

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"

	att.SortOrder = 15

	att.Model = "models/weapons/arccw_go/atts/supp_tgpa.mdl"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true

	att.Mult_ShootPitch = 1.1
	att.Mult_ShootVol = 0.75
	att.Mult_Range = 0.9

	att.Add_BarrelLength = 8

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_tec9_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_tec9_barrel_long")

	att.PrintName = "200mm JATI Barrel"
	att.Icon = Material("entities/acwatt_go_tec9_barrel_long.png", "mips smooth")
	att.Description = "Long shrouded barrel that improves range but also adds weight."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_tec9_barrel"

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.5
	att.Mult_AccuracyMOA = 0.5
	att.Mult_DrawTime = 1.15

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_tec9_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_tec9_barrel_short")

	att.PrintName = "90mm AB-1 Barrel"
	att.Icon = Material("entities/acwatt_go_tec9_barrel_short.png", "mips smooth")
	att.Description = "Short barrel developed to meet regulations of the 1994 Assault Weapons Ban. Improves handling, though reduces range."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_tec9_barrel"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 1.5
	att.Mult_DrawTime = 0.75

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_tec9_mag_10.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_tec9_mag_10")

	att.PrintName = "10-Round 9mm TEC-9"
	att.Icon = Material("entities/acwatt_go_tec9_mag_10.png", "mips smooth")
	att.Description = "Small magazine with lighter load. Improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 10
	att.AutoStats = true
	att.Slot = "go_tec9_mag"

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Override_ClipSize = 10
	att.Mult_ReloadTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_tec9_mag_32.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_tec9_mag_32")

	att.PrintName = "32-Round 9mm TEC-9"
	att.Icon = Material("entities/acwatt_go_tec9_mag_32.png", "mips smooth")
	att.Description = "Extended magazine improves capacity at the cost of handling."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 32
	att.AutoStats = true
	att.Slot = "go_tec9_mag"

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.1
	att.Override_ClipSize = 32
	att.Mult_ReloadTime = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ump_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ump_barrel_long")

	att.PrintName = "350mm USC Barrel"
	att.Icon = Material("entities/acwatt_go_ump_barrel_long.png", "mips smooth")
	att.Description = "USC civilian carbine barrel. Good for long range engagements."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ump_barrel"

	att.Mult_MoveSpeed = 0.9

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.5
	att.Mult_AccuracyMOA = 0.75

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ump_barrel_med.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ump_barrel_med")

	att.PrintName = "220mm HK Barrel"
	att.Icon = Material("entities/acwatt_go_ump_barrel_med.png", "mips smooth")
	att.Description = "Medium-length barrel for the UMP."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ump_barrel"

	att.Mult_Range = 1.15
	att.Mult_Recoil = 0.9
	att.Mult_SightTime = 1.1
	att.Mult_AccuracyMOA = 0.9

	att.Mult_ShootPitch = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ump_mag_12.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ump_mag_12")

	att.PrintName = "12-Round .45 UMP"
	att.Icon = Material("entities/acwatt_go_ump_mag_12.png", "mips smooth")
	att.Description = "Small magazine with lighter load. Improves handling."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 12
	att.AutoStats = true
	att.Slot = "go_ump_mag"

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Override_ClipSize = 12
	att.Mult_ReloadTime = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ump_mag_30_9mm.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ump_mag_30_9mm")

	att.PrintName = "30-Round 9mm UMP-9"
	att.Icon = Material("entities/acwatt_go_ump_mag_30_9mm.png", "mips smooth")
	att.Description = "9mm magazine conversion for the UMP-45 submachine gun."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 30
	att.AutoStats = true
	att.Slot = "go_ump_mag"

	att.Mult_Range = 1.1
	att.Mult_Penetration = 0.8
	att.Mult_Recoil = 0.9
	att.Mult_RPM = 1.15
	att.Mult_AccuracyMOA = 1.25
	att.Override_ClipSize = 30
	att.Mult_Damage = 0.75
	att.Mult_DamageMin = 0.8
	att.Mult_ShootPitch = 1.25

	-- ump45_9mm

	att.Hook_GetShootSound = function(wep, ss)
	    if ss == "arccw_go/ump45/ump45_02.wav" or ss == "arccw_go/ump45/ump45_02.wav" then
	        return "arccw_go/ump45/ump45_9mm.wav"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_ump_stock_in.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_ump_stock_in")

	att.PrintName = "Folded Stock"
	att.Icon = Material("entities/acwatt_go_ump_stock_in.png", "mips smooth")
	att.Description = "Folding the stock improves handling but reduces recoil controllability."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ump_stock"

	att.Free = true

	att.Mult_Recoil = 2
	att.Mult_SpeedMult = 1.25
	att.Mult_SightTime = 0.75

	att.NoStock = true
	ArcCW.LoadAttachmentType(att)
end

------
-- go_usp_mag_15_9.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_usp_mag_15_9")

	att.PrintName = "18-Round 9mm USP"
	att.Icon = Material("entities/acwatt_go_usp_mag_regular.png", "mips smooth")
	att.Description = "Converts the pistol into 9mm, allowing for higher mag capacity and more controlability."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 2.5
	att.AutoStats = true
	att.Slot = "go_usp_mag"

	att.ActivateElements = {"9mm"}
	att.Override_ClipSize = 18
	att.Mult_Damage = 0.7
	att.Mult_DamageMin = 0.9
	att.Mult_Recoil = 0.8
	att.Mult_RPM = 1.15
	--att.Mult_ShootPitch = 0.85

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return {"arccw_go/usp/usp_unsilenced_9mm_01.wav", "arccw_go/usp/usp_unsilenced_9mm_02.wav", "arccw_go/usp/usp_unsilenced_9mm_03.wav"} end
	end
	att.Hook_GetDistantShootSound = function(wep, sound)
	    if snd == wep.DistantShootSound then return "arccw_go/hkp2000/hkp2000-1-distant.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_usp_mag_20.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_usp_mag_20")

	att.PrintName = "20-Round .45 USP"
	att.Icon = Material("entities/acwatt_go_usp_mag_20.png", "mips smooth")
	att.Description = "Extended magazine for the USP-45 pistol. Medium length balances increased capacity with increased weight."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 20
	att.AutoStats = true
	att.Slot = "go_usp_mag"

	att.Override_ClipSize = 20

	att.Mult_MoveSpeed = 0.99
	att.Mult_SightTime = 1.05
	att.Mult_ReloadTime = 1.05

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_med"
	    elseif anim == "reload_empty" then
	        return "reload_med_empty"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_usp_mag_25_9.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_usp_mag_25_9")

	att.PrintName = "25-Round 9mm USP"
	att.Icon = Material("entities/acwatt_go_usp_mag_20.png", "mips smooth")
	att.Description = "Extended magazine for the 9mm USP conversion. Medium length balances increased capacity with increased weight."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 2.25
	att.AutoStats = true
	att.Slot = "go_usp_mag"

	att.ActivateElements = {"9mm", "go_usp_mag_20"}
	att.Override_ClipSize = 25
	att.Mult_Damage = 0.7
	att.Mult_DamageMin = 0.9
	att.Mult_Recoil = 0.8
	att.Mult_RPM = 1.15
	--att.Mult_ShootPitch = 0.85

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.15
	att.Mult_ReloadTime = 1.25

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_med"
	    elseif anim == "reload_empty" then
	        return "reload_med_empty"
	    end
	end

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return {"arccw_go/usp/usp_unsilenced_9mm_01.wav", "arccw_go/usp/usp_unsilenced_9mm_02.wav", "arccw_go/usp/usp_unsilenced_9mm_03.wav"} end
	end
	att.Hook_GetDistantShootSound = function(wep, sound)
	    if snd == wep.DistantShootSound then return "arccw_go/hkp2000/hkp2000-1-distant.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_usp_mag_30.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_usp_mag_30")

	att.PrintName = "30-Round .45 USP"
	att.Icon = Material("entities/acwatt_go_usp_mag_30.png", "mips smooth")
	att.Description = "Extended magazine for the USP-45 pistol. Heavy, but may be worth the extra ammo."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 30
	att.AutoStats = true
	att.Slot = "go_usp_mag"

	att.Override_ClipSize = 30

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.15
	att.Mult_ReloadTime = 1.25

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_long"
	    elseif anim == "reload_empty" then
	        return "reload_long_empty"
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_usp_mag_40_9.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_usp_mag_40_9")

	att.PrintName = "40-Round 9mm USP"
	att.Icon = Material("entities/acwatt_go_usp_mag_30.png", "mips smooth")
	att.Description = "Extended magazine for the 9mm USP conversion. Heavy, but may be worth the extra ammo."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 2
	att.AutoStats = true
	att.Slot = "go_usp_mag"

	att.ActivateElements = {"9mm", "go_usp_mag_30"}
	att.Override_ClipSize = 40
	att.Mult_Damage = 0.7
	att.Mult_DamageMin = 0.9
	att.Mult_Recoil = 0.8
	att.Mult_RPM = 1.15
	--att.Mult_ShootPitch = 0.85

	att.Mult_MoveSpeed = 0.9
	att.Mult_SightTime = 1.25
	att.Mult_ReloadTime = 1.4

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_long"
	    elseif anim == "reload_empty" then
	        return "reload_long_empty"
	    end
	end

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return {"arccw_go/usp/usp_unsilenced_9mm_01.wav", "arccw_go/usp/usp_unsilenced_9mm_02.wav", "arccw_go/usp/usp_unsilenced_9mm_03.wav"} end
	end
	att.Hook_GetDistantShootSound = function(wep, sound)
	    if snd == wep.DistantShootSound then return "arccw_go/hkp2000/hkp2000-1-distant.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- go_usp_mag_8_127.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_usp_mag_8_127")

	att.PrintName = "8-Round M225 M6D"
	att.Icon = Material("entities/acwatt_go_usp_mag_20.png", "mips smooth")
	att.Description = "How did you manage to do this?\nConverts the weapon to fire the M225 12.7x40mm SAP-HE (semi-armor-piercing, high-explosive) round.\nRequires a barrel conversion."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 0
	att.AutoStats = true
	att.Slot = "go_usp_mag"
	att.Ignore = true

	att.ActivateElements = {"go_usp_mag_20"}
	att.GivesFlags = {"nocomp"}
	att.Override_ClipSize = 8
	att.Mult_Damage = 1.25
	att.Mult_DamageMin = 1.25
	att.Mult_Recoil = 2
	att.Mult_RPM = 0.45
	--att.Mult_ShootPitch = 0.85

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.2
	att.Mult_ReloadTime = 1.2

	att.Hook_SelectReloadAnimation = function(wep, anim)
	    if anim == "reload" then
	        return "reload_med"
	    elseif anim == "reload_empty" then
	        return "reload_med_empty"
	    end
	end

	--[[]
	att.Override_Firemodes_Priority = -2
	att.Override_Firemodes = {
	    {
	        Mode = 2,
	    },
	    {
	        Mode = 1,
		},
	    {
	        Mode = 0
	    }
	}
	]]

	att.Hook_GetShootSound = function(wep, snd)
	    if snd == wep.ShootSound or snd == wep.FirstShootSound then return "arccw_go/usp/usp_unsilenced_127.wav" end
	end
	att.Hook_GetDistantShootSound = function(wep, sound)
	    if snd == wep.DistantShootSound then return "arccw_go/deagle/deagle-1-distant.wav" end
	end

	--MA-HK USP-X12.7 PDWS
	ArcCW.LoadAttachmentType(att)
end

------
-- go_usp_muzzle_match.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_usp_muzzle_match")

	att.PrintName = "Match Compensator"
	att.Icon = Material("entities/acwatt_go_usp_muzzle_match.png", "smooth mips")
	att.Description = "Special fitted compensator for the USP, greatly improving recoil control, precision, and on-the-move accuracy.\nThis occupies the lower rail, making optic mounts, LAMs and different slide lengths impossible to use."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Slot = "go_muzzle_usp"

	att.ExcludeFlags = {"nocomp"}

	att.AutoStats = true

	att.Mult_ShootPitch = 0.9
	att.Mult_MoveDispersion = 0.5
	att.Mult_AccuracyMOA = 0.5
	att.Mult_Recoil = 0.75
	att.Mult_RecoilSide = 0.75
	att.Mult_Range = 1.25

	--att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.15
	att.Mult_SightedSpeedMult = 0.85

	att.SortOrder = 1000
	ArcCW.LoadAttachmentType(att)
end

------
-- go_usp_slide_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_usp_slide_long")

	att.PrintName = "150mm Elite Slide"
	att.Icon = Material("entities/acwatt_go_usp_slide_long.png", "mips smooth")
	att.Description = "Long USP slide that improves range but also adds weight."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_usp_slide"

	att.Mult_Range = 1.5
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.5
	att.Mult_AccuracyMOA = 0.5
	att.Mult_DrawTime = 1.15

	att.Mult_RPM = 0.85

	att.Mult_ShootPitch = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- go_usp_slide_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("go_usp_slide_short")

	att.PrintName = "90mm USP-C Slide"
	att.Icon = Material("entities/acwatt_go_usp_slide_short.png", "mips smooth")
	att.Description = "Compact slide that improves weapon handling and trigger response."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_usp_slide"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 0.8
	att.Mult_AccuracyMOA = 1.5
	att.Mult_DrawTime = 0.75

	att.Mult_RPM = 1.15

	att.Mult_ShootPitch = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- grip_ergo.lua
------

do
	local att = {}
	ArcCW.SetShortName("grip_ergo")

	att.PrintName = "Ergo Grip"
	att.Icon = Material("entities/acwatt_grip_ergo.png")
	att.Description = "Ergonomic grip improves effective recoil control at the cost of moving accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "grip"

	att.Mult_Recoil = 0.85

	--att.Mult_SpeedMult = 0.95
	att.Mult_MoveDispersion = 1.5

	att.ActivateElements = {"egrip"}
	ArcCW.LoadAttachmentType(att)
end

------
-- grip_rubberized.lua
------

do
	local att = {}
	ArcCW.SetShortName("grip_rubberized")

	att.PrintName = "Rubberized Grip"
	att.Icon = Material("entities/acwatt_grip_rubberized.png")
	att.Description = "Rubberized grip improves movement accuracy, but reduces agility."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "grip"

	--att.Mult_SightTime = 1.1
	att.Mult_SightedMoveSpeed = 0.8

	att.Mult_MoveDispersion = 0.65

	att.ActivateElements = {"rgrip"}
	ArcCW.LoadAttachmentType(att)
end

------
-- grip_smooth.lua
------

do
	local att = {}
	ArcCW.SetShortName("grip_smooth")

	att.PrintName = "Smooth Grip"
	att.Icon = Material("entities/acwatt_grip_smooth.png")
	att.Description = "Smooth grip improves agility at the cost of recoil control."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "grip"

	att.Mult_Recoil = 1.1
	att.Mult_SightTime = 0.9

	att.ActivateElements = {"smoothgrip"}
	ArcCW.LoadAttachmentType(att)
end

------
-- grip_sturdy.lua
------

do
	local att = {}
	ArcCW.SetShortName("grip_sturdy")

	att.PrintName = "Sturdy Grip"
	att.Icon = Material("entities/acwatt_grip_sturdy.png")
	att.Description = "Sturdy grip that allows for better hip fire accuracy."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "grip"

	att.Mult_HipDispersion = 0.9
	att.Mult_SpeedMult = 0.97

	att.ActivateElements = {"sturdygrip"}
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_ammo_api.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_ammo_api")

	att.PrintName = "(CS+) Fire and Brimstone"
	att.Icon = Material("entities/acwatt_ammo_api.png")
	att.Description = "Load weapon with armor-piercing incendiary ammo, which deals extra damage, ignites targets within its effective range, and has superior penetration. However, due to reliability issues, reduced-capacity magazines are used."
	att.Desc_Pros = {
	    "pro.ignite", "+Due to GSO not having support for Reduced Mags,", "you get to use this at max capacity!"
	}
	att.Desc_Cons = { "-Reload speed penalty to compensate"
	}
	att.AutoStats = true
	att.Slot = "go_ammo"
	att.InvAtt = "ammo_api"

	att.Mult_Damage = 1.1
	att.Mult_DamageMin = 1.2
	att.Mult_Penetration = 2
	att.Mult_Recoil = 1.15
	att.Mult_ReloadTime = 1.5

	att.Override_DamageType = DMG_BURN

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_ammo_blank.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_ammo_blank")

	att.PrintName = "(CS+) Blanks"
	att.Icon = Material("entities/acwatt_ammo_blank.png")
	att.Description = "Cartridges which contain no bullet and only emit a loud bang and muzzle flash. Completely incapable of doing harm."
	att.Desc_Pros = {
	    "pro.ammo_blank",
	}
	att.Desc_Cons = {
	    "con.ammo_blank",
	}
	att.AutoStats = true
	att.Slot = {"go_ammo_bullet", "go_ammo"}
	att.InvAtt = "ammo_blank"

	att.Override_Num = 0
	att.Mult_Num = 0

	att.Mult_Recoil = 0.25

	att.NotForNPCs = true
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_ammo_dragon.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_ammo_dragon")

	att.PrintName = "(CS+) Dragon's Breath"
	att.Icon = Material("entities/acwatt_ammo_dragon.png")
	att.Description = "Incendiary load shotgun shells deal extra damage at both close and long range, as well as igniting targets within its effective range. However, a reduced magazine is equipped."
	att.Desc_Pros = {
	    "pro.ignite", "+Due to GSO not having support for Reduced Mags,", "you get to use this at max capacity!"
	}
	att.Desc_Cons = { "-Reload speed penalty to compensate"
	}
	att.AutoStats = true
	att.Slot = "go_ammo"
	att.InvAtt = "ammo_dragon"

	att.Mult_PrecisionMOA = 2
	att.Mult_ShootPitch = 0.85
	att.Mult_Damage = 1.25
	att.Mult_DamageMin = 1.25
	att.Mult_ReloadTime = 1.5

	att.Override_DamageType = DMG_BURN

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_ammo_frangible.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_ammo_frangible")

	att.PrintName = "(CS+) Hollow Point"
	att.Icon = Material("entities/acwatt_ammo_frangible.png")
	att.Description = "Bullets with a frangible hollow tip penetrating far less, but have better stopping power up-close."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo"
	att.InvAtt = "ammo_frangible"
	att.Mult_Damage = 1.1
	att.Mult_DamageMin = 0.6
	att.Mult_Penetration = 0.25

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_ammo_lowpower.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_ammo_lowpower")

	att.PrintName = "(CS+) Reduced Load"
	att.Icon = Material("entities/acwatt_ammo_lowpower.png")
	att.Description = "Rounds with a low-power charge. Reduces kick, but also reduces stopping power."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"go_ammo_bullet", "go_ammo"}
	att.InvAtt = "ammo_lowpower"

	att.Mult_Damage = 0.85
	att.Mult_DamageMin = 0.85
	att.Mult_Penetration = 0.75
	att.Mult_Recoil = 0.75
	att.Mult_ShootVol = 0.8
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_ammo_magnum.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_ammo_magnum")

	att.PrintName = "(CS+) Magnum Buckshot"
	att.Icon = Material("entities/acwatt_ammo_magnum.png")
	att.Description = "Powerful overloaded rounds deal extra damage at close range, but at the cost of increased recoil, spread, and long-range damage."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo"
	att.InvAtt = "ammo_magnum"

	att.Mult_ShootPitch = 0.9
	att.Mult_Damage = 1.25
	att.Mult_DamageMin = 1
	att.Mult_Penetration = 1.25
	att.Mult_Range = 0.8
	att.Mult_Recoil = 1.2
	att.Mult_AccuracyMOA = 1.5

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_ammo_match.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_ammo_match")

	att.PrintName = "(CS+) Match Ammo"
	att.Icon = Material("entities/acwatt_ammo_match.png")
	att.Description = "High-quality competition-grade ammunition. Consistent power loads allow for greater accuracy. Custom-tooled bullets cut rifling more smoothly and keep energy for longer. Such bullets cannot be used in bulk."
	att.Desc_Pros = {"+Due to GSO not having support for Reduced Mags,", "you get to use this at max capacity!"
	}
	att.Desc_Cons = { "-Reload speed penalty to compensate"
	}
	att.AutoStats = true
	att.Slot = "go_ammo"
	att.InvAtt = "ammo_match"

	att.Mult_DamageMin = 1.15
	att.Mult_SightTime = 0.9
	att.Mult_Precision = 0.25
	att.Mult_Recoil = 0.85
	att.Mult_ReloadTime = 1.5

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_ammo_ricochet.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_ammo_ricochet")

	att.PrintName = "(CS+) Cornerfragger"
	att.Icon = Material("entities/acwatt_ammo_ricochet.png")
	att.Description = "Bullets ricochet off surfaces once, and gain increased damage when doing so. Specialized bullet head reduces damage and makes penetration impossible. More of a revolver technique."
	att.Desc_Pros = {
	    "pro.ammo_ricochet"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo"
	att.InvAtt = "ammo_ricochet"

	att.NotForNPC = true

	att.Mult_Damage = 0.85
	att.Mult_Penetration = 0
	-- att.Mult_Recoil = 1.15
	-- att.Mult_SpeedMult = 0.9

	att.Hook_Compatible = function(wep)
	    if wep.Num ~= 1 or wep.ShootEntity ~= nil then return false end
	end

	att.Hook_BulletHit = function(wep, data)
	    if CLIENT then return end

	    if not data.tr.HitNonWorld and data.tr.HitPos then
	        local dir = data.tr.Normal - 2 * (data.tr.Normal:Dot(data.tr.HitNormal)) * data.tr.HitNormal
	        local r = ents.Create("arccw_ricochet")
	        r.FireTime = CurTime()
	        r.Owner = wep.Owner
	        r.Damage = math.ceil(data.damage * 2)
	        r.Direction = dir
	        r.Inflictor = wep
	        r:SetPos(data.tr.HitPos)
	        r:Spawn()
	        return false
	    end

	end

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_ammo_sabot.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_ammo_sabot")

	att.PrintName = "(CS+) Sabot Slug"
	att.Icon = Material("entities/acwatt_ammo_sabot.png")
	att.Description = "Shell containing a subcaliber projectile with discarding sabot. This enables superior muzzle velocity on the armor-piercing projectile, allowing it to deal more damage at range and penetrate a lot of armor. However, it is not as powerful as a full-caliber slug round."
	att.Desc_Pros = {"+Due to GSO not having support for Reduced Mags,", "you get to use this at max capacity!"
	}
	att.Desc_Cons = { "-Reload speed penalty to compensate"
	}
	att.AutoStats = true
	att.Slot = "go_ammo"
	att.InvAtt = "ammo_sabot"

	att.Override_Num = 1

	att.Mult_ShootPitch = 1.2
	att.Mult_Damage = 0.7
	att.Mult_DamageMin = 1.8
	att.Mult_Penetration = 5
	att.Mult_AccuracyMOA = 0.15
	att.Mult_Range = 2
	att.Mult_ReloadTime = 1.5

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_ammo_slug.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_ammo_slug")

	att.PrintName = "(CS+) Deer Slug"
	att.Icon = Material("entities/acwatt_ammo_slug.png")
	att.Description = "Shell containing a single heavy lead slug. More accurate, and more effective at range, but at the cost of being only a single projectile."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.projectilecount"
	}
	att.AutoStats = true
	att.Slot = "go_ammo"
	att.InvAtt = "ammo_slug"

	att.Override_Num = 1

	att.Mult_ShootPitch = 1.15
	att.Mult_Damage = 0.8
	att.Mult_DamageMin = 2
	att.Mult_Penetration = 1.5
	att.Mult_AccuracyMOA = 0.35

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_ammo_tmj.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_ammo_tmj")

	att.PrintName = "(CS+) Total Metal Jacket"
	att.Icon = Material("entities/acwatt_ammo_tmj.png")
	att.Description = "Bullets with a total copper coating which keep energy better at long range, improving damage at distance but overpenetrating targets which are too close."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_ammo"
	att.InvAtt = "ammo_tmj"

	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 1.2
	att.Mult_Penetration = 2

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_bipod.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_bipod")

	att.PrintName = "(CS+) Bipod"
	att.Icon = Material("entities/acwatt_bipod.png")
	att.Description = "Bipod can be deployed by pressing +USE while in an eligible spot. While deployed, the user's aiming angle is limited and recoil is reduced to near-zero. Moving will release bipod. While not in use, the bipod negatively impacts weapon maneuverability."

	att.SortOrder = 10

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "foregrip"
	att.InvAtt = "bipod"

	att.LHIK = true
	att.LHIK_Animation = true

	att.MountPositionOverride = 1

	att.Model = "models/weapons/arccw/atts/bipod.mdl"

	att.Bipod = true
	att.Mult_BipodRecoil = 0.25
	att.Mult_BipodDispersion = 0.1

	att.Mult_SightTime = 1.2
	att.Mult_HipDispersion = 1.2
	att.Mult_SpeedMult = 0.95

	att.Hook_LHIK_TranslateAnimation = function(wep, anim)
	    if anim == "idle" or anim == "in" or anim == "out" then
	        if wep:InBipod() then
	            return "idle_bipod"
	        else
	            return "idle"
	        end
	    end
	end

	att.Hook_Compatible = function(wep)
	    if wep.Bipod_Integral then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_fcg_accelerator.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_fcg_accelerator")

	att.PrintName = "(CS+) Accelerator"
	att.Icon = Material("entities/acwatt_fcg_accelerator.png")
	att.Description = "Firemode conversion that increases fire rate the longer you shoot, up to 7 shots. Includes 14-round burst."
	att.Desc_Pros = {
	    "pro.fcg_accelerator",
	}
	att.Desc_Cons = {
	    "con.fcg_accelerator",
	}
	att.Slot = "go_perk"
	att.InvAtt = "fcg_accelerator"

	att.Override_Firemodes = {
	    {
	        Mode = 2,
	    },
	    {
	        Mode = -14,
	        PrintName = "14BR"
	    },
	    {
	        Mode = 0
	    }
	}

	att.Hook_ModifyRPM = function(wep, delay)
	    local max = math.min(7, wep:GetCapacity())

	    local delta = wep:GetBurstCount() / max

	    local mult = Lerp(delta, 0.5, 1.25)

	    return delay / mult
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_fcg_auto.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_fcg_auto")

	att.PrintName = "(CS+) Automatic"
	att.Icon = Material("entities/acwatt_fcg_auto.png")
	att.Description = "Firemode conversion allowing for full-auto and semi-auto fire modes."
	att.Desc_Pros = {
	    "pro.auto",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"
	att.InvAtt = "fcg_auto"

	att.Override_Firemodes = {
	    {
	        Mode = 2,
	    },
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}

	att.Hook_Compatible = function(wep)
	    -- Search for any non-full auto firemodes. If there are none, this isn't applicable
	    for i, v in pairs(wep.Firemodes) do
	        if !v then continue end
	        if v.Mode == 2 then
	            return false
	        end
	    end

	    return
	end

	att.Mult_Recoil = 1.15
	att.Mult_RPM = 0.85
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_fcg_burst.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_fcg_burst")

	att.PrintName = "(CS+) Burst"
	att.Icon = Material("entities/acwatt_fcg_burst.png")
	att.Description = "Firemode conversion allowing for 3-round burst and semi-auto fire modes."
	att.Desc_Pros = {
	    "pro.burst"
	}
	att.Desc_Cons = {
	    "con.burstdelay"
	}
	att.AutoStats = true
	att.Slot = "go_perk"
	att.InvAtt = "fcg_burst"

	att.Override_Firemodes = {
	    {
	        Mode = -3,
	        PostBurstDelay = 0.1
	    },
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}

	att.Hook_Compatible = function(wep)
	    local auto = false
	    for i, v in pairs(wep.Firemodes) do
	        if v.Mode and v.Mode == -3 then
	            auto = true
	            break
	        end
	    end
	    if auto then return false end
	end

	att.Mult_RPM = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_fcg_double.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_fcg_double")

	att.PrintName = "(CS+) Double Stuff"
	att.Icon = Material("entities/acwatt_fcg_double.png")
	att.Description = "Fire system that can fit one extra round in the chamber at a time through esoteric mechanical magic."
	att.Desc_Pros = {
	    "+ +2",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"
	att.InvAtt = "fcg_double"

	att.Override_ChamberSize = 2

	att.Mult_ReloadTime = 1.05

	att.Hook_Compatible = function(wep, compat)
	    if wep.ChamberSize == 1 then
	        return
	    else
	        return false
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_fcg_hyper.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_fcg_hyper")

	att.PrintName = "(CS+) Hyper-Burst"
	att.Icon = Material("entities/acwatt_fcg_hyper.png")
	att.Description = "Firemode conversion allowing for a rapid two-round 'hyper burst' mode that fires both bullets in extremely rapid succession. Extra mechanical complexity increases weight and reduces effective precision."
	att.Desc_Pros = {
	    "pro.hyper",
	    "pro.hyper2"
	}
	att.Desc_Cons = {
	    "con.burstdelay2",
	}
	att.AutoStats = true
	att.Slot = "go_perk"
	att.InvAtt = "fcg_hyper"

	att.Override_Firemodes = {
	    {
	        Mode = -2,
	        Mult_RPM = 1.6,
	        Mult_AccuracyMOA = 1.5,
	        RunawayBurst = true,
	        PostBurstDelay = 0.25,
	        Override_ShotRecoilTable = {
	            [0] = 0.25,
	            [1] = 1.75,
	        }
	    },
	    {
	        Mode = 0
	    }
	}

	att.Mult_Recoil = 1.25
	att.Mult_SightTime = 1.2
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_fcg_regulator.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_fcg_regulator")

	att.PrintName = "(CS+) Regulator"
	att.Icon = Material("entities/acwatt_fcg_regulator.png")
	att.Description = "Fire control device that allows the selection of varying fire rates."
	att.Desc_Pros = {
	    "pro.regulator",
	}
	att.Desc_Cons = {
	    "con.regulator"
	}
	att.Slot = "go_perk"
	att.InvAtt = "fcg_regulator"

	att.Override_Firemodes = {
	    {
	        Mode = 2,
	        PrintName = "80%",
	        Mult_RPM = 0.8
	    },
	    {
	        Mode = 2,
	        PrintName = "60%",
	        Mult_RPM = 0.60,
	    },
	    {
	        Mode = 2,
	        PrintName = "40%",
	        Mult_RPM = 0.4
	    },
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_fcg_semi.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_fcg_semi")

	att.PrintName = "(CS+) Semi"
	att.Icon = Material("entities/acwatt_fcg_semi.png")
	att.Description = "Firemode conversion which allows only semi-auto fire."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.semi"
	}
	att.AutoStats = true
	att.Slot = "go_perk"
	att.InvAtt = "fcg_semi"

	att.Override_Firemodes = {
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}

	att.Hook_Compatible = function(wep)
	    -- Search for any non-semi firemodes. If there are none, this isn't applicable
	    for i, v in pairs(wep.Firemodes) do
	        if !v then continue end
	        if v.Mode and v.Mode != 1 and v.Mode != 0 then
	            return
	        end
	    end

	    return false
	end

	att.Mult_AccuracyMOA = 0.75
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_fcg_sputter.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_fcg_sputter")

	att.PrintName = "(CS+) Sputter"
	att.Icon = Material("entities/acwatt_fcg_sputter.png")
	att.Description = "Firemode conversion designed to circumvent early machine gun regulations by making the gun fire continuously until empty."
	att.Desc_Pros = {
	    "pro.sputter",
	}
	att.Desc_Cons = {
	    "con.sputter",
	    "con.sputter2",
	}
	att.AutoStats = true
	att.Slot = "go_perk"
	att.InvAtt = "fcg_sputter"

	att.Override_Firemodes = {
	    {
	        Mode = -1000,
	        RunawayBurst = true,
	        PrintName = "SPUT"
	    }
	}

	att.Mult_RPM = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_muzz_choke.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_muzz_choke")

	att.PrintName = "(CS+) Tight Choke"
	att.Icon = Material("entities/acwatt_muzz_choke.png")
	att.Description = "Shotgun choke which reduces pellet spread, at the cost of directly worsening clump dispersion while hip firing. Also increases felt recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"
	att.InvAtt = "muzz_choke"

	att.SortOrder = 30

	att.Mult_Recoil = 1.35
	att.Mult_HipDispersion = 1.5
	att.Mult_AccuracyMOA = 0.7

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_muzz_circlechoke.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_muzz_circlechoke")

	att.PrintName = "(CS+) Concentric Choke"
	att.Icon = Material("entities/acwatt_muzz_circlechoke.png")
	att.Description = "Shotgun choke producing a circular pattern which is hollow in the middle."
	att.Desc_Pros = {
	    "pro.muzz_circlechoke",
	}
	att.Desc_Cons = {
	    "con.muzz_circlechoke"
	}
	att.AutoStats = false
	att.Slot = "muzzle"
	att.InvAtt = "muzz_circlechoke"
	att.SortOrder = 20

	att.Mult_AccuracyMOA = 0.25

	att.Override_ShotgunSpreadPattern = true
	att.Override_ShotgunSpreadDispersion = false

	att.Hook_ShotgunSpreadOffset = function(wep, data)
	    local a1 = Angle(0, math.Rand(-360, 360), 0)
	    local v1 = a1:Forward() * 2.5
	    data.ang = Angle(v1.x, v1.y, 0)

	    return data
	end

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_muzz_crosschoke.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_muzz_crosschoke")

	att.PrintName = "(CS+) Cross Choke"
	att.Icon = Material("entities/acwatt_muzz_crosschoke.png")
	att.Description = "Shotgun choke producing a cross-shaped pattern."
	att.Desc_Pros = {
	    "pro.muzz_crosschoke",
	}
	att.Desc_Cons = {
	    "con.situational"
	}
	att.AutoStats = false
	att.Slot = "muzzle"
	att.InvAtt = "muzz_crosschoke"
	att.SortOrder = 20

	att.Mult_AccuracyMOA = 0.2

	att.Override_ShotgunSpreadPattern = true
	att.Override_ShotgunSpreadDispersion = false

	att.Hook_ShotgunSpreadOffset = function(wep, data)
	    if math.random(0, 1) >= 0.5 then
	        data.ang = Angle(0, math.Rand(-3, 3), 0)
	    else
	        data.ang = Angle(math.Rand(-3, 3), 0, 0)
	    end

	    return data
	end

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_muzz_duckbill.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_muzz_duckbill")

	att.PrintName = "(CS+) Duckbill Choke"
	att.Icon = Material("entities/acwatt_muzz_duckbill.png")
	att.Description = "Shotgun choke which produces a wide horizontal dispersion pattern. Potentially good for crowd control."
	att.Desc_Pros = {
	    "pro.muzz_duckbill",
	}
	att.Desc_Cons = {
	    "con.muzz_duckbill"
	}
	att.AutoStats = false
	att.Slot = "muzzle"
	att.InvAtt = "muzz_duckbill"
	att.SortOrder = 20

	att.Mult_AccuracyMOA = 0.25

	att.Override_ShotgunSpreadPattern = true
	att.Override_ShotgunSpreadDispersion = false

	att.Hook_ShotgunSpreadOffset = function(wep, data)
	    data.ang = Angle(0, math.Rand(-5, 5), 0)

	    return data
	end

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_muzz_widechoke.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_muzz_widechoke")

	att.PrintName = "(CS+) Wide Choke"
	att.Icon = Material("entities/acwatt_muzz_widechoke.png")
	att.Description = "Shotgun choke which increases pellet spread, but greatly reduces hip fire dispersion and felt recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "muzzle"
	att.InvAtt = "muzz_widechoke"
	att.SortOrder = 30

	att.Mult_Recoil = 0.7
	att.Mult_HipDispersion = 0.2
	att.Mult_AccuracyMOA = 1.5

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_perk_fastreload.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_perk_fastreload")

	att.PrintName = "(CS+) Rushed Reloading"
	att.Icon = Material("entities/acwatt_perk_fastreload.png")
	att.Description = "Improves reloading speed by 15% through improved magwell design."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"
	att.InvAtt = "perk_fastreload"

	att.Mult_ReloadTime = 0.85
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_perk_last.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_perk_last")

	att.PrintName = "(CS+) Memento Mori"
	att.Icon = Material("entities/acwatt_perk_last.png")
	att.Description = "Significant damage multiplier at the cost of being able to fire only one round at a time, extremely slow reloading, and damage at range. It's got to be personal."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.perk_last",
	}
	att.AutoStats = true
	att.Slot = "go_perk"
	att.InvAtt = "perk_last"

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
-- gsob_perk_lightweight.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_perk_lightweight")

	att.PrintName = "(CS+) Light Frame"
	att.Icon = Material("entities/acwatt_perk_lightweight.png")
	att.Description = "Lightened frame allows faster movement and aiming, but worsens recoil."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"
	att.InvAtt = "perk_lightweight"

	att.Mult_SpeedMult = 1.15
	att.Mult_SightTime = 0.9
	att.Mult_Recoil = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_perk_owyn.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_perk_owyn")

	att.PrintName = "(CS+) Make It Count"
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
	att.Slot = "go_perk"
	att.InvAtt = "perk_owyn"

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
-- gsob_perk_quickdraw.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_perk_quickdraw")

	att.PrintName = "(CS+) Bodyguard"
	att.Icon = Material("entities/acwatt_perk_quickdraw.png")
	att.Description = "A sling system helps with drawing more quickly, as well as firing from the hip. However, it is more difficult to use when aiming."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"
	att.InvAtt = "perk_quickdraw"

	att.Mult_DrawTime = 0.4
	att.Mult_HolsterTime = 0.4
	att.Mult_HipDispersion = 0.8
	att.Mult_SightedSpeedMult = 0.8
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_perk_refund.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_perk_refund")

	att.PrintName = "(CS+) Never Stop Shooting"
	att.Icon = Material("entities/acwatt_perk_refund.png")
	att.Description = "Shots which successfully hit have a 50% chance to be refunded to your reserve ammo."
	att.Desc_Pros = {
	    "+ Chance to refund shots"
	}
	att.Desc_Cons = {
	}
	att.Slot = "go_perk"
	att.InvAtt = "perk_refund"

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
-- gsob_perk_underwater.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_perk_underwater")

	att.PrintName = "(CS+) Diver"
	att.Icon = Material("entities/acwatt_perk_underwater.png")
	att.Description = "Allows gun to shoot underwater."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "go_perk"
	att.InvAtt = "perk_underwater"

	att.Override_CanFireUnderwater = true

	att.Hook_Compatible = function(wep)
	    if wep.CanFireUnderwater then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsob_perk_vampire.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsob_perk_vampire")

	att.PrintName = "(CS+) Health Recycling"
	att.Icon = Material("entities/acwatt_perk_vampire.png")
	att.Description = "Successful hits heal shooter, at the cost of dealing significantly less damage."
	att.Ignore = true
	att.Desc_Pros = {
	    "+ Health steal"
	}
	att.Desc_Cons = {
	    "- Reduced damage",
		"- Aerosun doesn't like you >:^("
	}
	att.Slot = "go_perk"
	att.InvAtt = "perk_vampire"

	att.Mult_Damage = 0.5
	att.Mult_DamageMin = 0.5

	att.Hook_BulletHit = function(wep, data)
	    if !data.tr.Entity then return end

	    if data.tr.HitWorld then return end

	    if data.tr.Entity:Health() <= 0 then return end

	    if wep.Owner:Health() > wep.Owner:GetMaxHealth() then return end

	    wep.Owner:SetHealth(math.Clamp(wep.Owner:Health() + (data.damage * 0.1), 0, wep.Owner:GetMaxHealth()))
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsoe_extra_ammo_airsoft.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsoe_extra_ammo_airsoft")

	att.PrintName = "(CSExtras) Airsoft"
	att.Icon = Material("entities/acwatt_ammo_airsoft.png", "smooth mips")
	att.Description = "Replace weapon internals to fire tiny plastic BB pellets, effectively making the gun a toy. While the projectile does minimal damage, the weapon can load a lot more pellets and handles incredibly well.\nRemember, no full auto in the buildings!"
	att.Desc_Pros = {
	    "Shoot BB pellets",
	    "Large magazine capacity",
	    "Great handling and no recoil"
	}
	att.Desc_Cons = {
	    "Minimal damage"
	}
	att.Desc_Neutrals = {
	    "Uses BB Pellets ammo",
	    "By default, players w/ this can instakill each other"
	}
	att.Slot = {"go_ammo_bullet", "go_ammo"}
	att.InvAtt = "ammo_airsoft"

	att.AutoStats = false

	att.Mult_Recoil = 0.1
	att.Mult_HipDispersion = 0.6
	att.Mult_MoveDispersion = 0.75
	att.Mult_AccuracyMOA = 2
	att.Mult_Damage = 0.1
	att.Mult_DamageMin = 0.1
	att.Mult_RPM = 1.25
	att.Mult_CycleSpeed = 1.25

	att.Override_ShootEntity = "arccw_bb"
	att.Mult_MuzzleVelocity = 300

	att.Override_Ammo = "airsoft"

	att.Hook_GetCapacity = function(wep, cap)
	    local cs = wep.RegularClipSize or wep.Primary.ClipSize
	    if wep.ShotgunReload or wep.ManualAction then
	        return cs * 2
	    elseif wep.RevolverReload or cs <= 2 then
	        return cs
	    else
	        return cs * 4
	    end
	end

	att.Hook_SelectInsertAnimation = function(wep, data)
	    data.count = data.count * 2
	    return data
	end

	att.Hook_PreDoEffects = function(wep, fx)
	    return true
	end

	att.Hook_GetShootSound = function(wep, sound)
	    return "weapons/arccw/airsoft2.wav"
	end
	att.Hook_GetDistantShootSound = function(wep, sound)
	    return false
	end

	game.AddAmmoType({
	    name = "airsoft"
	})

	if CLIENT then
	    language.Add("airsoft_ammo", "BB Pellets")
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsoe_extra_ammo_birdshot.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsoe_extra_ammo_birdshot")

	att.PrintName = "(CSExtras) Birdshot"
	att.Icon = Material("entities/acwatt_ammo_birdshot.png", "mips")
	att.Description = "Small projectiles loaded in large quantities intended for hunting small game. Has considerably less recoil but is less lethal."
	att.Desc_Pros = {
	    "+4 pellets per shot",
	}
	att.Desc_Cons = {
	}
	att.Slot = "go_ammo"
	att.InvAtt = "ammo_birdshot"

	att.AutoStats = true

	att.Add_Num = 4
	att.Mult_AccuracyMOA = 1.3
	att.Mult_Recoil = 0.5
	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 0.65

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsoe_extra_ammo_cerberus.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsoe_extra_ammo_cerberus")

	att.PrintName = "(CSExtras) Cerberus"
	att.Icon = Material("entities/acwatt_ammo_cerberus.png", "smooth mips")
	att.Description = "Unorthodox pistol round that splits into three upon leaving the chamber. Horrible accuracy, but flays point blank targets effectively."
	att.Desc_Pros = {
	    "+2 projectiles per shot", "+Due to GSO not having support for Reduced Mags,", "you get to use this at max capacity!"
	}
	att.Desc_Cons = {
	    "-Reload speed penalty to compensate"
	}
	att.Desc_Neutrals = {
	    "Can only be used with pistol or magnum ammo",
	}
	att.Slot = "go_ammo"
	att.InvAtt = "ammo_cerberus"

	att.Override_Num = 3

	att.Mult_ShootPitch = 0.85
	att.Mult_Damage = 1.5
	att.Mult_DamageMin = 0.2
	att.Mult_AccuracyMOA = 4
	att.Mult_Range = 0.7
	att.Mult_Penetration = 0.1

	att.AutoStats = true

	att.Hook_Compatible = function(wep)
	    if wep.Num ~= 1 or (wep.Primary.Ammo ~= "pistol" and wep.Primary.Ammo ~= "357") then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsoe_extra_ammo_explosive.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsoe_extra_ammo_explosive")

	att.PrintName = "(CSExtras) Devil's Lance"
	att.Icon = Material("entities/acwatt_ammo_explosive.png")
	att.Description = "A bullet with an explosive charge, used originally for calibrating aircraft weapons. \nIn WWII, elite snipers of the Eastern Front reserved these extremely rare ammo for high value targets. Its effects can only be described as grotesque - and very effective."
	att.Desc_Pros = {
	    "+ Explosion on hit dealing additional 100% damage"
	}
	att.Desc_Cons = {
	    "-80% Magazine capacity",
	}
	att.Desc_Neutrals = {
	    "Manual/break action and rifle/sniper ammo only",
	    "Blast radius is 96 HU / 2.4m",
	}
	att.AutoStats = true
	att.Slot = "go_ammo"
	att.InvAtt = "ammo_explosive"

	att.Mult_ShootPitch = 0.8
	att.Mult_ShootVol = 1.3
	att.Mult_Penetration = 0
	att.Mult_Damage = 0.7
	att.Mult_Range = 0.7

	att.Override_DamageType = DMG_BURN
	att.ActivateElements = {"reducedmag"}

	att.Hook_Compatible = function(wep)
	    if not (wep.ManualAction or (wep:GetChamberSize() == 0 and (wep.RegularClipSize or wep.Primary.ClipSize) <= 2)) then return false end
	    local tbl = engine.ActiveGamemode() == "terrortown" and {"357"} or {"ar2", "SniperPenetratedRound"}
	    if not table.HasValue(tbl, wep.Primary.Ammo or "") then return false end
	end

	att.Hook_GetCapacity = function(wep, cap)
	    return math.Clamp(math.Round(wep.RegularClipSize * 0.2), 1, 5)
	end

	att.Hook_BulletHit = function(wep, data)
	    local ent = data.tr.Entity
	    util.BlastDamage(wep, wep:GetOwner(), data.tr.HitPos, 96, wep:GetDamage(data.range))
	    if ent:IsValid() and ent:GetClass() == "npc_helicopter" then
	        data.dmgtype = DMG_AIRBOAT
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsoe_extra_ammo_flechette.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsoe_extra_ammo_flechette")

	att.PrintName = "(CSExtras) Flechette"
	att.Icon = Material("entities/acwatt_ammo_flechette.png", "smooth mips")
	att.Description = "Thin, sharp pointed projectiles provide better performance over range and superior penetration."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Slot = "go_ammo"
	att.InvAtt = "ammo_flechette"

	att.AutoStats = true

	att.Mult_Damage = 0.8
	att.Mult_DamageMin = 1.4
	att.Mult_Range = 1.5
	att.Mult_AccuracyMOA = 0.6
	att.Mult_MoveDispersion = 1.3
	att.Mult_Penetration = 8

	att.Hook_Compatible = function(wep)
	    if !wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsoe_extra_fcg_dualstage.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsoe_extra_fcg_dualstage")

	att.PrintName = "(CSExtras) Dual Stage Auto"
	att.Icon = Material("entities/acwatt_fcg_dualstage.png", "smooth mips")
	att.Description = "Two-stage automatic trigger that reduces RPM when sighted. The benefit of this system is improved recoil stability and control."
	att.Desc_Neutrals = {
	    "Has worse performance on non-automatic weapons",
	}
	att.Desc_Pros = {
	    "-15% Recoil when sighted",
	    "-30% Horizontal recoil when sighted"
	}
	att.Desc_Cons = {
	    "-30% Fire rate when sighted",
	}
	att.Slot = "go_perk"
	att.InvAtt = "fcg_dualstage"

	--att.Mult_Recoil = 0.9
	--att.Mult_RecoilSide = 0.8
	--att.Mult_HipDispersion = 1.15

	att.Override_Firemodes = {
	    {
	        Mode = 2,
	    },
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}

	att.AutoStats = true

	att.Hook_ModifyRecoil = function(wep)
	    if wep:GetCurrentFiremode().Mode == 2 and  wep:GetState() == ArcCW.STATE_SIGHTS then
	        return {Recoil = 0.85, RecoilSide = 0.7, VisualRecoilMult = 0.8}
	    end
	end

	att.Hook_ModifyRPM = function(wep, delay)
	    if wep:GetCurrentFiremode().Mode == 2 and  wep:GetState() == ArcCW.STATE_SIGHTS then
	        return delay * (1 / 0.7)
	    end
	end

	att.Hook_Compatible = function(wep)
	    -- Only available if the weapon already has full auto.
	    local has = false
	    for i, v in pairs(wep.Firemodes) do
	        if !v then continue end
	        if v.Mode == 2 then
	            has = true
	            break
	        end
	    end

	    if !has then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsoe_extra_fcg_dualstage2.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsoe_extra_fcg_dualstage2")

	att.PrintName = "(CSExtras) Dual Stage Auto"
	att.Icon = Material("entities/acwatt_fcg_dualstage.png", "smooth mips")
	att.Description = "Two-stage automatic trigger that reduces RPM when sighted. Fires faster than automatic conversion FCGs when not sighted."
	att.Desc_Neutrals = {
	    "Has better performance on automatic weapons",
	}
	att.Desc_Pros = {
	    "+ Fully automatic fire"
	}
	att.Desc_Cons = {
	    "-50% Fire rate when sighted",
	    "+20% Recoil when not sighted"
	}
	att.Slot = "go_perk"
	att.InvAtt = "fcg_dualstage"

	--att.Mult_HipDispersion = 1.15

	att.Override_Firemodes = {
	    {
	        Mode = 2,
	    },
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}

	att.AutoStats = true

	att.Hook_ModifyRPM = function(wep, delay)
	    if wep:GetCurrentFiremode().Mode == 2 and wep:GetState() == ArcCW.STATE_SIGHTS then
	        return delay * (1 / 0.5)
	    end
	end

	att.Hook_ModifyRecoil = function(wep)
	    if not (wep:GetCurrentFiremode().Mode == 2 and wep:GetState() == ArcCW.STATE_SIGHTS) then
	        return {Recoil = 1.2, RecoilSide = 1, VisualRecoilMult = 1}
	    end
	end


	att.Hook_Compatible = function(wep)
	    -- Only available if the weapon does not have full auto.
	    for i, v in pairs(wep.Firemodes) do
	        if !v then continue end
	        if v.Mode == 2 then
	            return false
	        end
	    end

	    return
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- gsoe_extra_fcg_mysteryburst.lua
------

do
	local att = {}
	ArcCW.SetShortName("gsoe_extra_fcg_mysteryburst")

	att.PrintName = "(CSExtras) Mystery Burst"
	att.Icon = Material("entities/acwatt_fcg_mysteryburst.png", "smooth mips")
	att.Description = "A tampered Smart Burst fire system that a random amount of bullets. Very fast but suffers from inconsistency."
	att.Desc_Neutrals = {
	    "Each burst fires 10%~30% of total capacity",
	}
	att.Desc_Pros = {
	    "Mystery burst mode"
	}
	att.Desc_Cons = {
	    "con.burstdelay2",
	}
	att.Slot = "go_perk"
	att.InvAtt = "fcg_mysteryburst"

	att.Ignore = false

	att.Override_Firemodes = {
	    {
	        Mode = -1000,
	        CustomBars = "_____",
	        PrintName = "??BST",
	        RunawayBurst = true,
	    },
	    {
	        Mode = 0
	    }
	}

	att.AutoStats = true

	att.Mult_RPM = 1.3

	att.Hook_GetBurstLength = function(wep)

	    local bstCnt = math.max(math.ceil(wep:GetCapacity() * (math.random() * 0.2 + 0.1)), 2)

	    if wep:GetNWInt("ArcCW_SmartBurst", -1) < 0 then
	        wep:SetBurstCount(0)
	        wep:SetNWInt("ArcCW_SmartBurst", bstCnt)
	    end

	    return wep:GetNWInt("ArcCW_SmartBurst", -1) < 0 and nil or wep:GetNWInt("ArcCW_SmartBurst")
	end

	-- Using this as a makeshift onReload hook right now
	att.Hook_SelectReloadAnimation = function(wep, mult)
	    wep:SetNWInt("ArcCW_SmartBurst", -1)
	end

	att.Hook_ShouldNotFire = function(wep)
	    if wep:GetNWInt("ArcCW_SmartBurst", -1) > 1 and wep:GetNWInt("ArcCW_SmartBurst", -1) <= wep:GetBurstCount() then
	        wep:SetNWInt("ArcCW_SmartBurst", -1)
	        wep.Primary.Automatic = false
	        wep:SetNextPrimaryFire(CurTime() + 0.2)
	        return true
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

