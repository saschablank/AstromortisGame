extends Button
class_name BuildingBtn

signal _on_building_btn_pressed(building_type: String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	_on_building_btn_pressed.emit(name)


func _on_energy_storage_pressed() -> void:
	pass # Replace with function body.


func _on_water_factory_pressed() -> void:
	pass # Replace with function body.


func _on_farm_pressed() -> void:
	pass # Replace with function body.


func _on_factory_pressed() -> void:
	pass # Replace with function body.


func _on_dronehub_pressed() -> void:
	pass # Replace with function body.
