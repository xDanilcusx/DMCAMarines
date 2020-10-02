/obj/item/weapon/shield
	name = "shield"
	var/block_chance = 65

/obj/item/weapon/shield/riot
	name = "riot shield"
	desc = "A shield adept at blocking blunt objects from connecting with the torso of the shield wielder."
	icon = 'icons/obj/items/weapons.dmi'
	icon_state = "riot"
	flags_equip_slot = SLOT_BACK
	force = 5.0
	throwforce = 5.0
	throw_speed = 1
	throw_range = 4
	w_class = 4.0
	matter = list("glass" = 7500, "metal" = 1000)
	origin_tech = "materials=2"
	attack_verb = list("shoved", "bashed")
	var/cooldown = 0 //shield bash cooldown. based on world.time

	IsShield()
		return 1

	attackby(obj/item/W as obj, mob/user as mob)
		if(istype(W, /obj/item/weapon/baton))
			if(cooldown < world.time - 25)
				user.visible_message("<span class='warning'>[user] bashes [src] with [W]!</span>")
				playsound(user.loc, 'sound/effects/shieldbash.ogg', 25, 1)
				cooldown = world.time
		else
			..()

/obj/item/weapon/shield/energy
	name = "energy combat shield"
	desc = "A shield capable of stopping most projectile and melee attacks. It can be retracted, expanded, and stored anywhere."
	icon = 'icons/obj/items/weapons.dmi'
	icon_state = "eshield0" // eshield1 for expanded
	flags_atom = CONDUCT|NOBLOODY
	force = 3.0
	throwforce = 5.0
	throw_speed = 1
	throw_range = 4
	w_class = 2
	origin_tech = "materials=4;magnets=3;syndicate=4"
	attack_verb = list("shoved", "bashed")
	var/active = 0

/obj/item/weapon/shield/montage
	name = "N30 montage shield"
	desc = "A shield adept at blocking blunt objects from connecting with the torso of the shield wielder."
	icon = 'icons/obj/items/weapons.dmi'
	icon_state = "metal"
	flags_equip_slot = SLOT_BACK
	block_chance = 100
	force = 5.0
	throwforce = 5.0
	throw_speed = 1
	throw_range = 4
	w_class = 4.0
	origin_tech = "materials=2"
	attack_verb = list("shoved", "bashed", "slash")
	var/cooldown = 0 //shield bash cooldown. based on world.time

	Get_shield_chance()
		return block_chance

	attackby(obj/item/W as obj, mob/user as mob)
		if(istype(W, /obj/item/weapon/baton))
			if(cooldown < world.time - 25)
				user.visible_message("<span class='warning'>[user] bashes [src] with [W]!</span>")
				playsound(user.loc, 'sound/effects/shieldbash.ogg', 25, 1)
				cooldown = world.time
		else
			..()

/obj/item/weapon/shield/montage/IsReflect(def_zone, hol_dir, hit_dir, mob/M)
	return is_the_opposite_dir(hol_dir, hit_dir)

/obj/item/weapon/shield/montage/Get_shield_chance()
	return block_chance
