extends "res://src/states/StateBase.gd"

var collisions: Array = []
func process_state(delta: float):
	pass


func target_reached():
	pass


func area_entered(area_2d: Area2D):
	collisions.append(area_2d)


func area_exited(area_2d: Area2D):
	if area_2d in collisions:
		collisions.erase(area_2d)


func can_be_placed() -> bool:
	if len(collisions) > 0:
		return false
	return true	

func process_input(event: InputEvent) -> void:
	pass
