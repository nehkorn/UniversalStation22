// CITIZENS

/datum/job/citizen
	title = "Citizen"
	department = "Civilians"
	social_class = SOCIAL_CLASS_LOW

	min_skill = list( // untrained scum
		SKILL_COMBAT = SKILL_BASIC,
		SKILL_WEAPONS = SKILL_BASIC)

	total_positions = -1
	spawn_positions = -1
	supervisors = "civil protection"

	outfit_type = /decl/hierarchy/outfit/job/citizen

/datum/job/citizen/worker
	title = "Factory Worker"

	total_positions = 5
	spawn_positions = 5
	supervisors = "civil protection and the Factory Overseer"

	access = list(access_manufacturing)

	outfit_type = /decl/hierarchy/outfit/job/citizen/worker

// COPS

/datum/job/cp_rankleader
	title = "Civil Protection Rank Leader"
	department = "Civil Protection"
	supervisors = "the Administrator"
	req_admin_notify = 1
	social_class = SOCIAL_CLASS_COM

	min_skill = list( // shouldnt be out in the field much
		SKILL_BUREAUCRACY = SKILL_EXPERIENCED,
		SKILL_COMBAT = SKILL_EXPERIENCED,
		SKILL_WEAPONS = SKILL_EXPERIENCED,
		SKILL_FORENSICS = SKILL_EXPERIENCED)

	total_positions = 1
	spawn_positions = 1

	outfit_type = /decl/hierarchy/outfit/job/cp/rankleader

/datum/job/cp_elite
	title = "Civil Protection Elite"
	department = "Civil Protection"
	supervisors = "rank leader"
	social_class = SOCIAL_CLASS_MED

	min_skill = list(
		SKILL_COMBAT = SKILL_TRAINED,
		SKILL_WEAPONS = SKILL_EXPERIENCED,
		SKILL_FORENSICS = SKILL_TRAINED)

	total_positions = 3
	spawn_positions = 3

	outfit_type = /decl/hierarchy/outfit/job/cp/elite

/datum/job/cp_officer
	title = "Civil Protection Officer"
	department = "Civil Protection"
	supervisors = "elites and the rank leader"
	social_class = SOCIAL_CLASS_MED

	min_skill = list(
		SKILL_COMBAT = SKILL_TRAINED,
		SKILL_WEAPONS = SKILL_TRAINED,
		SKILL_FORENSICS = SKILL_BASIC)

	total_positions = 5
	spawn_positions = 3

	outfit_type = /decl/hierarchy/outfit/job/cp/civilprotection

// CITY COMMAND

var/datum/announcement/minor/ca_announcement = new(do_newscast = 1)

/datum/job/cityadmin
	title = "City Administrator"
	department = "City Command"
	supervisors = "Combine officials and the Earth Administrator"
	social_class = SOCIAL_CLASS_MAX

	access = list()
	minimal_access = list()

	total_positions = 1
	spawn_positions = 1

	//outfit_type = /decl/hierarchy/outfit/job/earthadministrator

/datum/job/cityadmin/get_access()
	return get_all_station_access()

/datum/job/overwatch_elite
	title = "Overwatch Elite"
	department = "City Command"
	supervisors = "the City Administrator"
	social_class = SOCIAL_CLASS_HIGH

	access = list()
	minimal_access = list()

	total_positions = 2
	spawn_positions = 2

	min_skill = list( //killing machine
		SKILL_BUREAUCRACY = SKILL_UNTRAINED,
		SKILL_COMBAT = SKILL_MASTER,
		SKILL_WEAPONS = SKILL_MASTER,
		SKILL_FORENSICS = SKILL_UNTRAINED)

	//outfit_type = /decl/hierarchy/outfit/job/overwatch_elite

/datum/job/overwatch_elite/get_access()
	return get_all_station_access()
