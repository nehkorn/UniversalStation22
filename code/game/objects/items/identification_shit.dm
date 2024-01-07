/obj/item/social_badge
	name = "class badge"
	desc = "A badge showing what social class you belong to."
	item_state = "silver"
	var/social_class = SOCIAL_CLASS_MED
	var/owner
	w_class = ITEM_SIZE_TINY

/obj/item/social_badge/Initialize()
	. = ..()
	if(social_class)
		switch(social_class)
			if(SOCIAL_CLASS_MIN)
				icon_state = "bronze"
			if(SOCIAL_CLASS_MED)
				icon_state = "silver"
			if(SOCIAL_CLASS_HIGH)
				icon_state = "gold"
			if(SOCIAL_CLASS_MAX)
				icon_state = "plat"

/obj/item/social_badge/examine(mob/user, distance)
	. = ..()
	if(owner && social_class)
		to_chat(user, "This one seems to belong to <b>[owner]</b>.")
		to_chat(user, "It says that they are <b>a [social_class]</b>, a <b>[get_social_class_level_Global(social_class)]</b> class.")

/obj/item/social_badge/attack_self(mob/user)
	. = ..()
	user.visible_message("\The [user] shows you: [icon2html(src, viewers(get_turf(src)))]: [src.name]. In bold letters there is written: <b>'[social_class]'</b>.",\
		"You flash your badge: [icon2html(src, viewers(get_turf(src)))]: [src.name]. In bold letters there is written: <b>'[social_class]'</b>.")
	src.add_fingerprint(user)
	return
