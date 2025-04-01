@tool

extends OptionButton
class_name ConditionOptionBtn



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func load_list(list: Array[String]):
	clear()
	for it in list:
		add_item(it.capitalize())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Engine.is_editor_hint() and item_count == 0:
		load_list(WorkingOrder.WORKING_ORDER_CONDITIONS)
	elif item_count == 0:
		load_list(WorkingOrder.WORKING_ORDER_CONDITIONS)
