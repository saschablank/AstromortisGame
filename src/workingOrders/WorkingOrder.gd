@tool

extends Object
class_name WorkingOrder


static var WORKING_ORDER_CONDITIONS: Array[String] = [
	"has_less_then",
	"has_more_then",
	"has_exact amount",
	"always"
]

var building_to_use: BuildingBase
var order_data: Dictionary = {}

func _init(p_order_data) -> void:
	update_data(p_order_data)
	
func update_data(p_order_data: Dictionary):
	order_data = p_order_data
