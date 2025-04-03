extends "res://src/states/StateBase.gd"




func state_init():
	var order = get_parent().current_order
	var dropoff_dest: BuildingBase = order["dropoff"]
	for i in range(1,order["amount"]):
		dropoff_dest.local_storage.add_input_item(order["item"])


func process_state(delta: float):
	_on_state_change.emit("backtohub")
