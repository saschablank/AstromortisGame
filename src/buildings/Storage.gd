extends "res://src/buildings/BuildingBase.gd"

var denyed_items: Array[String] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	building_name = "storage"
	energy_consumption = 10
	super()
