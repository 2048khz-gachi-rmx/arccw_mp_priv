local Material = ArcCW.AttachmentMat

------
-- ur_1911_cal_10auto.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_1911_cal_10auto")

	att.PrintName = "Delta Elite 10mm Auto Conversion"
	att.AbbrevName = "10mm Auto"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "AMAS-FBI 10mm Auto Conversion"
	end
	-- att.Hook_NameChange = function(wep,name)
	-- 	name = "Ruger SR1911"
	-- end
	att.SortOrder = 10
	att.Icon = Material("entities/att/acwatt_ud_glock_caliber.png", "smooth mips")
	att.Description = "The FBI's preferred caliber of choice.\nDespite its distinctive power, it's not as large as .45 ACP, though its damage curve is more balanced."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ur_m1911_caliber"
	att.AutoStats = true
	att.Override_Trivia_Calibre = "10mm Auto"
	-- att.Override_Trivia_Manufacturer = "Ruger"
	att.Mult_Damage = 35 / 45
	att.Mult_DamageMin = 20 / 15
	att.Mult_Penetration = 8 / 9
	att.Mult_RangeMin = 1.5
	-- att.Mult_Recoil = 1.3
	-- att.Mult_RecoilSide = 1.25
	-- att.Mult_ReloadTime = 1.2
	-- att.Mult_MalfunctionMean = 0.75
	att.Mult_ClipSize = 8 / 7
	att.Override_ShellScale = 1
	att.Hook_GetShootSound = function(wep, sound)
	    if wep:GetBuff_Override("Silencer") then
	        return "weapons/arccw_ud/glock/fire_supp_10.ogg" -- Placeholder
	    else
	        return "weapons/arccw_ud/glock/fire_10.ogg" -- Not Placeholder
	    end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then
	        return "weapons/arccw_ud/glock/fire_dist_10.ogg" end
	end
	--[[
	att.Override_ClipSize = 15
	att.Override_ClipSize_Priority = -1
	local slotinfo = {
	    [7] = {"15-Round Mag", "15-Round Mag", nil},
	}
	att.Hook_GetDefaultAttName = function(wep, slot)
	    if slotinfo[slot] then
	        return GetConVar("arccw_truenames"):GetBool() and slotinfo[slot][2] or slotinfo[slot][1]
	    end
	end
	att.Hook_GetDefaultAttIcon = function(wep, slot)
	    if slotinfo[slot] then
	        return slotinfo[slot][3]
	    end
	end
	]]
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_1911_cal_9mm.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_1911_cal_9mm")

	att.PrintName = "SR1911 9x19mm Parabellum Conversion"
	att.AbbrevName = "9x19mm Parabellum"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "AMAS Competition 9mm Parabellum Conversion"
	end
	att.SortOrder = 9
	att.Icon = Material("entities/att/acwatt_ud_glock_caliber.png", "smooth mips")
	att.Description = "A popular alternative caliber to .45 ACP. With a reduced diameter, the round achieves greater muzzle velocity and magazine capacity."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ur_m1911_caliber"
	att.AutoStats = true
	att.Override_Trivia_Calibre = "9x19mm Parabellum"
	att.Override_Trivia_Manufacturer = "Sturm, Ruger & Company"
	att.Mult_Damage = 30 / 45
	att.Mult_DamageMin = 17 / 15
	att.Mult_Penetration = 6 / 9
	att.Mult_Range = 1.25
	att.Mult_RPM = 1.05
	att.Mult_ReloadTime = .9
	att.Mult_Recoil = 0.85
	att.Mult_RecoilSide = 0.75
	att.Mult_ClipSize = 9 / 7
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
	att.Override_ShellScale = 1
	att.Hook_GetShootSound = function(wep, sound)
	    if wep:GetBuff_Override("Silencer") then
	        return "weapons/arccw_ud/glock/fire_supp.ogg"
	    else
	        return "weapons/arccw_ud/glock/fire.ogg"
	    end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then
	        return "weapons/arccw_ud/glock/fire.ogg" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_barrel_105.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_barrel_105")

	att.PrintName = "12\" Carbine Barrel"
	att.Icon = Material("entities/att/ur_ak/barrel/100.png", "mips smooth")
	att.Description = "Reduced length barrel that serves as a middle ground between full-size and SMG-length barrels. Reduces weight and profile while keeping the weapon accurate and controllable."
	att.Slot = {"ur_ak_barrel"}
	att.AutoStats = true
	att.SortOrder = 12
	att.Mult_Sway = .85
	att.Mult_SightTime = .8
	att.Add_BarrelLength = -3
	att.Mult_SightedSpeedMult = 1.05
	att.Mult_Recoil = 1.3
	att.Mult_AccuracyMOA = 1.5
	att.Mult_Range = .75
	att.Mult_RPM = 625/600
	att.Mult_ShootPitch = 105/100
	att.ToggleLockDefault = true
	att.ToggleStats = {
	    {
	        PrintName = "Black",
	        ActivateElements = {"barrel_105"},
	    },
	    {
	        PrintName = "Plum",
	        ActivateElements = {"barrel_105_red"},
	    },
	    {
	        PrintName = "Olive Drab",
	        ActivateElements = {"barrel_105_green"},
	    },
	}
	att.GivesFlags = {"ak_barrelchange","nodong"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_barrel_74m.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_barrel_74m")

	att.PrintName = "16\" Polymer Barrel"
	att.Icon = Material("entities/att/ur_ak/barrel/poly.png", "mips smooth")
	att.Description = "Light polymer handguard with superior agility, but higher recoil from the reduced counterweight."
	att.Slot = {"ur_ak_barrel"}
	att.AutoStats = true
	att.SortOrder = 16
	att.Mult_Sway = .9
	att.Mult_SightTime = .85
	att.Mult_Recoil = 1.2
	att.ToggleLockDefault = true
	att.ToggleStats = {
	    {
	        PrintName = "Black",
	        ActivateElements = {"barrel_74m"},
	    },
	    {
	        PrintName = "Plum",
	        ActivateElements = {"barrel_74m_red"},
	    },
	    {
	        PrintName = "Olive Drab",
	        ActivateElements = {"barrel_74m_green"},
	    },
	}
	att.GivesFlags = {"nodong"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_barrel_ak12.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_barrel_ak12")

	att.PrintName = "16\" Ratnik Handguard"
	att.Icon = Material("entities/att/ur_ak/barrel/ak12.png", "mips smooth")
	att.Description = "The most recent barrel for the AK platform, with polymerized construction and an upper rail interface. Practical, yet comfortable."
	att.Slot = {"ur_ak_barrel"}
	att.AutoStats = true
	att.Desc_Neutrals = {"ur.ak.userail"}
	att.SortOrder = 16
	att.Mult_Sway = .9
	att.Mult_ShootSpeedMult = 1.1
	att.Mult_Recoil = 1.1
	att.GivesFlags = {"ak_railedguard","nodong","ak_barrelchange"}
	att.ActivateElements = {"barrel_ak12", "handguard_ak12", "sight_ak12"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_barrel_akm.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_barrel_akm")

	att.PrintName = "16\" Modernized Barrel"
	att.Icon = Material("entities/att/ur_ak/barrel/stock_barrel.png", "mips smooth") -- todo
	att.Description = "Enhanced wood handguard with protrusions for increased grip surface."
	att.Slot = {"ur_ak_barrel"}
	att.AutoStats = true
	--att.Desc_Neutrals = {"uc.cosmetic"} nvm
	att.SortOrder = 16
	att.Mult_Sway = .95
	att.Mult_SightedSpeedMult = .98
	att.ActivateElements = {"barrel_akm"}
	--att.Ignore = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_barrel_alpha.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_barrel_alpha")

	att.PrintName = "16\" Zenitco Barrel"
	att.Icon = Material("entities/att/ur_ak/barrel/alpha.png", "mips smooth")
	att.Description = "US production handguard featuring a rail interface for additional modularity. Especially lightweight, though less comfortable to grip."
	att.Slot = {"ur_ak_barrel"}
	att.AutoStats = true
	--att.Desc_Neutrals = {"uc.cosmetic"} nvm
	att.SortOrder = 15.9
	att.Mult_Sway = 1.1
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_SpeedMult = 1.05
	att.Mult_Recoil = 1.075
	att.GivesFlags = {"ak_railedguard","nodong"}
	att.ActivateElements = {"barrel_alpha"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_barrel_alpha_105.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_barrel_alpha_105")

	att.PrintName = "12\" Spetsnaz Alpha Barrel"
	att.Icon = Material("entities/att/ur_ak/barrel/alpha_100.png", "mips smooth")
	att.Description = "Series 100 type barrel fitted with Helix handguard as used by various Russian armed forces. Similarly to the 105 Barrels, Reduces weight and profile while keeping the weapon accurate and controllable but also features the Alpha's sleek and modern design for extra modularity."
	att.Slot = {"ur_ak_barrel"}
	att.AutoStats = true
	--att.Desc_Neutrals = {"uc.cosmetic"} nvm
	att.SortOrder = 12
	att.Mult_Sway = .85
	att.Mult_SightTime = .8
	att.Add_BarrelLength = -3
	att.Mult_SightedSpeedMult = 1.05
	att.Mult_Recoil = 1.3
	att.Mult_AccuracyMOA = 1.5
	att.Mult_Range = .75
	att.Mult_RPM = 625/600
	att.Mult_ShootPitch = 105/100
	att.GivesFlags = {"ak_railedguard","ak_barrelchange","nodong"}
	att.ActivateElements = {"barrel_105_alpha"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_barrel_dong.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_barrel_dong")

	att.PrintName = "\"Romanian Dong\" Integral Foregrip"
	att.AbbrevName = "Dong Foregrip"
	att.Icon = Material("entities/att/ur_ak/dong.png", "mips smooth")
	att.Description = "Romanian lower handguard design, shaped into an integrated foregrip. Functions like a Stubby Foregrip with slightly less added weight."
	att.Slot = {"ur_ak_ub"}
	--att.Desc_Cons = {"uc.noubs"}
	att.AutoStats = true
	att.SortOrder = 16
	att.Mult_Recoil = .825
	att.Mult_SightTime = 1.125
	att.Mult_MoveDispersion = 1.25
	att.ActivateElements = {"barrel_dong"}
	att.ExcludeFlags = {"barrel_carbine","nodong"}
	att.LHIK = true
	att.ModelOffset = Vector(-23, -2.6, 3.8)
	--att.ModelScale = Vector(1.111, 1.111, 1.111)
	att.Model = "models/weapons/arccw/ak_lhik_dong.mdl"
	att.Override_HoldtypeActive = "smg"
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_barrel_krinkov.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_barrel_krinkov")

	att.PrintName = "8\" Compact Barrel"
	att.Icon = Material("entities/att/ur_ak/barrel/aksu.png", "mips smooth")
	att.Description = "Special carbine length handguard and barrel. Its reduced length leads to less unwieldiness, and the shortened gas system increases cyclic rate respectably.\nThese traits combined, however, result in a difficult weapon to control."
	att.Slot = {"ur_ak_barrel"}
	att.AutoStats = true
	att.SortOrder = 8
	att.Mult_ShootPitch = 115/100
	att.Add_BarrelLength = -6
	att.Mult_RPM = 1.131
	att.Mult_SightTime = .8
	att.Mult_HipDispersion = .8
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_SpeedMult = 1.025
	att.Mult_Sway = .8
	att.Mult_Recoil = 1.5
	att.Mult_AccuracyMOA = 2
	att.Mult_Range = .5
	att.ActivateElements = {"barrel_krinkov"}
	att.GivesFlags = {"ak_barrelchange","barrel_carbine","ak_barrelkrinkov"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_barrel_rpk.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_barrel_rpk")

	att.PrintName = "23\" SAW Barrel"
	att.Icon = Material("entities/att/ur_ak/barrel/rpk.png", "mips smooth")
	att.Description = "Light machine gun barrel as used on the RPK. In addition to improved precision from the elongated barrel, it features an integrated bipod which can be deployed for even greater accuracy and control.\nVery front-heavy due to the long, more massive barrel."
	att.Slot = {"ur_ak_barrel"}
	att.AutoStats = true
	att.SortOrder = 23
	att.Add_BarrelLength = 5
	att.Mult_SightTime = 1.2
	att.Mult_SpeedMult = .95
	att.Mult_SightedSpeedMult = 0.8
	att.Mult_Sway = 1.5
	att.Mult_Recoil = .8
	att.Mult_AccuracyMOA = .7
	att.Mult_Range = 1.5
	att.Mult_MalfunctionMean = 2
	att.Mult_HipDispersion = 1.5
	att.Bipod = true
	att.Mult_BipodRecoil = .25
	att.Mult_BipodDispersion = .2
	att.ActivateElements = {"barrel_rpk"}
	att.GivesFlags = {"ak_barrelchange"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_barrel_rpk74m.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_barrel_rpk74m")

	att.PrintName = "23\" Polymer SAW Barrel"
	att.Icon = Material("entities/att/ur_ak/barrel/rpk_poly.png", "mips smooth")
	att.Description = "Light machine gun barrel with polymer handguard furniture. The lighter material reduces strain at the cost of shoulder-fired performance. It features an integrated bipod which can be deployed for even greater accuracy and control."
	att.Slot = {"ur_ak_barrel"}
	att.AutoStats = true
	att.SortOrder = 22.9
	att.Add_BarrelLength = 5
	att.Mult_SightTime = 1.1
	att.Mult_SpeedMult = .975
	att.Mult_SightedSpeedMult = 0.85
	att.Mult_Sway = 1.35
	att.Mult_HipDispersion = 1.35
	att.Mult_AccuracyMOA = .8
	att.Mult_Range = 1.5
	att.Mult_MalfunctionMean = 2
	att.Mult_HipDispersion = 1.5
	att.Mult_MoveDispersion = 1.25
	att.Bipod = true
	att.Mult_BipodRecoil = .25
	att.Mult_BipodDispersion = .2
	att.ActivateElements = {"barrel_rpk74m"}
	att.GivesFlags = {"ak_barrelchange","nodong"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_barrel_t56.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_barrel_t56")

	att.PrintName = "16\" Type 56 Barrel"
	att.Icon = Material("entities/att/ur_ak/barrel/type56.png", "mips smooth")
	att.Description = "Chinese derivative barrel with a fully hooded front sight and a folding spike bayonet. When unfolded, the bayonet increases melee damage substantially, but adds some forward weight."
	att.Slot = {"ur_ak_barrel"}
	att.AutoStats = true
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "16\" Yucha 7 Barrel" -- Chinese for harpoon
	end
	att.SortOrder = 16
	att.Mult_SightedSpeedMult = .95
	att.ToggleLockDefault = true
	att.ToggleStats = {
	    {
	        PrintName = "Extended",
	        ActivateElements = {"barrel_t56_ext"},
	        AutoStats = true,
	        Add_MeleeRange = 16,
	        Mult_MeleeDamage = 3,
	        Mult_MeleeWaitTime = 2,
	        Add_BarrelLength = 3,
	        Mult_Sway = 1.2,
	        -- Override_BashPreparePos = Vector(4, -5, -1.8),
	        -- Override_BashPrepareAng = Angle(-15, -5, -5),
	        -- Override_BashPos = Vector(-1, 12, 4.5), -- i'm too impatient to not make this bat you in the face with the stock
	        -- Override_BashAng = Angle(-7, 3, 25),
	        Hook_SelectBashAnim = function(wep,anim)
	            return "bash_bayonet"
	        end
	    },
	    {
	        PrintName = "Folded",
	        AutoStats = true,
	        ActivateElements = {"barrel_t56"},
	    },
	}
	att.GivesFlags = {"ak_bayonet1"}
	att.ExcludeFlags = {"ak_bayonet2"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_barrel_vepr.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_barrel_vepr")

	att.PrintName = "20\" VEPR Barrel"
	att.Icon = Material("entities/att/ur_ak/barrel/vepr.png", "mips smooth")
	att.Description = "Long civilian hunting barrel with a bottom-heavy handguard. Slow to handle and aim, but steady and accurate."
	att.Slot = {"ur_ak_barrel"}
	att.AutoStats = true
	att.SortOrder = 20
	att.Add_BarrelLength = 4
	att.Mult_SightTime = 1.15
	att.Mult_SpeedMult = .95
	att.Mult_SightedSpeedMult = 0.75
	att.Mult_Sway = 0.85
	att.Mult_Recoil = 0.85
	att.Mult_AccuracyMOA = 0.5
	att.Mult_Range = 1.25
	att.Mult_HipDispersion = 1.25
	att.Mult_ShootPitch = 0.9
	att.Mult_RPM = 0.8
	att.ActivateElements = {"barrel_vepr"}
	att.GivesFlags = {"ak_barrelchange"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_barrel_vityaz.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_barrel_vityaz")

	att.PrintName = "8\" SMG Barrel"
	att.Icon = Material("entities/att/ur_ak/barrel/pp19.png", "mips smooth")
	att.Description = "Submachine gun barrel with a rail interface for additional modularity. Functions identically to the Compact barrel."
	att.Slot = {"ur_ak_barrel"}
	att.AutoStats = true
	att.SortOrder = 7
	att.Add_BarrelLength = -6
	att.Mult_ShootPitch = 115/100
	att.Mult_RPM = 1.131
	att.Mult_SightTime = .8
	att.Mult_HipDispersion = .8
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_SpeedMult = 1.025
	att.Mult_Sway = .8
	att.Mult_Recoil = 1.5
	att.Mult_AccuracyMOA = 2
	att.Mult_Range = .5
	att.ActivateElements = {"barrel_vityaz"}
	att.GivesFlags = {"ak_barrelchange","barrel_carbine","ak_railedguard"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_cal_12g.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_cal_12g")

	att.PrintName = "Saiga-12 12 Gauge Receiver"
	att.AbbrevName = "12G Receiver"
	att.Icon = Material("entities/att/ur_ak/recievers/12.png", "mips smooth")
	--att.Icon = Material("entities/att/obsolete.png", "mips smooth") not obsolete anymore
	att.Description = "Turns the rifle into a semi-automatic, mag-fed combat shotgun."
	att.Desc_Pros = {
	    "ur.ak.12g.1"
	}
	att.Desc_Cons = {
	    "uc.semionly",
	    "ur.ak.12g.2",
	    "uc.jam"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ur_ak_cal"
	att.AutoStats = true
	att.SortOrder = -100
	-- Recycled USAS code top kek
	att.Override_ClipSize_Priority = -1
	att.Override_ClipSize = 8
	--att.Mult_HipDispersion = 1.25
	att.Mult_RPM = 0.4
	att.Override_Malfunction = true
	att.Mult_MalfunctionMean = 0.8
	att.Mult_MalfunctionVariance = 1.5
	att.Override_AccuracyMOA_Priority = -1
	att.Override_AccuracyMOA = 40
	att.Override_Num_Priority = -1 -- shotgun ammo may need to overwrite this
	att.Override_Num = 8
	att.Mult_Damage = 3
	att.Mult_DamageMin = 3
	att.Mult_Range = 0.2
	att.Mult_RangeMin = .5
	--att.Mult_PhysBulletMuzzleVelocity = 3 -- revert velocity changes by range
	att.Mult_PhysBulletMuzzleVelocity = .75
	--att.Mult_RangeMin = 0.75
	att.Mult_Recoil = 3
	att.Mult_RecoilSide = 2
	att.Mult_ShootSpeedMult = 0.75
	att.Mult_SpeedMult = 0.925
	att.Mult_ReloadTime = 1.15
	att.Override_Firemodes = {
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}
	att.LHIK = true
	att.Override_IsShotgun = true
	att.Override_IsShotgun_Priority = 999
	att.Override_Ammo = "buckshot"
	att.Override_Trivia_Calibre = "12 Gauge"
	att.Override_Trivia_Class = "Shotgun"
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/12g.mdl"
	att.Override_ShellScale = 1
	att.Override_ShellSounds = ArcCW.ShotgunShellSoundsTable
	att.GivesFlags = {"cal_12g"}
	att.ActivateElements = {"mag_12g"}
	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return "weapons/arccw_ud/m1014/fire.ogg" end
	    if fsound == wep.ShootSoundSilenced then return "weapons/arccw_ud/m1014/fire_supp.ogg" end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then return "weapons/arccw_ud/870/fire_dist.ogg" end
	end
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_12g"
	end
	-- att.Hook_GetDefaultAttIcon = function(wep, slot)
	--     if slotinfo[slot] then
	--         return slotinfo[slot][3]
	--     end
	-- end
	-- att.Hook_TranslateAnimation = function(wep, anim)
	--     if (anim == "fire" or anim == "fire_empty") then
	--         return anim .. "_usas"
	--     end
	-- end
	local slotinfo = {
	    [5] = {"8-Round Mag", "8-Round Mag", Material("entities/att/ur_ak/magazines/12_8.png", "mips smooth")},
	    [11] = {"\"BUCK\" #00 Buckshot", "\"BUCK\" #00 Buckshot", Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")},
	}
	att.Hook_GetDefaultAttName = function(wep, slot)
	    if slotinfo[slot] then
	        return GetConVar("arccw_truenames"):GetBool() and slotinfo[slot][2] or slotinfo[slot][1]
	    end
	end
	att.Hook_GetDefaultAttIcon = function(wep, slot)
	    if slotinfo[slot] then
	        return slotinfo[slot][3]
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_cal_308.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_cal_308")

	att.PrintName = "AK-308 7.62x51mm NATO Receiver"
	att.AbbrevName = ".308 Receiver"
	att.Icon = Material("entities/att/ur_ak/recievers/308.png", "mips smooth")
	att.Description = "Converts the weapon to a battle rifle, boasting an even larger bullet, passable accuracy, and a kick like a mule.\nAccuracy becomes extremely low in fully automatic mode."
	att.Slot = {"ur_ak_cal"}
	att.AutoStats = true
	att.Desc_Cons = {
	    "+300% Imprecision in Automatic mode"
	}
	--att.SortOrder = 10
	att.Override_ClipSize = 20
	att.Mult_Range = 2
	att.Mult_Penetration = 2
	att.Mult_RPM = 1.167 -- 700 rpm
	att.Mult_AccuracyMOA = .75
	att.Mult_Damage = 75 / 50
	att.Mult_DamageMin = 40 / 25
	att.Mult_ReloadTime = 1.25
	att.Mult_Recoil = 1.75
	att.Mult_RecoilSide = 1.5
	att.Mult_SightTime = 1.1
	att.Override_Firemodes = {
	    {
	        Mode = 2,
	        Mult_AccuracyMOA = 4
	    },
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	} -- The real AK-308 is select fire :trollscream:
	att.Override_Trivia_Calibre = "7.62x51mm NATO"
	att.Override_Trivia_Class = "Battle Rifle"
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
	att.Override_ShellScale = 1.145
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_308"
	end
	att.GivesFlags = {"cal_308","receiver_ak12"}
	att.ActivateElements = {"mag_308", "reciever_ak12"}
	local path = ")^weapons/arccw_ur/ak/"
	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "fire_308_1.ogg", path .. "fire_308_2.ogg", path .. "fire_308_3.ogg"} end
	    if fsound == wep.ShootSoundSilenced then return path .. "fire_308_sup.ogg" end
	end
	-- att.Hook_GetDistantShootSound = function(wep, distancesound)
	--     if distancesound == wep.DistantShootSound then return path .. "fire_545_dist.ogg" end
	-- end
	local slotinfo = {
	    [5] = {"20-Round Mag", "20-Round Mag", Material("entities/att/ur_ak/magazines/308_20.png", "mips smooth")},
	}
	att.Hook_GetDefaultAttName = function(wep, slot)
	    if slotinfo[slot] then
	        return GetConVar("arccw_truenames"):GetBool() and slotinfo[slot][2] or slotinfo[slot][1]
	    end
	end
	att.Hook_GetDefaultAttIcon = function(wep, slot)
	    if slotinfo[slot] then
	        return slotinfo[slot][3]
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_cal_366.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_cal_366")

	att.PrintName = "Vepr .366 TKM Receiver"
	att.AbbrevName = ".366 TKM Receiver"
	att.Icon = Material("entities/att/ur_ak/recievers/366.png", "mips smooth")
	att.Description = "Hunting round based on 7.62x39mm, with stronger ranged ballistics than the parent cartridge. Weapons chambered for it are exclusively produced for the civilian market, and are therefore semi-automatic only."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.semionly"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ur_ak_cal"
	att.AutoStats = true
	att.Mult_Damage = 1.2
	att.Mult_DamageMin = 1.2
	att.Mult_Range = 1.25
	att.Mult_PrecisionMOA = .75
	att.Mult_Penetration = 1.5
	--att.Mult_ReloadTime = .9
	att.Mult_RPM = 0.8
	att.Mult_Recoil = 1.5
	-- att.Override_ClipSize = 10
	att.Mult_ShootVol = 130 / 125
	-- att.Hook_SelectReloadAnimation = function(wep, anim)
	--     return anim .. "_10rnd"
	-- end
	att.Override_Firemodes = {
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0
	    }
	}
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/366tkm.mdl"
	att.Override_ShellScale = 1
	--att.Override_Trivia_Class = "Shotgun" -- The VPO-209 is considered a shotgun because of its smoothbore barrel
	att.Override_Trivia_Calibre = ".366 TKM"
	att.Override_Trivia_Manufacturer = "Molot-Oruzhiye"
	-- att.ActivateElements = {"mag_366"}
	att.GivesFlags = {"cal_366"}
	local path = ")^weapons/arccw_ur/ak/"
	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "fire_366_1.ogg", path .. "fire_366_2.ogg", path .. "fire_366_3.ogg"} end
	    if fsound == wep.ShootSoundSilenced then return path .. "fire_sup_1.ogg" end -- Temporary?
	end
	-- local slotinfo = {
	--     [5] = {"10-Round Mag", "10-Round Mag", Material("entities/att/ur_ak/magazines/366_10.png", "smooth mips")},
	-- }
	-- att.Hook_GetDefaultAttName = function(wep, slot)
	--     if slotinfo[slot] then
	--         return GetConVar("arccw_truenames"):GetBool() and slotinfo[slot][2] or slotinfo[slot][1]
	--     end
	-- end
	-- att.Hook_GetDefaultAttIcon = function(wep, slot)
	--     if slotinfo[slot] then
	--         return slotinfo[slot][3]
	--     end
	-- end
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_cal_545.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_cal_545")

	att.PrintName = "AK-74 5.45x39mm Receiver"
	att.AbbrevName = "5.45x39mm Receiver"
	att.Icon = Material("entities/att/ur_ak/recievers/545.png", "mips smooth")
	att.Description = "Lighter, more accurate cartridge that maintains wounding potential up close, but lacks penetration."
	att.Slot = {"ur_ak_cal"}
	att.AutoStats = true
	att.SortOrder = 10
	att.Override_Ammo = "smg1"
	att.Override_Trivia_Calibre = "5.45x39mm"
	att.Mult_Range = 1.2
	att.Mult_RPM = 1.083 -- 650 rpm
	att.Mult_SightedSpeedMult = 1.05
	att.Mult_ReloadTime = .95
	att.Mult_Recoil = .85
	att.Mult_AccuracyMOA = .85
	att.Mult_HipDispersion = .75
	att.Mult_Penetration = .65
	att.Mult_DamageMin = .8
	att.Mult_Damage = .8
	att.ShootPitchVariation = 1
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/545x39.mdl"
	att.Override_ShellScale = 1
	att.GivesFlags = {"cal_545"}
	att.ActivateElements = {"mag_545_30"}
	local path = ")^weapons/arccw_ur/ak/545_39/"
	local path1 = ")^weapons/arccw_ur/ak/"
	att.Hook_GetShootSound = function(wep, fsound)
	    --[[if fsound == wep.FirstShootSound or fsound == wep.FirstShootSound then return {
	        path .. "stalol/fire_545_1.wav",
	     } end]]
	    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "fire-01.ogg", path .. "fire-02.ogg", path .. "fire-03.ogg", path .. "fire-04.ogg", path .. "fire-05.ogg", path .. "fire-06.ogg"} end
	    if fsound == wep.ShootSoundSilenced then return path1 .. "fire_545_sup.ogg" end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then return {path .. "fire-dist-01.ogg", path .. "fire-dist-02.ogg", path .. "fire-dist-03.ogg", path .. "fire-dist-04.ogg", path .. "fire-dist-05.ogg", path .. "fire-dist-06.ogg"} end
	end
	local slotinfo = {
	    [5] = {"30-Round Mag", "30-Round Mag", Material("entities/att/ur_ak/magazines/545_30.png", "mips smooth")},
	}
	att.Hook_GetDefaultAttName = function(wep, slot)
	    if slotinfo[slot] then
	        return GetConVar("arccw_truenames"):GetBool() and slotinfo[slot][2] or slotinfo[slot][1]
	    end
	end
	att.Hook_GetDefaultAttIcon = function(wep, slot)
	    if slotinfo[slot] then
	        return slotinfo[slot][3]
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_cal_545_ak12.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_cal_545_ak12")

	att.PrintName = "AK-12 5.45x39mm Receiver"
	att.AbbrevName = "AK-12 Receiver"
	att.Icon = Material("entities/att/ur_ak/recievers/ak12.png", "mips smooth")
	att.Description = [[Lighter, more accurate cartridge that maintains wounding potential up close, but lacks penetration.
	Features a dark, glossy finish and a 2-round burst group.]]
	att.Desc_Pros = {
	    "ur.ak.burst"
	}
	att.Slot = {"ur_ak_cal"}
	att.AutoStats = true
	att.SortOrder = 10
	att.Override_Ammo = "smg1"
	att.Override_Trivia_Calibre = "5.45x39mm"
	att.Mult_Range = 1.2
	att.Mult_RPM = 1.083 -- 650 rpm
	att.Mult_SightedSpeedMult = 1.05
	att.Mult_ReloadTime = .95
	att.Mult_Recoil = .85
	att.Mult_AccuracyMOA = .85
	att.Mult_HipDispersion = .75
	att.Mult_Penetration = .65
	att.Mult_DamageMin = .8
	att.Mult_Damage = .8
	att.ShootPitchVariation = 1
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/545x39.mdl"
	att.Override_ShellScale = 1
	att.GivesFlags = {"cal_545"}
	att.Override_Firemodes = {
	    {
	        Mode = 2,
	    },
	    {
	        Mode = -2
	    },
	    {
	        Mode = 1,
	    },
	    {
	        Mode = 0,
	    },
	}
	att.ActivateElements = {"mag_545_30", "reciever_ak12"}
	att.GivesFlags = {"receiver_ak12","cal_545"}
	local path = ")^weapons/arccw_ur/ak/545_39/"
	local path1 = ")^weapons/arccw_ur/ak/"
	att.Hook_GetShootSound = function(wep, fsound)
	    --[[if fsound == wep.FirstShootSound or fsound == wep.FirstShootSound then return {
	        path .. "stalol/fire_545_1.wav",
	     } end]]
	    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "fire-01.ogg", path .. "fire-02.ogg", path .. "fire-03.ogg", path .. "fire-04.ogg", path .. "fire-05.ogg", path .. "fire-06.ogg"} end
	    if fsound == wep.ShootSoundSilenced then return path1 .. "fire_545_sup.ogg" end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then return {path .. "fire-dist-01.ogg", path .. "fire-dist-02.ogg", path .. "fire-dist-03.ogg", path .. "fire-dist-04.ogg", path .. "fire-dist-05.ogg", path .. "fire-dist-06.ogg"} end
	end
	local slotinfo = {
	    [5] = {"30-Round Mag", "30-Round Mag", Material("entities/att/ur_ak/magazines/545_30.png", "mips smooth")},
	}
	att.Hook_GetDefaultAttName = function(wep, slot)
	    if slotinfo[slot] then
	        return GetConVar("arccw_truenames"):GetBool() and slotinfo[slot][2] or slotinfo[slot][1]
	    end
	end
	att.Hook_GetDefaultAttIcon = function(wep, slot)
	    if slotinfo[slot] then
	        return slotinfo[slot][3]
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_cal_556.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_cal_556")

	att.PrintName = "AK-101 5.56x45mm NATO Receiver"
	att.AbbrevName = "5.56x45mm Receiver"
	att.Icon = Material("entities/att/ur_ak/recievers/545.png", "mips smooth")
	att.Description = "Designed for the export market, this receiever uses the NATO standard 5.56x45mm cartridge.\nThe smaller round yields a higher muzzle velocity and accuracy at range with similiar wounding potential to 5.45x39mm, but with a slower cyclic rate."
	att.Slot = {"ur_ak_cal"}
	att.AutoStats = true
	att.SortOrder = 10
	att.Override_Ammo = "smg1"
	att.Override_Trivia_Calibre = "5.56x45mm NATO"
	att.Mult_Range = 1.5
	att.Mult_SightedSpeedMult = 1.05
	att.Mult_ReloadTime = 0.95
	att.Mult_Recoil = 0.65
	att.Mult_AccuracyMOA = 0.6
	att.Mult_HipDispersion = .75
	att.Mult_Penetration = 12 / 16
	att.Mult_DamageMin = 20 / 25
	att.Mult_Damage = 34 / 50
	att.Override_Trivia_Country = "Russia"
	att.ShootPitchVariation = 1
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/556x45.mdl"
	att.Override_ShellScale = 1
	att.GivesFlags = {"cal_556"}
	att.ActivateElements = {"mag_556_30"}
	local path = ")^weapons/arccw_ur/ak/556/"
	local path1 = ")^weapons/arccw_ur/ak/"
	att.Hook_GetShootSound = function(wep, fsound)
	    --[[if fsound == wep.FirstShootSound or fsound == wep.FirstShootSound then return {
	        path .. "stalol/fire_545_1.wav",
	     } end]]
	    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "fire-01.ogg", path .. "fire-02.ogg", path .. "fire-03.ogg", path .. "fire-04.ogg", path .. "fire-05.ogg", path .. "fire-06.ogg"} end
	    if fsound == wep.ShootSoundSilenced then return path .. "fire_supp.ogg" end
	end
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then return {path .. "fire-dist-01.ogg", path .. "fire-dist-02.ogg", path .. "fire-dist-03.ogg", path .. "fire-dist-04.ogg", path .. "fire-dist-05.ogg", path .. "fire-dist-06.ogg"} end
	end
	local slotinfo = {
	    [5] = {"30-Round Mag", "30-Round Mag", Material("entities/att/ur_ak/magazines/545_30.png", "mips smooth")},
	}
	att.Hook_GetDefaultAttName = function(wep, slot)
	    if slotinfo[slot] then
	        return GetConVar("arccw_truenames"):GetBool() and slotinfo[slot][2] or slotinfo[slot][1]
	    end
	end
	att.Hook_GetDefaultAttIcon = function(wep, slot)
	    if slotinfo[slot] then
	        return slotinfo[slot][3]
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_cal_9mm.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_cal_9mm")

	att.PrintName = "PP-19 Vityaz 9x19mm Parabellum Receiver"
	att.AbbrevName = "9x19mm Receiver"
	att.Icon = Material("entities/att/ur_ak/recievers/9.png", "mips smooth")
	att.Description = "Converts the weapon to a submachine gun. The smaller caliber drastically reduces recoil, but has much less range and is less accurate."
	att.Slot = {"ur_ak_cal"}
	att.AutoStats = true
	att.SortOrder = 9
	att.Override_Ammo = "pistol"
	att.Override_Trivia_Calibre = att.AbbrevName
	att.Override_Trivia_Class = "Submachine Gun"
	att.Mult_Range = 0.6
	att.Mult_RPM = 1.178 -- 800 rpm with the carbine barrels
	att.Mult_ReloadTime = .95
	att.Mult_Recoil = .35
	att.Mult_AccuracyMOA = .85
	att.Mult_HipDispersion = .75
	att.Mult_ShootPitch = 90 / 100
	att.Mult_Penetration = 0.125
	att.Mult_DamageMin = 0.85
	att.Mult_Damage = 0.64
	att.Override_Ammo = "pistol"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"
	att.Override_Trivia_Class = "Submachine Gun"
	att.Override_ShellModel = "models/weapons/arccw/uc_shells/9x19.mdl"
	att.Override_ShellScale = 1
	att.Override_ShellSounds = ArcCW.PistolShellSoundsTable
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_9mm"
	end
	att.GivesFlags = {"cal_9mm"}
	att.ActivateElements = {"mag_9mm"}
	local soundpath = ")weapons/arccw_ur/ak/stalol/ak9_first_"
	local soundpath_s = ")weapons/arccw_ur/ak/stalol/ak9_loop_"
	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.FirstShootSound or fsound == wep.FirstShootSound then return {
	        soundpath .. "1.wav",
	        soundpath .. "2.wav",
	     } end
	    if fsound == wep.ShootSound or fsound == wep.FirstShootSoundSilenced then return {
	        soundpath_s .. "1.wav",
	        soundpath_s .. "2.wav",
	        soundpath_s .. "3.wav",
	     } end
	end
	local soundpath_dist = ")^weapons/arccw_ur/ak/stalol/ak9_tail"
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then return {
	        soundpath_dist .. ".wav",
	     } end
	end
	local slotinfo = {
	    [5] = {"30-Round Mag", "30-Round Mag", Material("entities/att/ur_ak/magazines/9_30.png", "mips smooth")},
	}
	att.Hook_GetDefaultAttName = function(wep, slot)
	    if slotinfo[slot] then
	        return GetConVar("arccw_truenames"):GetBool() and slotinfo[slot][2] or slotinfo[slot][1]
	    end
	end
	att.Hook_GetDefaultAttIcon = function(wep, slot)
	    if slotinfo[slot] then
	        return slotinfo[slot][3]
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_charm_tl.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_charm_tl")

	att.PrintName = "Tactical Laser Position"
	att.Icon = Material("entities/att/aksidemount.png", "smooth mips")
	att.Description = "Give your AN/PEQ a reason to be thin."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {
	    "ur.ak.tl.1",
	    "ur.ak.tl.2"
	}
	att.Slot = "ur_ak_charm"
	att.ActivateElements = {"optic_raillaser"}
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 20, -6),
	        Ang = Angle(0, 0, -25),
	        GlobalPos = false,
	        GlobalAng = true,
	        Magnification = 1,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}
	att.SortOrder = 998
	-- att.TacLaserPos = true
	att.RequireFlags = {"tac"}
	att.GivesFlags = {"ak_norail"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_cover_ak12.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_cover_ak12")

	att.PrintName = "AK-12 Dust Cover"
	att.Icon = Material("entities/att/ur_ak/dustcover_ak12.png", "mips smooth")
	att.Description = "Russian military issue dust cover with an upper picattiny rail."
	att.Slot = {"ur_ak_cover"}
	att.AutoStats = true
	att.Desc_Neutrals = {
	    "uc.cosmetic",
	    "ur.ak.alpha"
	}
	att.ActivateElements = {"cover_ak12"}
	att.GivesFlags = {"cover_rail"}
	att.ExcludeFlags = {"ak_barrelkrinkov","ak_norail"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_cover_alpha.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_cover_alpha")

	att.PrintName = "Alpha AK Dust Cover"
	att.AbbrevName = "Alpha Dust Cover"
	att.Icon = Material("entities/att/ur_ak/dustcover_alpha.png", "mips smooth")
	att.Description = "Alternative US-made dust cover with an upper picattiny rail."
	att.Slot = {"ur_ak_cover"}
	att.AutoStats = true
	att.Desc_Neutrals = {
	    "uc.cosmetic",
	    "ur.ak.alpha"
	}
	att.ActivateElements = {"cover_alpha"}
	att.GivesFlags = {"cover_rail"}
	att.ExcludeFlags = {"ak_barrelkrinkov","ak_norail"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_cover_ribbed.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_cover_ribbed")

	att.PrintName = "Ribbed Dust Cover"
	att.Icon = Material("entities/att/ur_ak/dustcover_ribbed.png", "mips smooth")
	att.Description = "Alternative dust cover with small protrustions. Realistically down to preference."
	att.Slot = {"ur_ak_cover"}
	att.Desc_Neutrals = {"uc.cosmetic"}
	att.ActivateElements = {"cover_ribbed"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_cover_truniun_rail.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_cover_truniun_rail")

	att.PrintName = "Trunnion Sight Mount"
	att.Icon = Material("entities/att/ur_ak/dustcover_mount.png", "mips smooth")
	att.Description = "Picatinny rail mounted on trunnion sights"
	att.Slot = {"ur_ak_cover"}
	att.Desc_Neutrals = {"uc.cosmetic"}
	att.Desc_Cons = {"Obstructs ironsights, install any scope"
	-- , "Only small scopes can be installed"    ?
	}
	att.ActivateElements = {"cover_trail"}
	att.GivesFlags = {"cover_rail"}
	att.ExcludeFlags = {"ak_barrelkrinkov","ak_norail"}
	-- att.Ignore = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_grip_ak12.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_grip_ak12")

	att.PrintName = "AK-12 Polymer Grip"
	att.Icon = Material("entities/att/ur_ak/grip_ak12.png", "mips smooth")
	att.Description = "Black polymer grip with an emphasis on ergonomics."
	att.AutoStats = true
	att.Slot = {"ur_ak_grip"}
	att.Mult_SightTime = .875
	att.Mult_SpeedMult = 1.025
	att.Mult_RecoilSide = 1.15
	att.ActivateElements = {"grip_ak12"}
	-- att.ActivateElements = {"grip_alpha"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_grip_akm.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_grip_akm")

	att.PrintName = "Modernized Grip"
	att.Icon = Material("entities/att/ur_ak/grip_modern.png", "mips smooth")
	att.Description = "Redesigned pistol grip, carved into a more ergonomic shape with grooves for a more comfortable grip."
	att.AutoStats = true
	att.Slot = {"ur_ak_grip"}
	att.Mult_SightTime = .9
	att.Mult_Recoil = 1.05
	att.Mult_RecoilSide = 1.025
	att.ActivateElements = {"grip_akm"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_grip_alpha.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_grip_alpha")

	att.PrintName = "Helix Polymer Grip"
	att.Icon = Material("entities/att/ur_ak/grip_helix.png", "mips smooth")
	att.Description = "Rough US-made polymer grip, eases ironsight handling at the cost of a higher recoil."
	att.AutoStats = true
	att.Slot = {"ur_ak_grip"}
	att.Mult_SightTime = .95
	att.Mult_Recoil = 1.1
	att.Mult_RecoilSide = 1.05
	att.Mult_SightedSpeedMult = 1.2
	att.ActivateElements = {"grip_alpha"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_grip_saiga.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_grip_saiga")

	att.PrintName = "Saiga Polymer Grip"
	att.AbbrevName = "Saiga Grip"
	att.Icon = Material("entities/att/ur_ak/grip_saiga.png", "mips smooth")
	att.Description = "Ergonomic polymer grip. The large, grooved grip surface mitigates its effects on recoil, but not entirely."
	att.AutoStats = true
	att.Slot = {"ur_ak_grip"}
	att.Mult_SightTime = .9
	att.Mult_RecoilSide = 1.05
	att.Mult_SightedSpeedMult = .9
	att.ActivateElements = {"grip_saiga"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_mag_545_45.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_mag_545_45")

	att.PrintName = "45-Round Extended Mag"
	att.Icon = Material("entities/att/ur_ak/magazines/545_45.png", "mips smooth")
	att.Description = "Extended magazine for the AK-74. While intended for squad gunners, the extra ammo is useful for any loadout, though the longer mag is noticeably heavier."
	att.Slot = {"ur_ak_mag"}
	att.AutoStats = true
	att.Desc_Cons = {
	    "uc.jam"
	}
	att.SortOrder = 45
	att.HideIfBlocked = true
	att.Override_ClipSize = 45
	att.Mult_SightTime = 1.25
	att.Mult_ReloadTime = 1.15
	att.Mult_Sway = 1.5
	att.Mult_RecoilSide = 1.2
	att.Mult_SpeedMult = 0.95
	att.Mult_ShootSpeedMult = 0.9
	att.Override_Malfunction = true
	att.Mult_MalfunctionMean = 0.85
	att.Mult_MalfunctionVariance = 1.5
	att.ActivateElements = {"mag_545_45"}
	att.RequireFlags = {"cal_545"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_mag_545_ak12.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_mag_545_ak12")

	att.PrintName = "AK-12 30-Round Polymer Mag"
	att.AbbrevName = "30-Round Polymer Mag"
	att.Icon = Material("entities/att/ur_ak/magazines/545_30_ak12.png", "mips smooth")
	att.Description = "Contemporary polymer magazine. The grooves give it a slightly better grip surface, but the difference in practice is negligible."
	att.Slot = {"ur_ak_mag"}
	att.AutoStats = true
	att.Desc_Neutrals = {
	    "uc.cosmetic",
	}
	att.SortOrder = 98
	att.HideIfBlocked = true
	-- att.Override_ClipSize = 45
	-- att.Mult_SightTime = 1.25
	-- att.Mult_ReloadTime = 1.15
	-- att.Mult_Sway = 1.5
	-- att.Mult_RecoilSide = 1.2
	-- att.Mult_SpeedMult = 0.95
	-- att.Mult_ShootSpeedMult = 0.9
	-- att.Override_Malfunction = true
	-- att.Mult_MalfunctionMean = 0.85
	-- att.Mult_MalfunctionVariance = 1.5
	att.ActivateElements = {"mag_545_ak12"}
	-- att.ActivateElements = {"mag_545_45"}
	att.RequireFlags = {"cal_545"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_mag_545_black.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_mag_545_black")

	att.PrintName = "30-Round Black Bakelite Mag"
	att.AbbrevName = "30-Round Mag (Black)"
	att.Icon = Material("entities/att/ur_ak/magazines/545_30_b.png", "mips smooth")
	att.Description = "Identical to the stock magazine, spray-painted black. Might suit your taste better."
	att.Slot = {"ur_ak_mag"}
	att.AutoStats = true
	att.Desc_Neutrals = {
	    "uc.cosmetic",
	}
	att.SortOrder = 99
	att.HideIfBlocked = true
	att.ActivateElements = {"mag_545_black"}
	att.RequireFlags = {"cal_545"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_mag_762_10.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_mag_762_10")

	att.PrintName = "AK-47 10-Round Compact Mag"
	att.AbbrevName = "10-Round Compact Mag"
	att.Icon = Material("entities/att/ur_ak/magazines/762_10.png", "mips smooth")
	att.Description = "Sporting purpose magazine with a very low capacity. The lighter load reduces the weapon's weight significantly."
	att.Slot = {"ur_ak_mag"}
	att.AutoStats = true
	att.SortOrder = 10
	att.GivesFlags = {"mag_366"}
	att.HideIfBlocked = true
	att.Override_ClipSize = 10
	att.Mult_SightTime = 0.8
	att.Mult_ReloadTime = 0.85
	att.Mult_Sway = 0.5
	att.Mult_SpeedMult = 1.025
	att.Mult_ShootSpeedMult = 1.05
	att.Mult_MalfunctionMean = 1.6
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_10rnd"
	end
	-- att.Hook_TranslateAnimation = function(wep, anim)
	--     if (anim == "fix") then
	--         return anim .. "_75"
	--     end
	-- end
	att.ActivateElements = {"mag_762_75"}
	att.ExcludeFlags = {"cal_545","cal_9mm","cal_12g","cal_308","cal_556"} -- Includes .366
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_mag_762_75.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_mag_762_75")

	att.PrintName = "AK-47 75-Round Drum Mag"
	att.AbbrevName = "75-Round Drum Mag"
	att.Icon = Material("entities/att/ur_ak/magazines/762_75.png", "mips smooth")
	att.Description = "Cylindrical drum magazine with capacity for a very large number of rounds, ideal for machine gunners. It is heavy enough to shift the weapon's center of mass, disorienting recoil control in addition to the existing drawbacks of extreme weight. Prone to feeding failures."
	att.Slot = {"ur_ak_mag"}
	att.AutoStats = true
	att.SortOrder = 75
	att.GivesFlags = {"mag_drum"}
	att.HideIfBlocked = true
	att.Override_ClipSize = 75
	att.Mult_SightTime = 1.3
	att.Mult_ReloadTime = 1.25
	att.Mult_Sway = 2.5
	att.Mult_SpeedMult = 0.9
	att.Mult_ShootSpeedMult = 0.8
	att.Mult_DrawTime = 1.2
	att.Mult_RecoilSide = 1.5
	att.Mult_HolsterTime = 1.2
	att.Mult_RecoilSide = 1.1
	att.Override_Malfunction = true
	att.Mult_MalfunctionMean = 0.7
	att.Mult_MalfunctionVariance = 1.5
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_75"
	end
	att.Hook_TranslateAnimation = function(wep, anim)
	    if (anim == "fix") then
	        return anim .. "_75"
	    end
	end
	att.ActivateElements = {"mag_762_75"}
	att.ExcludeFlags = ArcCW.UR.AKCalFlags
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_mag_762_bakelite.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_mag_762_bakelite")

	att.PrintName = "30-Round Bakelite Mag"
	att.AbbrevName = "30-Round Mag (Bakelite)"
	att.Icon = Material("entities/att/ur_ak/magazines/762_bakelite.png", "mips smooth")
	att.Description = "Plastic variant of the standard issue magazine. Might suit your taste better."
	att.Slot = {"ur_ak_mag"}
	att.AutoStats = true
	att.Desc_Neutrals = {
	    "uc.cosmetic",
	}
	att.SortOrder = 30
	att.HideIfBlocked = true
	att.ActivateElements = {"mag_762_bakelite"}
	att.ExcludeFlags = {"cal_545","cal_9mm","cal_12g","cal_308","cal_556"} -- Includes .366
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_mag_762_pmag.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_mag_762_pmag")

	att.PrintName = "PMAG 30 AK/AKM MOE"
	att.AbbrevName = "30-Round PMAG"
	att.Icon = Material("entities/att/ur_ak/magazines/762_pmag.png", "mips smooth")
	att.Description = "American aftermarket magazine. The grooves give it a slightly better grip surface, but the difference in practice is negligible."
	att.Slot = {"ur_ak_mag"}
	att.AutoStats = true
	att.Desc_Neutrals = {
	    "uc.cosmetic",
	}
	att.SortOrder = 30
	att.HideIfBlocked = true
	att.ActivateElements = {"mag_762_pmag"}
	att.ExcludeFlags = {"cal_545","cal_9mm","cal_12g","cal_308","cal_556"} -- Includes .366
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_muzzle_ak74.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_muzzle_ak74")

	att.PrintName = "AK-74M Compensator"
	att.Icon = Material("entities/att/ur_ak/muzzle_74m.png", "mips smooth")
	att.Description = "External compensator used since the '70s for AKs of multiple calibers. Efficiently reduces horizontal recoil and marginally reduces vertical recoil at the cost of a frontal counterweight that will inevitably raise swaying."
	att.AutoStats = true
	att.Slot = {"ur_ak_muzzle"}
	att.Mult_Recoil = .95
	att.Mult_RecoilSide = .65
	att.Add_BarrelLength = 2.5
	att.Mult_SightTime = 1.05
	att.Mult_Sway = 1.25
	att.SortOrder = 999
	att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
	att.ActivateElements = {"muzzle_ak74"}
	att.ExcludeFlags = {"ak_barrelchange"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_muzzle_akm.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_muzzle_akm")

	att.PrintName = "AKM Muzzle Brake"
	att.Icon = Material("entities/att/ur_ak/muzzle_m.png", "mips smooth")
	att.Description = "External muzzle brake unique to the AKM and some derivatives. The slant-cut design counters muzzle rise without adding as much weight as a universal compensator."
	att.AutoStats = true
	att.Slot = {"ur_ak_muzzle"}
	att.Mult_Recoil = .9
	att.Mult_RecoilSide = .95
	att.Add_BarrelLength = 1
	att.Mult_SightTime = 1.025
	att.Mult_Sway = 1.05
	att.Mult_ShootVol = 1.1
	att.SortOrder = 999
	att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
	att.ActivateElements = {"muzzle_akm"}
	att.ExcludeFlags = {"ak_barrelchange"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_muzzle_bayonet.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_muzzle_bayonet")

	att.PrintName = "Type 2 Bayonet"
	att.Icon = Material("entities/att/ur_ak/muzzle_bayonet.png", "mips smooth")
	att.Description = "External bayonet unique to early AK-pattern rifles. Wide and sharp, it's a bit bulky but allows for a devastating melee attack."
	att.AutoStats = true
	att.Slot = {"ur_ak_muzzle"}
	att.SortOrder = 998
	att.Add_MeleeRange = 16
	att.Mult_MeleeDamage = 3.5
	att.Mult_MeleeWaitTime = 2
	att.Add_BarrelLength = 3
	att.Mult_Sway = 1.4
	att.Mult_SightTime = 1.1
	att.Mult_MeleeTime = 1.1
	att.Override_BashPreparePos = Vector(4, -5, -1.8)
	att.Override_BashPrepareAng = Angle(-15, -5, -5)
	att.Override_BashPos = Vector(-1, 12, 4.5) -- i'm too impatient to not make this bat you in the face with the stock
	att.Override_BashAng = Angle(-7, 3, 25)
	att.Hook_SelectBashAnim = function(wep,anim)
	    return "bash_bayonet"
	end
	att.AttachSound = "arccw_uc/common/gunsmith/suppressor_thread.ogg"
	att.ActivateElements = {"muzzle_bayonet"}
	att.GivesFlags = {"ak_bayonet2"}
	att.ExcludeFlags = {"ak_barrelchange","ak_bayonet1"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_stock_ak12.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_stock_ak12")

	att.PrintName = "AK-12 Stock"
	att.Icon = Material("entities/att/ur_ak/stock/ak12.png", "mips smooth")
	att.Description = "Retractable folding stock. Its ergonomic design is comfortable to use on the move."
	att.Slot = {"ur_ak_stock"}
	att.AutoStats = true
	att.SortOrder = 2
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_MoveDispersion = .8
	att.Mult_RecoilSide = 1.35
	att.Mult_Sway = 1.25
	att.Add_BarrelLength = -4
	att.ActivateElements = {"stock_ak12"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_stock_ak74m.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_stock_ak74m")

	att.PrintName = "Polymer Stock"
	att.Icon = Material("entities/att/ur_ak/stock/n.png", "mips smooth")
	att.Description = [[Full side-folding stock. While extended, it functions similarly to a standard wood stock, albeit with less stability.
	Folding the stock boosts mobility and recoil, though not as significantly as skeletal folding stocks.
	Toggling this stock modifies performance accordingly.]]
	att.AutoStats = true
	att.Slot = {"ur_ak_stock"}
	att.SortOrder = 1
	att.ToggleLockDefault = true
	att.ToggleSound = "arccw_uc/common/stockslide.ogg"
	att.ExcludeFlags = {"mag_drum"}
	att.ToggleStats = {
	    {
	        PrintName = "Extended",
	        Mult_SightTime = 0.95,
	        Mult_Sway = 1.2,
	        
	        ActivateElements = {"stock_ak74m"},
	        AutoStats = true,
	    },
	    {
	        PrintName = "Folded",
	        Mult_SightTime = 0.85,
	        Mult_DrawTime = 0.9,
	        Mult_HolsterTime = 0.9,
	        Mult_Recoil = 1.25,
	        Mult_RecoilSide = 1.75,
	        Mult_SightedSpeedMult = 1.05,
	        Mult_ShootSpeedMult = 1.05,
	        Add_BarrelLength = -9,
	        Mult_Sway = 2.5,
	        ActivateElements = {"stock_ak74m_folded"},
	        AutoStats = true,
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_stock_akn.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_stock_akn")

	att.PrintName = "AKN Pattern Straight Stock"
	att.AbbrevName = "Straight Stock"
	att.Icon = Material("entities/att/ur_ak/stock/n.png", "mips smooth")
	att.Description = "A straight, hollow mass-manufacturing stock that eases handling. The heightened cheek rest also allows for better accuracy."
	att.Slot = {"ur_ak_stock"}
	att.AutoStats = true
	att.SortOrder = 4
	att.Mult_Recoil = 1.1
	att.Mult_SightTime = .95
	att.Mult_Sway = 0.8
	att.Mult_HipDispersion = 1.05
	att.ActivateElements = {"stock_akn"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_stock_aks.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_stock_aks")

	att.PrintName = "Sidefolding Stock"
	att.Icon = Material("entities/att/ur_ak/stock/fold.png", "mips smooth")
	att.Description = [[Side-folding stock found since the 74 series' debut. The triangular structure reduces its compromise on stability, but it is still less effective than a fixed stock. Folding the stock provides massively boosted maneuverability at the cost of severe recoil.
	Toggling this stock modifies performance accordingly.]]
	att.AutoStats = true
	att.Slot = {"ur_ak_stock"}
	att.SortOrder = 1
	att.ToggleLockDefault = true
	att.ToggleSound = "arccw_uc/common/stockslide.ogg"
	att.ExcludeFlags = {"mag_drum"}
	att.ToggleStats = {
	    {
	        PrintName = "Extended",
	        Mult_SightTime = .8,
	        Mult_RecoilSide = 1.25,
	        Mult_Sway = 1.2,
	        Mult_SightedSpeedMult = 1.05,
	        ActivateElements = {"stock_aks"},
	        AutoStats = true,
	    },
	    {
	        PrintName = "Folded",
	        Mult_SightTime = 0.6,
	        Mult_DrawTime = 0.85,
	        Mult_HolsterTime = 0.85,
	        Mult_Recoil = 1.5,
	        Mult_RecoilSide = 2,
	        Mult_SightedSpeedMult = 1.2,
	        Mult_ShootSpeedMult = 1.15,
	        Add_BarrelLength = -9,
	        Mult_Sway = 3,
	        ActivateElements = {"stock_aks_folded"},
	        AutoStats = true,
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_stock_alpha.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_stock_alpha")

	att.PrintName = "Carbine Stock"
	att.Icon = Material("entities/att/ur_ak/stock/helix.png", "mips smooth")
	att.Description = "A US made adjustable lightweight polymer stock with expectable pros and cons. Reduces vertical recoil and swaying, but drastically adds horizontal recoil."
	att.Slot = {"ur_ak_stock"}
	att.AutoStats = true
	att.SortOrder = 2
	att.Mult_Recoil = 0.85
	att.Mult_RecoilSide = 1.5
	att.Mult_Sway = 0.7
	att.Mult_SpeedMult = 1.05
	att.ActivateElements = {"stock_alpha"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_stock_none.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_stock_none")

	att.PrintName = "No Stock"
	att.Icon = Material("arccw/hud/atts/default.png", "mips smooth")
	att.Description = "Buttstock? What are you, Western capitalist WEAKLING? Real comrades channel strength of Siberian bear and shoot Kalashnikov without stock; withstand kick harder than 20 bottles of vodka."
	att.Slot = {"ur_ak_stock"}
	att.AutoStats = true
	att.Free = true
	att.SortOrder = -1
	att.Mult_SightTime = 0.5
	att.Mult_DrawTime = 0.6
	att.Mult_HolsterTime = 0.6
	att.Mult_Recoil = 1.65
	att.Mult_RecoilSide = 1.85
	att.Mult_SightedSpeedMult = 1.25
	att.Mult_SpeedMult = 1.1
	att.Mult_ShootSpeedMult = 1.15
	att.Add_BarrelLength = -9
	att.Mult_Sway = 3
	att.ActivateElements = {"stock_none"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_stock_rpk.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_stock_rpk")

	att.PrintName = "Clubfoot Stock"
	att.Icon = Material("entities/att/ur_ak/stock/rpk.png", "mips smooth")
	att.Description = "Heavy-duty machine gun stock, designed with prone shooting in mind. It has more mass than the factory stock, but is generally more comfortable to aim and shoot with."
	att.Slot = {"ur_ak_stock"}
	att.AutoStats = true
	att.SortOrder = 3
	att.Mult_Recoil = .85
	att.Mult_Sway = .75
	att.Mult_SightTime = 1.1
	att.Mult_SpeedMult = .9
	att.ActivateElements = {"stock_rpk"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_stock_skeletal.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_stock_skeletal")

	att.PrintName = "Skeletal Stock"
	att.Icon = Material("entities/att/ur_ak/stock/saiga.png", "mips smooth")
	att.Description = [[Lightens the weapon by reducing mass in the stock. Unlike other skeletal stocks for this platform, this stock cannot be folded.]]
	att.AutoStats = true
	att.Slot = {"ur_ak_stock"}
	att.SortOrder = 2
	att.Mult_SightTime = .8
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_SpeedMult = 1.05
	att.Mult_Sway = 1.1
	att.Mult_Recoil = 1.35
	att.Mult_RecoilSide = 1.15
	att.ActivateElements = {"stock_skeletal"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_stock_underfolder.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_stock_underfolder")

	att.PrintName = "Underfolding Stock"
	att.Icon = Material("entities/att/ur_ak/stock/under.png", "mips smooth")
	att.Description = [[Folding stock of the AKS-47. While not as stable as a full wood stock, it is much lighter. Folding the stock provides massively boosted maneuverability at the cost of severe recoil.
	Toggling this stock modifies performance accordingly.]]
	att.AutoStats = true
	att.Slot = {"ur_ak_stock"}
	att.SortOrder = 1
	att.ToggleLockDefault = true
	att.ToggleSound = "arccw_uc/common/stockslide.ogg"
	att.ToggleStats = {
	    {
	        PrintName = "Extended",
	        Mult_SightTime = .8,
	        Mult_RecoilSide = 1.35,
	        Mult_Sway = 1.25,
	        Mult_SightedSpeedMult = 1.1,
	        Mult_SpeedMult = 1.025,
	        ActivateElements = {"stock_underfolder"},
	        AutoStats = true,
	    },
	    {
	        PrintName = "Folded",
	        Mult_SightTime = 0.6,
	        Mult_DrawTime = 0.85,
	        Mult_HolsterTime = 0.85,
	        Mult_Recoil = 1.5,
	        Mult_RecoilSide = 2,
	        Mult_SightedSpeedMult = 1.2,
	        Mult_ShootSpeedMult = 1.15,
	        Add_BarrelLength = -9,
	        Mult_Sway = 3,
	        ActivateElements = {"stock_underfolder_folded"},
	        AutoStats = true,
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_ak_stock_vepr.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_ak_stock_vepr")

	att.PrintName = "Thumbhole Stock"
	att.Icon = Material("entities/att/ur_ak/stock/vepr.png", "mips smooth")
	att.Description = "Marksman stock with integrated grip. The thumbhole design provides unparalleled stability."
	att.Slot = {"ur_ak_stock"}
	att.AutoStats = true
	att.Desc_Cons = {
	    "uc.nogrip"
	}
	att.SortOrder = 3
	att.Mult_Recoil = 0.85
	att.Mult_Sway = 0.5
	att.Mult_SightTime = 1.15
	att.Mult_SpeedMult = 0.95
	att.Mult_SightedSpeedMult = 0.8
	att.ActivateElements = {"stock_vepr"}
	att.GivesFlags = {"stock_vepr"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_aw_barrel_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_aw_barrel_long")

	att.PrintName = "AW 27\" Magnum Barrel"
	att.AbbrevName = "27\" Magnum Barrel"
	att.Icon = Material("entities/att/ur_aw/bar_long.png", "mips smooth")
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "AP 27\" Magnum Barrel"
	end
	--att.Icon = Material("entities/att/acwatt_ud_mini14_barrel_long.png", "smooth mips")
	att.SortOrder = 27
	att.Description = "Lengthened fluted-steel barrel used with high-caliber setups for enhanced muzzle velocity and recoil reduction."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ur_aw_barrel"
	att.Mult_Range = 1.1
	att.Mult_Recoil = .8
	att.Mult_SightTime = 1.15
	att.Mult_Sway = 1.25
	att.Add_BarrelLength = 3
	att.AutoStats = true
	att.ActivateElements = {"barrel_long"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_aw_barrel_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_aw_barrel_sd")

	att.PrintName = "AWS 28\" Suppressed Barrel"
	att.AbbrevName = "28\" SD Barrel"
	att.Icon = Material("entities/att/ur_aw/bar_sup.png", "mips smooth")
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "APS 28\" SD Barrel"
	end
	--att.Icon = Material("entities/att/acwatt_ud_mini14_barrel_long.png", "smooth mips")
	att.SortOrder = 28
	att.Description = "Integrally suppressed barrel for the Arctic Warfare, designed for use with subsonic ammunition. Very effective for noise reduction, but reduces effective range.\nIncompatible with magnum ammunition."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "uc.nomuzzle"
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ur_aw_barrel"
	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.Mult_ShootPitch = 1.1
	att.Mult_ShootVol = 0.6
	att.Mult_Range = .85
	att.Add_BarrelLength = 3
	att.Mult_SightedSpeedMult = 0.85
	att.AutoStats = true
	att.ExcludeFlags = {"mag_338","mag_300"}
	att.ActivateElements = {"barrel_sd"}
	att.GivesFlags = {"barrel_sd"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_aw_barrel_short.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_aw_barrel_short")

	att.PrintName = "AT 20\" Shortened Barrel"
	att.AbbrevName = "20\" Shortened Barrel"
	att.Icon = Material("entities/att/ur_aw/bar_short.png", "mips smooth")
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "AP 20\" Shortened Barrel"
	end
	--att.Icon = Material("entities/att/acwatt_ud_mini14_barrel_long.png", "smooth mips")
	att.SortOrder = 20
	att.Description = "Custom-tooled \"close-quarters\" barrel that compromises long-range performance, but reduces forward weight significantly."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ur_aw_barrel"
	att.Mult_SightTime = 0.75
	att.Mult_Sway = 0.5
	att.Mult_HipDispersion = 0.5
	att.Mult_SpeedMult = 1.05
	att.Add_BarrelLength = -4
	att.Mult_Range = 0.3
	att.Mult_AccuracyMOA = 4
	att.Mult_Recoil = 1.25
	att.AutoStats = true
	att.ActivateElements = {"barrel_short"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ur_aw_cal_300.lua
------

do
	local att = {}
	ArcCW.SetShortName("ur_aw_cal_300")

	att.PrintName = "AWM .300 Winchester Magnum Receiver"
	att.AbbrevName = ".300 Win Mag"
	att.Icon = Material("entities/att/ur_aw/rec300.png", "mips smooth")
	att.Description = "Versatile magnum cartridge identical in diameter to 7.62x51mm rounds but with significantly higher muzzle energy. Liable to overpenetration at close range."
	att.Slot = "ur_aw_cal"
	att.Desc_Pros = {
	    "ur.aw.velocity"
	}
	att.AutoStats = true
	att.Mult_Damage = 44 / 75
	att.Mult_DamageMin = 85 / 40
	--att.Mult_Range = 2
	att.Override_Range = 50
	att.Override_RangeMin = 10
	att.Override_PhysBulletMuzzleVelocity = 1000
	att.Mult_Penetration = 1.25
	att.Mult_Recoil = 1.5
	att.Mult_ReloadTime = 5.55 / 5.15
	att.Mult_ShootSpeedMult = 0.9
	local path = ")^weapons/arccw_ur/aw_placeholders/338/"
	local path1 = ")^weapons/arccw_ur/aw_placeholders/"
	att.Hook_GetDistantShootSound = function(wep, distancesound)
	    if distancesound == wep.DistantShootSound then return {path1 .. "fire-dist-01.ogg", path1 .. "fire-dist-02.ogg", path1 .. "fire-dist-03.ogg", path1 .. "fire-dist-04.ogg", path1 .. "fire-dist-05.ogg", path1 .. "fire-dist-06.ogg"} end
	end
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_338"
	end
	local slotinfo = {
	    [5] = {"5-Round Mag", "5-Round Mag", Material("entities/att/ur_aw/mag338_5.png", "mips smooth")},
	}
	att.Hook_GetDefaultAttIcon = function(wep, slot)
	    if slotinfo[slot] then
	        return slotinfo[slot][3]
	    end
	end
	att.Override_Trivia_Calibre = ".300 Winchester Magnum"
	att.Override_ShellModel = "models/weapons/arccw/ud_shells/338.mdl"
	att.Override_Ammo = "SniperPenetratedRound"
	att.GivesFlags = {"mag_300"}
	--att.ActivateElements = {"mag_338"}
	ArcCW.LoadAttachmentType(att)
end

