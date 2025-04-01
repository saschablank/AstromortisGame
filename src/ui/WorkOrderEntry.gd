extends HBoxContainer

signal _on_edit_working_order(working_order: WorkingOrder)
signal _on_delete_working_order(working_order: WorkingOrder)

var work_order: WorkingOrder

func _ready() -> void:
	pass
	
func load_data(p_work_order: WorkingOrder):
	if p_work_order != null:
		work_order = p_work_order
		$workingOrderText.text = work_order.get_working_order_text()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_edit_pressed() -> void:
	_on_edit_working_order.emit(work_order)


func _on_delete_pressed() -> void:
	_on_delete_working_order.emit(work_order)
