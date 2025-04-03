extends "res://src/states/StateBase.gd"

var start_pos = null
var end_pos = null
var last_pos = null
var current_pos = null
var ground_layer: TileMapLayer = null
var tilemap_cords_for_straight: Dictionary = {
	Vector2(1,-1) : Vector2(0, 256), 		#right
	Vector2(-1, 1) : Vector2(0, 256), 		#right
	Vector2(-1,-1) : Vector2(768, 256), 	#left
	Vector2(1,1) : Vector2(768, 256) 	#left
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func state_leave():
	pass # create the final street building there

func state_init():
	ground_layer = get_parent().get_node("LevelNode/Level/ground_grid")

func process_state(delta:float):
	if start_pos != null and ground_layer != null:
		last_pos = current_pos
		current_pos = get_parent().get_global_mouse_position()
		var current_tile_center: Vector2 = ground_layer.local_to_map(current_pos)
		var last_pos_tile_center: Vector2 = ground_layer.local_to_map(last_pos)
		if current_tile_center != last_pos_tile_center:
			print(current_tile_center.distance_to(last_pos_tile_center) * current_tile_center.direction_to(last_pos_tile_center))
		
	

func click():
	if start_pos == null:
		pass
	else:
		_on_state_change.emit("default")


func process_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_mask == MOUSE_BUTTON_LEFT and event.is_pressed() == true:
			click()
