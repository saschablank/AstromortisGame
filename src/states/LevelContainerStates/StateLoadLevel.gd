extends "res://src/states/StateBase.gd"

static var LEVEL_MAP: Dictionary = {
	"level01": "res://scenes/level01/Level.tscn",
	"level02": "res://scenes/level03/Level.tscn"
}


@export var is_level_loaded: bool = false
@export var level_to_load: String = ""
@export var level_node_to_use: Node2D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	name = "load_level"
	state_owner = get_parent()

func set_level_to_load(level_name: String, level_node: Node2D):
	level_to_load = level_name
	level_node_to_use = level_node

func process_state(delta: float):
	if is_level_loaded == false and level_to_load.is_empty() == false:
		if level_to_load in LEVEL_MAP:
			var new_level = load(LEVEL_MAP[level_to_load]).instantiate()
			level_node_to_use.add_child(new_level)
			_on_state_change.emit("default")
