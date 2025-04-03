extends "res://src/buildings/BuildingBase.gd"

const DRONE = preload("res://scenes/objects/drone/Drone.tscn")

@export var start_drone_count = 5
@export var drones: Array[Drone] = []

func _ready() -> void:
	self.building_name = "dronehub"
	super()


func create_drones(amount:int = 1):
	var rnd = RandomNumberGenerator.new()
	for i in range(0,amount):
		var new_drone = DRONE.instantiate()
		get_parent().get_parent().add_child(new_drone)
		drones.append(new_drone)
		new_drone.global_position =  global_position + Vector2(rnd.randf_range(-64,64), rnd.randf_range(-64,64))
		new_drone.parent_hub = self


func get_free_drone() -> Drone:
	for it in drones:
		if it.is_drone_free() == true:
			return it
	return null
