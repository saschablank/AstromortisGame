extends "res://src/states/StateBase.gd"


func state_init():
	var order = get_parent().current_order
	var pickup_dest: BuildingBase = order["pickup"]
	for i in range(1,order["amount"]):
		pickup_dest.local_storage.remove_from_pickup(order["item"])


func process_state(delta: float):
	_on_state_change.emit("todropoff")
