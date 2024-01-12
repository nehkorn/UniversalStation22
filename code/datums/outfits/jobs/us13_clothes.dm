/obj/item/clothing/under/cp_uniform
	name = "civil protection uniform"
	desc = "The thing to keep under you while you wear that fancy armor."
	icon_state = "cpuniform"
	worn_state = "cpuniform"

/obj/item/clothing/suit/armor/vest/old/security/cpO
	name = "civil protection officer armored vest"
	desc = "The thing that actually keeps the bullets away from your vital organs!"
	icon_state = "cpO"

/obj/item/clothing/mask/cpO
	name = "civil protection officer gasmask"
	desc = "Standard issue, hides your face and protects it from bullets, the whole thing!"
	icon_state = "cpO_helm"
	unique_death = 'sound/voice/sec_death.ogg'
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_PADDED
		)
