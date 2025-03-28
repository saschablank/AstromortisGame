extends Node
class_name EnergySystem

@export var energy_pool: float = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for it in get_parent().get_node("Buildings").get_children():
		if it is BuildingBase:
			energy_pool += it.energy_consumption
