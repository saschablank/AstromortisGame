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
	$"../Area2D".scale.y += scale_step
	tick_counter += 1
	

func process_state(delta: float):
	if is_init == false:
		$"../InfoIcons".set_info_icons_active(InfoIcons.INFO_ICON, InfoIcons.BUILD_ICON)
		
		$"../Area2D".scale.y = $"../Area2D".scale.y / GameDefinitions.MAX_BUILDING_TICK
		$"../InfoIcons".scale.y = 1 + tick_counter * scale_step
		scale_step = $"../Area2D".scale.y
		get_parent().add_child(build_tick_timer)
		is_init = true
		build_tick_timer.wait_time = GameDefinitions.BUILDINGS_BUILD_TIMES_TICK[get_parent().building_name]
		build_tick_timer.connect("timeout", _on_timer_tick)
		build_tick_timer.start()
		
	if tick_counter == GameDefinitions.MAX_BUILDING_TICK:
		build_tick_timer.stop()
		get_parent().get_node("InfoIcons").set_inactive()
		_on_state_change.emit("active")
		


func target_reached():
	pass
