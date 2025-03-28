extends "res://src/states/StateBase.gd"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func process_state(delta: float):
	pass


func target_reached():
	pass


func area_entered(area_2d: Area2D):
	pass


func area_exited(area_2d: Area2D):
	pass


func process_input(event: InputEvent) -> void:
	pass
	
func state_init():
	$"../InfoIcons".set_info_icons_active(InfoIcons.WARNING_ICON, InfoIcons.NO_ENERGY_ICON)
