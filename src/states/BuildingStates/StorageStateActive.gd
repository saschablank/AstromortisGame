extends "res://src/states/StateBase.gd"


var timer: Timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(timer)
	timer.connect("timeout", storage_tick)


func state_leave():
	timer.stop()


func storage_tick():
	for item in RessourceDefinitions.ALL_RESSOURCES:
		if item not in get_parent().denyed_items:
			var building_with_item: BuildingBase = (
					BuildingQuery.find_closest_building_with_item_in_output(item, get_parent())
				)
			if building_with_item != null:
				if item == RessourceDefinitions.OXYGEN or item == RessourceDefinitions.DRINKING_WATER:
					building_with_item.local_storage.add_item_order(item, 100)
				else:
					building_with_item.local_storage.add_item_order(item, 1)

func process_state(delta: float) -> void:
	if timer.is_stopped() == true:
		timer.wait_time = 3
		timer.start()
		
