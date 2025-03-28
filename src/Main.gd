extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LevelContainer.load_level("level01")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
