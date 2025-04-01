extends HBoxContainer
class_name WorkingOrderConditionControl

signal _on_condition_delete(control: WorkingOrderConditionControl)

static var DATA_KEY_COND_ROOT = "cond"
static var DATA_KEY_COND_ITEM = "cond_item"
static var DATA_KEY_COND_VLAUE = "cond_value"
static var DATA_KEY_COND_AMOUNT = "cond_amount"



var condition_data: Dictionary = {}
var item_to_produce: String = ""


func update_data(data: Dictionary, p_item_to_produce: String):
	init_condition(p_item_to_produce)
	condition_data = data
	for index in range($connected_items.item_count):
		if data[DATA_KEY_COND_ITEM] == $connected_items.get_item_text(index):
			$connected_items.selected = index
			break
	for index in range($Condition.item_count):
		if data[DATA_KEY_COND_VLAUE] == $Condition.get_item_text(index):
			$Condition.selected = index
			break
	$amountOfItems.text = str(data[DATA_KEY_COND_AMOUNT])


func init_condition(p_item_to_produce: String):
	item_to_produce = p_item_to_produce
	$connected_items.load_list(RessourceDefinitions.get_connected_items(item_to_produce, true))
	$Condition.load_list(WorkingOrder.WORKING_ORDER_CONDITIONS)
	
	
func get_data_from_ui():
	return  { 
		DATA_KEY_COND_ITEM : $connected_items.get_item_text($connected_items.selected),
		DATA_KEY_COND_VLAUE: $Condition.get_item_text($Condition.selected),
		DATA_KEY_COND_AMOUNT : int($amountOfItems.text) 
	}
	


func _on_delete_btn_pressed() -> void:
	_on_condition_delete.emit(self)
