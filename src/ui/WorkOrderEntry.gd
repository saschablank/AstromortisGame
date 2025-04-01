extends HBoxContainer

signal _on_edit_working_order(working_order: WorkingOrder)
signal _on_delete_working_order(working_order: WorkingOrder)

var work_order: WorkingOrder

func _ready() -> void:
	pass
	
func load_data(p_work_order: WorkingOrder):
	if p_work_order != null:
		work_order = p_work_order

	for it in work_order.order_data:
		var node = get_node(it)
		if node is Label:
			node.text = str(work_order.order_data[it])
		if node is LineEdit:
			node.text = str(work_order.order_data[it])
		if node is Button:
			node.text = str(work_order.order_data[it])
		if node is OptionButton: # BUGGY
			for index in range(0,node.item_count):
				if work_order.order_data[it] == node.get_item_text(index):
					node.selected = index

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_edit_pressed() -> void:
	_on_edit_working_order.emit(work_order)


func _on_delete_pressed() -> void:
	_on_delete_working_order.emit(work_order)
