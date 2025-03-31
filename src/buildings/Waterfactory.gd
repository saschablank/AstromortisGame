extends "res://src/buildings/BuildingBase.gd"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	building_name = "waterfactory"
	energy_consumption = 15
	super()
	var active_state_which_needs_recipie = states["active"]
	active_state_which_needs_recipie.active_recipie = RessourceDefinitions.DRINKING_WATER
