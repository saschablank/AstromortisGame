extends "res://src/states/StateBase.gd"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func state_leave():
	$"../InfoIcons".set_inactive()	

func state_init():
	$"../InfoIcons".set_info_icons_active(InfoIcons.WARNING_ICON, InfoIcons.NO_ENERGY_ICON)
