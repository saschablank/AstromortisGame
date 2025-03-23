@tool
extends TileMapLayer
@export var tiles_folder: String = "" 
@export var level: String = ""
@export var is_map_generated = false
static var LEVEL_TO_TILE_COUNT: Dictionary = {
	"level01" : { "x" : 8, "y": 4}
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func generate_map():
	pass

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
			var tiles_images: Array[String] = get_dir_contents(tiles_folder)
			var counter = 0
			tiles_images.sort()
			print("Start generating tilesets for the tilemap")
			if level in LEVEL_TO_TILE_COUNT:
				print(tiles_images)
				if len(tiles_images) == LEVEL_TO_TILE_COUNT[level]["x"] * LEVEL_TO_TILE_COUNT[level]["y"]:
					for y in range(0,LEVEL_TO_TILE_COUNT[level]["y"]):
						for x in range(0, LEVEL_TO_TILE_COUNT[level]["x"]):
							print(tiles_folder + str(counter) + ".png")
							var new_image = ImageTexture.create_from_image(Image.load_from_file( tiles_folder + str(counter) + ".png"))
							counter += 1
							
							var atlas_source: TileSetAtlasSource = TileSetAtlasSource.new()
							var source_id: int = tile_set.add_source(atlas_source)
							atlas_source.texture = new_image
							atlas_source.texture_region_size = Vector2i(1024,1024)
							atlas_source.create_tile(Vector2(0,0))
							
							print(str(x) + " : " + str(y))
							set_cell(Vector2(x,y), source_id, Vector2i(0,0))
					print("TILEMAP GENERATION DONE")
					is_map_generated = true
				else:
					print("TILECOUNT != Image files")
				
			else:
				print("ERROR NO LEVEL IN TILECOUNT MAP FOUND")
			
			
		
