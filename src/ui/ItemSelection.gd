@tool

extends OptionButton
@export var shoud_preload: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func load_list(item_list: Array[String]):
	clear()
	for it in item_list:
		add_item(it.capitalize())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Engine.is_editor_hint() and item_count == 0 and shoud_preload:
		load_list(RessourceDefinitions.ALL_RESSOURCES)
	elif item_count == 0:
		load_list(RessourceDefinitions.ALL_RESSOURCES)
