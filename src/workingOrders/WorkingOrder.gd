@tool

extends Object
class_name WorkingOrder


static var WORKING_ORDER_CONDITIONS: Array[String] = [
	"has_less_then",
	"has_more_then",
	"has_exact amount"
]

var building_to_use: BuildingBase
var order_data: Dictionary = {}
var to_produce = 0

func _init(p_order_data) -> void:
	update_data(p_order_data)
	
func update_data(p_order_data: Dictionary):
	order_data = p_order_data

func get_working_order_text():
	var condition_text = "One-time Order:	"
	if len(order_data["cond"]):
		condition_text = "Conditional Order:	"
	return condition_text +  str(order_data["item_amount"]) + " " + order_data["item"] + " at " + order_data["time"] + " with " + order_data["priority"] + " priority "
