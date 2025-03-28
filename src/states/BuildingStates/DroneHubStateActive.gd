extends StateBase

var can_drones_operate: bool = true


func state_init():
	$"../InfoIcons".set_inactive()
	var parent = get_parent()
	if len(parent.drones) == 0:
		parent.create_drones(5)

func process_state(delta: float):
	get_parent().energy_consumption = 10 + (2 * len(get_parent().drones))
	
