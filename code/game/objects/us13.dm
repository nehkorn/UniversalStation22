/obj/structure/bed/chair/bench // because we are too good for chairs
	name = "bench"
	desc = "For all of your sitting needs during an alien occupation."
	icon_state = "bench"
	base_icon = "bench"
	anchored = TRUE

/obj/machinery/clock
	name = "trainstation clock"
	icon = 'icons/obj/32x64.dmi'
	icon_state = "clock"
	desc = "I wonder what time it is..."
	anchored = TRUE
	density = TRUE

/obj/structure/trashbin
	name = "trash can"
	desc = "Just a normal trash can."
	icon = 'icons/obj/furniture.dmi'
	icon_state = "bin"
	density = TRUE
	anchored = TRUE

/obj/structure/trashbin/attackby(obj/item/O, mob/user)
	. = ..()
	if(user && O)
		if(!user.unEquip(O, src)) //for some reason this allows it to actually move, hilarious
			return
		O.forceMove(src)

/obj/structure/trashbin/attack_hand(mob/user)
	. = ..()
	if(contents.len)
		var/obj/item/random_item = pick(contents)
		random_item.dropInto(loc)
		user.visible_message(SPAN_NOTICE("[user] grabs [random_item] out from \the [src], gross."), SPAN_NOTICE("You grab [random_item] out from \the [src], gross!"))

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

/obj/item/reagent_containers/food/drinks/cans/breen/New()
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

/obj/structure/traffic_pole
	name = "traffic pole"
	desc = "Used to stop traffic. Used to."
	icon = 'icons/obj/furniture.dmi'
	icon_state = "road_pole"
	anchored = TRUE
	density = FALSE

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
	desc = "This is what trains move on."
	icon_state = "track"

/obj/structure/street_light
	name = "street light"
	icon = 'icons/obj/street.dmi'
	desc = "It is on 24/7, not even the night looks like night anymore."
	icon_state = "streetlamp1"

	density = TRUE
	anchored = TRUE

	layer = ABOVE_HUMAN_LAYER

	/// Brightness of the light when on. Can be negative.
	var/lamp_brightness = 1
	/// Inner range of the light when on. Can be negative
	var/lamp_inner_range = 0.6
	/// Outer range of the light when on. Can be negative.
	var/lamp_outer_range = 7.5

/obj/structure/street_light/Initialize()
	. = ..()
	set_light(lamp_brightness, lamp_inner_range, lamp_outer_range)

/obj/item/gnome
	name = "gnome"
	desc = "Hopefully this one isn't TOO aware..."
	icon_state = "gnome"
	var/supercharged = FALSE

/obj/item/gnome/supercharged
	supercharged = TRUE

/obj/item/gnome/attack(mob/living/M, mob/living/user, target_zone, animate)
	. = ..()
	var/mob/living/carbon/human/victim = M
	if(supercharged)
		victim.gib()
		to_world(SPAN_DANGER("<font size='4'>[pick("ANOTHER POOR SOUL GOT GNOMED.", "HAAH-HE!")]</font>"))

/obj/structure/rustcar
	name = "rusted derelict"
	desc = "A rusted metal chassis of some pre-war machine. What could it be?"
	icon = './icons/medium_vehicles.dmi'
	icon_state = "derelict"
	anchored = TRUE
	density = TRUE

/obj/structure/rustcar/Initialize()
	. = ..()
	color = get_random_colour()
