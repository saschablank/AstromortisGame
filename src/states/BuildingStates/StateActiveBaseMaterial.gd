extends "res://src/states/StateBase.gd"


var prod_timer = Timer.new()
var active_recipie = ""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(prod_timer)
	prod_timer.connect("timeout", production_tick)
	
func state_init():
	prod_timer.wait_time = RessourceDefinitions.MANUFACTORING_TIME_MAP[active_recipie]


func production_tick():
	var storage: LocalStorage = get_parent().local_storage
	var water_amount = RessourceDefinitions.RECIPIE_OUTPUT_AMOUNT[active_recipie]
	storage.add_output_item(active_recipie, water_amount)


func process_state(delta: float):
	if prod_timer.is_stopped() == true:
		prod_timer.start()
