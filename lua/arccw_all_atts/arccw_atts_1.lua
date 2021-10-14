------
-- acoggers.lua
------

do
	local att = {}
	ArcCW.SetShortName("acoggers")

	att.PrintName = "ACOGGERS (2.5-3x)"
	att.Icon = Material("entities/acwatt_acoggers.png")
	att.Description = "Some sort of magnified optic with a person's face on it. He is making a peculiar gesture."
	att.Ignore = true

	att.SortOrder = 2.75

	att.Desc_Pros = {
	    "+ POGGERS",
	}
	att.Desc_Cons = {
	}
	att.Slot = "optic"

	att.Model = "models/weapons/arccw/atts/acog.mdl"

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 10, -1.469),
	        Ang = Angle(0, 0, 0),
	        Magnification = 2,
	        IgnoreExtra = true
	    }
	}

	att.Holosight = true
	att.HolosightReticle = Material("hud/scopes/poggers.png")
	att.HolosightNoFlare = true
	att.HolosightSize = 12
	att.HolosightBone = "holosight"
	att.HolosightPiece = "models/weapons/arccw/atts/acog_hsp.mdl"

	att.HolosightMagnification = 1.1
	att.HolosightBlackbox = true

	att.HolosightMagnificationMin = 1.1
	att.HolosightMagnificationMax = 1.5

	att.Mult_SightTime = 1.15
	att.Mult_SightedSpeedMult = 0.9
	ArcCW.LoadAttachmentType(att)
end

------
-- ammo_api.lua
------

