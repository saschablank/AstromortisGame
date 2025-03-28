extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LevelContainer.load_level("level01")
