extends "res://src/states/StateBase.gd"


var prod_timer = Timer.new()
var active_recipie = ""


func _ready() -> void:
	add_child(prod_timer)
	prod_timer.connect("timeout", production_tick)
	
func state_init():
	prod_timer.wait_time = RessourceDefinitions.MANUFACTORING_TIME_MAP[active_recipie]


func production_tick():
	print("production_tick")
	var storage: LocalStorage = get_parent().local_storage
	var item_amount = RessourceDefinitions.RECIPIE_OUTPUT_AMOUNT[active_recipie]
	storage.add_output_item(active_recipie, item_amount)
	get_parent().active_working_order.to_produce -= item_amount
	if get_parent().active_working_order.to_produce <= 0:
		get_parent().remove_working_order(get_parent().active_working_order)
		print("order fullfilled")


func process_state(delta: float):
	if get_parent().active_working_order != null:
		if prod_timer.is_stopped() == true:
			prod_timer.start()
	else:
		prod_timer.stop()
