extends "res://src/states/StateBase.gd"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	movement_speed = get_parent().drone_speed


func process_state(delta: float):
	var pickup_building = get_parent().current_order["pickup"]
	if pickup_building != null:
		move_to_target(delta, pickup_building.global_position)


func target_reached():
	_on_state_change.emit("pickup")
