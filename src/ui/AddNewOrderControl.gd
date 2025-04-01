extends Panel

const WORKING_ORDER_CONDITION = preload("res://scenes/ui/WorkingOrderCondition.tscn")

signal _on_new_work_order(work_order: WorkingOrder)
signal _on_working_order_edit_finish(work_order: WorkingOrder)

@onready var item_amount: LineEdit = $MainRows/OrderDataControls/HBoxContainer/item_amount
@onready var item: OptionButton = $MainRows/OrderDataControls/HBoxContainer/item
@onready var priority: OptionButton = $MainRows/OrderDataControls/HBoxContainer5/Priority
@onready var time: OptionButton = $MainRows/OrderDataControls/HBoxContainer4/time
@onready var order_data_controls: VBoxContainer = $MainRows/OrderDataControls
@onready var add_condition_btn: Button = $MainRows/AddConditionBtn
@onready var add_new_order_btn: Button = $addNewOrderBtn

var condition_controls: Array[WorkingOrderConditionControl] = []
var working_order_to_edit: WorkingOrder = null


func show_to_edit_working_order(working_order: WorkingOrder):
	working_order_to_edit = working_order
	add_new_order_btn.text = "Update Order"
	visible = true
	grab_focus()


func show_for_new_order():
	working_order_to_edit = null
	item.selected = -1
	for it in order_data_controls.get_children():
		if it is WorkingOrderConditionControl:
			it.queue_free()
	add_condition_btn.disabled = true
	add_new_order_btn.text = "Create Order"
	visible = true
	grab_focus()
	

func _on_item_item_selected(index: int) -> void:
	for it in order_data_controls.get_children():
		if it is WorkingOrderConditionControl:
			it.queue_free()
	add_condition_btn.disabled = false


func collect_condition_data() -> Array[Dictionary]:
	var conditions: Array[Dictionary] = []
	for it in order_data_controls.get_children():
		if it is WorkingOrderConditionControl:
			conditions.append(it.get_data_from_ui())
	return conditions


func _on_add_new_order_btn_pressed() -> void:
	var order_data: Dictionary = {
		"item_amount": int(item_amount.text),
		"item" : item.get_item_text(item.get_selected_id()),		
		"time" : time.get_item_text(time.get_selected_id()),
		"priority": priority.get_item_text(priority.get_selected_id()),
		"cond": collect_condition_data()
	}
	if working_order_to_edit == null:
		var working_order: WorkingOrder = WorkingOrder.new(order_data)
		_on_new_work_order.emit(working_order)
	else:
		working_order_to_edit.update_data(order_data)
		_on_working_order_edit_finish.emit(working_order_to_edit)
	visible = false
	release_focus()


func delete_condition(control: WorkingOrderConditionControl):
	if control != null:
		condition_controls.erase(control)
		control.queue_free()


func _on_add_condition_btn_pressed() -> void:
	if len(condition_controls) <= 5:
		var new_condition_control = WORKING_ORDER_CONDITION.instantiate()
		order_data_controls.add_child(new_condition_control)
		new_condition_control.init_condition(item.get_item_text(item.get_selected_id()))
		new_condition_control.connect("_on_condition_delete", delete_condition)
		condition_controls.append(new_condition_control)
