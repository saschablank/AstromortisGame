extends "res://src/states/StateBase.gd"

const BuildingDefinitions = preload("res://src/BuildingDefinitions.gd")

var tick_counter: int = 0
var build_tick_timer: Timer = Timer.new()
var scale_step = 0
var is_init: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _on_timer_tick():
	get_parent().scale.y += scale_step
	tick_counter += 1

func process_state(delta: float):
	if is_init == false:
		print(get_parent().scale.y)
		get_parent().scale.y = get_parent().scale.y / GameDefinitions.MAX_BUILDING_TICK
		scale_step = get_parent().scale.y
		print(get_parent().scale.y)
		get_parent().add_child(build_tick_timer)
		is_init = true
		build_tick_timer.wait_time = GameDefinitions.BUILDINGS_BUILD_TIMES_TICK[get_parent().building_name]
		build_tick_timer.connect("timeout", _on_timer_tick)
		build_tick_timer.start()
		
	if tick_counter == GameDefinitions.MAX_BUILDING_TICK:
		build_tick_timer.stop()
		_on_state_change.emit("active")
		


func target_reached():
	pass
