extends Object
class_name WorkingOrderProcessor

func process_working_orders(working_orders: Array[WorkingOrder]):
	for it in working_orders:
		var condition_meet:bool = true
		if len(it.order_data["cond"]) > 0:
			condition_meet = are_conditions_meet(it)
		if condition_meet == true:
			if it.building_to_use == null:
				for building_type in RessourceDefinitions.BUILDING_TO_ITEM_MAP:
					if (it.order_data["item"].to_lower().replace(" ", "_") in 
						RessourceDefinitions.BUILDING_TO_ITEM_MAP[building_type]):
						var building_to_place_order: BuildingBase = find_building_to_place_order(building_type)
						if building_to_place_order != null:
							building_to_place_order.add_working_order(it)

func are_conditions_meet(working_order: WorkingOrder) -> bool:
	var conditions: Array[Dictionary] = working_order.order_data["cond"]
	var are_conditions_meet_list: Array[bool] = []
	for it in conditions:
		var item = it[WorkingOrderConditionControl.DATA_KEY_COND_ITEM]
		var amount = it[WorkingOrderConditionControl.DATA_KEY_COND_AMOUNT]
		var total_avaiable_items = BuildingQuery.get_total_output_item_amount(item)
		if (it[WorkingOrderConditionControl.DATA_KEY_COND_VLAUE] == "has_less_then" and 
			amount > total_avaiable_items):
				are_conditions_meet_list.append(true)
		elif(it[WorkingOrderConditionControl.DATA_KEY_COND_VLAUE] == "has_more_then" and
			amount < total_avaiable_items):
				are_conditions_meet_list.append(true)
		elif(it[WorkingOrderConditionControl.DATA_KEY_COND_VLAUE] == "has_exact amount" and
			amount == total_avaiable_items):
				are_conditions_meet_list.append(true)
	return !(false in are_conditions_meet_list)

func find_building_to_place_order(building_type: String):
	var buildings: Array[BuildingBase] = BuildingQuery.get_all_of_type(building_type)
	var building_with_least_orders: BuildingBase = null
	for it in buildings:
		if building_with_least_orders == null:
			building_with_least_orders = it
		if it.get_working_order_count() == 0:
			return it
		else:
			if building_with_least_orders.get_working_order_count() > it.get_working_order_count():
				building_with_least_orders = it
	return building_with_least_orders
			
