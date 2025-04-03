extends Control
class_name MainUi

signal _on_building_pressed(building_name: String)
signal _on_build_corridor()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_building_btn_pressed(building_name: String):
	_on_building_pressed.emit(building_name)


func _on_build_corridor_pressed() -> void:
	_on_build_corridor.emit()
