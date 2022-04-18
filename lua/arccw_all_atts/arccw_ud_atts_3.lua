local Material = ArcCW.AttachmentMat

------
-- ud_uzi_mag_40.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_uzi_mag_40")

	att.PrintName = "Uzi 40-Round Extended Mag"
	att.AbbrevName = "40-Round Extended Mag"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "STAP 40-Round Extended Mag"
	end
	att.SortOrder = 40
	att.Icon = Material("entities/att/acwatt_ud_uzi_mag_40.png", "smooth mips")
	att.Description = "Extended magazine for the Uzi. It is only somewhat longer than the standard magazine, making it not that difficult to handle."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_uzi_mag"
	att.AutoStats = true
	att.Mult_SightTime = 1.08
	--att.Mult_Recoil = 0.9
	att.Mult_ReloadTime = 1.12
	--att.Mult_SpeedMult = 0.9
	att.Override_ClipSize = 40
	att.Mult_Sway = 1.15
	att.ActivateElements = {"ud_uzi_41_mag"}
	att.Hook_SelectReloadAnimation = function(wep, anim)
	    return anim .. "_41"
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_uzi_stock_folded.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_uzi_stock_folded")

	att.PrintName = "Folded Stock"
	att.Icon = Material("entities/att/acwatt_ud_uzi_stock_folded.png", "smooth mips")
	att.Description = "Tuck in the folding stock, making the weapon easier to manuver but less controllable."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_uzi_stock"
	att.AutoStats = true
	att.Free = true
	att.SortOrder = 2
	att.Mult_Recoil = 1.15
	att.Mult_RecoilSide = 1.25
	att.Mult_VisualRecoilMult = 2
	att.Mult_Sway = 1.5
	att.Mult_SightTime = 0.85
	att.Mult_SightedSpeedMult = 1.05
	att.Mult_ShootSpeedMult = 1.05
	att.Mult_DrawTime = 0.75
	att.Mult_HolsterTime = 0.75
	att.Add_BarrelLength = -2
	att.ActivateElements = {"ud_uzi_folded_stock"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_uzi_stock_polymer.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_uzi_stock_polymer")

	att.PrintName = "Uzi Polymer Stock"
	att.AbbrevName = "Polymer Stock"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "STAP Polymer Stock"
	end
	att.Icon = Material("entities/att/acwatt_ud_uzi_stock_solid.png", "smooth mips")
	att.Description = "A solid, non-foldable stock made of polymer. Provides decent recoil reduction and doesn't weigh as much as a full wooden stock."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {}
	att.Slot = "ud_uzi_stock"
	att.AutoStats = true
	att.SortOrder = 3
	att.Mult_Recoil = 0.85
	att.Mult_RecoilSide = 0.75
	att.Mult_VisualRecoilMult = 0.75
	att.Mult_Sway = 0.75
	att.Mult_SightTime = 1.15
	att.Mult_SightedSpeedMult = 0.95
	att.Mult_ShootSpeedMult = 0.95
	att.Mult_DrawTime = 1.25
	att.Mult_HolsterTime = 1.25
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_uzi_stock_remove.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_uzi_stock_remove")

	att.PrintName = "No Stock"
	att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
	att.Description = "Remove your stock. Who needs it, anyway? Not you, that's for sure."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "ud_uzi_stock"
	att.AutoStats = true
	att.Free = true
	att.SortOrder = 1
	att.Mult_Recoil = 1.25
	att.Mult_RecoilSide = 1.5
	att.Mult_VisualRecoilMult = 2
	att.Mult_Sway = 2
	att.Mult_SightTime = 0.75
	att.Mult_SightedSpeedMult = 1.1
	att.Mult_ShootSpeedMult = 1.1
	att.Mult_DrawTime = 0.75
	att.Mult_HolsterTime = 0.75
	att.Add_BarrelLength = -2
	ArcCW.LoadAttachmentType(att)
end

------
-- ud_uzi_stock_wood.lua
------

do
	local att = {}
	ArcCW.SetShortName("ud_uzi_stock_wood")

	att.PrintName = "Uzi Wooden Stock"
	att.AbbrevName = "Wooden Stock"
	if !GetConVar("arccw_truenames"):GetBool() then
	    att.PrintName = "STAP Wooden Stock"
	end
	att.Icon = Material("entities/att/acwatt_ud_uzi_stock_solid.png", "smooth mips")
	att.Description = "A solid, non-foldable stock made of wood. Old-fashioned and very sturdy, though less compact."
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Desc_Neutrals = {}
	att.Slot = "ud_uzi_stock"
	att.AutoStats = true
	att.SortOrder = 4
	att.Mult_Recoil = 0.75
	att.Mult_RecoilSide = 0.5
	att.Mult_VisualRecoilMult = 0.5
	att.Mult_Sway = 0.5
	att.Mult_SightTime = 1.25
	att.Mult_SightedSpeedMult = 0.9
	att.Mult_ShootSpeedMult = 0.9
	att.Mult_DrawTime = 1.25
	att.Mult_HolsterTime = 1.25
	ArcCW.LoadAttachmentType(att)
end

