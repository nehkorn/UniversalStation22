/obj/structure/bed/chair/bench // because we are too good for chairs
	name = "bench"
	desc = "For all of your sitting needs during an alien occupation."
	icon_state = "bench"
	base_icon = "bench"

/obj/machinery/clock
	name = "trainstation clock"
	icon = 'icons/obj/32x64.dmi'
	icon_state = "clock"
	desc = "I wonder what time it is..."

/obj/structure/trashbin
	name = "trash can"
	icon = 'icons/obj/furniture.dmi'
	icon_state = "bin"

/obj/structure/trashbin/examine(mob/user)
	. = ..()
	if(ishuman(user))
		var/mob/living/carbon/human/examinator
		if(examinator.social_class)
			switch(examinator.social_class)
				if(SOCIAL_CLASS_LOW)
					to_chat(examinator, "Those CP assholes keep telling me to pick up cans and then put them in these.")
				if(SOCIAL_CLASS_MED)
					to_chat(examinator, "Hehehe, I keep telling citizens to put cans into these.")
				if(SOCIAL_CLASS_HIGH)
					to_chat(examinator, "My fucking goons keep telling citizens to put cans into these.")
				else
					to_chat(examinator, "Just a normal trash can.")

/obj/machinery/clock/examine(mob/user, distance)
	. = ..()
	to_chat(user, SPAN_NOTICE("The time is [stationtime2text()]."))

/obj/machinery/vending/sovietsoda/breen // too lazy
	name = "Dr. Breen's Private Reserve"
	desc = "I wonder who this Breen is..."
	icon = 'icons/obj/32x64.dmi'
	icon_state = "breen_vend"
	products = list(/obj/item/reagent_containers/food/drinks/breen = 50)

/obj/machinery/vending/sovietsoda/breen/Initialize(mapload, d, populate_parts)
	. = ..()
	icon_deny = initial(icon_state)
	icon_vend = initial(icon_state)

/obj/item/reagent_containers/food/drinks/breen
	name = "canned water"
	desc = "Water. In a can! Provided to you by Dr. Breen."
	icon_state = "breen_blu"
	center_of_mass = "x=16;y=10"

/obj/item/reagent_containers/food/drinks/cans/breen/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/water, 30) // TODO: new reagent for breen watah

/obj/structure/phone_booth
	name = "phone booth"
	desc = "Looks like you could phone someone with this... as if!"
	icon = 'icons/obj/furniture.dmi'
	icon_state = "phone"
	anchored = TRUE
	density = TRUE
	var/random_num = TRUE
	var/phone_number // TODO: make phones actually be phonable

/obj/structure/phone_booth/Initialize()
	. = ..()
	if(random_num)
		phone_number = rand(1, 999)

/obj/structure/cmb_ffprojector // indestructible version
	name = "forcefield projector"
	desc = "Used by the Combine to make gates or just keep people out of places they don't want them to be. This one looks pretty sturdy..."
	icon = 'icons/turf/walls.dmi'
	icon_state = "cmb_forcefieldON"
	breakable = FALSE
	density = TRUE
	anchored = TRUE

/obj/structure/cmb_ffprojector/off
	desc = "This one is off."
	icon_state = "cmb_forceifledOFF"

/obj/structure/cmb_forcefield
	name = "forcefield"
	desc = "Used by the Combine to make gates or just keep people out of places they don't want them to be."
	icon = 'icons/turf/walls.dmi'
	icon_state = "cmb_forcefield"
	breakable = FALSE
	density = TRUE
	anchored = TRUE

/obj/structure/cmb_forcefield/CanPass(atom/movable/mover, turf/target, height, air_group)
	return FALSE

/obj/structure/train_track
	name = "train track"
	icon = 'icons/obj/224x32.dmi'
	icon_state = "track"
