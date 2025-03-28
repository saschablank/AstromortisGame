extends Node
class_name StateBase

signal _on_state_change(new_state: String)
signal _on_target_reached()

@export var state_name = ""
@export var state_owner: Node = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func process_state(delta: float):
	pass


func target_reached():
	pass


func area_entered(area_2d: Area2D):
	pass


func area_exited(area_2d: Area2D):
	pass


func process_input(event: InputEvent) -> void:
	pass
	
func state_init():
	pass
