extends "res://src/states/StateBase.gd"


func _ready() -> void:
	movement_speed = get_parent().drone_speed

func process_state(delta: float):
	if get_parent().parent_hub != null:
		move_to_target(delta, get_parent().parent_hub.global_position)


func target_reached():
	_on_state_change.emit("idle")
