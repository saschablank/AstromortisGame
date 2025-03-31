extends "res://src/states/StateBase.gd"

var collisions: Array = []


func process_state(delta: float):
	var sprite: AnimatedSprite2D = get_parent().get_node("Area2D/AnimatedSprite2D")	
	if can_be_placed() == false:
		sprite.modulate = Color("red")
	else:
		sprite.modulate = Color(1,1,1)


func target_reached():
	pass


func area_entered(area_2d: Area2D):
	collisions.append(area_2d)


func area_exited(area_2d: Area2D):
	if area_2d in collisions:
		collisions.erase(area_2d)


func body_entered(body_2d: Node2D):
	collisions.append(body_2d)


func body_exited(body_2d: Node2D):
	if body_2d in collisions:
		collisions.erase(body_2d)


func can_be_placed() -> bool:
	if len(collisions) > 0:
		return false
	return true	


func process_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.keycode == KEY_R and event.is_pressed() == false:
			var anim_sprite: AnimatedSprite2D = get_parent().get_node("Area2D/AnimatedSprite2D")
			if anim_sprite != null:
				if anim_sprite.frame == 0:
					anim_sprite.frame = 1
				else:
					anim_sprite.frame = 0
