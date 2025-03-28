extends "res://src/buildings/BuildingBase.gd"



func _ready() -> void:
	building_name = "solarpanel"
	var rnd = RandomNumberGenerator.new()
	#energy_consumption = rnd.randf_range(-48.0,-52.0)
	super()
