extends Node
class_name EnergySystem

@export var energy_production: float = 0
@export var energy_consumption: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var buildings = get_parent().get_node("Buildings").get_children()
	energy_consumption = 0
	energy_production = 0
	for it in buildings:
		if it is BuildingBase:
			if it.energy_consumption < 0 and it.get_active_state().state_name == "active":
				energy_production += abs(it.energy_consumption)
			else:
				energy_consumption += it.energy_consumption
	if energy_production < energy_consumption:
		buildings.reverse()
		for it in buildings:
			if it is BuildingBase:
				if it.get_active_state().state_name == "active" and it.energy_consumption > 0:
					it._on_state_change("nopower")
					break
	else:
		for it in buildings:
			if it is BuildingBase:
				if it != null and it.get_active_state() != null:
					if it.get_active_state().name == "nopower":
						it._on_state_change("active")
						print("STATE CHANGED FROM NO POWER TO ACTIVE")
						break
