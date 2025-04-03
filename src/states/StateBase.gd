extends Node
class_name StateBase

signal _on_state_change(new_state: String)
signal _on_target_reached()

@export var state_name = ""
@export var state_owner: Node = null
@export var movement_speed = 0
var target_reached_margin = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func move_to_target(delta: float, dest_position: Vector2):
	get_parent().position = get_parent().position.move_toward(dest_position, delta * movement_speed)
	if get_parent().position.distance_to(dest_position) < target_reached_margin:
		_on_target_reached.emit()

func process_state(delta: float):
	pass


func target_reached():
	pass


func area_entered(area_2d: Area2D):
	pass


func area_exited(area_2d: Area2D):
	pass


func body_entered(body_2d: Node2D):
	pass


func body_exited(body_2d: Node2D):
	pass


func process_input(event: InputEvent) -> void:
	pass


func state_init():
	pass


func state_leave():
	pass
