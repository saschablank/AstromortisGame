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
