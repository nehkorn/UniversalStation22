/decl/hierarchy/outfit/job/citizen
	name = OUTFIT_JOB_NAME("Citizen")
	hierarchy_type = /decl/hierarchy/outfit/job/citizen

	uniform = /obj/item/clothing/under/color/blue
	shoes = /obj/item/clothing/shoes/black

	id_slot = slot_wear_id
	id_types = list(/obj/item/card/id/civilian)
	pda_type = null

/decl/hierarchy/outfit/job/cp
	hierarchy_type = /decl/hierarchy/outfit/job/cp
	l_ear = /obj/item/device/radio/headset/headset_sec // TODO: replace with CP headset
	gloves = /obj/item/clothing/gloves/guards
	uniform = /obj/item/clothing/under/cp_uniform
	glasses = /obj/item/clothing/glasses/sunglasses/sechud
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(/obj/item/handcuffs = 1)

/decl/hierarchy/outfit/job/cp/civilprotection
	name = OUTFIT_JOB_NAME("CP Officer")
	hierarchy_type = /decl/hierarchy/outfit/job/cp/civilprotection

	suit = /obj/item/clothing/suit/armor/vest/old/security/cpO
	mask = /obj/item/clothing/mask/cpO
