/obj/item/key
	name = "key"
	desc = "Used to unlock things."
	icon = 'icons/obj/items.dmi'
	icon_state = "keys"
	w_class = 1
	var/key_data = ""

/obj/item/key/medbay
	name = "civilian medbay key"
	desc = "Used to unlock the doors of the citizen medbay."
	key_data = "CivMedbay"

/obj/item/key/New(var/newloc,var/data)
	if(data)
		key_data = data
	..(newloc)

/obj/item/key/proc/get_data(var/mob/user)
	return key_data

/obj/item/key/soap
	name = "soap key"
	desc = "a fragile key made using a bar of soap."
	var/uses = 0

/obj/item/key/soap/get_data(var/mob/user)
	uses--
	if(uses == 1)
		to_chat(user, "<span class='warning'>\The [src] is going to break soon!</span>")
	else if(uses <= 0)
		to_chat(user, "<span class='warning'>\The [src] crumbles in your hands.</span>")
		qdel(src)
	return ..()
