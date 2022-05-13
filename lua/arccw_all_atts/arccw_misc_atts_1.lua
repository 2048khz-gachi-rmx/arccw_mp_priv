local Material = ArcCW.AttachmentMat

------
-- fas2_ammo_12gaugeincendiary.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_ammo_12gaugeincendiary")

	att.PrintName = "12 Gauge Dragon's Breath Ammo"
	att.Icon = Material("vgui/fas2atts/incendiary")
	att.Description = "Dragon's breath is a special type of incendiary-effect rounds for 12 gauge shotguns."
	att.Desc_Pros = {
		"A 100% chance to set the enemy on fire"
	}
	att.Free = true
	att.AutoStats = true
	att.Slot = "fas2_ammo_shotgun"
	att.Mult_Damage = 0.6
	att.Mult_DamageMin = 0.4
	att.Mult_Penetration = 0.05
	att.Mult_AccuracyMOA = 1.5
	att.Mult_HipDispersion = 1
	att.Override_DamageType = DMG_BURN
	att.ActivateElements = {"incendiary"}
	att.Override_Ammo = "12gaugeincendiary"
	att.Override_ShellModel = "models/shells/12g_bucknball.mdl"
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_ammo_12gaugeslug.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_ammo_12gaugeslug")

	att.PrintName = "12 Gauge Slug Ammo"
	att.Icon = Material("vgui/fas2atts/slug")
	att.Description = "A modern shotgun slug is a heavy projectile made of lead, copper, or other material and fired from a shotgun. Slugs are designed for hunting, self-defense, and other uses."
	att.AutoStats = true
	att.Slot = "fas2_ammo_shotgun"
	att.Free = true
	att.Override_Num = 1
	att.Mult_Damage = 1.4
	att.Mult_DamageMin = 1.1
	att.Mult_Penetration = 1.2
	att.Mult_AccuracyMOA = 0
	att.Mult_HipDispersion = 0.8
	att.Mult_Recoil = 1.1
	att.Mult_RecoilSide = 1.1
	att.Mult_RecoilPunch = 1.1
	att.ActivateElements = {"slug"}
	att.Override_Ammo = "12gaugeslug"
	att.Override_ShellModel = "models/shells/12g_slug.mdl"
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_ammo_45acphs.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_ammo_45acphs")

	att.PrintName = ".45ACP HydroShock Rounds"
	att.Icon = Material("vgui/fas2atts/762ap")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_ammo_45acphs"
	att.Free = true
	att.Mult_Damage = 1.2
	att.Mult_DamageMin = 1.2
	att.Mult_Penetration = 1.2
	att.Mult_HipDispersion = 1.15
	att.Mult_Recoil = 1.25
	att.Mult_RecoilSide = 1.1
	att.Override_Ammo = ".45acphs"
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_ammo_545x39ap.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_ammo_545x39ap")

	att.PrintName = "5.45x39MM AP Rounds"
	att.Icon = Material("vgui/fas2atts/762ap")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_ammo_545x39mmap"
	att.Free = true
	att.Mult_Damage = 1.2
	att.Mult_DamageMin = 1.2
	att.Mult_Penetration = 1.3
	att.Mult_HipDispersion = 1.1
	att.Mult_Recoil = 1.2
	att.Mult_RecoilSide = 1.05
	att.Override_Ammo = "5.45x39mmap"
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_ammo_556x45ap.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_ammo_556x45ap")

	att.PrintName = "5.56x45MM AP Rounds"
	att.Icon = Material("vgui/fas2atts/762ap")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_ammo_556x45mmap"
	att.Free = true
	att.Mult_Damage = 1.2
	att.Mult_DamageMin = 1.2
	att.Mult_Penetration = 1.3
	att.Mult_HipDispersion = 1.1
	att.Mult_Recoil = 1.2
	att.Mult_RecoilSide = 1.05
	att.Override_Ammo = "5.56x45mmap"
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_ammo_57x28ap.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_ammo_57x28ap")

	att.PrintName = "5.7x28MM AP Rounds"
	att.Icon = Material("vgui/fas2atts/762ap")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_ammo_57x28mmap"
	att.Free = true
	att.Mult_Damage = 1.3
	att.Mult_DamageMin = 1.3
	att.Mult_Penetration = 1.2
	att.Mult_HipDispersion = 1.05
	att.Mult_Recoil = 1.35
	att.Mult_RecoilSide = 1.1
	att.Override_Ammo = "5.7x28mmap"
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_ammo_762x39ap.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_ammo_762x39ap")

	att.PrintName = "7.62x39MM AP Rounds"
	att.Icon = Material("vgui/fas2atts/762ap")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_ammo_762x39mmap"
	att.Free = true
	att.Mult_Damage = 1.2
	att.Mult_DamageMin = 1.2
	att.Mult_Penetration = 2
	att.Mult_HipDispersion = 1.15
	att.Mult_Recoil = 1.5
	att.Mult_RecoilSide = 1.3
	att.Override_Ammo = "7.62x39mmap"
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_ammo_762x51ap.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_ammo_762x51ap")

	att.PrintName = "7.62x51MM AP Rounds"
	att.Icon = Material("vgui/fas2atts/762ap")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_ammo_762x51mmap"
	att.Free = true
	att.Mult_Damage = 1.35
	att.Mult_DamageMin = 1.35
	att.Mult_Penetration = 1.5
	att.Mult_HipDispersion = 1.1
	att.Mult_Recoil = 1.35
	att.Mult_RecoilSide = 1.15
	-- att.ActivateElements = {"762ap"}
	att.Override_Ammo = "7.62x51mmap"
	-- att.Override_ShellModel = "models/shells/300win.mdl"
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_ammo_762x54ap.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_ammo_762x54ap")

	att.PrintName = "7.62x54MM AP Rounds"
	att.Icon = Material("vgui/fas2atts/762ap")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_ammo_762x54mmap"
	att.Free = true
	att.Mult_Damage = 1.4
	att.Mult_DamageMin = 1.4
	att.Mult_Penetration = 2
	att.Mult_HipDispersion = 1.1
	att.Mult_Recoil = 1.8
	att.Mult_RecoilSide = 1.8
	att.Override_Ammo = "7.62x54mmap"
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_ammo_762x54sp.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_ammo_762x54sp")

	att.PrintName = "7.62x54MM Sniper Rounds"
	att.Icon = Material("vgui/fas2atts/762ap")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_ammo_762x54mmsp"
	att.Free = true
	att.Mult_Damage = 0.95
	att.Mult_DamageMin = 0.95
	att.Mult_Penetration = 0.8
	att.Mult_HipDispersion = 0.85
	att.Mult_Recoil = 0.75
	att.Mult_RecoilSide = 0.75
	att.Override_Ammo = "7.62x54mmsp"
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_ammo_9x18ap.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_ammo_9x18ap")

	att.PrintName = "9x18MM AP Rounds"
	att.Icon = Material("vgui/fas2atts/762ap")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_ammo_9x18mmap"
	att.Free = true
	att.Mult_Damage = 1.2
	att.Mult_DamageMin = 1.2
	att.Mult_Penetration = 1.5
	att.Mult_HipDispersion = 1.1
	att.Mult_Recoil = 1.1
	att.Mult_RecoilSide = 1.05
	att.Override_Ammo = "9x18mmap"
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_ammo_9x19ap.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_ammo_9x19ap")

	att.PrintName = "9x19MM AP Rounds"
	att.Icon = Material("vgui/fas2atts/762ap")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_ammo_9x19mmap"
	att.Free = true
	att.Mult_Damage = 1.2
	att.Mult_DamageMin = 1.2
	att.Mult_Penetration = 1.5
	att.Mult_HipDispersion = 1.1
	att.Mult_Recoil = 1.1
	att.Mult_RecoilSide = 1.05
	att.Override_Ammo = "9x19mmap"
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_ammo_9x39ap.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_ammo_9x39ap")

	att.PrintName = "9x39MM AP Rounds"
	att.Icon = Material("vgui/fas2atts/762ap")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_ammo_9x39mmap"
	att.Free = true
	att.Mult_Damage = 1.25
	att.Mult_DamageMin = 1.25
	att.Mult_Penetration = 1.5
	att.Mult_HipDispersion = 1.1
	att.Mult_Recoil = 1.3
	att.Mult_RecoilSide = 1.15
	att.Override_Ammo = "9x39mmap"
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_ammo_9x39sp.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_ammo_9x39sp")

	att.PrintName = "9x39MM Sniper Rounds"
	att.Icon = Material("vgui/fas2atts/762ap")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_ammo_9x39mmsp"
	att.Free = true
	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 0.9
	att.Mult_Penetration = 0.84
	att.Mult_HipDispersion = 0.85
	att.Mult_Recoil = 0.85
	att.Mult_RecoilSide = 0.95
	att.Override_Ammo = "9x39mmsp"
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_canted_ironsight.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_canted_ironsight")

	att.PrintName = "Canted Ironsights"
	att.Icon = Material("vgui/fas2atts/cantedironsight")
	att.Description = "Canted Ironsights are available for weapons with attachment rails that allow a close-range option when a long-range optic is already mounted. The user simply rotates the weapon 45° to make use of the accessory, with minimal change in handling and performance."
	att.Desc_Pros = {
	    "The ability to switch from the telescopic sight to the side (Double E)"
	}
	att.ItemData = {
	    width = 1,
	    height = 1,
	    price = 8000,
	    rarity = { weight = 35 },
	}
	att.Slot = "fas2_cantedsight"
	att.Model = "models/weapons/fas2/attachments/canted_ironsight.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(-0.47, 9, -1.07),
	        Ang = Angle(0, 0, -45),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        IgnoreExtra = true
	    }
	}
	att.KeepBaseIrons = true
	att.Holosight = false
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_canted_tiss.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_canted_tiss")

	att.PrintName = "Canted Ironsights ''Tiss''"
	att.Icon = Material("vgui/fas2atts/cantedironsight")
	att.Description = "Canted Ironsights are available for weapons with attachment rails that allow a close-range option when a long-range optic is already mounted. The user simply rotates the weapon 45° to make use of the accessory, with minimal change in handling and performance."
	att.Desc_Pros = {
	    "Tririum ironsight",
	    "The ability to switch from the telescopic sight to the side (Double E)"
	}
	att.ItemData = {
	    width = 1,
	    height = 1,
	    price = 8000,
	    rarity = { weight = 35 },
	}
	att.Slot = "fas2_cantedsight"
	att.Model = "models/weapons/fas2/attachments/tiss.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(-0.455, 9, -1.05),
	        Ang = Angle(0, 0, -45),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        IgnoreExtra = true
	    }
	}
	att.KeepBaseIrons = true
	att.Holosight = false
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_extra_anpeq15.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_extra_anpeq15")

	att.PrintName = "AN/PEQ-15"
	att.Icon = Material("vgui/fas2atts/anpeq15")
	att.Description = "The AN/PEQ-15 Infrared Target Pointer/Illuminator/Aiming Light (ITPIAL) is a laser sight for use on rifles fitted with a Picatinny rail. It was manufactured by Insight Technology."
	att.Desc_Pros = {
	    "Accuracy of shooting from the hip"
	}
	att.Desc_Cons = {
	    "Gives out your location"
	}
	att.ItemData = {
	    width = 1,
	    height = 1,
	    price = 3000,
	    rarity = { weight = 35 },
	}
	att.Slot = "fas2_tactical"
	att.Model = "models/weapons/fas2/attachments/anpeq15.mdl"
	att.Laser = false
	att.LaserStrength = 1
	att.LaserBone = "laser"
	att.LaserColor = Color(0, 255, 0)
	att.Mult_HipDispersion = 0.95
	att.ToggleStats = {
	    {
	        PrintName = "On",
	        Laser = true
	    },
	    {
	        PrintName = "Off",
	        Laser = false,
	    }
	}
	att.ActivateElements = {"handguard"}
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_extra_anpeq2.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_extra_anpeq2")

	att.PrintName = "AN/PEQ-2"
	att.Icon = Material("vgui/fas2atts/anpeq2")
	att.Description = "The AN/PEQ-2 Infrared Target Pointer/Illuminator/Aiming Light (ITPIAL) is a laser sight for use on rifles fitted with a Picatinny rail. It was manufactured by Insight Technology."
	att.Desc_Pros = {
	    "Accuracy of shooting from the hip"
	}
	att.Desc_Cons = {
	    "Gives out your location"
	}
	att.Slot = "fas2_tactical"
	att.ItemData = {
	    width = 1,
	    height = 1,
	    price = 3000,
	    rarity = { weight = 35 },
	}
	att.Model = "models/weapons/fas2/attachments/anpeq2.mdl"
	att.Laser = false
	att.LaserStrength = 1
	att.LaserBone = "laser"
	att.LaserColor = Color(255, 0, 0)
	att.ToggleStats = {
	    {
	        PrintName = "On",
	        Laser = true
	    },
	    {
	        PrintName = "Off",
	        Laser = false,
	    }
	}
	att.Mult_HipDispersion = 0.95
	att.ActivateElements = {"handguard"}
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_extra_cheekpad.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_extra_cheekpad")

	att.PrintName = "Cheek Pad"
	att.Icon = Material("vgui/fas2atts/cheekpad")
	att.Description = "The Cheek Pad decreases vertical recoil."
	att.AutoStats = true
	att.Slot = "fas2_kar98kcheekpad"
	att.ItemData = {
	    width = 1,
	    height = 1,
	    price = 3000,
	    rarity = { weight = 35 },
	}
	att.Mult_Recoil = 0.8
	att.Mult_RecoilSide = 0.95
	att.ActivateElements = {"cheekpad"}
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_extra_foregrip.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_extra_foregrip")

	att.PrintName = "Foregrip"
	att.Icon = Material("vgui/fas2atts/foregrip")
	att.Description = "A vertical forward grip or foregrip is a vertical pistol grip mounted on the fore-end of a long-barrel firearm, designed for grasping by the frontal support hand."
	att.AutoStats = true
	att.Slot = "fas2_grip"
	att.SortOrder = 10
	att.Model = false
	att.Mult_Recoil = 0.75
	att.Mult_RecoilSide = 0.8
	att.Mult_RecoilPunch = 0.85
	att.Override_HoldtypeActive = "smg"
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	att.ActivateElements = {"grip", "handguard"}
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_extra_inforcelight.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_extra_inforcelight")

	att.PrintName = "INFORCE FLASHLIGHT"
	att.Icon = Material("vgui/fas2atts/inforce_light")
	att.Description = "The Inforce Flashlight is a portable electric light designed for picatinny rails."
	att.Desc_Pros = {
	    "Provides artificial lighting in dark places"
	}
	att.Desc_Cons = {
	    "Gives out your location"
	}
	att.Slot = "fas2_tactical"
	att.Model = "models/weapons/fas2/attachments/inforce_light.mdl"
	att.Flashlight = false
	att.FlashlightHFOV = 60
	att.FlashlightVFOV = 60
	att.FlashlightFarZ = 768
	att.FlashlightTexture = "effects/flashlight001"
	att.FlashlightBrightness = 1.5
	att.FlashlightBone = "light"
	att.ToggleStats = {
	    {
	        PrintName = "On",
	        Flashlight = true
	    },
	    {
	        PrintName = "Off",
	        Flashlight = false,
	    }
	}
	att.ActivateElements = {"handguard"}
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_extra_mp5pdwstock.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_extra_mp5pdwstock")

	att.PrintName = "PDW Stock"
	att.Icon = Material("vgui/fas2atts/pdwstock")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_pdw"
	att.Model = false
	att.Mult_Recoil = 0.85
	att.Mult_RecoilSide = 0.9
	att.Mult_RecoilPunch = 0.8
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	att.ActivateElements = {"pdwstock"}
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_extra_uziwoodenstock.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_extra_uziwoodenstock")

	att.PrintName = "UZI Wooden Stock"
	att.Icon = Material("vgui/fas2atts/uzi_woodenstock")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_woodenstock"
	att.Model = false
	att.Mult_Recoil = 0.9
	att.Mult_RecoilSide = 0.85
	att.Mult_RecoilPunch = 0.85
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	att.ActivateElements = {"uzistock"}
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_mag_545_45rnd.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_mag_545_45rnd")

	att.PrintName = "5.45 45rnd Mag"
	att.Icon = Material("vgui/fas2atts/545_45rnd")
	att.Description = "45-round bakelite Izhmash 6L26 magazine for 5.45x39 ammo, for AK-74 and compatible systems. Also a standard issue RPK-74 magazine."
	att.AutoStats = true
	att.Slot = "fas2_545_45rnd"
	att.MagExtender = true
	att.Override_ClipSize = 45
	att.ActivateElements = {"45rnd"}
	att.Hook_Compatible = function(wep)
	    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_mag_545_60rnd.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_mag_545_60rnd")

	att.PrintName = "5.45 60rnd Mag"
	att.Icon = Material("vgui/fas2atts/545_60rnd")
	att.Description = "60-round quad-stack polymer Izhmash 6L31 magazine for 5.45x39 ammo, for AK-74 and compatible systems. Produced as a small batch, never serialized."
	att.AutoStats = true
	att.Slot = "fas2_545_60rnd"
	att.MagExtender = true
	att.Override_ClipSize = 60
	att.ActivateElements = {"60rnd"}
	att.Hook_Compatible = function(wep)
	    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_mag_762_45rnd.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_mag_762_45rnd")

	att.PrintName = "7.62x39 45rnd Mag"
	att.Icon = Material("vgui/fas2atts/545_45rnd")
	att.Description = "45-round magazine for 7.62x39 ammo, for AK-47 and compatible systems. Also a standard issue RPK-47 magazine."
	att.AutoStats = true
	att.Slot = "fas2_762_45rnd"
	att.MagExtender = true
	att.Override_ClipSize = 45
	att.ActivateElements = {"45rnd"}
	att.Hook_Compatible = function(wep)
	    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_mag_fnfal_20rnd.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_mag_fnfal_20rnd")

	att.PrintName = "FN Fal 20RND Magazine"
	att.Icon = Material("vgui/fas2atts/fnfal20mag")
	att.Description = "Extended magazine for FN Fal."
	att.AutoStats = true
	att.Slot = "fas2_fnfalmag"
	att.MagExtender = true 
	att.Override_ClipSize = 20
	att.ActivateElements = {"mag"}
	att.Hook_Compatible = function(wep)
	    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_mag_m21_20rnd.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_mag_m21_20rnd")

	att.PrintName = "M21 20rnd Mag"
	att.Icon = Material("vgui/fas2atts/m2120rndmag")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_m21_20rnd"
	att.MagExtender = true
	att.Override_ClipSize = 20
	att.ActivateElements = {"20rnd"}
	att.Hook_Compatible = function(wep)
	    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_mag_m249_200rnd.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_mag_m249_200rnd")

	att.PrintName = "M249 200RND Box"
	att.Icon = Material("vgui/fas2atts/200rnd")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_m249_200rnd"
	att.MagExtender = true
	att.Override_ClipSize = 200
	att.ActivateElements = {"200mag"}
	att.Hook_Compatible = function(wep)
	    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_mag_mp5_30rnd.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_mag_mp5_30rnd")

	att.PrintName = "MP5 30rnd Mag"
	att.Icon = Material("vgui/fas2atts/mp5k30rnd")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_mp5_30rnd"
	att.MagExtender = true
	att.Override_ClipSize = 30
	att.ActivateElements = {"30rnd"}
	att.Hook_Compatible = function(wep)
	    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_mag_sg55x_30rnd.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_mag_sg55x_30rnd")

	att.PrintName = "SG550 30rnd Mag"
	att.Icon = Material("vgui/fas2atts/sg55xmag")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_sg55x_30rnd"
	att.MagExtender = true
	att.Override_ClipSize = 30
	att.ActivateElements = {"30rnd"}
	att.Hook_Compatible = function(wep)
	    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_mag_sks_20rnd.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_mag_sks_20rnd")

	att.PrintName = "SKS 20rnd mag"
	att.Icon = Material("vgui/fas2atts/sks20mag")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_sks_mags"
	att.MagExtender = true
	att.Override_ClipSize = 20
	att.ActivateElements = {"20rnd"}
	att.Hook_Compatible = function(wep)
	    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_mag_sks_30rnd.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_mag_sks_30rnd")

	att.PrintName = "SKS 30rnd mag"
	att.Icon = Material("vgui/fas2atts/sks30mag")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_sks_mags"
	att.MagExtender = true
	att.Override_ClipSize = 30
	att.ActivateElements = {"30rnd"}
	att.Hook_Compatible = function(wep)
	    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_mag_stanag.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_mag_stanag")

	att.PrintName = "Stanag Magazine"
	att.Icon = Material("vgui/fas2atts/stanag")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_stanag"
	att.MagReducer = true
	att.Override_ClipSize = 30
	att.ActivateElements = {"stanag"}
	att.Hook_Compatible = function(wep)
	    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_mag_vss_30rnd.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_mag_vss_30rnd")

	att.PrintName = "SKS 30rnd mag"
	att.Icon = Material("vgui/fas2atts/stanag")
	att.Description = ""
	att.AutoStats = true
	att.Slot = "fas2_vss_30rnd"
	att.MagExtender = true
	att.Override_ClipSize = 30
	att.ActivateElements = {"30rnd"}
	att.Hook_Compatible = function(wep)
	    if (wep.RegularClipSize or wep.Primary.ClipSize) == wep.ExtendedClipSize then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_muzzle_bayonet.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_muzzle_bayonet")

	att.PrintName = "M9 Bayonet"
	att.Icon = Material("vgui/fas2atts/bayonet")
	att.Description = "The M9 Bayonet, officially known as the M9 Phrobis III, is a multi-purpose knife and bayonet officially adopted in 1986 by the United States. It has a 7-inch blade and is issued with a sheath designed to double as a wire cutter."
	att.AutoStats = true
	att.Slot = "fas2_bayonet"
	att.Desc_Pros = {"Allows to bash your enemies. (E + LMB)"}
	att.ActivateElements = {"bayonet"}
	att.Override_CanBash = true
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_muzzle_flashhider.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_muzzle_flashhider")

	att.PrintName = "Flash Hider"
	att.Icon = Material("vgui/fas2atts/flashhider.png")
	att.Description = "A flash hider is a device attached to the muzzle of a rifle or other firearm that reduces the visible signature of the burning gases that exit the muzzle."
	att.AutoStats = true
	att.Slot = "fas2_muzzlebrake"
	att.SortOrder = 10
	att.Model = false
	att.Override_MuzzleEffect = "muzzleflash_pistol_red"
	att.FlashHider = true
	att.Add_BarrelLength = 2
	att.Mult_Recoil = 0.95
	att.Mult_RecoilSide = 0.98
	att.Mult_RecoilPunch = 0.95
	att.Mult_Range = 0.98
	att.ActivateElements = {"flashhider"}
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_muzzle_muzzlebrake.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_muzzle_muzzlebrake")

	att.PrintName = "Muzzlebrake"
	att.Icon = Material("vgui/fas2atts/muzzlebrake.png")
	att.Description = "A muzzle brake is a device connected to the muzzle or barrel of a firearm that is intended to redirect a portion of propellant gases to counter recoil and unwanted muzzle rise."
	att.AutoStats = true
	att.Slot = "fas2_muzzlebrake"
	att.SortOrder = 10
	att.Model = false
	att.Add_BarrelLength = 2
	att.Mult_Recoil = 0.85
	att.Mult_RecoilSide = 1.1
	att.Mult_RecoilPunch = 0.8
	att.Mult_Range = 0.92
	att.ActivateElements = {"muzzlebrake"}
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_muzzle_sr25suppressor.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_muzzle_sr25suppressor")

	att.PrintName = "SR25 Suppressor"
	att.Icon = Material("vgui/fas2atts/suppressor")
	att.Description = "A suppressor is a muzzle device that reduces the acoustic intensity of the muzzle report and the recoil when a gun is discharged."
	att.AutoStats = true
	att.Slot = "fas2_muzzle_sr25"
	att.SortOrder = 10
	att.Model = false
	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true
	att.Mult_Recoil = 0.9
	att.Mult_RecoilSide = 0.9
	att.Mult_RecoilPunch = 0.9
	att.Mult_HipDispersion = 0.8
	att.Mult_Range = 1.1
	att.Mult_Damage = 0.95
	att.Mult_DamageMin = 0.95
	att.Add_BarrelLength = 8
	att.ActivateElements = {"suppressorsr25"}
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_muzzle_suppressor.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_muzzle_suppressor")

	att.PrintName = "Suppressor"
	att.Icon = Material("vgui/fas2atts/suppressor")
	att.Description = "A suppressor is a muzzle device that reduces the acoustic intensity of the muzzle report and the recoil when a gun is discharged."
	att.AutoStats = true
	att.Slot = "fas2_muzzle"
	att.SortOrder = 10
	att.Model = false
	att.Silencer = true
	att.Override_MuzzleEffect = "muzzleflash_suppressed"
	att.IsMuzzleDevice = true
	att.Mult_Recoil = 0.95
	att.Mult_RecoilSide = 0.95
	att.Mult_RecoilPunch = 0.95
	att.Mult_HipDispersion = 0.9
	att.Mult_Range = 0.95
	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 0.9
	att.Add_BarrelLength = 8
	att.ActivateElements = {"suppressor"}
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_scope_acog.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_scope_acog")

	att.PrintName = "Acog"
	att.Icon = Material("vgui/fas2atts/acog")
	att.Description = "The ACOG is a series of prismatic telescopic sights manufactured by Trijicon. The ACOG was originally designed to be used on the M16 rifle and M4 carbine, but Trijicon has also developed ACOG accessories for other firearms. Models provide fixed-power magnification levels from 1.25× to 6×."
	att.Desc_Pros = {
	    "Precision sight picture",
	    "4x magnification",
	}
	att.Desc_Cons = {
	    "Narrow sighting area",
	    "Visible scope glint"
	}
	att.Slot = "fas2_scope"
	att.Model = "models/weapons/fas2/attachments/acog.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(-0.009, 6.1, -1.064),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	    }
	}
	att.ScopeGlint = true
	att.Mult_GlintMagnitude = 0.5
	att.Holosight = true
	att.HolosightReticle = Material("sprites/fas2/scopes/acog")
	att.HolosightNoFlare = true
	att.HolosightSize = 6.8
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/fas2/attachments/acog_hsp.mdl"
	att.HolosightMagnification = 4
	att.HolosightBlackbox = true
	att.ActivateElements = {"mount"}
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_scope_atnthor.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_scope_atnthor")

	 att.PrintName = "ATNTHOR"
	att.Icon = Material("vgui/fas2atts/atnthor")
	att.Description = "The ATNTHOR is a thermal scope designed for picatinny accessory rails."
	att.Desc_Pros = {
	    "Precision sight picture",
	    "Provides thermal visions"
	}
	att.Desc_Cons = {
	    "Doesn't provide magnification",
	    "Not comfortable to use",
	    "Narrow sighting area",
	    "Visible scope glint"
	}
	att.Slot = "fas2_scope"
	att.Model = "models/weapons/fas2/attachments/atnthor.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 6.6, -1.227),
	        Ang = Angle(0, 0, 0),
	        Magnification = 0,
	        -- ScrollFunc = ArcCW.SCROLL_ZOOM,
	        -- ZoomLevels = 6,
	        -- ZoomSound = "fas2/sks/sks_insertlast.wav",
	        Thermal = true,
	        ThermalScopeColor = Color(255, 255, 255),
	        ThermalHighlightColor = Color(255, 255, 255),
	    }
	}
	att.ScopeGlint = true
	att.Mult_GlintMagnitude = 0.5
	att.Holosight = true
	att.HolosightReticle = Material("sprites/fas2/scopes/m110")
	att.HolosightNoFlare = true
	att.HolosightSize = 5
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/fas2/attachments/atnthor_hsp.mdl"
	att.HolosightMagnification = 0
	att.HolosightBlackbox = true
	att.HolosightConstDist = 64
	att.HolosightMagnificationMin = 1
	att.HolosightMagnificationMax = 2
	att.ActivateElements = {"mount"}
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_scope_elcan.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_scope_elcan")

	att.PrintName = "ELCAN C79"
	att.Icon = Material("vgui/fas2atts/c79")
	att.Description = "The C79 Optical sight is a small arms telescopic sight. It is 3.4×28, meaning 3.4x magnification, and a 28mm diameter objective lens. A tritium illuminated reticle provides for normal and low-light conditions sighting."
	att.Desc_Pros = {
	    "Precision sight picture",
	    "3.4x magnification",
	    "Designed for close combat (Double E)"
	}
	att.Desc_Cons = {
	    "Large size",
	    "Visible scope glint"
	}
	att.Slot = "fas2_scope"
	att.Model = "models/weapons/fas2/attachments/elcan.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(-0.01, 7, -1.21),
	        Ang = Angle(0, 0, 0),
	        Magnification = 2,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 2,
	        ZoomSound = "fas2/sks/sks_insertlast.wav"
	    },
	    {
	        Pos = Vector(-0.005, 5.8, -2.01),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.25,
	        HolosightBone = "holosight",
	        HolosightData = {
	        Holosight = false,
	        HolosightNoHSP = true,
	        },
	    },
	}
	att.ScopeGlint = true
	att.Mult_GlintMagnitude = 0.5
	att.Holosight = true
	att.HolosightReticle = Material("sprites/fas2/scopes/elcan")
	att.HolosightNoFlare = true
	att.HolosightSize = 11.5
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/fas2/attachments/elcan_hsp.mdl"
	att.HolosightMagnification = 3.4
	att.HolosightBlackbox = true
	att.HolosightMagnificationMin = 2
	att.HolosightMagnificationMax = 3.4
	att.ActivateElements = {"mount"}
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_scope_g36k.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_scope_g36k")

	att.PrintName = "G36K"
	att.Icon = Material("")
	att.Description = ""
	att.Slot = "firearms2_g36k"
	att.Model = "models/weapons/fas2/attachments/g36k_hsp.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 2.4, 0),
	        Ang = Angle(0, 0, 0),
	        Magnification = 2,
	        ScrollFunc = ArcCW.NONE,
	        ZoomSound = "fas2/sks/sks_insertlast.wav",
	    }
	}
	att.ScopeGlint = true
	att.Holosight = true
	att.HolosightReticle = Material("sprites/fas2/scopes/g36k")
	att.HolosightNoFlare = true
	att.HolosightSize = 13.6
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/fas2/attachments/g36k_hsp.mdl"
	att.HolosightMagnification = 4
	att.HolosightBlackbox = true
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_scope_irnv.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_scope_irnv")

	att.PrintName = "IRNV"
	att.Icon = Material("vgui/fas2atts/irnv")
	att.Description = "The IRNV is a scope with night vision, that highlights heat signatures as orange. This is useful for finding enemies at night, through foliage, in fog or rain, or when vision is otherwise hampered by inclement weather conditions."
	att.Desc_Pros = {
	    "Precision sight picture",
	    "Provides thermal & night visions"
	}
	att.Desc_Cons = {
	    "Doesn't provide magnification",
	    "Narrow sighting area"
	}
	att.Slot = "fas2_scope1"
	att.Model = "models/weapons/fas2/attachments/irnv.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(-0.02, 6.2, -1.105),
	        Ang = Angle(0, 0, 0),
	        Magnification = 0,
	        Thermal = true,
	        ThermalScopeColor = Color(0, 255, 0),
	        ThermalHighlightColor = Color(255, 255, 0),
	        ThermalFullColor = true,
	        ThermalScopeSimple = false,
	        ThermalNoCC = false,
	        ThermalBHOT = false,
	        Contrast = 2,
	    }
	}
	att.ScopeGlint = true
	att.Mult_GlintMagnitude = 0.5
	att.Holosight = true
	att.HolosightReticle = Material("sprites/fas2/scopes/irnv")
	att.HolosightNoFlare = true
	att.HolosightSize = 11
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/fas2/attachments/irnv_hsp.mdl"
	att.HolosightMagnification = 0
	att.HolosightBlackbox = true
	att.HolosightConstDist = 64
	att.HolosightMagnificationMin = 1
	att.HolosightMagnificationMax = 2
	att.ActivateElements = {"mount"}
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	--Временно не используется
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_scope_leupold.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_scope_leupold")

	att.PrintName = "Leupold"
	att.Icon = Material("vgui/fas2atts/mk4")
	att.Description = "Adjustable medium to long range optic, used on a variety of US military marksman and sniper rifles."
	att.Desc_Pros = {
	    "Precision sight picture",
	    "8x magnification",
	}
	att.Desc_Cons = {
	    "Large size",
	    "Visible scope glint"
	}
	att.Slot = "fas2_leupold_scope"
	att.Model = "models/weapons/fas2/attachments/leupold.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 7, -0.735),
	        Ang = Angle(0, 0, 0),
	        Magnification = 2,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 4,
	        ZoomSound = "fas2/sks/sks_insertlast.wav",
	    }
	}
	att.ScopeGlint = true
	att.Mult_GlintMagnitude = 1
	att.Holosight = true
	att.HolosightReticle = Material("sprites/fas2/scopes/leupold")
	att.HolosightNoFlare = true
	att.HolosightSize = 17
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/fas2/attachments/leupold_hsp.mdl"
	att.HolosightMagnification = 8
	att.HolosightBlackbox = true
	att.ActivateElements = {"mount"}
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_scope_leupold2.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_scope_leupold2")

	att.PrintName = "Leupold"
	att.Icon = Material("vgui/fas2atts/mk4")
	att.Description = "Adjustable medium to long range optic, used on a variety of US military marksman and sniper rifles."
	att.Desc_Pros = {
	    "Precision sight picture",
	    "8x magnification",
	}
	att.Desc_Cons = {
	    "Large size",
	    "Visible scope glint"
	}
	att.Slot = "fas2_leupold2_scope"
	att.Model = "models/weapons/fas2/attachments/leupold2.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(-0.047, 6, -1.095),
	        Ang = Angle(0, 0, 0),
	        Magnification = 2,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 4,
	        ZoomSound = "fas2/sks/sks_insertlast.wav",
	    }
	}
	att.ScopeGlint = true
	att.Mult_GlintMagnitude = 1
	att.Holosight = true
	att.HolosightReticle = Material("sprites/fas2/scopes/leupold")
	att.HolosightNoFlare = true
	att.HolosightSize = 16
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/fas2/attachments/leupold2_hsp.mdl"
	att.HolosightMagnification = 8
	att.HolosightBlackbox = true
	att.ActivateElements = {"mount"}
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_scope_pka.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_scope_pka")

	att.PrintName = "PK-A"
	att.Icon = Material("vgui/fas2atts/pka")
	att.Description = "Common Russian mid-range scope for AK and Saiga style receivers with a Chevron reticule and 3.4x zoom; faster aiming than the PSO-1 with less zoom."
	att.Desc_Pros = {
	    "Precision sight picture",
	    "3.4x magnification",
	}
	att.Desc_Cons = {
	    "Doesn't support reticles switching"
	}
	att.Slot = "fas2_sight"
	att.Model = "models/weapons/fas2/attachments/pka.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(-0.005, 7, -0.994),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1,
	        ZoomLevels = 1,
	    }
	}
	att.Holosight = true
	att.HolosightReticle = Material("sprites/fas2/scopes/pka")
	att.HolosightNoFlare = true
	att.HolosightSize = 8.5
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/fas2/attachments/pka_hsp.mdl"
	att.HolosightMagnification = 2
	att.HolosightBlackbox = true
	att.ActivateElements = {"mount"}
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_scope_ps320.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_scope_ps320")

	att.PrintName = "PS-320 ''VALDAY''"
	att.Icon = Material("vgui/fas2atts/c79")
	    att.Description = "PS-320 1x/6x scope designed by Valday."
	att.Desc_Pros = {
	    "Precision sight picture",
	    "6x magnification",
	}
	att.Desc_Cons = {
	    "Large size",
	    "Visible scope glint"
	}
	att.Slot = "fas2_scope"
	att.Model = "models/weapons/fas2/attachments/ps320.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(-0.009, 7.3, -1.062),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 1,
	        ZoomSound = "fas2/sks/sks_insertlast.wav"
	    }
	}
	att.ScopeGlint = true
	att.Mult_GlintMagnitude = 0.5
	att.Holosight = true
	att.HolosightReticle = Material("sprites/fas2/scopes/ps320")
	att.HolosightNoFlare = true
	att.HolosightSize = 9.5
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/fas2/attachments/ps320_hsp.mdl"
	att.HolosightMagnification = 8
	att.HolosightBlackbox = true
	att.HolosightMagnificationMin = 2
	att.HolosightMagnificationMax = 8
	att.ActivateElements = {"mount"}
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_scope_pso1.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_scope_pso1")

	att.PrintName = "PSO-1"
	att.Icon = Material("vgui/fas2atts/pso1")
	att.Description = "The PSO-1 is a 4×24 telescopic sight manufactured in Russia by the Novosibirsk instrument-making factory and issued with the Russian military Dragunov sniper rifle."
	att.Desc_Pros = {
	    "Precision sight picture",
	    "4x magnification",
	    "Can be switched ON or OFF (Double E)"
	}
	att.Desc_Cons = {
	    "Narrow sighting area",
	    "Visible scope glint"
	}
	att.Slot = "fas2_scope_pso1"
	att.Model = "models/weapons/fas2/attachments/pso1.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(0.06, 8.1, -0.56),
	        Ang = Angle(0, 0, 0),
	        Magnification = 2,
	        HolosightData = {
	            Holosight = true,
				HolosightMagnification = 12,
				HolosightReticle = Material("sprites/fas2/scopes/pso_off"),
	            HolosightSize = 10,
	            HolosightBlackbox = true,
	            HolosightMagnificationMin = 2,
	            HolosightMagnificationMax = 4,
	            Colorable = true,
	            HolosightPiece = "models/weapons/fas2/attachments/pso1_hsp.mdl"
	        },
	    },
	    {
	        Pos = Vector(0.06, 8.1, -0.56),
	        Ang = Angle(0, 0, 0),
	        Magnification = 2,	
	        HolosightData = {
	            Holosight = true,
				HolosightMagnification = 12,
				HolosightReticle = Material("sprites/fas2/scopes/pso_on"),
	            HolosightSize = 10,
	            HolosightBlackbox = true,
	            HolosightMagnificationMin = 2,
	            HolosightMagnificationMax = 4,
	            Colorable = true,
	            HolosightPiece = "models/weapons/fas2/attachments/pso1_hsp.mdl"
	        },
	    },	
	}
	att.ScopeGlint = true
	att.Mult_GlintMagnitude = 1
	att.Holosight = true
	att.HolosightReticle = Material("sprites/fas2/scopes/pso_on")
	att.HolosightNoFlare = true
	att.HolosightSize = 27
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/fas2/attachments/pso1_hsp.mdl"
	att.HolosightMagnification = 12
	att.HolosightBlackbox = true
	att.HolosightConstDist = 64
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_scope_sg551.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_scope_sg551")

	att.PrintName = "SG551"
	att.Icon = Material("")
	att.Description = ""
	att.Slot = "firearms2_sg551"
	att.Model = "models/weapons/fas2/attachments/sg551_hsp.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(0.003, 3, 0.003),
	        Ang = Angle(0, 0, 0),
	        Magnification = 2.25,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 4,
	        ZoomSound = "fas2/sr25/sr25_safety.wav",
	    }
	}
	att.ScopeGlint = true
	att.Holosight = true
	att.HolosightReticle = Material("sprites/fas2/scopes/leupold")
	att.HolosightNoFlare = true
	att.HolosightSize = 12.5
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/fas2/attachments/sg551_hsp.mdl"
	att.HolosightMagnification = 12
	att.HolosightBlackbox = true
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_sight__cmore.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_sight__cmore")

	att.PrintName = "C-More Railway"
	att.Icon = Material("vgui/fas2atts/cmore")
	att.Description = "The C-More Railway is a Red Dot Sight weapon sight developed by C-More for picatinny accessory rails."
	att.Desc_Pros = {
	    "Increasing aiming mobility",
	    "Provides comfortable aiming reticle"
	}
	att.Desc_Cons = {
	    "Doesn't provide magnification",
	    "Doesn't support reticles switching"
	}
	att.Slot = "fas2_sight"
	att.Model = "models/weapons/fas2/attachments/cmore.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(-0.006, 6.5, -0.95),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        IgnoreExtra = true
	    }
	}
	att.Holosight = true
	att.HolosightReticle = Material("sprites/fas2/sights/cmore")
	att.HolosightNoFlare = true
	att.HolosightSize = 1
	att.HolosightBone = "holosight"
	att.HolosightNoHSP = true
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	att.ActivateElements = {"mount"}
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_sight_compm4.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_sight_compm4")

	att.PrintName = "Aimpoint CompM4"
	att.Icon = Material("vgui/fas2atts/compm4")
	att.Description = "The Aimpoint CompM4 is a non-magnified red dot style gun sight adopted by the U.S. Armed Forces. It is produced by the Swedish company Aimpoint AB and is the successor to the earlier Aimpoint CompM2."
	att.Desc_Pros = {
	    "Slighty increasing aiming mobility",
	    "Provides comfortable Red Dot reticle"
	}
	att.Desc_Cons = {
	    "Doesn't provide magnification",
	    "Doesn't support reticles switching"
	}
	att.Slot = "fas2_sight"
	att.Model = "models/weapons/fas2/attachments/compm4.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(-0.013, 6.5, -0.8),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        IgnoreExtra = true
	    }
	}
	att.Holosight = true
	att.HolosightReticle = Material("sprites/fas2/sights/dot")
	att.HolosightNoFlare = true
	att.HolosightSize = 1
	att.HolosightBone = "holosight"
	att.HolosightNoHSP = true
	att.ActivateElements = {"mount"}
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_sight_eotech.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_sight_eotech")

	att.PrintName = "EoTech 553"
	att.Icon = Material("vgui/fas2atts/eotech553")
	att.Description = "The EoTech 553 is an American holographic sight specifically made for elite Army units, and the US Marine Corps. The soldiers chose EOTECH as the preffered close-quarter combat optic of choice."
	att.Desc_Pros = {
	    "Increasing aiming mobility",
	    "Provides comfortable aiming reticle"
	}
	att.Desc_Cons = {
	    "Doesn't provide magnification",
	    "Doesn't support reticles switching"
	}
	att.Slot = "fas2_sight"
	att.Model = "models/weapons/fas2/attachments/eotech.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(-0.014, 6.5, -1.11),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1.1,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        IgnoreExtra = true
	    }
	}
	att.Holosight = true
	att.HolosightReticle = Material("sprites/fas2/sights/eotech")
	att.HolosightNoFlare = true
	att.HolosightSize = 1
	att.HolosightBone = "holosight"
	att.HolosightNoHSP = true
	att.ActivateElements = {"mount"}
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_sight_sightmark.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_sight_sightmark")

	att.PrintName = "Sightmark SM13003B-DT"
	att.Icon = Material("vgui/fas2atts/sightmark")
	att.Description = "The Sightmark SM13003B-DT is a Red Dot Sight weapon sight developed by Sightmark for picatinny accessory rails."
	att.Desc_Pros = {
	    "Increasing aiming mobility",
	    "Provides comfortable aiming reticle"
	}
	att.Desc_Cons = {
	    "Doesn't provide magnification",
	    "Doesn't support reticles switching"
	}
	att.Slot = "fas2_sight"
	att.Model = "models/weapons/fas2/attachments/kobrards.mdl"
	att.AdditionalSights = {
	    {
	        Pos = Vector(-0.007, 6.5, -0.92),
	        Ang = Angle(0, 0, 0),
	        Magnification = 1,
	        ScrollFunc = ArcCW.SCROLL_NONE,
	        IgnoreExtra = true
	    }
	}
	att.Holosight = true
	att.HolosightReticle = Material("sprites/fas2/sights/cobrards")
	att.HolosightNoFlare = true
	att.HolosightSize = 1
	att.HolosightBone = "holosight"
	att.HolosightNoHSP = true
	att.ActivateElements = {"mount"}
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_sight_tritium.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_sight_tritium")

	att.PrintName = "Tritium Ironsights"
	att.Icon = Material("vgui/fas2atts/tritiumsights")
	att.Description = "Tritium sights give shooters the advantage of maintaining their sight picture in low light."
	att.Desc_Pros = {
	    "Tririum ironsight",
	}
	att.AutoStats = true
	att.Slot = "fas2_tritium"
	att.ActivateElements = {"tritium"}
	ArcCW.LoadAttachmentType(att)
end

------
-- fas2_skill_proficiency.lua
------

do
	local att = {}
	ArcCW.SetShortName("fas2_skill_proficiency")

	att.PrintName = "Proficiency"
	att.Icon = Material("vgui/fas2atts/proficiency")
	att.Description = "Improves reloading speed and weapon handling."
	att.Desc_Pros = {
		"Faster reloads"
	}
	att.Slot = "fas2_nomen"
	att.Hook_SelectReloadAnimation = function(wep, anim)
		local rel = wep.Animations["reload_nomen"] and "_nomen" or ""
		local empty = wep:Clip1() == 0 and "_empty" or ""
		if GetConVar("developer"):GetBool() and rel == "" then print(anim .. " Nomen Anim Not Found.") end
		return "reload" .. rel .. empty
	end
	att.AutoStats = true
	att.AttachSound = "fas2/cstm/attach.wav"
	att.DetachSound = "fas2/cstm/detach.wav"
	ArcCW.LoadAttachmentType(att)
end

