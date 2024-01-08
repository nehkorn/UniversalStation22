/obj/structure/bed/chair/bench // because we are too good for chairs
	name = "bench"
	desc = "For all of your sitting needs during an alien occupation."
	icon_state = "bench_c"

/obj/machinery/clock
	name = "trainstation clock"
	icon = 'icons/obj/32x64.dmi'
	icon_state = "clock"
	desc = "I wonder what time it is..."

/obj/machinery/clock/examine(mob/user, distance)
	. = ..()
	to_chat(user, SPAN_NOTICE("The time is [stationtime2text()]."))

/obj/machinery/vending/sovietsoda/breen // too lazy
	name = "Dr. Breen's Private Reserve"
	desc = "I wonder who this Breen is..."
	icon = 'icons/obj/32x64.dmi'
	icon_state = "breen_vend"
	icon_deny = icon_state
	icon_vend = icon_state
	products = list(/obj/item/reagent_containers/food/drinks/breen = 50)

/obj/item/reagent_containers/food/drinks/breen
	name = "canned water"
	desc = "Water. In a can! Provided to you by Dr. Breen."
	icon_state = "breen_blu"
	center_of_mass = "x=16;y=10"

/obj/item/reagent_containers/food/drinks/cans/breen/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/water, 30) // TODO: new reagent for breen watah
