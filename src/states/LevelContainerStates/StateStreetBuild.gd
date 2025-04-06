extends "res://src/states/StateBase.gd"


var start_pos = null
var end_pos = null
var last_pos = null
var current_pos = null
var ground_layer: TileMapLayer = null
var street_layer: TileMapLayer = null
var path: Array[Vector2] = []


var tilemap_cords_for_straight: Dictionary = {
	Vector2(1,-1) : Vector2(0, 256), 		#right
	Vector2(-1, 1) : Vector2(0, 256), 		#right
	Vector2(-1,-1) : Vector2(768, 256), 	#left
	Vector2(1,1) : Vector2(768, 256) 	#left
}

var tilemap_cords_tileset: Dictionary = {
	Vector2i(0,-1) : Vector2i(0, 2), 		#right
	Vector2i(0, 1) : Vector2i(0, 2), 		#right
	Vector2i(-1,0) : Vector2i(4, 2), 	#left
	Vector2i(1,0) : Vector2i(4, 2) 	#left
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func state_leave():
	pass # create the final street building there

func state_init():
	ground_layer = get_parent().get_node("LevelNode/Level/ground_grid")
	street_layer = get_parent().get_node("LevelNode/Level/streets")

func reset_grid():
	for it in path:
		street_layer.set_cell(it, 0 , Vector2i(-1,-1))
	path.clear()

func get_path_tiles():
	var left:bool = false
	var start_cell: Vector2 = ground_layer.local_to_map(start_pos)
	var mouse_tile: Vector2 = ground_layer.local_to_map(get_parent().get_global_mouse_position())
	if sign(mouse_tile.x -  start_cell.x ) == -1:
		left = true
	var current_tile: Vector2 = start_cell
	while current_tile.x != mouse_tile.x:
		if current_tile.x != mouse_tile.x and current_tile not in path:
			path.append(current_tile)
		current_tile.x += sign(mouse_tile.x - current_tile.x)	
	while current_tile.y != mouse_tile.y:
		if current_tile.y != mouse_tile.y and current_tile not in path:
			path.append(current_tile)
		current_tile.y += sign(mouse_tile.y - current_tile.y)
	return path


func process_state(delta:float):
	if start_pos != null and ground_layer != null:
		last_pos = current_pos
		if last_pos == null:
			last_pos = start_pos
		current_pos = get_parent().get_global_mouse_position()
		var mouse_tile: Vector2 = ground_layer.local_to_map(current_pos)
		var last_pos_tile_center: Vector2 = ground_layer.local_to_map(last_pos)
		if mouse_tile != last_pos_tile_center:
			reset_grid()
			var path: Array[Vector2] = get_path_tiles()	
			var last_dir = null
			for index in range(len(path)):
				if index == 0:
					street_layer.set_cell(path[index], 0, Vector2i(4,2))
				var last_tile:Vector2 = path[index - 1]
				var current_tile: Vector2 = path[index]
				var dir: Vector2i = last_tile.direction_to(current_tile)
				if last_dir != null:
					if last_dir != dir:
						if ((last_dir == Vector2i(-1,0)) and 
								dir == Vector2i(0,1)):
							street_layer.set_cell(last_tile, 0, Vector2i(2,3))	
						if ((last_dir == Vector2i(-1,0)) and 
								dir == Vector2i(0,-1)):
							street_layer.set_cell(last_tile, 0, Vector2i(4,0))
						if ((last_dir == Vector2i(1,0)) and 
								dir == Vector2i(0,1)):
							street_layer.set_cell(last_tile, 0, Vector2i(2,0))	
						if ((last_dir == Vector2i(1,0)) and 
								dir == Vector2i(0,-1)):
							street_layer.set_cell(last_tile, 0, Vector2i(0,3))	
				if dir in tilemap_cords_tileset:
					street_layer.set_cell(current_tile, 0, tilemap_cords_tileset[dir])
				last_dir = dir


func click():
	if start_pos == null:
		start_pos = get_parent().get_global_mouse_position()
	else:
		_on_state_change.emit("default")
		start_pos = null
		end_pos = null
		

func process_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_mask == MOUSE_BUTTON_LEFT and event.is_pressed() == true:
			click()
