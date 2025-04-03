extends "res://src/states/StateBase.gd"


func _ready() -> void:
	movement_speed = get_parent().drone_speed


func process_state(delta: float):
	var dropoff_location = get_parent().current_order["dropoff"]
	if dropoff_location != null:
		move_to_target(delta, dropoff_location.global_position)


func target_reached():
	_on_state_change.emit("dropoff")
