local Material = ArcCW.AttachmentMat

------
-- mifl_fas2_m4a1_mag_50bw_10.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_mag_50bw_10")

	att.PrintName = "10-Round .50 Beowulf"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_ammo_60.png", "mips smooth")
	att.Description = "Heavy caliber conversion for 5.56 rifles. Its shorter cartridge length but bigger bullet means this ammunition is very lethal up close, but loses energy quickly."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 10 + 10
	att.AutoStats = true
	att.Slot = {"mifl_fas2_m4a1_mag", "mifl_fas2_m249_mag", "mifl_fas2_famas_mag"}

	att.Override_ClipSize = 10

	att.Mult_Damage = 1.75
	att.Mult_DamageMin = 0.75
	att.Mult_Range = 0.75
	att.Mult_Recoil = 2.5
	att.Mult_RecoilSide = 1.5
	att.Mult_ShootPitch = 0.8
	att.Mult_RPM = 0.5
	att.Mult_AccuracyMOA = 2

	att.Override_Ammo = "357"
	att.Override_Trivia_Calibre = ".50 Beowulf"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_fire1.wav" then return "weapons/arccw_mifl/fas2/m4a1/m16a2_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/m4a1/m16a2_suppressed_fire1.wav" end

	    if fsound == "weapons/arccw_mifl/fas2/famas/famas_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/famas/50.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/famas/famas_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/famas/50_s.wav" end	
	end

	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_mag_50bw_15.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_mag_50bw_15")

	att.PrintName = "20-Round .50 Beowulf"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_ammo_60.png", "mips smooth")
	att.Description = "Heavy caliber conversion for 5.56 rifles. Its shorter cartridge length but bigger bullet means this ammunition is very lethal up close, but loses energy quickly. Double-stack magazine increases capacity at the cost of weight."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 15 + 10
	att.AutoStats = true
	att.Slot = {"mifl_fas2_m4a1_mag", "mifl_fas2_m249_mag", "mifl_fas2_famas_mag"}

	att.Mult_SightTime = 1.1
	att.Mult_ReloadTime = 1.2
	att.Override_ClipSize = 20
	att.ActivateElements = {"60"}

	att.Mult_Damage = 1.75
	att.Mult_DamageMin = 0.75
	att.Mult_Range = 0.75
	att.Mult_Recoil = 2.5
	att.Mult_RecoilSide = 1.5
	att.Mult_ShootPitch = 0.8
	att.Mult_RPM = 0.5
	att.Mult_AccuracyMOA = 2

	att.Override_Ammo = "357"
	att.Override_Trivia_Calibre = ".50 Beowulf"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_fire1.wav" then return "weapons/arccw_mifl/fas2/m4a1/m16a2_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/m4a1/m16a2_suppressed_fire1.wav" end

	    if fsound == "weapons/arccw_mifl/fas2/famas/famas_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/famas/50.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/famas/famas_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/famas/50_s.wav" end	
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_mag_50bw_5.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_mag_50bw_5")

	att.PrintName = "5-Round .50 Beowulf"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_ammo_20.png", "mips smooth")
	att.Description = "Heavy caliber conversion for 5.56 rifles. Its shorter cartridge length but bigger bullet means this ammunition is very lethal up close, but loses energy quickly. Smaller magazine is more manuverable."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 5 + 10
	att.AutoStats = true
	att.Slot = "mifl_fas2_m4a1_mag"

	att.Mult_SightTime = 0.9
	att.Mult_ReloadTime = 0.9
	att.Override_ClipSize = 5
	att.ActivateElements = {"20"}

	att.Mult_Damage = 1.75
	att.Mult_DamageMin = 0.75
	att.Mult_Range = 0.75
	att.Mult_Recoil = 2.5
	att.Mult_RecoilSide = 1.5
	att.Mult_ShootPitch = 0.8
	att.Mult_RPM = 0.5
	att.Mult_AccuracyMOA = 2

	att.Override_Ammo = "357"
	att.Override_Trivia_Calibre = ".50 Beowulf"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_fire1.wav" then return "weapons/arccw_mifl/fas2/m4a1/m16a2_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/m4a1/m16a2_suppressed_fire1.wav" end
	end

	--[[]
	att.Override_Firemodes_Priority = 10
	att.Override_Firemodes = {
	    {
	        Mode = 1,
	    },	
	    {
	        Mode = 0
	    }
	}
	]]
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_mag_556_20.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_mag_556_20")

	att.PrintName = "20-Round 5.56mm"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_ammo_20.png", "mips smooth")
	att.Description = "Smaller but lighter 20 round magazine."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.SortOrder = 20 + 100
	att.AutoStats = true
	att.Slot = {"mifl_fas2_m4a1_mag", "mifl_fas2_g36_mag", "mifl_fas2_sg55x_mag"}

	att.ActivateElements = {"20"}

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightTime = 0.85
	att.Override_ClipSize = 20
	att.Mult_ReloadTime = 0.9

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_fire1.wav" then return "weapons/arccw_mifl/fas2/m4a1/m16a2_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/m4a1/m16a2_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_mag_556_60.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_mag_556_60")

	att.PrintName = "60-Round 5.56mm"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_ammo_60.png", "mips smooth")
	att.Description = "Heavy quad stack magazine holding twice the rounds."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 60 + 100
	att.AutoStats = true
	att.Slot = {"mifl_fas2_m4a1_mag", "mifl_fas2_m249_mag", "mifl_fas2_g36_mag"}

	att.ActivateElements = {"60"}

	att.Mult_MoveSpeed = 0.95
	att.Mult_SightTime = 1.1
	att.Override_ClipSize = 60
	att.Mult_ReloadTime = 1.2
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_mag_9mm_21.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_mag_9mm_21")

	att.PrintName = "21-Round 9mm"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_ammo_32.png", "mips smooth")
	att.Description = "Conversion to a pistol caliber, offering lots of bullet really quickly. Short stick mag is much lighter than standard magazines."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 21 + 50
	att.AutoStats = true
	att.Slot = "mifl_fas2_m4a1_mag"

	att.Mult_MoveSpeed = 1.05
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_ReloadTime = 0.7
	att.Mult_SightTime = 0.8
	att.Override_ClipSize = 21

	att.Mult_Damage = 0.8
	att.Mult_DamageMin = 0.8
	att.Mult_Range = 0.75
	att.Mult_Penetration = 0.7
	att.Mult_Recoil = 0.6
	att.Mult_RPM = 1.2
	att.Mult_AccuracyMOA = 2
	att.Mult_ShootPitch = 0.9

	att.Override_Ammo = "pistol"
	att.Override_ShellModel = "models/shells/shell_9mm.mdl"
	att.Override_Trivia_Class = "Submachine Gun"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"
	att.AddSuffix = " 9mm"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_fire1.wav" then return "weapons/arccw_mifl/fas2/mac11/mac11_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/mac11/mac11_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_mag_9mm_32.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_mag_9mm_32")

	att.PrintName = "32-Round 9mm"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_ammo_32.png", "mips smooth")
	att.Description = "Conversion to a pistol caliber, offering lots of bullet really quickly. Stick magazine is lighter than standard magazines."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 32 + 50
	att.AutoStats = true
	att.Slot = {"mifl_fas2_m4a1_mag", "mifl_fas2_m249_mag"}

	att.ActivateElements = {"32"}

	att.Mult_ReloadTime = 0.9
	att.Mult_SightTime = 0.9
	att.Override_ClipSize = 32

	att.Mult_Damage = 0.8
	att.Mult_DamageMin = 0.8
	att.Mult_Range = 0.75
	att.Mult_Penetration = 0.7
	att.Mult_Recoil = 0.6
	att.Mult_RPM = 1.2
	att.Mult_AccuracyMOA = 2
	att.Mult_ShootPitch = 0.9

	att.Override_Ammo = "pistol"
	att.Override_ShellModel = "models/shells/shell_9mm.mdl"
	att.Override_Trivia_Class = "Submachine Gun"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"
	att.AddSuffix = " 9mm"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_fire1.wav" then return "weapons/arccw_mifl/fas2/mac11/mac11_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/mac11/mac11_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_mag_9mm_50.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_mag_9mm_50")

	att.PrintName = "50-Round 9mm"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_ammo_50.png", "mips smooth")
	att.Description = "Drum magazine for the pistol caliber conversion. Slightly heavier than standard magazines."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 50 + 50 
	att.AutoStats = true
	att.Slot = {"mifl_fas2_m4a1_mag"}

	att.Mult_ReloadTime = 1.1
	--att.Mult_SightTime = 1.1
	att.Override_ClipSize = 50

	att.Mult_Damage = 0.8
	att.Mult_DamageMin = 0.8
	att.Mult_Range = 0.75
	att.Mult_Penetration = 0.7
	att.Mult_Recoil = 0.6
	att.Mult_RPM = 1.2
	att.Mult_AccuracyMOA = 2
	att.Mult_ShootPitch = 0.9

	att.Override_Ammo = "pistol"
	att.Override_ShellModel = "models/shells/shell_9mm.mdl"
	att.Override_Trivia_Class = "Submachine Gun"
	att.Override_Trivia_Calibre = "9x19mm Parabellum"
	att.AddSuffix = " 9mm"

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_fire1.wav" then return "weapons/arccw_mifl/fas2/mac11/mac11_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/m4a1/m4_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/mac11/mac11_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_stock_a2.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_stock_a2")

	att.PrintName = "Vintage Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_stock_a2.png", "mips smooth")
	att.Description = "Solid stock that stabilizes recoil but is slower to manuver. Essential for that ‘vintage’ look."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m4a1_stock"

	att.Mult_SightTime = 1.2
	att.Mult_Recoil = 0.9
	att.Mult_RecoilSide = 0.75
	att.Mult_SightedSpeedMult = 0.85
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_stock_pdw.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_stock_pdw")

	att.PrintName = "PDW Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_stock_sd.png", "mips smooth")
	att.Description = "Extremely light stock consisting of only a pad, increasing weapon mobility noticably."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m4a1_stock"

	att.Mult_RecoilSide = 1.2
	att.Mult_VisualRecoilMult = 1.2

	att.Mult_SightedSpeedMult = 1.15
	att.Mult_SpeedMult = 1.075
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m4a1_stock_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m4a1_stock_sd")

	att.PrintName = "Folded Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_m4a1_stock_kurz.png", "mips smooth")
	att.Description = "Curious stock ripped from a gangster’s submachine gun to make the weapon more concealable and maneuverable."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_m4a1_stock"

	att.Mult_RecoilSide = 1.5
	att.Mult_VisualRecoilMult = 1.25

	att.Mult_SightTime = 0.85
	att.Mult_HipDispersion = 0.9
	att.Mult_DrawTime = 0.5
	att.Mult_HolsterTime = 0.5
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m79_ammo_airburst.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m79_ammo_airburst")

	att.PrintName = "M79 Airburst"
	att.Icon = Material("entities/arccw_mifl_fas2_m79_air.png", "mips smooth")
	att.Description = "A high explosive grenade with configurable timed fuse. Will defuse itself if impacted with a surface.\n\nBeware, as a low muzzle velocity and fuse length can explode yourself!"
	att.Desc_Pros = {
	    "pro.fas2.m79.dmg",
	    "pro.fas2.m79.rad"
	}
	att.Desc_Cons = {
	    "con.fas2.m79.impactdefuse"
	}
	att.Desc_Neutrals = {
	    "info.fas2.m79.timer"
	}
	att.SortOrder = 3

	att.Slot = "mifl_fas2_m79_ammo"
	att.Override_ShootEntity = "arccw_gl_m79_airburst"

	att.Override_Firemodes_Priority = 1000
	att.Override_Firemodes = {
	    {
	        Mode = 1,
	        PrintName = "0.2s",
	        DetonationDelay = 0.2
	    },
	    {
	        Mode = 1,
	        PrintName = "0.3s",
	        DetonationDelay = 0.3
	    },
	    {
	        Mode = 1,
	        PrintName = "0.4s",
	        DetonationDelay = 0.4
	    },
	    {
	        Mode = 1,
	        PrintName = "0.5s",
	        DetonationDelay = 0.5
	    },
	    {
	        Mode = 1,
	        PrintName = "0.75s",
	        DetonationDelay = 0.75
	    },
	    {
	        Mode = 1,
	        PrintName = "1s",
	        DetonationDelay = 1
	    },
	    {
	        Mode = 1,
	        PrintName = "0.15s",
	        DetonationDelay = 0.15
	    },
	    {
	        Mode = 0
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m79_ammo_buckshot.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m79_ammo_buckshot")

	att.PrintName = "M79 Buckshot"
	att.Icon = Material("entities/arccw_mifl_fas2_m79_shotgun.png", "mips smooth")
	att.Description = "A grenade loaded with buckshot pellets and uses shotgun ammo. Because of the low grenade pressure, damage isn't as spectacular as one would expect."
	att.Desc_Pros = {
	    "pro.fas2.m79.buck"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "info.fas2.m79.buck"
	}
	att.SortOrder = 2

	att.Slot = {"mifl_fas2_m79_ammo"}
	att.Override_ShootEntity = false
	att.Override_Num = 30
	att.Mult_Damage = 300 / 150
	att.Mult_DamageMin = 60 / 60
	att.Mult_ShootPitch = 0.75
	att.Mult_ReloadTime = 0.9

	att.Override_AmmoPerShot = 3
	att.Override_ClipSize = 3
	att.Override_Ammo = "buckshot"

	att.Hook_Compatible = function(wep, data)
	    if wep.Attachments[4] and wep.Attachments[4].Installed == "mifl_fas2_m79_tube_q" then return false end
	end

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2/ks23/ks23_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m79_ammo_cball.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m79_ammo_cball")

	att.PrintName = "M79 Energy Orb"
	att.Icon = Material("entities/arccw_mifl_fas2_m79_ar2.png", "mips smooth")
	att.Description = "Grenade containing a combine dark energy device, which deploys an energy ball when fired."
	att.Desc_Pros = {
	    "pro.fas2.m79.cball"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "info.fas2.m79.cball"
	}
	att.SortOrder = -10

	att.Slot = "mifl_fas2_m79_ammo"
	att.Override_ShootEntity = "arccw_gl_m79_cball"
	att.Override_Ammo = "AR2AltFire"
	att.Mult_MuzzleVelocity = 0.5

	att.Hook_Compatible = function(wep, data)
	    if wep.Attachments[4] and wep.Attachments[4].Installed == "mifl_fas2_m79_tube_q" then return false end
	end

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/irifle/irifle_fire2.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m79_ammo_flash.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m79_ammo_flash")

	att.PrintName = "M79 Flash"
	att.Icon = Material("entities/arccw_mifl_fas2_m79_flash.png", "mips smooth")
	att.Description = "A grenade that creates a blinding flash."
	att.Desc_Pros = {
	    "pro.fas2.m79.flash"
	}
	att.Desc_Cons = {
	    "con.fas2.m79.min"
	}
	att.SortOrder = 1.5

	att.Slot = "mifl_fas2_m79_ammo"
	att.Override_ShootEntity = "arccw_gl_m79_flash"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m79_ammo_hornet.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m79_ammo_hornet")

	att.PrintName = "M79 Hornet's Nest"
	att.Icon = Material("entities/arccw_mifl_fas2_m79_hornet.png", "mips smooth")
	att.Description = "A grenade loaded with 18 .22LR rounds, and thus uses pistol ammo. It is much more accurate and has more range than buckshot, but doesn't do as much damage."
	att.Desc_Pros = {
	    "pro.fas2.m79.hornet"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "info.fas2.m79.hornet"
	}
	att.SortOrder = 2.5

	att.Slot = {"mifl_fas2_m79_ammo"}
	att.Override_ShootEntity = false
	att.Override_Num = 18
	att.Mult_Damage = 180 / 150
	att.Mult_DamageMin = 90 / 60
	att.Mult_AccuracyMOA = 0.4
	att.Mult_Range = 2
	att.Mult_ShootPitch = 0.75
	att.Mult_ReloadTime = 0.9

	att.Override_AmmoPerShot = 18
	att.Override_ClipSize = 18
	att.Override_Ammo = "pistol"

	att.Hook_Compatible = function(wep, data)
	    if wep.Attachments[4] and wep.Attachments[4].Installed == "mifl_fas2_m79_tube_q" then return false end
	end

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2/ks23/ks23_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m79_ammo_incendiary.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m79_ammo_incendiary")

	att.PrintName = "M79 Incendiary"
	att.Icon = Material("entities/arccw_mifl_fas2_m79_fire.png", "mips smooth")
	att.Description = "A grenade loaded with flammable fuel, spreading fire on impact."
	att.Desc_Pros = {
	    "pro.fas2.m79.incendiary"
	}
	att.Desc_Cons = {
	    "con.fas2.m79.min"
	}
	att.SortOrder = 0

	att.Slot = "mifl_fas2_m79_ammo"
	att.Override_ShootEntity = "arccw_gl_m79_incendiary"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m79_ammo_mini_buckshot.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m79_ammo_mini_buckshot")

	att.PrintName = "M79 Mini-Buckshot"
	att.Icon = Material("entities/arccw_mifl_fas2_m79_shotgun_small.png", "mips smooth")
	att.Description = "Small buckshot-loaded shells for the quad-barrel M79, using uses shotgun ammo. Does much less damage even compared to regular shotguns, but it's a shotgun I guess."
	att.Desc_Pros = {
	    "pro.fas2.m79.buck"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "info.fas2.m79.buck"
	}
	att.SortOrder = 2

	att.Slot = {"mifl_fas2_m79_ammo"}
	att.Override_ShootEntity = false
	att.Override_Num = 10
	att.Mult_Damage = 100 / 150
	att.Mult_DamageMin = 20 / 60
	att.Mult_AccuracyMOA = 0.5
	att.Mult_ShootPitch = 1.1
	att.Mult_ReloadTime = 0.9

	att.Override_Ammo = "buckshot"

	att.InvAtt = "mifl_fas2_m79_ammo_buckshot"

	att.Hook_Compatible = function(wep, data)
	    if wep.Attachments[4] and wep.Attachments[4].Installed ~= "mifl_fas2_m79_tube_q" then return false end
	end

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2/ks23/ks23_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m79_ammo_mini_hornet.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m79_ammo_mini_hornet")

	att.PrintName = "M79 Mini Hornet"
	att.Icon = Material("entities/arccw_mifl_fas2_m79_hornet_small.png", "mips smooth")
	att.Description = "A mini grenade loaded with 5 .22LR rounds, and thus uses pistol ammo. It is much more accurate and has more range than buckshot, but doesn't do as much damage."
	att.Desc_Pros = {
	    "pro.fas2.m79.hornet"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "info.fas2.m79.hornet"
	}
	att.SortOrder = 2.5

	att.Slot = {"mifl_fas2_m79_ammo"}
	att.Override_ShootEntity = false
	att.Override_Num = 5
	att.Mult_Damage = 50 / 150
	att.Mult_DamageMin = 25 / 60
	att.Mult_AccuracyMOA = 0.2
	att.Mult_Range = 2
	att.Mult_ShootPitch = 1.1
	att.Mult_ReloadTime = 0.9

	att.Override_AmmoPerShot = 5
	att.Override_ClipSize = 20
	att.Override_ClipSize_Priority = 10
	att.Override_Ammo = "pistol"

	att.InvAtt = "mifl_fas2_m79_ammo_hornet"

	att.Hook_Compatible = function(wep, data)
	    if wep.Attachments[4] and wep.Attachments[4].Installed ~= "mifl_fas2_m79_tube_q" then return false end
	end

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == wep.ShootSound then return "weapons/arccw_mifl/fas2/ks23/ks23_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m79_ammo_smoke.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m79_ammo_smoke")

	att.PrintName = "M79 Smoke"
	att.Icon = Material("entities/arccw_mifl_fas2_m79_smoke.png", "mips smooth")
	att.Description = "A grenade that deploys smoke."
	att.Desc_Pros = {
	    "pro.fas2.m79.smoke"
	}
	att.Desc_Cons = {
	    "con.fas2.m79.min"
	}
	att.SortOrder = 1

	att.Slot = "mifl_fas2_m79_ammo"
	att.Override_ShootEntity = "arccw_gl_m79_smoke"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m79_ammo_timed.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m79_ammo_timed")

	att.PrintName = "M79 Timed"
	att.Icon = Material("entities/arccw_mifl_fas2_m79_time.png", "mips smooth")
	att.Description = "A high explosive grenade with configurable timed fuse and carrying a heavier payload. Does not detonate on impact. Useful when shooting around corners."
	att.Desc_Pros = {
	    "pro.fas2.m79.dmg"
	}
	att.Desc_Cons = {
	    "con.fas2.m79.noimpact"
	}
	att.Desc_Neutrals = {
	    "info.fas2.m79.timer"
	}
	att.SortOrder = 4

	att.Slot = "mifl_fas2_m79_ammo"
	att.Override_ShootEntity = "arccw_gl_m79_timed"

	att.Mult_MuzzleVelocity = 0.8

	att.Override_Firemodes_Priority = 1000
	att.Override_Firemodes = {
	    {
	        Mode = 1,
	        PrintName = "2s",
	        DetonationDelay = 2
	    },
	    {
	        Mode = 1,
	        PrintName = "3s",
	        DetonationDelay = 3
	    },
	    {
	        Mode = 1,
	        PrintName = "5s",
	        DetonationDelay = 5
	    },
	    {
	        Mode = 1,
	        PrintName = "10s",
	        DetonationDelay = 10
	    },
	    {
	        Mode = 0
	    }
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m79_stock.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m79_stock")

	att.PrintName = "Obrez Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_m79_stock.png", "smooth")
	att.Description = "Saw off the wooden stock, leaving only a handle. Greatly increases recoil, but handles faster."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 1

	att.Slot = "mifl_fas2_m79_stock"
	att.AutoStats = true

	att.Mult_SightTime = 0.75
	att.Mult_SpeedMult = 1.1
	att.Mult_Recoil = 1.75
	att.Mult_RecoilSide = 1.5
	att.Mult_DrawTime = 0.75
	att.Mult_HolsterTime = 0.75
	att.Mult_ReloadTime = 0.95
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m79_tube_c.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m79_tube_c")

	att.PrintName = "Compact Tube"
	att.Icon = Material("entities/arccw_mifl_fas2_m79_tube_c.png", "smooth")
	att.Description = "Shortened tube for the M79. Somewhat more agile, but velocity is reduced."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 2

	att.Slot = "mifl_fas2_m79_tube"
	att.AutoStats = true

	att.Mult_AccuracyMOA = 2
	att.Mult_MuzzleVelocity = 0.75
	att.Mult_SightTime = 0.75
	att.Mult_SpeedMult = 1.1
	att.Mult_ReloadTime = 0.9
	att.Mult_ShootPitch = 1.1
	att.Mult_Recoil = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m79_tube_k.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m79_tube_k")

	att.PrintName = "Obrez Tube"
	att.Icon = Material("entities/arccw_mifl_fas2_m79_tube_k.png", "smooth")
	att.Description = "Cut down \"Pirate Gun\" tube for the M79. Agile, but does not shoot very far."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 1

	att.Slot = "mifl_fas2_m79_tube"
	att.AutoStats = true

	att.Mult_AccuracyMOA = 4
	att.Mult_MuzzleVelocity = 0.5
	att.Mult_SightTime = 0.5
	att.Mult_SpeedMult = 1.2
	att.Mult_ReloadTime = 0.8
	att.Mult_ShootPitch = 1.2
	att.Mult_Recoil = 1.25
	att.Mult_DrawTime = 0.75
	att.Mult_HolsterTime = 0.75

	att.LHIK = true
	att.LHIK_Priority = -2
	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_sd.mdl"

	att.ModelOffset = Vector(4, -0.5, -2)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m79_tube_l.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m79_tube_l")

	att.PrintName = "Extended Tube"
	att.Icon = Material("entities/arccw_mifl_fas2_m79_tube_long.png", "smooth")
	att.Description = "Long tube for the M79. Allows for longer range precision firing."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 3

	att.Slot = "mifl_fas2_m79_tube"
	att.AutoStats = true

	att.Mult_AccuracyMOA = 0.5
	att.Mult_MuzzleVelocity = 1.5
	att.Mult_SightTime = 1.25
	att.Mult_SpeedMult = 0.9
	att.Mult_ReloadTime = 1.1
	att.Mult_ShootPitch = 0.85
	att.Mult_Recoil = 0.75
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m79_tube_q.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m79_tube_q")

	att.PrintName = "Quad Tube"
	att.Icon = Material("entities/arccw_mifl_fas2_m79_tube_quad.png", "smooth")
	att.Description = "Compact quadruple barrel for the M79. Small grenades have considerably less recoil, but also less velocity and explosive power."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	    "con.fas2.m79.quad"
	}
	att.SortOrder = 2.5

	att.Slot = "mifl_fas2_m79_tube"
	att.AutoStats = true

	att.Mult_AccuracyMOA = 3
	att.Mult_MuzzleVelocity = 0.75
	att.Mult_SightTime = 1.25
	att.Mult_ReloadTime = 1.2
	att.Mult_ShootPitch = 1.25
	att.Mult_Recoil = 0.5

	att.Override_ClipSize = 4

	att.Override_Trivia_Calibre = "18×46mm Mini-Grenade"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m82_long.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m82_long")

	att.PrintName = "Marksman Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_m82_long.png")
	att.Description = "Longer barrel with even bigger muzzle brake. Damped recoil by at lot at a cost of handling"
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true

	att.SortOrder = 10

	att.ActivateElements = {"long"}

	att.Slot = "mifl_fas2_m82_hg"

	att.Mult_Recoil = 0.6
	att.Mult_RecoilSide = 0.4

	att.Mult_ReloadTime = 1.05
	att.Mult_ShootVol = 0.9
	att.Mult_AccuracyMOA = 0.8
	att.Mult_Range = 1.2

	att.Mult_SightTime = 1.1
	att.Mult_DrawTime = 1.1
	att.Mult_SpeedMult = 0.9
	att.Mult_SightedSpeedMult = 0.7

	att.Mult_HipDispersion = 0.9

	att.Add_BarrelLength = 5

	att.Mult_RPM = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m82_mag_25mm.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m82_mag_25mm")

	att.PrintName = "5-Round 25mm"
	att.Icon = Material("entities/arccw_mifl_fas2_ak_mag_556.png", "mips smooth")
	att.Description = "Explosive cartidge, guarantee to penetrate even the most armored."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 5
	att.AutoStats = true
	att.Slot = "mifl_fas2_m82_mag"

	att.Mult_Damage = 0.85
	att.Mult_DamageMin = 0.85
	att.Mult_Penetration = 0.5
	att.Mult_Range = 0.5
	att.Mult_Recoil = 1.5
	att.Mult_RecoilSide = 1.5
	att.Mult_RPM = 0.75

	att.Override_Ammo = "smg1_grenade"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m82_obrez.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m82_obrez")

	att.PrintName = "Obrez Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_m82_obrez.png")
	att.Description = "Okay, you know you need that right? All of that unburnt powder and kinetic energy is going straight in your face. I hope you break your bones with this."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true

	att.SortOrder = 1

	att.ActivateElements = {"obrez"}

	att.GivesFlags = {"mifl_fas2_m82_obrez"}

	att.Slot = "mifl_fas2_m82_hg"

	att.Mult_Damage = 0.7

	att.Mult_Recoil = 2
	att.Mult_RecoilSide = 2

	att.Mult_ReloadTime = 0.75
	att.Mult_ShootVol = 1.2
	att.Mult_AccuracyMOA = 4
	att.Mult_Range = 0.25

	att.Mult_SightTime = 0.5
	att.Mult_DrawTime = 0.5
	att.Mult_SpeedMult = 1.25
	att.Mult_SightedSpeedMult = 1.5

	att.Mult_HipDispersion = 0.8

	att.Add_BarrelLength = -30

	att.ModelOffset = Vector(-5, -4.5, 1.2)

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_m4x.mdl"

	att.Mult_RPM = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_m82_whisper.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_m82_whisper")

	att.PrintName = "Whisper Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_m82_whisperer.png")
	att.Description = "The magnum opus of some silencer enthuasist, this hulk of a suppressor is capable of somewhat dampening the thundering roar of a .50 BMG round.\nUnfortunately, that's still quite loud, and all that energy from the trapped gas is going straight into your shoulder."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true

	att.SortOrder = 2

	att.ExcludeFlags = {"backup"}

	att.ActivateElements = {"whisperer"}

	att.Slot = "mifl_fas2_m82_hg"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Mult_ShootPitch = 1.5
	att.Mult_ShootVol = 0.6
	att.Mult_AccuracyMOA = 0.75
	att.Mult_Range = 1.3
	att.Mult_SightTime = 1.3
	--att.Mult_HipDispersion = 1.2
	att.Add_BarrelLength = 12
	att.Mult_RPM = 0.8
	att.Mult_Recoil = 1.5
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mass26_mag_25.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mass26_mag_25")

	att.PrintName = "25-Round 12 Gauge"
	att.Icon = Material("entities/arccw_mifl_fas2_mass26_mag_25.png", "mips smooth")
	att.Description = "A heavy shotgun drum magazine that lets you keep racking that slide all day long."
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 25
	att.AutoStats = true
	att.Slot = "mifl_fas2_mass_mag"

	att.Mult_SightedSpeedMult = 0.7
	att.Override_ClipSize = 25
	att.Mult_MoveSpeed = 0.85
	att.Mult_SightTime = 1.25
	att.Mult_ReloadTime = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mass26_stock_fold.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mass26_stock_fold")

	att.PrintName = "Folding Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_mass26_stock_fold.png", "mips smooth")
	att.Description = "A lightweight modern foldable stock that has excellent hipfire performance."
	att.SortOrder = 11
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mass_stock"

	att.Mult_SightTime = 0.9
	att.Mult_SightedSpeedMult = 0.7
	att.Mult_HipDispersion = 0.85
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mass_hg_extended.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mass_hg_extended")

	att.PrintName = "Extended Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_mass26_ext.png", "mips smooth")
	att.Description = "Long, shrouded barrel for the MASS-26. Debatably defeats the point of the weapon system, but it does make for accurate shooting."
	att.SortOrder = 4
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mass_hg"

	att.Mult_SpeedMult = 0.9
	att.Mult_ShootPitch = 0.9
	att.Mult_Range = 1.5
	att.Mult_SightTime = 1.5
	att.Mult_HipDispersion = 1.5
	att.Mult_AccuracyMOA = 0.6

	att.Mult_DrawTime = 1.2
	att.Mult_HolsterTime = 1.2
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mass_hg_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mass_hg_sd")

	att.PrintName = "Whisper Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_mass26_sd.png", "mips smooth")
	att.Description = "Integrated suppressor for the MASS-26."
	att.SortOrder = 1
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mass_hg"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Mult_SpeedMult = 0.95
	att.Mult_ShootPitch = 1.3
	att.Mult_ShootVol = 0.7
	att.Mult_Range = 1.25
	att.Mult_SightTime = 1.1
	att.Mult_HipDispersion = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mass_hg_xs.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mass_hg_xs")

	att.PrintName = "Obrez Barrel"
	att.Icon = Material("entities/arccw_mifl_fas2_mass26_xs.png", "mips smooth")
	att.Description = "Cut the barrel down to being as short as possible. Makes the weapon more manuverable, but really hurts spread and recoil."
	att.SortOrder = 1
	att.Desc_Pros = {
		"pro.fas2.xs",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mass_hg"
	att.Override_ShootWhileSprint = true
	att.Mult_MoveDispersion = 3
	att.Mult_HipDispersion = 1.5
	att.Mult_SpeedMult = 1.15
	att.Mult_SightedSpeedMult = 1.3
	att.Mult_Range = 0.75
	att.Mult_SightTime = 0.75
	att.Mult_AccuracyMOA = 1.25
	att.Mult_Recoil = 1.5
	att.Mult_RecoilSide = 1.5
	att.Mult_CycleTime = 0.9
	att.Mult_DrawTime = 0.8
	att.Mult_HolsterTime = 0.8
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_hg_eod.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_hg_eod")

	att.PrintName = "EOD Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_hg_eod.png", "mips smooth")
	att.Description = "Unique handguard used by hazard containment units, designed to accomdate for underbarrel weapons. Barrel shroud offers slightly more range and recoil control. Cooling system gives the weapon an edge over the laws of thermal dynamics."
	att.SortOrder = 2.5
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_hg"

	att.Mult_Range = 1.1
	att.Mult_SightTime = 1.15
	att.Mult_Recoil = 0.95

	att.Add_BarrelLength = 3
	att.Mult_ShootPitch = 0.95

	att.Mult_HeatCapacity = 1.5
	att.Mult_FixTime = 0.5
	att.Mult_HeatDissipation = 1.25
	att.Mult_HeatDelayTime = 0.5
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_hg_fish.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_hg_fish")

	att.PrintName = "Swordfish Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_hg_fish.png", "mips smooth")
	att.Description = "Handguard with lots of rail and a cool looking ironsight. Improves performace but also increases weight due to the amount of rails."
	att.SortOrder = 4
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_hg"

	att.Mult_RPM = 0.95
	att.Mult_Recoil = 0.85
	att.Mult_SightTime = 1.1
	att.Mult_MoveSpeed = 0.95
	att.Mult_HipDispersion = 0.8

	att.Mult_AccuracyMOA = 0.8
	att.Mult_Range = 1.2

	att.Add_BarrelLength = 4

	att.LHIK = true
	att.LHIK_Priority = -2
	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_sd.mdl"
	att.ModelOffset = Vector(2, -0.5, 0)

	att.GivesFlags = {"mifl_fas2_mp5_hg_eod"}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_hg_g3.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_hg_g3")

	att.PrintName = "CETME Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_hg_g3.png", "mips smooth")
	att.Description = "Absurdly long barrel, ruining the point of an SMG but extending reach regardless."
	att.SortOrder = 12
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_hg"

	att.Mult_RPM = 0.85
	att.Mult_Recoil = 0.75
	att.Mult_SightTime = 1.4
	att.Mult_MoveSpeed = 0.9
	att.Mult_HipDispersion = 1.5

	att.Mult_AccuracyMOA = 0.25
	att.Mult_Range = 2

	att.Add_BarrelLength = 12

	att.LHIK = true
	att.LHIK_Priority = -2
	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_k.mdl"
	att.ModelOffset = Vector(4, -0.4, 0.4)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_hg_grip.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_hg_grip")

	att.PrintName = "Gripped Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_hg_fg.png", "mips smooth")
	att.Description = "Adds a grip to the front end of the MP5 for more controllability."
	att.SortOrder = 0
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_hg"

	att.Mult_Recoil = 0.9
	att.Mult_RecoilSide = 0.7

	att.Mult_SightTime = 1.15
	att.Mult_MoveSpeed = 0.95

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_felin.mdl"

	att.ModelOffset = Vector(3.8, 0, 0)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_hg_k.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_hg_k")

	att.PrintName = "Kurz Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_hg_k.png", "mips smooth")
	att.Description = "Shortens the weapon by a significant amount, and out goes the accuracy."
	att.SortOrder = -1
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_hg"

	att.Mult_RPM = 1.15

	att.Mult_Recoil = 1.15
	att.Mult_RecoilSide = 1.3

	att.Mult_SightTime = 0.8
	att.Mult_ReloadTime = 0.9

	att.Mult_MoveSpeed = 1.1
	att.Mult_SightedSpeedMult = 1.2

	att.Mult_AccuracyMOA = 1.5
	att.Mult_Range = 0.7

	att.Add_BarrelLength = -6

	att.Mult_ShootPitch = 0.8
	att.LHIK = true
	att.LHIK_Priority = -2
	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_felin.mdl"

	att.GivesFlags = {"Akimbo_Yes"}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_hg_mw2.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_hg_mw2")

	att.PrintName = "Specops Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_hg_mw2.png", "mips smooth")
	att.Description = "Custom made MP5K upper for use by special forces. Shorter bolt and heavier weight makes it shoot faster without being harder to control."
	att.SortOrder = -0.5
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
		"con.fas2.ubgl",
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_hg"

	att.Mult_RPM = 1.25

	att.Mult_Recoil = 1.2
	att.Mult_RecoilSide = 1.2

	att.Mult_SightTime = 0.9

	att.Mult_MoveSpeed = 1.05
	att.Mult_SightedSpeedMult = 1.1

	att.Mult_AccuracyMOA = 1.25
	att.Mult_Range = 0.8

	att.Add_BarrelLength = -6
	att.Mult_ShootPitch = 1.1

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_sd.mdl"

	att.ModelOffset = Vector(-0.5, -0.5, 0)

	att.GivesFlags = {"Akimbo_Yes"}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_hg_no.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_hg_no")

	att.PrintName = "No Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_hg_no.png", "mips smooth")
	att.Description = "Completely disregarding the millions of dollars H&K spent on R&D to perfect the MP5 formula, you choose to cut off the barrel and worsen its ballistic performance. Since there's no actual handguard left, you also need to hold the weapon one-handed, making it even worse. Good job, genius!"
	att.SortOrder = -2
	att.Desc_Pros = {
		"pro.fas2.xs",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_hg"
	att.Override_ShootWhileSprint = true
	att.Mult_RPM = 1.2
	att.Mult_MoveDispersion = 3
	att.Mult_HipDispersion = 1.5
	att.Mult_SightTime = 0.7
	att.Mult_ReloadTime = 0.9

	att.Mult_Recoil = 1.5
	att.Mult_RecoilSide = 2

	att.Mult_SpeedMult = 1.2
	att.Mult_SightedSpeedMult = 1.4

	att.Mult_AccuracyMOA = 3
	att.Mult_Range = 0.5

	att.Mult_MoveDispersion = 1.5

	att.Add_BarrelLength = -8
	att.Mult_ShootPitch = 1

	att.LHIK = true
	att.LHIK_Priority = -2
	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_felin.mdl"

	att.GivesFlags = {"Akimbo_Yes"}

	att.ModelOffset = Vector(-15, -5, -5)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_hg_sd.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_hg_sd")

	att.PrintName = "SD Handguard"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_hg_sd.png", "mips smooth")
	att.Description = "Integral suppressor that reduces bullet velocity to subsonic levels while keeping all of the MP5's virtues intact."
	att.SortOrder = 4
	att.Desc_Pros = {
	    "pro.invistracers"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_hg"

	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"

	att.Mult_ShootVol = 0.6
	att.Mult_AccuracyMOA = 0.8
	att.Mult_Range = 1.2

	att.Mult_SightTime = 1.2
	att.Mult_HipDispersion = 1.2
	att.Mult_RPM = 0.9

	att.Mult_ShootPitch = 2.2
	att.Add_BarrelLength = 4
	att.Override_PhysTracerProfile = 5
	att.Override_TracerNum = 0
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_mag_10_20.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_mag_10_20")

	att.PrintName = "20-Round 10mm Auto"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_mag_10mm.png", "mips smooth")
	att.Description = "Convert weapon to fire the more powerful 10mm Auto with increased damage and less load. The straight magazine is ever so slightly heavier."
	att.SortOrder = 20 + 1500
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_mag"

	att.Override_ClipSize = 20

	att.Mult_Damage = 1.15
	att.Mult_DamageMin = 1.15

	att.Mult_Recoil = 1.1
	att.Mult_RPM = 0.9

	att.Mult_ReloadTime = 1.05

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/mp5/mp5_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/mp5/30.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/mp5/mp5k_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/mp5/30sd.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_mag_15.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_mag_15")

	att.PrintName = "15-Round 9mm"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_mag_15.png", "mips smooth")
	att.Description = "For the agile."
	att.SortOrder = 1 + 2000
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_mag"

	att.Override_ClipSize = 15 

	att.Mult_SpeedMult = 1.1
	att.Mult_ReloadTime = 0.85
	att.Mult_SightTime = 0.85
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_mag_20.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_mag_20")

	att.PrintName = "20-Round .45 ACP"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_mag_20.png", "mips smooth")
	att.Description = "Convert weapon to fire .45 ACP with less load, which kicks harder but is especially powerful up close."
	att.SortOrder = 20 + 1700
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	"con.magcap"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_mag"

	att.Override_ClipSize = 20

	att.Mult_Damage = 1.35
	att.Mult_DamageMin = 1.15

	att.Mult_RPM = 0.8
	att.Mult_Recoil = 1.2
	att.Mult_ShootPitch = 0.9
	att.Mult_ReloadTime = 0.95

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/mp5/mp5_fire1.wav" then return "weapons/arccw_mifl/fas2/mp5/mp5_40cal_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/mp5/mp5k_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/mp5/mp5_40cal_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_mag_20_70.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_mag_20_70")

	att.PrintName = "70-Round .45 ACP"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_mag_80.png", "mips smooth")
	att.Description = "Convert weapon to fire .45 ACP in a high capacity Vollmer magazine."
	att.SortOrder = 70 + 1700
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	"con.magcap"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_mag"

	att.Override_ClipSize = 70 

	att.Mult_SpeedMult = 0.9
	att.Mult_SightTime = 1.5
	att.Mult_ReloadTime = 1.25

	att.Mult_Damage = 1.35
	att.Mult_DamageMin = 1.15

	att.Mult_RPM = 0.8
	att.Mult_Recoil = 1.2
	att.Mult_ShootPitch = 0.9

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/mp5/mp5_fire1.wav" then return "weapons/arccw_mifl/fas2/mp5/mp5_40cal_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/mp5/mp5k_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/mp5/mp5_40cal_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_mag_30.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_mag_30")

	att.PrintName = "30-Round 10mm Auto"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_mag_10mm.png", "mips smooth")
	att.Description = "Convert weapon to fire the more powerful 10mm Auto with increased damage. The straight magazine is ever so slightly heavier."
	att.SortOrder = 30 + 1500
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_mag"

	att.Override_ClipSize = 30 

	att.Mult_Damage = 1.15
	att.Mult_DamageMin = 1.15

	att.Mult_Recoil = 1.1
	att.Mult_RPM = 0.9

	att.Mult_ReloadTime = 1.1
	att.Mult_SightTime = 1.1

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/mp5/mp5_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/mp5/30.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/mp5/mp5k_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2_custom/mp5/30sd.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_mag_45_30.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_mag_45_30")

	att.PrintName = "30-Round .45 ACP"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_mag_20.png", "mips smooth")
	att.Description = "Convert weapon to fire .45 ACP, which kicks harder but is especially powerful up close."
	att.SortOrder = 30 + 1700
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	"con.magcap"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_mag"

	att.Override_ClipSize = 30 

	att.Mult_Damage = 1.35
	att.Mult_DamageMin = 1.15

	att.Mult_RPM = 0.8
	att.Mult_Recoil = 1.2
	att.Mult_ShootPitch = 0.9

	att.Hook_GetShootSound = function(wep, fsound)
	    if fsound == "weapons/arccw_mifl/fas2/mp5/mp5_fire1.wav" then return "weapons/arccw_mifl/fas2/mp5/mp5_40cal_fire1.wav" end
	    if fsound == "weapons/arccw_mifl/fas2/mp5/mp5k_suppressed_fire1.wav" then return "weapons/arccw_mifl/fas2/mp5/mp5_40cal_suppressed_fire1.wav" end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_mag_50.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_mag_50")

	att.PrintName = "50-Round 9mm"
	att.Icon = Material("entities/arccw_mifl_fas2_g36_ammo_30.png", "mips smooth")
	att.Description = "Quad stack magazine holding almost twice the rounds."
	att.SortOrder = 50 + 2000
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_mag"

	att.Override_ClipSize = 50 

	att.Mult_SpeedMult = 0.95
	att.Mult_SightTime = 1.15
	att.Mult_ReloadTime = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_mag_80.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_mag_80")

	att.PrintName = "80-Round 9mm"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_mag_80.png", "mips smooth")
	att.Description = "Very high capacity Vollmer magazine, for in case you need to use the MP5 like a pocket machine gun."
	att.SortOrder = 80 + 2000
	att.Desc_Pros = {
	    "pro.magcap"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_mag"

	att.Override_ClipSize = 80 

	att.Mult_SpeedMult = 0.9
	att.Mult_SightTime = 1.5
	att.Mult_ReloadTime = 1.3
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_mag_waffle.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_mag_waffle")

	att.PrintName = "25-Round X.223"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_mag_waffle.png", "mips smooth")
	att.Description = "Waffle magazine loaded with experimental fragmented .223R rounds. Fires multiple shrapnel out of the barrel with poor accuracy and range, but up close it will hurt a lot."
	att.SortOrder = 25 + 1000
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_mag"

	att.Override_ClipSize = 25

	att.Mult_SightTime = 1.1
	att.Mult_ReloadTime = 1.1

	att.Mult_AccuracyMOA = 6
	att.Override_Num = 4
	att.Mult_Range = 0.5
	att.Mult_Damage = 1.5
	att.Mult_ShootPitch = 0.65
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_mag_waffle_80.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_mag_waffle_80")

	att.PrintName = "55-Round X.223"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_mag_80.png", "mips smooth")
	att.Description = "Vollmer waffle magazine loaded with experimental fragmented .223R rounds."
	att.SortOrder = 55 + 1000
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.magcap"
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_mag"

	att.Override_ClipSize = 55

	att.Mult_SpeedMult = 0.9
	att.Mult_SightTime = 1.5
	att.Mult_ReloadTime = 1.3

	att.Mult_AccuracyMOA = 6
	att.Override_Num = 4
	att.Mult_Range = 0.5
	att.Mult_Damage = 1.5
	att.Mult_ShootPitch = 0.65
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_stock_fish.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_stock_fish")

	att.PrintName = "Swordfish Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_stock_fish.png", "mips smooth")
	att.Description = "Heavy polymer stock. Not as heavy as those wooden ones."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_stock"
	att.SortOrder = 1

	att.Mult_SightTime = 1.25
	att.Mult_SightedSpeedMult = 0.75
	att.Mult_Recoil = 0.95
	att.Mult_RecoilSide = 0.75
	att.Mult_MoveDispersion = 0.75
	att.Mult_HipDispersion = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_stock_g3.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_stock_g3")

	att.PrintName = "G3 Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_stock_g3.png", "mips smooth")
	att.Description = "Heavy stock that ensures you won't have any trouble controlling recoil whats-so-ever."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_stock"
	att.SortOrder = 1

	att.Mult_SightTime = 1.4
	att.Mult_SightedSpeedMult = 0.5
	att.Mult_Recoil = 0.5
	att.Mult_RecoilSide = 0.5
	att.Mult_MoveDispersion = 0.5
	att.Mult_HipDispersion = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_stock_none.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_stock_none")

	att.PrintName = "No Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_no_grip.png", "mips smooth")
	att.Description = "Removing the stock decreases controllability but increases speed significantly."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_stock"
	att.Ignore = true

	att.Mult_Recoil = 1.8
	att.Mult_RecoilSide = 1.5
	att.Mult_SightTime = 0.75
	att.Mult_MoveDispersion = 0.75

	att.Mult_SightedSpeedMult = 1.25
	att.Mult_MoveSpeed = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_stock_pdw.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_stock_pdw")

	att.PrintName = "PDW Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_stock_pdw.png", "mips smooth")
	att.Description = "Lightweight folding stock, faster to manipulate but is worse at recoil control."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"mifl_fas2_mp5_stock", "mifl_fas2_g3_stock", "mifl_fas2_m11_stock"}
	att.SortOrder = 2

	att.Mult_SightTime = 0.85
	att.Mult_SightedSpeedMult = 1.2
	att.Mult_Recoil = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_stock_ump.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_stock_ump")

	att.PrintName = "UMP Stock"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_stock_ump.png", "mips smooth")
	att.Description = "Folding stock taken straight off a UMP. It is slightly heavier and sturdier than the MP5 folding stock."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.SortOrder = 3

	att.Mult_Recoil = 0.85
	att.Mult_SightedSpeedMult = 0.8

	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_stock"
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_ump_k.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_ump_k")

	att.PrintName = "UMP Kurz Kit"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_hg_umpk.png", "mips smooth")
	att.Description = "Aftermarket kit of a shortened UMP upper, allowing you to have the MP5K in UMP form."
	att.SortOrder = -50
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_hg"

	att.Mult_Recoil = 1.1
	att.Mult_RecoilSide = 1.2

	att.Mult_SpeedMult = 1.05
	att.Mult_SightedSpeedMult = 1.1

	att.Mult_Range = 0.9
	att.Mult_AccuracyMOA = 1.25

	att.Mult_SightTime = 0.9
	--att.Mult_ReloadTime = 0.95

	att.Add_BarrelLength = -6

	att.Mult_ShootPitch = 0.85

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_felin.mdl"

	att.ModelOffset = Vector(-0.8, -0, -1.5)

	att.GivesFlags = {"Akimbo_Yes"}
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_ump_nor.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_ump_nor")

	att.PrintName = "UMP Kit"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_hg_ump.png", "mips smooth")
	att.Description = "Aftermarket kit allowing your MP5 to pretend it is its cheaper cousin. It is slightly heavier and has more range."
	att.SortOrder = -40
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_hg"

	att.Mult_MoveSpeed = 0.95
	att.Mult_Range = 1.25
	att.Mult_RPM = 0.9
	att.Mult_Recoil = 0.95
	att.Mult_SightTime = 1.1
	att.Mult_AccuracyMOA = 0.8
	att.Mult_MoveDispersion = 3

	att.Mult_ShootPitch = 0.85

	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_sd.mdl"

	att.ModelOffset = Vector(1.5, -0.5, 0)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_mp5_ump_usc.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_mp5_ump_usc")

	att.PrintName = "USC Kit"
	att.Icon = Material("entities/arccw_mifl_fas2_mp5_hg_usc.png", "mips smooth")
	att.Description = "Aftermarket kit converting the MP5 to the long barrel civilian USC. Excellent range "
	att.SortOrder = -30
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "mifl_fas2_mp5_hg"

	att.Mult_SpeedMult = 0.9
	att.Mult_SightedSpeedMult = 0.8
	att.Mult_Range = 1.5
	att.Mult_RPM = 0.8
	att.Mult_Recoil = 0.9
	att.Mult_SightTime = 1.25
	att.Mult_AccuracyMOA = 0.5

	att.Add_BarrelLength = 9
	att.Mult_ShootPitch = 0.8
	att.LHIK = true
	att.LHIK_Priority = -2

	att.Model = "models/weapons/arccw/mifl_atts/fas2/grip_famas_k.mdl"

	att.ModelOffset = Vector(1.5, -0.5, 0)

	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_optic_551.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_optic_551")

	att.PrintName = "MRCS Scope (6x)"
	att.Icon = Material("entities/arccw_mifl_fas2_optic_551.png", "smooth")
	att.Description = "Swish mid-long range optic."

	att.SortOrder = 5

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"optic"}

	att.Model = "models/weapons/arccw/mifl_atts/fas2_optic_551.mdl"
	att.HolosightPiece = "models/weapons/arccw/mifl_atts/fas2_optic_acog_551.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 12, -2.05),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.5,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 1,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
	        IgnoreExtra = true,
	    },
	}
	att.Holosight = true
	att.HolosightMagnification = 6
	att.HolosightMagnificationMin = 6
	att.HolosightMagnificationMax = 6
	att.HolosightReticle = Material("mifl_fas2_reticle/scope_leo.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 12
	att.HolosightBone = "holosight"
	att.Colorable = false
	att.HolosightBlackbox = true

	att.Mult_SightTime = 1.2
	att.Mult_SpeedMult = 0.95

	att.Mult_VisualRecoilMult = 0.2

	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_optic_acog.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_optic_acog")

	att.PrintName = "ACOG (4x)"
	att.Icon = Material("entities/arccw_mifl_fas2_optic_acog.png", "smooth")
	att.Description = "Adaptive mid range combat scope fitted with an backup ironsight."

	att.SortOrder = 4

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom"
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	    "info.togglesight"
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw/mifl_atts/fas2_optic_acog.mdl"
	att.HolosightPiece = "models/weapons/arccw/mifl_atts/fas2_optic_acog_hsp.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 8.5, -1.45),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.2,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        IgnoreExtra = true,
	    },
	    {
	        Pos = Vector(0, 10, -2.52),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ZoomLevels = 1,		
	        HolosightData = {
	            Holosight = true,
				HolosightReticle = Material("mifl_fas2_reticle/blank.png"),
	            HolosightPiece = "models/weapons/arccw/mifl_atts/fas2_optic_acog_hsp.mdl",
	            HolosightBlackbox = true,			
	        },	
	        IgnoreExtra = true,		
	    },		
	}
	att.Holosight = true
	att.HolosightMagnification = 4
	att.HolosightMagnificationMin = 4
	att.HolosightMagnificationMax = 4
	att.HolosightReticle = Material("mifl_fas2_reticle/acog2.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 13
	att.HolosightBone = "holosight"
	att.Colorable = true
	att.HolosightBlackbox = true

	att.Mult_SightTime = 1.08
	att.Mult_SpeedMult = 0.94

	att.Mult_VisualRecoilMult = 0.125


	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_optic_elcan.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_optic_elcan")

	att.PrintName = "Elcan Hunter (3.5x)"
	att.Icon = Material("entities/arccw_mifl_fas2_optic_elcan.png", "smooth")
	att.Description = "Camouflage mid range optic. Specialised in jungles."

	att.SortOrder = 4

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw/mifl_atts/fas2_optic_elcan.mdl"
	att.HolosightPiece = "models/weapons/arccw/mifl_atts/fas2_optic_elcan_hsp.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 9, -1.5),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.2,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        IgnoreExtra = true,
	    },	
	}
	att.Holosight = true
	att.HolosightMagnification = 3.5
	att.HolosightMagnificationMin = 3.5
	att.HolosightMagnificationMax = 3.5
	att.HolosightReticle = Material("mifl_fas2_reticle/elcan.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 13
	att.HolosightBone = "holosight"
	att.Colorable = true
	att.HolosightBlackbox = true

	att.Mult_SightTime = 1.08
	att.Mult_SpeedMult = 0.94

	att.Mult_VisualRecoilMult = 0.15

	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_optic_felin.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_optic_felin")

	att.PrintName = "FRF2 (3-12x)"
	att.Icon = Material("entities/arccw_mifl_fas2_optic_felin.png", "mips smooth")
	att.Description = "Heavy advance optic system. Comes with a Thermal option with lower zoom, as well as a backup EO553."

	att.SortOrder = 12

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom"
	}
	att.Desc_Cons = {
	}

	att.AutoStats = true
	att.Slot = {"optic"}

	att.Model = "models/weapons/arccw/mifl_atts/fas2/felin_scope.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 17, -1.25),
	        Ang = Angle(0, 0, 0),
	        Magnification = 2,
	        ScopeMagnification = 2,
	        HolosightBone = "scope",
	        HolosightData = {
	            Holosight = true,
	            HolosightMagnification = 3,
	            HolosightMagnificationMin = 3,
	            HolosightMagnificationMax = 12,
	            HolosightReticle = Material("mifl_fas2_reticle/frf3.png", "mips smooth"),
	            HolosightNoFlare = true,
	            HolosightSize = 12,
	            HolosightBlackbox = true,
	            Colorable = true,
	            HolosightPiece = "weapons/arccw/mifl_atts/fas2/felin_scope_hsp.mdl"
	        },
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 8,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
	        IgnoreExtra = true,
	    },
	    {
	        Pos = Vector(0, 17, -1.25),
	        Ang = Angle(0, 0, 0),
	        Magnification = 2,
	        ScopeMagnification = 2,
	        HolosightBone = "scope",
	        Thermal = true,
	        ThermalScopeColor = Color(0, 255, 0),
	        ThermalHighlightColor = Color(255, 255, 0),
	        HolosightData = {
	            Holosight = true,
	            HolosightMagnification = 3,
	            HolosightMagnificationMin = 1.5,
	            HolosightMagnificationMax = 6,
	            HolosightReticle = Material("mifl_fas2_reticle/frf2.png", "mips smooth"),
	            HolosightNoFlare = true,
	            HolosightSize = 12,
	            HolosightBlackbox = true,
	            Colorable = true,
	            HolosightPiece = "weapons/arccw/mifl_atts/fas2/felin_scope_hsp.mdl"
	        },
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 8,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
	        IgnoreExtra = true,
	    },
	    {
	        Pos = Vector(0, 10, -5.7),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.5,
	        HolosightBone = "holosight",
	        HolosightData = {
	            Holosight = true,
	            HolosightReticle = Material("mifl_fas2_reticle/frf4.png", "mips smooth"),
	            HolosightNoFlare = true,
	            HolosightSize = 2,
	            Colorable = true,
	            HolosightNoHSP = true
	        },
	        IgnoreExtra = true,
	    },
	}

	att.Holosight = true
	att.HolosightPiece = "models/weapons/arccw/mifl_atts/fas2/felin_scope_hsp.mdl"

	att.ScopeGlint = true

	att.Mult_SightTime = 1.3
	att.Mult_SightedSpeedMult = 0.78
	att.Mult_SpeedMult = 0.925

	att.ColorOptionsTable = {
	    Color(255, 50, 50),
	    Color(50, 255, 50)
	}

	att.Mult_VisualRecoilMult = 0.2
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_optic_g36.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_optic_g36")

	att.PrintName = "N43 High (RDS)"
	att.Icon = Material("entities/arccw_mifl_fas2_optic_g36.png", "mips smooth")
	att.Description = "Gigantic percision sight designed as a backup for another gigangitc percision scope."

	att.SortOrder = 1

	att.Desc_Pros = {
	    "autostat.holosight",
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"optic"}

	att.Model = "models/weapons/arccw/mifl_atts/fas2_optic_g36.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 7, -1.9),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.25,
	        ScrollFunc = ArcCW.SCROLL_NONE
	    }
	}
	att.Holosight = true
	att.HolosightReticle = Material("mifl_fas2_reticle/dot.png" , "mips smooth")
	att.HolosightFlare = Material("mifl_fas2_reticle/dot_flare.png" , "mips smooth")
	att.HolosightSize = 1.5
	att.HolosightBone = "holosight"

	att.Colorable = true

	att.Mult_SightTime = 1.075

	att.ModelScale = Vector(2.2, 2.2, 2.2)
	att.ModelOffset = Vector(0, 0, -0.1)
	ArcCW.LoadAttachmentType(att)
