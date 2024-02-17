/datum/job/assistant
	title = "Assistant"
	department = "Civilian"
	department_flag = CIV

	total_positions = 0
	spawn_positions = 0
	supervisors = "absolutely everyone"
	economic_power = 1
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	alt_titles = list("Technical Assistant","Medical Intern","Research Assistant","Visitor")
	outfit_type = /decl/hierarchy/outfit/job/assistant

/datum/job/assistant/get_access()
	return list()
