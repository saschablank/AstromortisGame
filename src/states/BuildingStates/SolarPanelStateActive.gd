extends "res://src/states/StateBase.gd"

const GameStatics = preload("res://src/GameStatics.gd")
var rnd = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func state_init():
	$"../InfoIcons".set_inactive()
	
func process_state(delta: float):
	if GameStatics.IS_NIGHTTIME == false:
		if GameStatics.CURRENT_WEATHER == GameStatics.WEATHER_SUNNY:
			get_parent().energy_consumption = rnd.randf_range(-48.0,-52.0)
		elif GameStatics.CURRENT_WEATHER == GameStatics.WEATHER_NOT_SUNNY:
			get_parent().energy_consumption = rnd.randf_range(-24.0,-26.0)
		elif GameStatics.CURRENT_WEATHER == GameStatics.WEATHER_NO_SUN:
			get_parent().energy_consumption = 0
	else:
		get_parent().energy_consumption = 0