end

------
-- mifl_fas2_optic_lmk4.lua
------

do
	local att = {}
	ArcCW.SetShortName("mifl_fas2_optic_lmk4")

	att.PrintName = "Leupold Mk. 4 (3.5-8x)"
	att.Icon = Material("entities/arccw_mifl_fas2_optic_lmk4.png", "smooth")
	att.Description = "Adjustable medium to long range optic, used on a variety of US military marksman and sniper rifles."

	att.SortOrder = 8

	att.Desc_Pros = {
	    "autostat.holosight",
	    "autostat.zoom"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "optic"

	att.Model = "models/weapons/arccw/mifl_atts/fas2_optic_lmk4.mdl"
	att.HolosightPiece = "models/weapons/arccw/mifl_atts/fas2_optic_lmk4_hsp.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 12, -1.6),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.5,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 3,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
	        IgnoreExtra = true,
	    },
	}
	att.Holosight = true
	att.HolosightMagnification = 3.5
	att.HolosightMagnificationMin = 3.5
	att.HolosightMagnificationMax = 8
	att.HolosightReticle = Material("mifl_fas2_reticle/mildot.png", "mips smooth")
	att.HolosightNoFlare = true
	att.HolosightSize = 11
	att.HolosightBone = "holosight"
	att.Colorable = false
	att.HolosightBlackbox = true

	att.Mult_SightTime = 1.25
	att.Mult_SpeedMult = 0.9

	att.Mult_VisualRecoilMult = 0.2


	ArcCW.LoadAttachmentType(att)
end

