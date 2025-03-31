extends Object
class_name BuildingQuery

static var BUILDING_ROOT_NODE: Node2D = null


static func find_closest_building_with_item_in_output(item: String, src_building: BuildingBase ) -> BuildingBase:
	var buildings_with_item: Array[BuildingBase] = get_buildings_with_item(item)
	var closest: BuildingBase = null
	var current_distance = 99999999
	for it in buildings_with_item:
		if it != src_building:
			var dist = it.global_position.distance_to(src_building.global_position)
			if dist < current_distance:
				closest = it
				current_distance = dist
	return closest
	
static func get_buildings_with_item(item: String) ->  Array[BuildingBase]:
	var buildings_with_item: Array[BuildingBase] = []
	for it in BUILDING_ROOT_NODE.get_children():
		if it is BuildingBase:
			if it.local_storage.get_output_item_count(item) > 0:
				buildings_with_item.append(it)
	return buildings_with_item
	
static func order_buildings_by_distance(src_building: BuildingBase, to_sort: Array[BuildingBase]):
	var dist_map = []
	for it in to_sort:
		if it != src_building:
			dist_map.append({"building":it, "dist": it.global_position.distance_to(src_building.global_position)})
	dist_map.sort_custom(func(a:Dictionary, b: Dictionary) -> int: return a.distance < b.distance)
	var buildings: Array[BuildingBase] = []
	for it in dist_map:
		buildings.append(it.keys().building)
	return buildings
	
	

static func find_next_free_drone(src_building: BuildingBase) -> Drone:
	var drone_hubs: Array[BuildingBase] = []
	for it in BUILDING_ROOT_NODE.get_children():
		if( it is BuildingBase and 
				it.building_name == BuildingDefinitions.BUILDING_TYPE_DRONE_HUB and 
				it.get_active_state() != null):
			if it.get_active_state().name == "active":
					drone_hubs.append(it)
	drone_hubs = order_buildings_by_distance(src_building, drone_hubs)
	var r_free_drone = null
	for it in drone_hubs:
		
		r_free_drone = it.get_free_drone()
		if r_free_drone != null:
			return r_free_drone
	return null
	
			
