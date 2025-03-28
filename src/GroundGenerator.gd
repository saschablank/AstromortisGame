@tool

extends Node2D

const GROUND_TILE = preload("res://scenes/GroundTile.tscn")
@export var tiles_folder: String = "" 
@export var level: String = ""
@export var is_map_generated = true
var level_rect: Rect2 = Rect2(0,0,0,0)
static var LEVEL_TO_TILE_COUNT: Dictionary = {
	"level01" : { "x" : 10, "y": 7 },
	"level02" : { "x" : 8, "y" : 4}
}

static var LEVEL_RECTS = {
	"level01": Rect2(0,0, 10240, 7168)
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_map_generated = false


func get_dir_contents(path) -> Array[String]:
	var dir = DirAccess.open(path)
	var r_tiles: Array[String] = []
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				if file_name.ends_with(".png"):
					r_tiles.append(file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	return r_tiles

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		if tiles_folder.is_empty() == false and level.is_empty() == false and is_map_generated == false:
			if level in LEVEL_TO_TILE_COUNT:
				var tiles_images: Array[String] = get_dir_contents(tiles_folder)
				var counter = 0
				tiles_images.sort()
				print(tiles_images)
				if len(tiles_images) == LEVEL_TO_TILE_COUNT[level]["x"] * LEVEL_TO_TILE_COUNT[level]["y"]:
					for y in range(0,LEVEL_TO_TILE_COUNT[level]["y"]):
						for x in range(0, LEVEL_TO_TILE_COUNT[level]["x"]):
							var new_tile = GROUND_TILE.instantiate()
							new_tile.global_position = Vector2(x * 1024, y * 1024)
							var image = Image.load_from_file("res://levelTiles/level01/" + str(counter)+ ".png")
							new_tile.get_node("Sprite2D").texture = ImageTexture.create_from_image(image)
							add_child(new_tile)
							counter += 1
							print("new _tile added")
					is_map_generated = true
	else:
		if tiles_folder.is_empty() == false and level.is_empty() == false and is_map_generated == false:
			if level in LEVEL_TO_TILE_COUNT:
				var tiles_images: Array[String] = get_dir_contents(tiles_folder)
				var counter = 0
				tiles_images.sort()
				print(tiles_images)
				if len(tiles_images) == LEVEL_TO_TILE_COUNT[level]["x"] * LEVEL_TO_TILE_COUNT[level]["y"]:
					for y in range(0,LEVEL_TO_TILE_COUNT[level]["y"]):
						for x in range(0, LEVEL_TO_TILE_COUNT[level]["x"]):
							var new_tile = GROUND_TILE.instantiate()
							new_tile.global_position = Vector2(x * 1024, y * 1024)
							new_tile.get_node("Sprite2D").texture = load("res://levelTiles/level01/" + str(counter)+ ".png")
							add_child(new_tile)
							counter += 1
							print("new _tile added")
					is_map_generated = true
