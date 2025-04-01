extends LineEdit

@export var default_value: int = 1

func _on_text_submitted(new_text: String) -> void:
	if new_text.is_valid_int() == false:
		text = str(default_value)
		
