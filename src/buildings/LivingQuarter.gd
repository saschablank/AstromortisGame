extends "res://src/buildings/BuildingBase.gd"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	energy_consumption = 20
	building_name = "living_quarters"
	super()
