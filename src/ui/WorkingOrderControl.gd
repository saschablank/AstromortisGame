extends Control
class_name WorkingOrderControl

const WORK_ORDER_ENTRY = preload("res://scenes/ui/WorkOrderEntry.tscn")

var working_orders: Array[WorkingOrder] = []


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_data():
	for it in $Panel/ScrollContainer/VBoxContainer.get_children():
		it.queue_free()
	for it in working_orders:
		var new_entry = WORK_ORDER_ENTRY.instantiate()
		$Panel/ScrollContainer/VBoxContainer.add_child(new_entry)
		new_entry.connect("_on_edit_working_order", _on_working_order_edit_beginn)
		new_entry.connect("_on_delete_working_order", _on_delete_working_order)
		new_entry.load_data(it)

func init_on_show():
	update_data()

func _on_working_order_edit_beginn(working_order: WorkingOrder):
	if working_order != null:
		$NewOrderControl.show_to_edit_working_order(working_order)
	
func _on_delete_working_order(working_order: WorkingOrder):
	if working_order in working_orders:
		working_orders.erase(working_orders)
		update_data()

func _on_new_order_btn_pressed() -> void:
	$NewOrderControl.show_for_new_order()

func _on_new_order_control__on_new_work_order(work_order: WorkingOrder) -> void:
	if work_order != null:
		working_orders.append(work_order)
	update_data()
