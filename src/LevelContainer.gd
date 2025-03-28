extends Node2D

const GroundGenerator = preload("res://src/GroundGenerator.gd")

var states: Dictionary = {}
var active_state: StateBase = null
@onready var main_camera = $Camera2D


func _ready() -> void:
	for it in get_children():
		if it is StateBase:
			states[it.name] = it


func load_level(level_name: String):
	active_state = states["load_level"]
	active_state.set_level_to_load(level_name, $LevelNode)
	var level_rect: Rect2 = GroundGenerator.LEVEL_RECTS[level_name]
	self.main_camera.level_rect = level_rect


func _process(delta: float) -> void:
	if active_state != null:
		active_state.process_state(delta)


func _on_state_change(new_state: String):
	if active_state.name == "load_level":	
		self.main_camera.position = self.main_camera.level_rect.position + (self.main_camera.level_rect.size / 2)	
	active_state = states[new_state]


func _on_main_ui__on_building_pressed(building_name: String) -> void:
	_on_state_change("place_building")
	active_state.create_new_building(building_name)


func _input(event: InputEvent) -> void:
	if active_state != null:
		active_state.process_input(event)
