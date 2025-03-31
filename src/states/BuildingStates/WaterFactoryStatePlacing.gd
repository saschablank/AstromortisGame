extends "res://src/states/BuildingStates/StatePlacing.gd"


func can_be_placed() -> bool:
	for it in collisions:
		if it.name == "water":
			return true
	return false


func process_state(delta: float):
	super(delta)
