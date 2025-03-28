extends "res://src/buildings/BuildingBase.gd"

@export var start_drone_count = 5
@export var drones: Array[Node2D] = []

func _ready() -> void:
	self.building_name = "dronehub"
	super()


func create_drones(amount:int = 1):
	pass
