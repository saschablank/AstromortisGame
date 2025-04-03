extends Node2D
class_name Drone

var states: Dictionary = {}
var active_state: StateBase = null
var current_order: Dictionary = {}
var parent_hub: BuildingBase = null

@export var drone_speed = 500


func _ready() -> void:
	for it in get_children():
		if it is StateBase:
			states[it.name] = it
			it.state_name = it.name
	_on_state_change("idle")
	$AnimatedSprite2D.play("front")


func set_item_order(pickup_location: BuildingBase, dropoff_location: BuildingBase, item: String, amount: int = 1):
	current_order = {}
	current_order["pickup"] = pickup_location
	current_order["dropoff"] = dropoff_location
	current_order["item"] = item
	current_order["amount"] = amount
	_on_state_change("topickup")


func is_drone_free() -> bool:
	return active_state.name == "backtohub" or active_state.name == "idle"


func _process(delta: float) -> void:
	if active_state != null:
		active_state.process_state(delta)


func _on_target_reached():
	if active_state != null:
		active_state.target_reached()


func _on_state_change(new_state: String):
	if new_state in states:
		if active_state != null:
			active_state.state_leave()
		active_state = states[new_state]
		active_state.state_init()