do
	local att = {}
	ArcCW.SetShortName("ammo_api")

	att.PrintName = "Fire and Brimstone"
	att.Icon = Material("entities/acwatt_ammo_api.png")
	att.Description = "Load weapon with armor-piercing incendiary ammo, which deals extra damage, ignites targets within its effective range, and has superior penetration. However, due to reliability issues, reduced-capacity magazines are used."
	att.Desc_Pros = {
	    "pro.ignite"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "ammo_bullet"

	att.Mult_Damage = 1.1
	att.Mult_DamageMin = 1.2
	att.Mult_Penetration = 2
	att.Mult_Recoil = 1.15

	att.Override_DamageType = DMG_BURN

	att.MagReducer = true

	att.ActivateElements = {"reducedmag"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ammo_blank.lua
------

do
	local att = {}
	ArcCW.SetShortName("ammo_blank")

	att.PrintName = "Blanks"
	att.Icon = Material("entities/acwatt_ammo_blank.png")
	att.Description = "Cartridges which contain no bullet and only emit a loud bang and muzzle flash. Completely incapable of doing harm."
	att.Desc_Pros = {
	    "pro.ammo_blank",
	}
	att.Desc_Cons = {
	    "con.ammo_blank",
	}
	att.AutoStats = true
	att.Slot = {"ammo_bullet", "ammo_shotgun"}

	att.Override_Num = 0
	att.Mult_Num = 0

	att.Mult_Recoil = 0.25

	att.NotForNPCs = true
	ArcCW.LoadAttachmentType(att)
end

------
-- ammo_dragon.lua
------

do
	local att = {}
	ArcCW.SetShortName("ammo_dragon")

	att.PrintName = "Dragon's Breath"
	att.Icon = Material("entities/acwatt_ammo_dragon.png")
	att.Description = "Incendiary load shotgun shells deal extra damage at both close and long range, as well as igniting targets within its effective range. However, a reduced magazine is equipped."
	att.Desc_Pros = {
	    "pro.ignite"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "ammo_shotgun"

	att.Mult_PrecisionMOA = 2
	att.Mult_ShootPitch = 0.85
	att.Mult_Damage = 1.25
	att.Mult_DamageMin = 1.25

	att.Override_DamageType = DMG_BURN

	att.MagReducer = true

	att.ActivateElements = {"reducedmag"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ammo_frangible.lua
------

do
	local att = {}
	ArcCW.SetShortName("ammo_frangible")

	att.PrintName = "Hollow Point"
	att.Icon = Material("entities/acwatt_ammo_frangible.png")
	att.Description = "Bullets with a frangible hollow tip penetrating far less, but have better stopping power up-close."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "ammo_bullet"

	att.Mult_Damage = 1.1
	att.Mult_DamageMin = 0.6
	att.Mult_Penetration = 0.25
	ArcCW.LoadAttachmentType(att)
end

------
-- ammo_lowpower.lua
------

do
	local att = {}
	ArcCW.SetShortName("ammo_lowpower")

	att.PrintName = "Reduced Load"
	att.Icon = Material("entities/acwatt_ammo_lowpower.png")
	att.Description = "Rounds with a low-power charge. Reduces kick, but also reduces stopping power."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"ammo_bullet", "ammo_shotgun"}

	att.Mult_Damage = 0.85
	att.Mult_DamageMin = 0.85
	att.Mult_Penetration = 0.75
	att.Mult_Recoil = 0.75
	att.Mult_ShootVol = 0.8
	ArcCW.LoadAttachmentType(att)
end

------
-- ammo_magnum.lua
------

do
	local att = {}
	ArcCW.SetShortName("ammo_magnum")

	att.PrintName = "Magnum Buckshot"
	att.Icon = Material("entities/acwatt_ammo_magnum.png")
	att.Description = "Powerful overloaded rounds deal extra damage at close range, but at the cost of increased recoil, spread, and long-range damage."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "ammo_shotgun"

	att.Mult_ShootPitch = 0.9
	att.Mult_Damage = 1.25
	att.Mult_DamageMin = 1
	att.Mult_Penetration = 1.25
	att.Mult_Range = 0.8
	att.Mult_Recoil = 1.2
	att.Mult_AccuracyMOA = 1.5
	ArcCW.LoadAttachmentType(att)
end

------
-- ammo_match.lua
------

do
	local att = {}
	ArcCW.SetShortName("ammo_match")

	att.PrintName = "Match Ammo"
	att.Icon = Material("entities/acwatt_ammo_match.png")
	att.Description = "High-quality competition-grade ammunition. Consistent power loads allow for greater accuracy. Custom-tooled bullets cut rifling more smoothly and keep energy for longer. Such bullets cannot be used in bulk."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "ammo_bullet"

	att.Mult_DamageMin = 1.15
	att.Mult_SightTime = 0.9
	att.Mult_Precision = 0.25
	att.Mult_Recoil = 0.85

	att.MagReducer = true

	att.ActivateElements = {"reducedmag"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ammo_ricochet.lua
------

do
	local att = {}
	ArcCW.SetShortName("ammo_ricochet")

	att.PrintName = "Cornerfragger"
	att.Icon = Material("entities/acwatt_ammo_ricochet.png")
	att.Description = "Bullets ricochet off surfaces once, and gain increased damage when doing so. Specialized bullet head reduces damage and makes penetration impossible. More of a revolver technique."
	att.Desc_Pros = {
	    "pro.ammo_ricochet"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "ammo_bullet"

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
	ArcCW.LoadAttachmentType(att)
end

------
-- ammo_rpg7_he.lua
------

do
	local att = {}
	ArcCW.SetShortName("ammo_rpg7_he")

	att.PrintName = "RPG-7 High Explosive"
	att.Icon = Material("entities/acwatt_ammo_rpg7_he.png")
	att.Description = "Load high explosive rockets that have a greater splash radius but no HEAT jet, reducing impact damage."
	att.Desc_Pros = {
	    "pro.rpg.splash"
	}
	att.Desc_Cons = {
	    "con.rpg.damage",
	}
	att.AutoStats = true
	att.Slot = "ammo_rpg7_rocket"

	att.Mult_SightTime = 0.9
	att.Mult_MoveSpeed = 1.15

	att.Override_ShootEntity = "arccw_rpg7_he"
	ArcCW.LoadAttachmentType(att)
end

------
-- ammo_rpg7_shovel.lua
------

do
	local att = {}
	ArcCW.SetShortName("ammo_rpg7_shovel")

	att.PrintName = "RPG-7 Shovel Tip"
	att.Icon = Material("entities/acwatt_ammo_shovel.png")
	att.Description = "A far cry from those regular rockets"
	att.Ignore = true
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "- Direct Hit Only",
	}
	att.AutoStats = true
	att.Slot = "ammo_rpg7_rocket"

	att.Mult_SightTime = 0.9
	att.Mult_MoveSpeed = 1.15

	att.Override_ShootEntity = ""
	ArcCW.LoadAttachmentType(att)
end

------
-- ammo_rpg7_smoke.lua
------

do
	local att = {}
	ArcCW.SetShortName("ammo_rpg7_smoke")

	att.PrintName = "RPG-7 Smokescreen"
	att.Icon = Material("entities/acwatt_ammo_rpg7_smoke.png")
	att.Description = "Smoke rockets that produce a wide smokescreen on impact. Also does light damage."
	att.Desc_Pros = {
	    "pro.rpg.smoke"
	}
	att.Desc_Cons = {
	    "con.rpg.smoke",
	}
	att.AutoStats = true
	att.Slot = "ammo_rpg7_rocket"

	att.Mult_SightTime = 0.9
	att.Mult_MoveSpeed = 1.15

	att.Override_ShootEntity = "arccw_rpg7_smoke"
	ArcCW.LoadAttachmentType(att)
end

------
-- ammo_rpg7_tandem.lua
------

do
	local att = {}
	ArcCW.SetShortName("ammo_rpg7_tandem")

	att.PrintName = "RPG-7 Tandem Warhead"
	att.Icon = Material("entities/acwatt_ammo_rpg7_he.png")
	att.Description = "Load tandem shaped charge warheads that have excellent direct hit damage but very poor splash damage."
	att.Desc_Pros = {
	    "pro.rpg.damage"
	}
	att.Desc_Cons = {
	    "con.rpg.splash",
	}
	att.AutoStats = true
	att.Slot = "ammo_rpg7_rocket"

	att.Mult_SightTime = 1.25
	att.Mult_MoveSpeed = 0.8
	att.Mult_ReloadTime = 1.2

	att.Override_ShootEntity = "arccw_rpg7_tandem"
	ArcCW.LoadAttachmentType(att)
end

------
-- ammo_sabot.lua
------

do
	local att = {}
	ArcCW.SetShortName("ammo_sabot")

	att.PrintName = "Sabot Slug"
	att.Icon = Material("entities/acwatt_ammo_sabot.png")
	att.Description = "Shell containing a subcaliber projectile with discarding sabot. This enables superior muzzle velocity on the armor-piercing projectile, allowing it to deal more damage at range and penetrate a lot of armor. However, it is not as powerful as a full-caliber slug round."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "ammo_shotgun"

	att.Override_Num = 1

	att.Mult_ShootPitch = 1.2
	att.Mult_Damage = 0.7
	att.Mult_DamageMin = 1.8
	att.Mult_Penetration = 5
	att.Mult_AccuracyMOA = 0.15
	att.Mult_Range = 2

	att.MagReducer = true

	att.ActivateElements = {"reducedmag"}
	ArcCW.LoadAttachmentType(att)
end

------
-- ammo_slug.lua
------

do
	local att = {}
	ArcCW.SetShortName("ammo_slug")

	att.PrintName = "Deer Slug"
	att.Icon = Material("entities/acwatt_ammo_slug.png")
	att.Description = "Shell containing a single heavy lead slug. More accurate, and more effective at range, but at the cost of being only a single projectile."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	    "con.projectilecount"
	}
	att.AutoStats = true
	att.Slot = "ammo_shotgun"

	att.Override_Num = 1

	att.Mult_ShootPitch = 1.15
	att.Mult_Damage = 0.8
	att.Mult_DamageMin = 2
	att.Mult_Penetration = 1.5
	att.Mult_AccuracyMOA = 0.35
	ArcCW.LoadAttachmentType(att)
end

------
-- ammo_tmj.lua
------

do
	local att = {}
	ArcCW.SetShortName("ammo_tmj")

	att.PrintName = "Total Metal Jacket"
	att.Icon = Material("entities/acwatt_ammo_tmj.png")
	att.Description = "Bullets with a total copper coating which keep energy better at long range, improving damage at distance but overpenetrating targets which are too close."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "ammo_bullet"

	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 1.2
	att.Mult_Penetration = 2
	ArcCW.LoadAttachmentType(att)
end

------
-- bipod.lua
------

do
	local att = {}
	ArcCW.SetShortName("bipod")

	att.PrintName = "Bipod"
	att.Icon = Material("entities/acwatt_bipod.png")
	att.Description = "Bipod can be deployed by pressing +USE while in an eligible spot. While deployed, the user's aiming angle is limited and recoil is reduced to near-zero. Moving will release bipod. While not in use, the bipod negatively impacts weapon maneuverability."

	att.SortOrder = 10

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "bipod"

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
-- charm_baby.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_baby")

	att.PrintName = "Childhood Memories"
	att.Icon = Material("entities/acwatt_charm_baby.png")
	att.Description = "A children's doll ravaged by the horrors of war. A good reminder to take an occasional nap-nap. Supposedly a good pizza topping."

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"

	att.Free = true

	att.Model = "models/weapons/arccw/atts/charmbase.mdl"

	att.DroppedModel = "models/Items/BoxSRounds.mdl"

	att.Charm = true
	att.CharmModel = "models/props_c17/doll01.mdl"
	att.CharmAtt = "Charm"
	att.CharmScale = Vector(0.15, 0.15, 0.15)
	att.CharmOffset = Vector(0, -1, 0)
	att.CharmAngle = Angle(-90, 0, 90)
	ArcCW.LoadAttachmentType(att)
end

------
-- charm_barrel.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_barrel")

	att.PrintName = "Highly Volatile"
	att.Icon = Material("entities/acwatt_charm_barrel.png")
	att.Description = "A model of a barrel enemy soldiers are often seen crowding around. Careful a stray bullet doesn't hit this thing."

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"

	att.Free = true

	att.Model = "models/weapons/arccw/atts/charmbase.mdl"

	att.DroppedModel = "models/Items/BoxSRounds.mdl"

	att.Charm = true
	att.CharmModel = "models/props_c17/oildrum001_explosive.mdl"
	att.CharmAtt = "Charm"
	att.CharmScale = Vector(0.05, 0.05, 0.05)
	att.CharmOffset = Vector(0, -2.25, 0)
	att.CharmAngle = Angle(90, 0, 90)
	ArcCW.LoadAttachmentType(att)
end

------
-- charm_can.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_can")

	att.PrintName = "Private Reserve"
	att.Icon = Material("entities/acwatt_charm_can.png")
	att.Description = "Don't drink this stuff - they put something in it to make you forget. Just remember to put it in the bin after you're done."

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"

	att.Free = true

	att.Model = "models/weapons/arccw/atts/charmbase.mdl"

	att.DroppedModel = "models/Items/BoxSRounds.mdl"

	att.Charm = true
	att.CharmModel = "models/props_junk/PopCan01a.mdl"
	att.CharmAtt = "Charm"
	att.CharmScale = Vector(0.25, 0.25, 0.25)
	att.CharmOffset = Vector(0, -0.25, 0)
	att.CharmAngle = Angle(90, 0, 90)
	ArcCW.LoadAttachmentType(att)
end

------
-- charm_cube.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_cube")

	att.PrintName = "Hexahedron"
	att.Icon = Material("entities/acwatt_charm_cube.png")
	att.Description = "You all know this cute lil guy. A simple but enduring symbol of the Garry's Mod legacy."

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"

	att.Free = true

	att.Model = "models/weapons/arccw/atts/charmbase.mdl"

	att.DroppedModel = "models/Items/BoxSRounds.mdl"

	att.Charm = true
	att.CharmModel = "models/hunter/blocks/cube025x025x025.mdl"
	att.CharmAtt = "Charm"
	att.CharmScale = Vector(0.1, 0.1, 0.1)
	att.CharmOffset = Vector(0, -0.5, 0)
	att.CharmAngle = Angle(90, 0, 90)
	ArcCW.LoadAttachmentType(att)
end

------
-- charm_deagle.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_deagle")

	att.PrintName = "Juandeag"
	att.Icon = Material("entities/acwatt_charm_deagle.png")
	att.Description = "A legendary handgun, believed to grant its wielder immense power. Maybe better kept as a souvenir."

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"

	att.Free = true

	att.Model = "models/weapons/arccw/atts/charmbase.mdl"

	att.DroppedModel = "models/Items/BoxSRounds.mdl"

	att.Charm = true
	att.CharmModel = "models/weapons/w_pist_deagle.mdl"
	att.CharmAtt = "Charm"
	att.CharmScale = Vector(0.2, 0.2, 0.2)
	att.CharmOffset = Vector(-0.2, 0.125, 0)
	att.CharmAngle = Angle(180, 45, -90)
	ArcCW.LoadAttachmentType(att)
end

------
-- charm_gman.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_gman")

	att.PrintName = "G-Man"
	att.Icon = Material("entities/acwatt_charm_gman.png")
	att.Description = "Unforseen consequences may arise as a result of this little charm."

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"

	att.Free = true

	att.Model = "models/weapons/arccw/atts/charmbase.mdl"

	att.DroppedModel = "models/Items/BoxSRounds.mdl"

	att.Charm = true
	att.CharmModel = "models/maxofs2d/balloon_gman.mdl"
	att.CharmAtt = "Charm"
	att.CharmScale = Vector(0.1, 0.1, 0.1)
	att.CharmOffset = Vector(0, 0.1, 0)
	att.CharmAngle = Angle(-90, 0, -90)
	ArcCW.LoadAttachmentType(att)
end

------
-- charm_gmod.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_gmod")

	att.PrintName = "The Big 'G'"
	att.Icon = Material("entities/acwatt_charm_gmod.png")
	att.Description = "Get representing with this charm made in the shape of the Garry's Mod logo."

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"

	att.Free = true

	att.Model = "models/weapons/arccw/atts/charmbase.mdl"

	att.DroppedModel = "models/Items/BoxSRounds.mdl"

	att.Charm = true
	att.CharmModel = "models/maxofs2d/logo_gmod_b.mdl"
	att.CharmAtt = "Charm"
	att.CharmScale = Vector(0.01, 0.01, 0.01)
	att.CharmOffset = Vector(0, -0.5, 0)
	att.CharmAngle = Angle(90, 0, 90)
	ArcCW.LoadAttachmentType(att)
end

------
-- charm_hook.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_hook")

	att.PrintName = "The Hook"
	att.Icon = Material("entities/acwatt_charm_hook.png")
	att.Description = "The party will be off the hook with this one. You'll certainly be on the hook for all the bad puns that will arise from this little model."

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"

	att.Free = true

	att.Model = "models/weapons/arccw/atts/charmbase.mdl"

	att.DroppedModel = "models/Items/BoxSRounds.mdl"

	att.Charm = true
	att.CharmModel = "models/props_junk/meathook001a.mdl"
	att.CharmAtt = "Charm"
	att.CharmScale = Vector(0.1, 0.1, 0.1)
	att.CharmOffset = Vector(0.25, -2, 0)
	att.CharmAngle = Angle(90, 0, 90)
	ArcCW.LoadAttachmentType(att)
end

------
-- charm_horse.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_horse")

	att.PrintName = "The Stallion"
	att.Icon = Material("entities/acwatt_charm_horse.png")
	att.Description = "Ride on, warrior."

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"

	att.Free = true

	att.Model = "models/weapons/arccw/atts/charmbase.mdl"

	att.DroppedModel = "models/Items/BoxSRounds.mdl"

	att.Charm = true
	att.CharmModel = "models/props_c17/statue_horse.mdl"
	att.CharmAtt = "Charm"
	att.CharmScale = Vector(0.01, 0.01, 0.01)
	att.CharmOffset = Vector(0, -1.25, 0)
	att.CharmAngle = Angle(0, 0, 90)
	ArcCW.LoadAttachmentType(att)
end

------
-- charm_hula.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_hula")

	att.PrintName = "Hawaiian"
	att.Icon = Material("entities/acwatt_charm_hula.png")
	att.Description = "When the horrors of war are too great to bear, the Hawaiian is there to remind you to keep dancing on."

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"

	att.Free = true

	att.Model = "models/weapons/arccw/atts/charmbase.mdl"

	att.DroppedModel = "models/Items/BoxSRounds.mdl"

	att.Charm = true
	att.CharmModel = "models/props_lab/huladoll.mdl"
	att.CharmAtt = "Charm"
	att.CharmScale = Vector(0.25, 0.25, 0.25)
	att.CharmOffset = Vector(0, -1.5, 0)
	att.CharmAngle = Angle(-90, 0, 90)
	ArcCW.LoadAttachmentType(att)
end

------
-- charm_monitor.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_monitor")

	att.PrintName = "Box Clone"
	att.Icon = Material("entities/acwatt_charm_monitor.png")
	att.Description = "A recreation of a boxy old-school computer monitor. Said to emit dangerous levels of radiation."

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"

	att.Free = true

	att.Model = "models/weapons/arccw/atts/charmbase.mdl"

	att.DroppedModel = "models/Items/BoxSRounds.mdl"

	att.Charm = true
	att.CharmModel = "models/props_lab/monitor02.mdl"
	att.CharmAtt = "Charm"
	att.CharmScale = Vector(0.05, 0.05, 0.05)
	att.CharmOffset = Vector(0, -1, 0)
	att.CharmAngle = Angle(-90, 0, 90)
	ArcCW.LoadAttachmentType(att)
end

------
-- charm_mossman.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_mossman")

	att.PrintName = "Mossman"
	att.Icon = Material("entities/acwatt_charm_mossman.png")
	att.Description = "This little balloon will always remind you to go with Alyx."

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"

	att.Free = true

	att.Model = "models/weapons/arccw/atts/charmbase.mdl"

	att.DroppedModel = "models/Items/BoxSRounds.mdl"

	att.Charm = true
	att.CharmModel = "models/maxofs2d/balloon_mossman.mdl"
	att.CharmAtt = "Charm"
	att.CharmScale = Vector(0.1, 0.1, 0.1)
	att.CharmOffset = Vector(0, 0.1, 0)
	att.CharmAngle = Angle(-90, 0, -90)
	ArcCW.LoadAttachmentType(att)
end

------
-- charm_physgun.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_physgun")

	att.PrintName = "Grav Gun"
	att.Icon = Material("entities/acwatt_charm_physgun.png")
	att.Description = "The fabled physics-based weapon of The Free Man. Show the world you are no slave with this wonderful little charm."

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"

	att.Free = true

	att.Model = "models/weapons/arccw/atts/charmbase.mdl"

	att.DroppedModel = "models/Items/BoxSRounds.mdl"

	att.Charm = true
	att.CharmModel = "models/weapons/w_physics.mdl"
	att.CharmAtt = "Charm"
	att.CharmScale = Vector(0.1, 0.1, 0.1)
	att.CharmOffset = Vector(0, 0.125, 0)
	att.CharmAngle = Angle(180, 90, -90)
	ArcCW.LoadAttachmentType(att)
end

------
-- charm_punished.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_punished")

	att.PrintName = "Punished"
	att.Icon = Material("entities/acwatt_charm_punished.png")
	att.Description = "Sorry to have kept you waiting."

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"

	att.Free = true

	att.Model = "models/weapons/arccw/atts/charmbase.mdl"

	att.DroppedModel = "models/Items/BoxSRounds.mdl"

	att.Charm = true
	att.CharmModel = "models/weapons/arccw/charms/punished.mdl"
	att.CharmAtt = "Charm"
	att.CharmScale = Vector(0.6, 0.6, 0.6)
	att.CharmOffset = Vector(0.75, -1.1, 0)
	att.CharmAngle = Angle(180, 0, 90)
	ArcCW.LoadAttachmentType(att)
end

------
-- charm_sign_crossing.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_sign_crossing")

	att.PrintName = "Walkin' Here"
	att.Icon = Material("entities/acwatt_charm_sign_crossing.png")
	att.Description = "Remind them that this is a pedestrian-friendly area with this street sign themed charm."

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"

	att.Free = true

	att.Model = "models/weapons/arccw/atts/charmbase.mdl"

	att.DroppedModel = "models/Items/BoxSRounds.mdl"

	att.Charm = true
	att.CharmModel = "models/props_c17/streetsign005b.mdl"
	att.CharmAtt = "Charm"
	att.CharmScale = Vector(0.1, 0.1, 0.1)
	att.CharmOffset = Vector(0, -0.75, 0)
	att.CharmAngle = Angle(180, 0, 90)
	ArcCW.LoadAttachmentType(att)
end

------
-- charm_sign_ravenholm.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_sign_ravenholm")

	att.PrintName = "That Town"
	att.Icon = Material("entities/acwatt_charm_sign_ravenholm.png")
	att.Description = "How many times do we have to tell you? We don't go to Ravenholm. This reminder might help you with remembering this critical fact."

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"

	att.Free = true

	att.Model = "models/weapons/arccw/atts/charmbase.mdl"

	att.DroppedModel = "models/Items/BoxSRounds.mdl"

	att.Charm = true
	att.CharmModel = "models/props_junk/ravenholmsign.mdl"
	att.CharmAtt = "Charm"
	att.CharmScale = Vector(0.05, 0.05, 0.05)
	att.CharmOffset = Vector(0, -2.8, 0)
	att.CharmAngle = Angle(-90, 0, 0)
	ArcCW.LoadAttachmentType(att)
end

------
-- charm_sign_rocky.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_sign_rocky")

	att.PrintName = "Loose Chippings"
	att.Icon = Material("entities/acwatt_charm_sign_rocky.png")
	att.Description = "Be they loose surface debris or landmines, sometimes you need a reminder that the ground isn't always the safest place to be."

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"

	att.Free = true

	att.Model = "models/weapons/arccw/atts/charmbase.mdl"

	att.DroppedModel = "models/Items/BoxSRounds.mdl"

	att.Charm = true
	att.CharmModel = "models/props_c17/streetsign005c.mdl"
	att.CharmAtt = "Charm"
	att.CharmScale = Vector(0.1, 0.1, 0.1)
	att.CharmOffset = Vector(0, -0.75, 0)
	att.CharmAngle = Angle(180, 0, 90)
	ArcCW.LoadAttachmentType(att)
end

------
-- charm_sign_stop.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_sign_stop")

	att.PrintName = "Full Stop"
	att.Icon = Material("entities/acwatt_charm_sign_stop.png")
	att.Description = "Stop them dead in their tracks with this charm."

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"

	att.Free = true

	att.Model = "models/weapons/arccw/atts/charmbase.mdl"

	att.DroppedModel = "models/Items/BoxSRounds.mdl"

	att.Charm = true
	att.CharmModel = "models/props_c17/streetsign004f.mdl"
	att.CharmAtt = "Charm"
	att.CharmScale = Vector(0.1, 0.1, 0.1)
	att.CharmOffset = Vector(0, -0.75, 0)
	att.CharmAngle = Angle(180, 0, 90)
	ArcCW.LoadAttachmentType(att)
end

------
-- charm_skull.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_skull")

	att.PrintName = "Poor Yorick"
	att.Icon = Material("entities/acwatt_charm_skull.png")
	att.Description = "\"Alas, poor Yorick! I knew him, Horatio, a fellow of infinite jest, of most excellent fancy. He hath borne me on his back a thousand times, and now, how abhorred in my imagination it is! My gorge rises at it. Here hung those lips that I have kissed I know not how oft. —Where be your gibes now? Your gambols? Your songs? Your flashes of merriment that were wont to set the table on a roar? Not one now to mock your own grinning? Quite chapfallen? Now get you to my lady’s chamber and tell her, let her paint an inch thick, to this favor she must come. Make her laugh at that.—Prithee, Horatio, tell me one thing.\" "

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"

	att.Free = true

	att.Model = "models/weapons/arccw/atts/charmbase.mdl"

	att.DroppedModel = "models/Items/BoxSRounds.mdl"

	att.Charm = true
	att.CharmModel = "models/Gibs/HGIBS.mdl"
	att.CharmAtt = "Charm"
	att.CharmScale = Vector(0.2, 0.2, 0.2)
	att.CharmOffset = Vector(0, -0.5, 0)
	att.CharmAngle = Angle(-90, 0, 90)
	ArcCW.LoadAttachmentType(att)
end

------
-- charm_util_battery.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_util_battery")

	att.PrintName = "Energy Encapsulator"
	att.Icon = Material("entities/acwatt_charm_punished.png")
	att.Description = "Curious. This is no charm. What appears to be a battery has been attached to your firearm, soaking up heat in a sort of void-like state. For what it's worth, it seems to.. work like a charm."

	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"
	att.SortOrder = 100
	att.Ignore = true
	att.Free = false

	att.Model = "models/Items/battery.mdl"

	local lazy = 0.35
	att.ModelScale = Vector(lazy, lazy, lazy)
	att.ModelOffset = Vector(0.2, 0, -2)
	att.OffsetAng = Angle(-90, 0, 90)

	att.Mult_HeatCapacity = 1.15

	att.Mult_HeatDelayTime = 1.1
	att.Mult_FixTime = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- charm_util_cmbsmackdown.lua
------

do
	local att = {}
	ArcCW.SetShortName("charm_util_cmbsmackdown")

	att.PrintName = "CMB Smackdown Unit"
	att.Icon = Material("entities/acwatt_charm_punished.png")
	att.Description = "Curious. This is no charm. An empty metal container has been attached to your weapon. Deal damage while using it to build dark energy, which will allow you a critical melee strike. Finish your beating quota three times over."

	att.Desc_Pros = {
		"Deal 200 damage to earn a deadly 4x melee hit"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "charm"
	att.SortOrder = 100
	att.Ignore = true
	att.Free = false

	att.Model = "models/Items/combine_rifle_cartridge01.mdl"

	local lazy = 0.35
	att.ModelScale = Vector(lazy, lazy, lazy)
	att.ModelOffset = Vector(0, -0.6, 0)
	att.OffsetAng = Angle(0, 0, 0)

	att.Mult_Damage = 0.95
	att.Mult_DamageMin = 0.95

	att.Override_Jamming = true
	att.Override_HeatFix = false
	att.Override_HeatLockout = false

	att.Override_HeatCapacity = 400
	att.Override_FixTime = 1
	att.Override_HeatDissipation = 0
	att.Override_HeatDelayTime = 0

	att.Hook_Compatible = function(wep)
	    if (wep.Jamming) and !wep:CheckFlags({"charm_util_cmdsmackdown"}, {}) then return false end
	end

	att.M_Hook_Mult_MeleeDamage = function(wep, data)
		if wep.Smackdown_WEgoin then
			data.mult = data.mult * 4
		end
	end

	att.Hook_GetHUDData = function(wep, data)
		data.heat_name = "CRIT"
	end

	att.O_Hook_Override_HeatDissipation = function(wep, data)
		if wep.Smackdown_WEgoin then
			data.current = 100
		else
			data.current = 0
		end
	end

	att.M_Hook_Mult_MeleeTime = function(wep, data)
		if wep.Smackdown_WEgoin then
			data.mult = 2/3
		else
			data.mult = 1
		end
	end

	att.Hook_PostBash = function(wep, data)
		if IsValid(data.tr.Entity) then
			if wep.Smackdown_WEgoin then
				wep:EmitSound( "ambient/energy/weld" .. math.random(1, 2) .. ".wav", 75, 100, 1, CHAN_AUTO )
			end
			wep:AddHeat(data.dmg*2)
		end
	end

	att.Hook_PreBash = function(wep, data)
		if wep:GetHeat() >= wep:GetMaxHeat() then
			wep:EmitSound( "ambient/energy/zap" .. table.Random({1, 2, 3, 5, 6, 7, 8, 9}) .. ".wav", 60, 100, .5, CHAN_AUTO )
			wep.Smackdown_WEgoin = true
		end
	end

	att.Hook_BulletHit = function(wep, data)
		if IsValid(data.tr.Entity) then
			wep:AddHeat(data.damage*2)
		end
	end

	att.Hook_Think = function(wep)
		if wep.Smackdown_WEgoin and wep:GetHeat()/wep:GetMaxHeat() <= 0 then
			wep.Smackdown_WEgoin = false
		end
		if wep.Smackdown_NextSound == nil then
			wep.Smackdown_NextSound = CurTime() + 2
		elseif ( wep:GetHeat()/wep:GetMaxHeat() >= 1 ) or wep.Smackdown_WEgoin then
	        if wep.Smackdown_NextSound < CurTime() then
	            local a = 1
	            local b = 4
	            if wep.Smackdown_WEgoin then
	                a = 0.1
	                b = 0.25
	            end

	            wep:EmitSound( "ambient/energy/spark" .. math.random(1, 6) .. ".wav", 60, 85, .4, CHAN_AUTO )
	            wep.Smackdown_NextSound = CurTime() + math.Rand(a, b)
	        end
		end
	end

	local mat_grad	= Material("arccw/gsoe_oapi_heat.png", "mips smooth")

	att.Hook_DrawHUD = function(wep)
		local pers = wep:GetHeat()/wep:GetMaxHeat()
		local timesince = wep.Smackdown_NextSound or CurTime()
		local mult = ( wep.Smackdown_WEgoin and 2555 or 1 )
		
		surface.SetDrawColor(0, 255, 255, pers*6 - ( CurTime()-wep.Smackdown_NextSound )*6 / 2 )
		surface.SetMaterial(mat_grad)
		surface.DrawTexturedRect(ScrW()/2, ScrH()/2, ScrW()/2, ScrH()/2)
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_ammo_api.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_ammo_api")

	att.PrintName = "(GSO) AP/I Rounds"
	att.Icon = Material("entities/acwatt_go_ammo_api.png", "mips smooth")
	att.Description = "Armor-piercing incendiary rounds which ignite targets and improves range and long range damage, though at the cost of reduced damage overall."
	att.Desc_Pros = {
	    "pro.ignite"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "ammo_bullet"
	att.InvAtt = "go_ammo_api"

	att.Mult_Range = 1.5

	att.Mult_Damage = 0.85
	att.Mult_DamageMin = 1.1

	att.Override_DamageType = DMG_BURN

	att.Override_PhysTracerProfile = 1

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_ammo_blanks.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_ammo_blanks")

	att.PrintName = "(GSO) Blank Rounds"
	att.Icon = Material("entities/acwatt_go_ammo_blanks.png", "mips smooth")
	att.Description = "Rounds that contain no bullet, only powder and a wad. Incapable of doing harm. Might come in useful, somehow?"
	att.Desc_Pros = {
	    "pro.ammo_blank",
	}
	att.Desc_Cons = {
	    "con.ammo_blank",
	}
	att.AutoStats = true
	att.Slot = {"ammo_bullet", "ammo_shotgun"}
	att.InvAtt = "go_ammo_blanks"

	att.Override_Num = 0
	att.Mult_Num = 0

	att.Mult_Recoil = 0.25

	att.NotForNPCs = true
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_ammo_jhp.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_ammo_jhp")

	att.PrintName = "(GSO) JHP Rounds"
	att.Icon = Material("entities/acwatt_go_ammo_jhp.png", "mips smooth")
	att.Description = "Rounds with a hollow tip, improving effective close range damage at the cost of range and penetration."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "ammo_bullet"
	att.InvAtt = "go_ammo_jhp"

	att.Mult_Penetration = 0.5

	att.Mult_Damage = 1.1
	att.Mult_DamageMin = 0.9

	att.Hook_Compatible = function(wep)
	    if wep:GetIsShotgun() then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_ammo_match.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_ammo_match")

	att.PrintName = "(GSO) Match Rounds"
	att.Icon = Material("entities/acwatt_go_ammo_match.png", "mips smooth")
	att.Description = "Precision-tooled rounds with extra powder which significantly improve weapon accuracy and range, at the cost of recoil and close-range damage."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "ammo_bullet"
	att.InvAtt = "go_ammo_match"

	att.Mult_AccuracyMOA = 0.6
	att.Mult_Recoil = 1.15
	att.Mult_Damage = 0.85
	att.Mult_Range = 1.5
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_ammo_sg_magnum.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_ammo_sg_magnum")

	att.PrintName = "(GSO) Magnum Shells"
	att.Icon = Material("entities/acwatt_go_ammo_sg_magnum.png", "mips smooth")
	att.Description = "A heavy loading of the default buckshot shell, improving close range damage at the cost of range, recoil, and spread."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "ammo_shotgun"
	att.InvAtt = "go_ammo_sg_magnum"

	att.Mult_Range = 0.75
	att.Mult_AccuracyMOA = 2

	att.Mult_Damage = 1.15
	att.Mult_DamageMin = 0.75

	att.Override_Num_Priority = 2
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_ammo_sg_sabot.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_ammo_sg_sabot")

	att.PrintName = "(GSO) Sabot Shells"
	att.Icon = Material("entities/acwatt_go_ammo_sg_sabot.png", "mips smooth")
	att.Description = "Aerodynamic slug encased in plastic sabot. Excellent accuracy and performance at range, but rather poor damage."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "ammo_shotgun"
	att.InvAtt = "go_ammo_sg_sabot"

	att.Override_Num = 1
	att.Mult_Range = 2.5
	att.Mult_AccuracyMOA = 0.1

	att.Mult_Damage = 0.5
	att.Mult_DamageMin = 0.65

	att.Override_Num_Priority = 2
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_ammo_sg_scatter.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_ammo_sg_scatter")

	att.PrintName = "(GSO) Scattershot Shells"
	att.Icon = Material("entities/acwatt_go_ammo_sg_scatter.png", "mips smooth")
	att.Description = "Shells with extra pellets, potentially improving hit chance."
	att.Desc_Pros = {
	    "Extra pellets"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "ammo_shotgun"
	att.InvAtt = "go_ammo_sg_scatter"

	att.Override_Num = 16

	att.Mult_Range = 0.5
	att.Mult_AccuracyMOA = 3

	att.Mult_Damage = 1
	att.Mult_DamageMin = 0.85

	att.Override_Num_Priority = 2
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_ammo_sg_slug.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_ammo_sg_slug")

	att.PrintName = "(GSO) Slug Shells"
	att.Icon = Material("entities/acwatt_go_ammo_sg_slug.png", "mips smooth")
	att.Description = "A single lead slug that improves accuracy and long range performance, though does not scatter."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "ammo_shotgun"
	att.InvAtt = "go_ammo_sg_slug"

	att.Override_Num = 1
	att.Mult_Range = 1.5
	att.Mult_AccuracyMOA = 0.25

	att.Mult_Damage = 0.8
	att.Mult_DamageMin = 0.85

	att.Override_Num_Priority = 2
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_ammo_sg_triple.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_ammo_sg_triple")

	att.PrintName = "(GSO) Triple-Hit Shells"
	att.Icon = Material("entities/acwatt_go_ammo_sg_triple.png", "mips smooth")
	att.Description = "A shell with three projectiles each, more accurate and powerful at range but with inferior general stopping power."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "ammo_shotgun"
	att.InvAtt = "go_ammo_sg_triple"

	att.Override_Num = 3
	att.Mult_Range = 1.25
	att.Mult_AccuracyMOA = 0.75

	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 0.9

	att.Override_Num_Priority = 2

	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_ammo_sub.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_ammo_sub")

	att.PrintName = "(GSO) Subsonic Rounds"
	att.Icon = Material("entities/acwatt_go_ammo_sub.png", "mips smooth")
	att.Description = "Reduced load rounds which are more quiet than standard ammo. Makes tracers invisible."
	att.Desc_Pros = {
	    "pro.invistracers"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "ammo_bullet"
	att.InvAtt = "go_ammo_sub"

	att.Mult_Range = 0.75
	att.Mult_Recoil = 0.8
	att.Mult_ShootVol = 0.85

	att.Override_PhysTracerProfile = 7
	att.Override_TracerNum = 0
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_ammo_tmj.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_ammo_tmj")

	att.PrintName = "(GSO) TMJ Rounds"
	att.Icon = Material("entities/acwatt_go_ammo_tmj.png", "mips smooth")
	att.Description = "Rounds which are totally coated in a copper jacket, improving penetrative capabilities and range at the cost of overall damage."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "ammo_bullet"
	att.InvAtt = "go_ammo_tmj"

	att.Mult_Penetration = 2

	att.Mult_Damage = 0.9
	att.Mult_DamageMin = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_ammo_tr.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_ammo_tr")

	att.PrintName = "(GSO) Tracer Rounds"
	att.Icon = Material("entities/acwatt_go_ammo_tr.png", "mips smooth")
	att.Description = "Rounds which contain a small pyrotechnic charge 'doped' with a chemical such as Strontium or Barium to produce a colored flame."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = {"ammo_bullet", "ammo_shotgun"}
	att.InvAtt = "go_ammo_tr"

	att.Mult_Damage = 1.01
	att.Mult_DamageMin = 1.01

	att.Mult_Penetration = 0.95

	att.ToggleStats = {
	    {
	        PrintName = "Red",
	        Override_PhysTracerProfile = 1
	    },
	    {
	        PrintName = "Green",
	        Override_PhysTracerProfile = 2
	    },
	    {
	        PrintName = "Violet",
	        Override_PhysTracerProfile = 5
	    },
	    {
	        PrintName = "Yellow",
	        Override_PhysTracerProfile = 4
	    },
	}
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_perk_bolt.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_perk_bolt")

	att.PrintName = "(GSO) Deft Hands"
	att.Icon = Material("entities/acwatt_go_perk_bolt.png", "mips smooth")
	att.Description = "Cycling the weapon is 25% faster."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "perk"
	att.InvAtt = "go_perk_bolt"

	att.Mult_CycleTime = 0.75

	att.Hook_Compatible = function(wep)
	    if !wep.ManualAction then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_perk_burst.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_perk_burst")

	att.PrintName = "(GSO) Enhanced Burst"
	att.Icon = Material("entities/acwatt_go_perk_burst.png", "mips smooth")
	att.Description = "Alters weapon fire group to support 3-burst and semi-automatic fire instead. Enhances effective fire rate."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "perk"
	att.InvAtt = "go_perk_burst"

	att.Override_Firemodes_Priority = 10
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
	    if wep.ManualAction then return false end
	    local auto = false
	    for i, v in pairs(wep.Firemodes) do
	        if v.Mode and v.Mode == -3 then
	            auto = true
	            break
	        end
	    end
	    if auto then return false end
	end

	att.Mult_RPM = 1.15
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_perk_diver.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_perk_diver")

	att.PrintName = "(GSO) Deep Sea"
	att.Icon = Material("entities/acwatt_go_perk_diver.png", "mips smooth")
	att.Description = "Enables the weapon to keep firing while underwater with specially sealed internal parts."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "perk"
	att.InvAtt = "go_perk_diver"

	att.Override_CanFireUnderwater = true

	att.Hook_Compatible = function(wep)
	    if wep.CanFireUnderwater then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_perk_fastreload.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_perk_fastreload")

	att.PrintName = "(GSO) Rapid Reload"
	att.Icon = Material("entities/acwatt_go_perk_fastreload.png", "mips smooth")
	att.Description = "Improves reload time."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "perk"
	att.InvAtt = "go_perk_fastreload"

	att.Mult_ReloadTime = 0.85
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_perk_headshot.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_perk_headshot")

	att.PrintName = "(GSO) Surgical Shot"
	att.Icon = Material("entities/acwatt_go_perk_headshot.png", "mips smooth")
	att.Description = "Further triples headshot damage."
	att.Desc_Pros = {
	    "pro.headshotdamage"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "perk"
	att.InvAtt = "go_perk_headshot"

	att.Hook_BulletHit = function(wep, data)
	    if CLIENT then return end

	    if data.tr.HitGroup == HITGROUP_HEAD then
	        data.damage = data.damage * 3
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_perk_last.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_perk_last")

	att.PrintName = "(GSO) Last One Out"
	att.Icon = Material("entities/acwatt_go_perk_last.png", "mips smooth")
	att.Description = "Last round has 25% greater damage."
	att.Desc_Pros = {
	    "pro.last"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "perk"
	att.InvAtt = "go_perk_last"

	att.M_Hook_Mult_Damage = function(wep, data)
	    if wep:Clip1() == 1 then
	        data.mult = data.mult * 1.25
	    end

	    return data
	end

	att.M_Hook_Mult_DamageMin = function(wep, data)
	    if wep:Clip1() == 1 then
	        data.mult = data.mult * 1.25
	    end

	    return data
	end

	att.Hook_BulletHit = function(wep, data)
	    if CLIENT then return end

	    if wep:Clip1() == 1 then
	        wep.Owner:EmitSound("arccw_go/fx/rics/legacy_ric_conc-1.wav", 100, 100, 1, CHAN_VOICE2)
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_perk_light.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_perk_light")

	att.PrintName = "(GSO) Light Internals"
	att.Icon = Material("entities/acwatt_go_perk_light.png", "mips smooth")
	att.Description = "Lightened internal parts allow faster movement while the gun is equipped."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "perk"
	att.InvAtt = "go_perk_light"

	att.Mult_SpeedMult = 1.1
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_perk_quickdraw.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_perk_quickdraw")

	att.PrintName = "(GSO) Quickdraw"
	att.Icon = Material("entities/acwatt_go_perk_quickdraw.png", "mips smooth")
	att.Description = "Draw and holster weapon more quickly."
	att.Desc_Pros = {
	    "pro.quickdraw"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "perk"
	att.InvAtt = "go_perk_quickdraw"

	att.Mult_DrawTime = 0.5
	att.Mult_HolsterTime = 0.5
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_perk_rapidfire.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_perk_rapidfire")

	att.PrintName = "(GSO) Frantic Firing Frenzy"
	att.Icon = Material("entities/acwatt_go_perk_rapidfire.png", "mips smooth")
	att.Description = "Slightly improves rate of fire."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "perk"
	att.InvAtt = "go_perk_rapidfire"

	att.Mult_RPM = 1.05

	att.Hook_Compatible = function(wep)
	    if wep.ManualAction then return false end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_perk_refund.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_perk_refund")

	att.PrintName = "(GSO) Head Hunt"
	att.Icon = Material("entities/acwatt_go_perk_refund.png", "mips smooth")
	att.Description = "Headshots load one bullet from reserve straight into the magazine."
	att.Desc_Pros = {
	    "pro.refund"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "perk"
	att.InvAtt = "go_perk_refund"

	att.Hook_BulletHit = function(wep, data)
	    if CLIENT then return end

	    if data.tr.HitGroup == HITGROUP_HEAD then
	        wep:RestoreAmmo(1)
	    end
	end
	ArcCW.LoadAttachmentType(att)
end

------
-- csp_go_perk_runandgun.lua
------

do
	local att = {}
	ArcCW.SetShortName("csp_go_perk_runandgun")

	att.PrintName = "(GSO) Run and Gun"
	att.Ignore = true
	att.Icon = Material("entities/acwatt_go_perk_onehand.png", "mips smooth")
	att.Description = "Special technique allows for shooting while sprinting."
	att.Desc_Pros = {
	    "pro.runandgun"
	}
	att.Desc_Cons = {
	}
	att.AutoStats = true
	att.Slot = "perk"
	att.InvAtt = "go_perk_runandgun"

	att.Override_ShootWhileSprint = true
	ArcCW.LoadAttachmentType(att)
end

------
-- deagle_gold.lua
------

do
	local att = {}
	ArcCW.SetShortName("deagle_gold")

	att.PrintName = "Gold Eagle"
	att.Icon = Material("entities/acwatt_deagle_gold.png", "smooth")
	att.Description = "Call of Duty 4's golden Desert Eagle."
	att.Desc_Pros = {
	}
	att.Desc_Cons = {
	}
	att.Desc_Neutrals = {
	}
	att.Slot = "skin_mw2deagle"

	att.Free = true

	att.ActivateElements = {"skin_gold"}
	ArcCW.LoadAttachmentType(att)
end

------
-- default.lua
------

do
	local att = {}
	ArcCW.SetShortName("default")

	att.PrintName = ""
	att.Icon = nil
	att.Description = ""
	att.Desc_Pros = {}
	att.Desc_Cons = {}
	att.Slot = ""
	att.TargetSpecificWeapon = "" -- ALWAYS make this attachment available on a specific weapon
	att.TargetSpecificSlot = 0 -- on this specific slot

	att.SortOrder = 0

	att.Spawnable = false -- generate entity
	att.AdminOnly = false -- see above
	att.Ignore = true
	att.InvAtt = nil -- use this other attachment in inventory
	att.Free = false -- attachment is always available, and doesn't need to be picked up or unlocked
	att.IgnorePickX = false -- will not increment the Pick X counter
	att.Hidden = false
	att.HideIfBlocked = false -- if the attachment cannot be attached due to flag reasons, do not show up
	att.HideIfUnavailable = false -- if the attachment is not owned, do not show up even if "Hide Unowned Attachments" is off

	att.NotForNPCs = false

	att.AddPrefix = ""
	att.AddSuffix = ""

	att.ToggleStats = {
	    -- {
	    --     PrintName = "Red",
	    --     AutoStatName = "On",
	    --     Laser = true,
	    --     LaserColor = Color(255, 0, 0),
	    --     Mult_HipDispersion = 0.75,
	    --     AdditionalSights = {
	    --         {
	    --             Pos = Vector(-2, 10, -4), -- relative to where att.Model is placed
	    --             Ang = Angle(0, 0, -45),
	    --             GlobalPos = false,
	    --             GlobalAng = true,
	    --             Magnification = 1
	    --         }
	    --     },
	    -- },
	    -- {
	    --     PrintName = "Blue",
	    --     NoAutoStats = true,
	    --     Laser = true,
	    --     LaserColor = Color(0, 0, 255),
	    --     Mult_HipDispersion = 0.75,
	    --     AdditionalSights = {
	    --         {
	    --             Pos = Vector(-2, 10, -4), -- relative to where att.Model is placed
	    --             Ang = Angle(0, 0, -45),
	    --             GlobalPos = false,
	    --             GlobalAng = true,
	    --             Magnification = 1
	    --         }
	    --     },
	    -- },
	    -- {
	    --     PrintName = "Off",
	    --     Laser = false,
	    --     Mult_HipDispersion = 1,
	    -- }
	}

	att.KeepBaseIrons = false

	att.GivesFlags = {}
	att.RequireFlags = {}
	att.ExcludeFlags = {}

	-- Do not use right now.
	att.SubSlots = {
	    {
	        PrintName = "Optic",
	        Slot = {"optic", "optic_lp"}, -- OR
	        Slot = "optic",
	        DefaultAttName = "Iron Sights",
	        DefaultAttIcon = Material(""),
	        MergeSlots = {}, -- mergeslots are relative to att.SubSlots, so this entry would be [1], then [2], etc
	        -- bone/wmbone is inherited
	        ExtraSightDist = 0,
	        Offset = { -- inherits from base slot
	            vpos = Vector(0, 0, 0),
	            vang = Angle(0, 0, 0),
	            wpos = Vector(0, 0, 0),
	            wang = Angle(0, 0, 0)
	        },
	        SlideAmount = {
	            vmin = Vector(0, 0, 0),
	            vmax = Vector(0, 0, 0),
	            wmin = Vector(0, 0, 0),
	            wmax = Vector(0, 0, 0),
	        },
	    }
	    -- CorrectiveAng/Pos is inherited from base slot
	    -- everything else is the same as normal slots
	}

	att.Max = nil -- the maximum number of this attachment that can be attached.

	att.Model = ""
	att.HideModel = false
	att.ModelBodygroups = ""
	att.ModelSkin = 0
	att.ModelScale = Vector(1, 1, 1)
	att.ModelOffset = Vector(0, 0, 0)
	att.OffsetAng = Angle(0, 0, 0)
	att.ModelIsShield = false
	att.ShieldResistance = nil -- amount of penetration to get through one unit of shield
	att.ShieldBone = "ValveBiped.Bip01_R_Hand"
	att.DrawFunc = function(self, element, wm) end

	att.Charm = false
	att.CharmBone = "Charm"
	att.CharmModel = ""
	att.CharmOffset = Vector(0, 0, 0)
	att.CharmScale = Vector(1, 1, 1)
	att.CharmSkin = 0
	att.CharmBodygroups = ""

	att.Health = 0 -- for breakable attachments

	att.ShieldCorrectAng = Angle(0, 0, 0)
	att.ShieldCorrectPos = Vector(0, 0, 0)

	-- amount of damage done to this attachment
	-- attachments which are even a bit damaged are not returned
	att.DamageOnShoot = 0
	att.DamageOnReload = 0
	att.DamagePerSecond = 0

	-- {slot = int, atthp = float, dmg = DamageInfo}
	att.Hook_PlayerTakeDamage = function(wep, data) end

	-- {slot = int, oldhp = float, dmg = float}
	att.Hook_AttTakeDamage = function(wep, data) end

	-- {slot = int, dmg = float}
	att.Hook_AttDestroyed = function(wep, data) end

	att.VMColor = Color(255, 255, 255)
	att.WMColor = Color(255, 255, 255)
	att.VMMaterial = ""
	att.WMMaterial = ""

	att.DroppedModel = nil
	att.LHIKHide = false -- use this to just hide the left hand
	att.LHIK = false -- use this model for left hand IK
	att.LHIK_Animation = false
	att.LHIK_GunDriver = ""
	att.LHIK_CamDriver = ""

	att.Override_NoHideLeftHandInCustomization = nil

	att.ActivateElements = {}

	att.MountPositionOverride = nil -- set between 0 to 1 to always mount in a certain position

	att.AdditionalSights = {
	    {
	        Pos = Vector(0, 0, 0), -- relative to where att.Model is placed
	        Ang = Angle(0, 0, 0),
	        GlobalPos = false, -- solver will not correct position relative to att.Model position
	        GlobalAng = false, -- solver will not correct angle
	        ViewModelFOV = 45,
	        ScrollFunc = ArcCW.SCROLL_ZOOM,
	        ZoomLevels = 6,
	        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
	        NVScope = nil, -- enables night vision effects for scope
	        NVScopeColor = Color(0, 255, 100),
	        NVFullColor = false, -- night vision scope is true full color
	        Thermal = true,
	        ThermalScopeColor = Color(255, 255, 255),
	        ThermalHighlightColor = Color(255, 255, 255),
	        ThermalFullColor = false,
	        ThermalScopeSimple = false,
	        ThermalNoCC = false,
	        ThermalBHOT = false, -- invert bright/dark
	        IgnoreExtra = false, -- ignore gun-determined extra sight distance
	        Contrast = 1, -- allows you to adjust the values for contrast and brightness when either NVScope or Thermal is enabled.
	        Brightness = 0,
	        SpecialScopeFunction = function(screen) end -- perform whatever screen space effects you like here, copy SWEP:FormThermalImaging and SWEP:FormNightVision for examples
	    }
	}

	att.UBGL = false -- is underbarrel grenade launcher

	att.UBGL_Automatic = false
	att.UBGL_ClipSize = 1
	att.UBGL_Ammo = "smg1_grenade"
	att.UBGL_RPM = 300

	-- Use animations on the weapon itself, useful for weapon-specific UBGL
	att.UBGL_BaseAnims = false

	-- wep: weapon
	-- ubgl: UBGL attachment slot.
	att.UBGL_Fire = function(wep, ubgl) end
	att.UBGL_Reload = function(wep, ubgl) end

	att.Silencer = false

	att.Bipod = false
	att.Mult_BipodRecoil = 0.25
	att.Mult_BipodDispersion = 0.1

	att.Override_AlwaysPhysBullet = nil
	att.Override_NeverPhysBullet = nil

	att.Override_AmmoPerShot = 1
	att.Override_InfiniteAmmo = nil
	att.Override_BottomlessClip = nil

	att.MagExtender = false
	att.MagReducer = false
	att.OverrideClipSize = nil
	att.Add_ClipSize = 0

	att.Override_FuseTime = nil

	att.Laser = false
	att.LaserStrength = 1
	att.LaserBone = "laser"
	att.LaserColor = Color(255, 0, 0)

	att.Flashlight = false
	att.FlashlightFOV = 50
	att.FlashlightHFOV = nil -- horizontal FOV
	att.FlashlightVFOV = nil -- vertical FOV
	-- basically, use HFOV + VFOV if you want it to be non square
	att.FlashlightFarZ = 512 -- how far it goes
	att.FlashlightNearZ = 4 -- how far away it starts
	att.FlashlightAttenuationType = ArcCW.FLASH_ATT_LINEAR -- LINEAR, CONSTANT, QUADRATIC are available
	att.FlashlightColor = Color(255, 255, 255)
	att.FlashlightTexture = ""
	att.FlashlightBrightness = 1
	att.FlashlightBone = "laser"

	att.Holosight = false
	att.HolosightReticle = nil
	att.HolosightFlare = nil
	att.HolosightSize = nil
	att.HolosightBone = "holosight"
	att.HolosightPiece = nil -- the lens of the holo sight, if applicable
	att.HolosightMagnification = 1 -- magnify the lens by this much
	att.HolosightBlackbox = false
	att.HolosightNoHSP = false -- for this holosight ignore HSP
	att.HolosightConstDist = nil -- constant holosight distance, mainly for scopes with range finder

	att.Colorable = false -- automatically use the player's color option
	att.HolosightColor = Color(255, 255, 255)

	att.Override_Ammo = "ar2" -- overrides the ammo type with this one

	att.Override_Firemodes = {}

	-- you can use _Priority to determine the priority of overrides.
	-- append it to the end of an Override_ stat to set this.
	-- for example, att.Override_Firemodes_Priority = 2
	-- higher priority = will be chosen over lower priority
	-- default priority for all stats is 1.

	-- all hooks will work when applied to the SWEP table as well
	-- e.g. SWEP.Hook_FireBullets

	-- use A_Hook_[Add_Whatever] to hook into additive hooks.
	-- {buff = string buff, add = num add}
	-- return table

	-- use O_Hook_[Override_Whatever] to hook into override hooks.
	-- {buff = string buff, current = any override, winningslot = int slot}

	-- use M_Hook_[Mult_Whatever] to hook into multiply hooks.
	-- {buff = string buff, mult = num mult}

	-- all hooks, mults, and adds will work on fire modes

	-- called when the active sight is changed
	-- return to change activesight
	-- {active = int activesight, asight = table}
	att.Hook_SwitchActiveSights = function(wep, data) end

	-- Allows you to directly edit the burst count
	att.Hook_GetBurstCount = function(wep, burstcount) end

	-- Allows you to directly edit how long a burst is
	att.Hook_GetBurstLength = function(wep, length) end

	-- Allows you to directly edit whether the weapon is reloading/inoperable
	att.Hook_GetReloading = function(wep, reloading) end

	-- Directly modify dispersion
	att.Hook_ModDispersion = function(wep, dispersion) end

	-- Allows you to change the weapon's name
	-- string name
	att.Hook_NameChange = function(wep, name) end

	-- allows you to do whatever you like to the weapon VMs
	-- {vm = vm, eles = ae}
	att.Hook_ModifyBodygroups = function(wep, data) end

	-- allows you to return a shotgun spread offset
	-- {n = int number, ang = angle offset}
	att.Hook_ShotgunSpreadOffset = function(wep, data) end

	-- done before playing an effect
	-- return false to prevent playing
	-- fx: {eff = effect name, fx = EffectData()}
	att.Hook_PreDoEffects = function(wep, fx) end

	-- return true = compatible
	-- return false = incompatible
	-- data = {slot = string or table, att = string}
	att.Hook_Compatible = function(wep, data) end

	-- hook that lets you change the values of the bullet before it's fired.
	att.Hook_FireBullets = function(wep, bullettable) end

	-- called after all other primary attack functions. Do stuff here.
	att.Hook_PostFireBullets = function(wep) end

	-- return true to prevent fire
	att.Hook_ShouldNotFire = function(wep) end

	-- return true to prevent fire, bashing, anything involving the fire button
	att.Hook_ShouldNotFireFirst = function(wep) end

	-- return true to prevent ads
	att.Hook_ShouldNotSight = function(wep) end

	-- return anything to select this reload animation. Bear in mind that not all guns have the same animations, so check first.
	att.Hook_SelectReloadAnimation = function(wep, curanim) end

	-- return anything to multiply reload time by that much
	att.Hook_MultReload = function(wep, mult) end

	-- data has entries:
	-- number count, how much ammo to add with this insert
	-- string anim, which animation to play
	-- bool empty, whether we are reloading from empty
	att.Hook_SelectInsertAnimation = function(wep, data) end

	-- return to override fire animation
	att.Hook_SelectFireAnimation = function(wep, curanim) end

	-- return string to change played anim
	-- string anim, animation we are attempting to play
	-- return false to block animation
	-- return nil to do nothing
	att.Hook_TranslateAnimation = function(wep, anim) end

	-- directly changes source sequence to play
	-- seq and return can either be string or table
	att.Hook_TranslateSequence = function(wep, seq) end

	-- allows any sound to be translated to any other
	att.Hook_TranslateSound = function(wep, soundname) end

	att.Hook_LHIK_TranslateAnimation = function(wep, anim) end

	-- att.Hook_TranslateAnimation = function(wep, anim)
	--     if anim == "reload" then
	--         return "reload_soh"
	--     elseif anim == "reload_empty" then
	--         return "reload_empty_soh"
	--     end
	-- end

	-- anim is string
	att.Hook_SelectBashAnim = function(wep, anim) end

	att.Hook_PreBash = function(wep) end

	-- data = {tr = tr, dmg = dmg}
	att.Hook_PostBash = function(wep, data) end

	-- Called just before a physbullet will call FireBullets
	-- data.bullet - physbullet info; data.tr - trace info
	att.Hook_PhysBulletHit = function(wep, data) end

	-- data has entries:
	-- number range, the distance the bullet had to travel
	-- number damage, the calculated damage the bullet will do
	-- number penleft, the amount of penetration the bullet still possesses
	-- enum dmgtype, the DMG_ enum of the damagetype
	-- table tr, the trace result
	-- entity att, the attacker (?)
	-- DamageInfo dmg, the damage info

	-- changes to dmg may be overwritten later, so set damage and dmgtype instead
	att.Hook_BulletHit = function(wep, data) end

	-- return true to prevent reloading
	att.Hook_PreReload = function(wep) end

	att.Hook_PostReload = function(wep) end

	att.Hook_GetVisualBullets = function(wep) end

	att.Hook_GetVisualClip = function(wep) end

	-- return to set mag capacity
	att.Hook_GetCapacity = function(wep, cap) end

	-- return false to suppress shoot sound
	-- string sound = default sound
	att.Hook_GetShootSound = function(wep, sound) end
	att.Hook_GetShootDrySound = function(wep, sound) end
	att.Hook_GetDistantShootSound = function(wep, sound) end

	-- or just add more!
	-- data has entries:
	-- string sound
	-- number volume
	-- number pitch
	att.Hook_AddShootSound = function(wep, data) end
	--    att.Hook_AddShootSound = function(wep, data)
	--      wep:MyEmitSound("weapons/pistol/pistol_fire2.wav", data.volume, data.pitch, 1, CHAN_WEAPON - 1)
	--    end

	-- allows you to modify the weapon's rate of fire
	att.Hook_ModifyRPM = function(wep, delay) end

	-- return a table containing Recoil, RecoilSide, VisualRecoilMult to multiply them
	-- Alternatively, edit the values in rec without returning, which supports multiple hooks changing the value
	att.Hook_ModifyRecoil = function(wep, rec) end

	-- run in Think()
	att.Hook_Think = function(wep) end

	-- thinking hook for att
	att.DrawFunc = function(wep, element, wm) end

	-- after ADS starts or ends
	att.Hook_SightToggle = function(wep, enter) end

	att.Override_Trivia_Class = nil -- "Submachine Gun"
	att.Override_Trivia_Desc = nil -- "Ubiquitous 9mm SMG. Created as a response to the need for a faster-firing and more reliable submachine gun than existing options at the time."
	att.Override_Trivia_Manufacturer = nil -- "Auschen Waffenfabrik"
	att.Override_Trivia_Calibre = nil -- "9x21mm Jager"
	att.Override_Trivia_Mechanism = nil -- "Roller-Delayed Blowback"
	att.Override_Trivia_Country = nil -- "Austria"
	att.Override_Trivia_Year = nil -- 1968

	att.Mult_Damage = 1
	att.Mult_DamageMin = 1
	att.Mult_DamageRand = 1
	att.Mult_DamageNPC = 1 -- damage WHEN USED BY NPCS not when used against them
	att.Mult_Range = 1
	att.Mult_Penetration = 1
	att.Override_DamageType = nil
	att.Override_ShootEntity = nil
	att.Mult_MuzzleVelocity = 1

	att.Override_ShotgunSpreadPattern = {}
	att.Override_ShotgunSpreadPatternOverrun = {}

	att.Override_NoRandSpread = false -- disable (random) spread modification after bullet table override

	att.Mult_MeleeTime = 1
	att.Mult_MeleeDamage = 1
	att.Add_MeleeRange = 0
	att.Mult_MeleeAttackTime = 1
	att.Override_MeleeDamageType = nil

	-- jam/heat related buffs
	att.Override_Jamming = nil
	att.Mult_HeatCapacity = 1
	att.Mult_FixTime = 1
	att.Mult_HeatDissipation = 1
	att.Mult_HeatDelayTime = 1
	att.Override_HeatFix = nil
	att.Override_HeatLockout = nil
	att.Hook_Overheat = function(wep, heat) end

	att.Override_Tracer = nil -- tracer effect name
	att.Override_TracerNum = nil
	-- att.Override_TracerCol = nil
	-- att.Mult_TracerWidth = 1
	att.TracerFinalMag = nil

	att.Override_PhysTracerProfile = nil -- color for phys tracer.
	-- there are 8 options:
	-- 0 = normal
	-- 1 = red
	-- 2 = green
	-- 3 = blue
	-- 4 = yellow
	-- 5 = violet
	-- 6 = cyan
	-- 7 = black/invisible

	att.Override_CanBash = nil

	att.Override_ShotgunReload = nil
	att.Override_HybridReload = nil

	att.Override_AutoReload = nil

	att.Override_ManualAction = nil

	att.Override_CanFireUnderwater = nil

	att.Override_ChamberSize = nil
	att.Add_ChamberSize = nil

	att.Mult_Recoil = 1
	att.Mult_RecoilSide = 1
	att.Mult_VisualRecoilMult = 1

	att.Mult_Sway = 1

	att.Override_ShootWhileSprint = nil

	att.Mult_RPM = 1

	att.Override_Num = nil

	att.Mult_AccuracyMOA = 1
	att.Mult_HipDispersion = 1
	att.Mult_SightsDispersion = 1

	att.Mult_ShootVol = 1
	att.Mult_ShootPitch = 1

	att.Mult_GlintMagnitude = 1

	att.Override_MuzzleEffect = nil
	att.Override_FastMuzzleEffect = nil
	att.Override_GMMuzzleEffect = nil

	att.Override_ShellEffect = nil
	att.Override_ShellMaterial = nil

	att.Override_MuzzleEffectAttachment = nil
	att.Override_CaseEffectAttachment = nil

	att.Mult_SpeedMult = 1
	att.Mult_SightedSpeedMult = 1
	att.Mult_ShootSpeedMult = 1

	att.Override_HoldtypeHolstered = nil
	att.Override_HoldtypeActive = nil
	att.Override_HoldtypeSights = nil

	att.Override_AnimShoot = nil

	att.Override_HolsterPos = nil
	att.Override_HolsterAng = nil

	att.Add_BarrelLength = 0

	att.Override_BarrelOffsetSighted = nil
	att.Override_BarrelOffsetHip = nil

	att.Mult_ReloadTime = 1
	att.Mult_DrawTime = 1
	att.Mult_SightTime = 1
	att.Mult_CycleTime = 1

	att.AttachSound = nil
	att.DetachSound = nil

	ArcCW.LoadAttachmentType(att)
end

