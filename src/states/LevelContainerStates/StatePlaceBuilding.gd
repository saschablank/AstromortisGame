extends "res://src/states/StateBase.gd"

const SOLAR_PANEL = preload("res://scenes/buildings/solarpanel/SolarPanel.tscn")
const DRONE_HUB = preload("res://scenes/buildings/Dronehub/DroneHub.tscn")
const STORAGE = preload("res://scenes/buildings/Storage/Storage.tscn")
const WATERFACTORY = preload("res://scenes/buildings/Waterfactory/Waterfactory.tscn")

var building_to_place: BuildingBase = null


func process_state(delta: float):
	if building_to_place != null:
		var ground_grid: TileMapLayer =  get_parent().get_node("LevelNode/Level/ground_grid")
		if ground_grid != null:
			building_to_place.position = ground_grid.map_to_local(
				ground_grid.local_to_map(
					get_parent().get_global_mouse_position()
					)
				)

	
func process_input(event: InputEvent) -> void:
	if event is InputEventMouse:
		if event.button_mask == MOUSE_BUTTON_LEFT and event.is_pressed() == true:
			if building_to_place.get_active_state().can_be_placed():
				building_to_place._on_state_change("build")
				_on_state_change.emit("default")
				building_to_place = null
		if event.button_mask == MOUSE_BUTTON_RIGHT and event.is_pressed()  == true:
				_on_state_change.emit("default")
				building_to_place.queue_free()
				building_to_place = null
				BuildingQuery.BUILDING_ROOT_NODE = get_parent().get_node("Buildings")


func create_new_building(building_name: String) -> void:
	if building_name == "solar_panel":
		building_to_place = SOLAR_PANEL.instantiate()
	elif building_name == "dronehub":
		building_to_place = DRONE_HUB.instantiate()
	elif building_name == "storage":
		building_to_place = STORAGE.instantiate()
	elif building_name == "waterfactory":
		building_to_place = WATERFACTORY.instantiate()
	if building_to_place != null:
		get_parent().get_node("Buildings").add_child(building_to_place)
		BuildingQuery.BUILDING_ROOT_NODE = get_parent().get_node("Buildings")
