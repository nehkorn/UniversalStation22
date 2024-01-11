/decl/hierarchy/outfit/job/citizen
	name = OUTFIT_JOB_NAME("Citizen")

	uniform = /obj/item/clothing/under/color/blue
	shoes = /obj/item/clothing/shoes/brown

	id_slot = slot_wear_id
	id_types = list(/obj/item/card/id/civilian)
	pda_type = null

/decl/hierarchy/outfit/job/cp
	hierarchy_type = /decl/hierarchy/outfit/job/cp
	l_ear = /obj/item/device/radio/headset/headset_sec/civil_protection
	gloves = /obj/item/clothing/gloves/guards
	uniform = /obj/item/clothing/under/cp_uniform
	glasses = /obj/item/clothing/glasses/sunglasses/sechud
	shoes = /obj/item/clothing/shoes/jackboots
	back = /obj/item/storage/backpack/satchel/sec
	backpack_contents = list(/obj/item/handcuffs = 1)

/decl/hierarchy/outfit/job/cp/civilprotection
	name = OUTFIT_JOB_NAME("Civil Protection Officer")

	suit = /obj/item/clothing/suit/armor/vest/old/security/cpO
	mask = /obj/item/clothing/mask/cpO
