extends Panel

@export var build_menu: Control = null
@export var working_orders_window: Control = null


func _on_open_working_order_btn_pressed() -> void:
	working_orders_window.visible = !working_orders_window.visible


func _on_open_building_menu_pressed() -> void:
	build_menu.visible = !build_menu.visible
	
