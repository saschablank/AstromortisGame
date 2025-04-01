extends Button
class_name CloseBtn

@export var window_control_to_close: Control = null


func _on_pressed() -> void:
	window_control_to_close.visible = false
	window_control_to_close.focus_exited.emit()
