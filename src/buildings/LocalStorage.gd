extends Object
class_name LocalStorage
const BuildingBase = preload("res://src/buildings/BuildingBase.gd")


var parent_building:BuildingBase = null
var order_update_timer: Timer = Timer.new()
var output_items: Array[String] = []
var input_items: Array[String] = []
var item_orders: Array[String] = []
var item_ready_for_pickup: Array[String] = []
var processed_item_order: Array[String] = []


func _init():
	var rnd: RandomNumberGenerator = RandomNumberGenerator.new()
	order_update_timer.wait_time = rnd.randf_range(0.2, 0.5)
	order_update_timer.connect("timeout", _on_update_orders)
	parent_building.add_child(order_update_timer)


func start_timer() -> void:
	order_update_timer.start()


func get_output_item_count(item: String) -> int:
	var counter = 0
	for it in output_items:
		if it == item:
			counter += 1
	return counter 


func _on_update_orders() -> void:
	var to_delete_order = []
	for item_order in item_orders:
		var closest_building = BuildingQuery.find_closest_building_with_item_in_output(item_order, parent_building)
		if closest_building != null:
			var free_drone = BuildingQuery.find_next_free_drone(parent_building)
			if free_drone != null:
				if item_order in RessourceDefinitions.DRONE_TRANSPORT_AMOUNT:
					free_drone.set_order_data(closest_building, parent_building,item_order,
						RessourceDefinitions.DRONE_TRANSPORT_AMOUNT[item_order])
					for i in range(RessourceDefinitions.DRONE_TRANSPORT_AMOUNT[item_order]):
						closest_building.building_object.storage.move_item_to_pickout(item_order)
				else:
					free_drone.set_order_data(closest_building, parent_building,item_order,1)
					closest_building.storage.move_item_to_pickout(item_order)
				to_delete_order.append(item_order)
				processed_item_order.append(item_order)
	for it in to_delete_order:
		item_orders.erase(it)


func get_input_item_count(item: String) -> int:
	var counter = 0
	for it in input_items:
		if it == item:
			counter += 1
	return counter 
	

func has_item_in_output(item: String) -> bool:
	return item in output_items


func get_item_order_count(item: String) -> int:
	var counter = 0
	for it in item_orders:
		if it == item:
			counter += 1
	for it in processed_item_order:
		if it == item:
			counter += 1
	return counter


func add_item_order(item: String, amount: int) -> void:
	for i in range(0, amount):
		var item_order_item_count = get_item_order_count(item)
		if item_order_item_count < amount:
			item_orders.append(item)
		else:
			break


func remove_input_items(item: String, amout: int) -> void:
	var to_remove = []
	var counter = 0
	for i in range(0,amout):
		remove_input_item(item)


func remove_input_item(item: String) -> void:
	var to_delete = null
	for it in input_items:
		if it == item:
			to_delete = it
			break
	input_items.erase(to_delete)


func _move_item_from_list_to_list(item: String, l1: Array, l2: Array) -> bool:
	var succses: bool = false
	var to_remove = null
	if item != null:
		for it in l1:
			if it == item:
				to_remove = it
				l2.append(item)
				succses = true
				break
		l1.erase(to_remove)
	return succses


func move_all_input_to_output() -> void:
	for it in input_items:
		add_output_item(it,1)
	input_items.clear()


func move_item_to_pickout(item: String) -> bool: 
	return _move_item_from_list_to_list(item, output_items, item_ready_for_pickup)


func move_item_to_output(item: String) -> bool:
	return _move_item_from_list_to_list(item, input_items, output_items)


func remove_from_pickup(item: String) -> void:
	var to_delete = null
	for it in item_ready_for_pickup:
		if it == item:
			to_delete = it
	item_ready_for_pickup.erase(to_delete)


func remove_processed_item_order(item: String) -> void:
	var to_remove = null
	if item != null:
		for it in processed_item_order:
			if it == item:
				to_remove = item
				break
	processed_item_order.erase(to_remove)


func add_input_item(item: String) -> void:
	input_items.append(item)
	remove_processed_item_order(item)


func add_output_item(item:String, amount: int = 1) -> void:
	for i in range(0, amount):
		output_items.append(item)


func get_save_game_data():
	var items = []
	for item in output_items:
		items.append({"name": item, "is_output": true})
	for item in input_items:
		items.append({"name": item, "is_output": false})
	return items


func load_from_save_game_data(save_game_data):
	for item in save_game_data:
		if item["is_output"] == true:
			add_output_item(item["name"])
		else:
			add_input_item(item["name"])
