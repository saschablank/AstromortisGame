extends Node2D
class_name BuildingBase

const LocalStorage = preload("res://src/buildings/LocalStorage.gd")

var states: Dictionary= {}
var active_state = null 
var building_name: String = ""
var energy_consumption: float = 0
var local_storage: LocalStorage = LocalStorage.new()
#var working_orders: Workorders = []

func _ready() -> void:
	for it in get_children():
		if it is StateBase:
			states[it.name] = it
			it.state_name = it.name
	_on_state_change("placing")
	$Area2D/AnimatedSprite2D.play("default")
	local_storage.parent_building = self
	


func _process(delta: float) -> void:
	if active_state != null:
		active_state.process_state(delta)


func _input(event: InputEvent) -> void:
	if active_state != null:
		active_state.process_input(event)


func _on_state_change(new_state: String):
	if active_state != null:
		active_state.state_leave()
	active_state = states[new_state]
	active_state.state_init()


func get_active_state() -> StateBase:
	return active_state
