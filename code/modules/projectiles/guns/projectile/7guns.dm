/obj/item/gun/projectile/boltaction // MASTER OBJ
	name = "bolt action rifle"
	icon = 'icons/obj/guns/7guns.dmi'
	w_class = ITEM_SIZE_LARGE
	origin_tech = list(TECH_COMBAT = 2)
	caliber = CALIBER_RIFLE_MILITARY
	slot_flags = SLOT_BACK
	force = 20
	ammo_type = /obj/item/ammo_casing/rifle/military
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING|SPEEDLOADER
	max_shells = 5
	accuracy = 4
	scope_zoom = 0
	scoped_accuracy = 0
	var/bolt_open = FALSE

/obj/item/ammo_magazine/speedloader/clip/seven
	name = "rifle stripper clip"
	desc = "A stripper clip for rifle caliber weapons."
	icon_state = "clip"
	caliber = CALIBER_RIFLE_MILITARY
	ammo_type = /obj/item/ammo_casing/rifle/military
	matter = list(MATERIAL_STEEL = 1800)
	max_ammo = 5
	multiple_sprites = 1

/obj/item/gun/projectile/boltaction/on_update_icon()
	..()
	if(bolt_open)
		icon_state = "[initial(icon_state)]-open"
	else
		icon_state = "[initial(icon_state)]"

/obj/item/gun/projectile/boltaction/handle_post_fire(mob/user, atom/target, var/pointblank=0, var/reflex=0)
	..()
	if(user && user.skill_check(SKILL_WEAPONS, SKILL_MASTER))
		to_chat(user, "<span class='notice'>You work the bolt open with a reflexive motion, ejecting [chambered]!</span>")
		unload_shell()

/obj/item/gun/projectile/boltaction/proc/unload_shell()
	if(chambered)
		if(!bolt_open)
			playsound(src.loc, 'sound/weapons/guns/interaction/rifle_boltback.ogg', 50, 1)
			bolt_open = TRUE
		chambered.dropInto(src.loc)
		loaded -= chambered
		chambered = null

/obj/item/gun/projectile/boltaction/attack_self(mob/user as mob)
	bolt_open = !bolt_open
	if(bolt_open)
		if(chambered)
			to_chat(user, "<span class='notice'>You work the bolt open, ejecting [chambered]!</span>")
			unload_shell()
		else
			to_chat(user, "<span class='notice'>You work the bolt open.</span>")
		playsound(src.loc, 'sound/weapons/guns/interaction/rifle_boltback.ogg', 50, 1)
	else
		to_chat(user, "<span class='notice'>You work the bolt closed.</span>")
		playsound(src.loc, 'sound/weapons/guns/interaction/rifle_boltforward.ogg', 50, 1)
		bolt_open = FALSE
	add_fingerprint(user)
	update_icon()

/obj/item/gun/projectile/boltaction/special_check(mob/user)
	if(bolt_open)
		to_chat(user, "<span class='warning'>You can't fire [src] while the bolt is open!</span>")
		return FALSE
	return ..()

/obj/item/gun/projectile/boltaction/load_ammo(var/obj/item/A, mob/user)
	if(!bolt_open)
		return
	..()

/obj/item/gun/projectile/boltaction/unload_ammo(mob/user, var/allow_dump=1)
	if(!bolt_open)
		return
	..()

// techian

/obj/item/gun/projectile/boltaction/maynard
	name = "Maynard-9 bolt-action rifle"
	desc = "The ninth iteration of the Maynard-brand bolt-action rifle. The other eight were decomissioned due to a large amount of jamming complaints."
	icon_state = "maynard9"
	item_state = "boltaction"
	wielded_item_state = "boltaction-wielded"
