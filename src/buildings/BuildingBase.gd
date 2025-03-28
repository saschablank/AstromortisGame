extends Node
class_name BuildingBase


var states: Dictionary = {}
var active_state = null 
var building_name: String = ""
var energy_consumption: float = 0


func _ready() -> void:
	for it in get_children():
		if it is StateBase:
			states[it.name] = it
	_on_state_change("placing")


func _process(delta: float) -> void:
	if active_state != null:
		active_state.process_state(delta)


func _on_state_change(new_state: String):
	active_state = states[new_state]


func get_active_state():
	return active_state
