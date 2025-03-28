extends Camera2D

signal _on_zoom()
signal _on_camera_move()

@export var zoom_step: float = 0.1
@export var camera_speed: int
@export var min_zoom = Vector2(0.1, 0.1)  # Zoom in limit
@export var max_zoom = Vector2(2, 2)      # Zoom out limit

var level_rect: Rect2 = Rect2(-1,-1,-1,-1)
var lock_camera: bool = false
var current_delta: float = 0

var camera_move_keys = {
	KEY_W: [false,false],
	KEY_A: [false,false],
	KEY_S: [false,false],
	KEY_D: [false,false]
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	zoom = min_zoom


func _input(event):
	if lock_camera == false:
		if event is InputEventMouseButton and event.pressed:
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				#if get_node("CanvasLayer/MainUi").is_colonists_control_visible() == false:
				zoom_on_mouse(-zoom_step)  # Zoom in
			elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				#if get_node("CanvasLayer/MainUi").is_colonists_control_visible() == false:
				zoom_on_mouse(zoom_step)  # Zoom out
		elif event is InputEventKey:
			var updated_position: Vector2 = position
			var process_position = false
			if event.keycode in camera_move_keys.keys() and event.pressed:
				camera_move_keys[event.keycode][0] = true
				camera_move_keys[event.keycode][1] = true
			if event.keycode in camera_move_keys.keys() and event.pressed == false:
				camera_move_keys[event.keycode][0] = false
				camera_move_keys[event.keycode][1] = false
			
				
func get_zoom_scale() -> Vector2:
	return Vector2(1/zoom.x, 1/zoom.y)


func zoom_on_mouse(zoom_delta: float) -> void:
	_on_zoom.emit()
	var mouse_position_before = get_global_mouse_position()
	# Update the zoom level, clamping to min/max limits
	zoom += Vector2(zoom_delta, zoom_delta)
	zoom.x = clamp(zoom.x, min_zoom.x, max_zoom.x)
	zoom.y = clamp(zoom.y, min_zoom.y, max_zoom.y)
	var mouse_position_after = get_global_mouse_position()
	position += mouse_position_before - mouse_position_after


func process_updated_position(updated_position) -> void:
	var screen_size = Vector2(get_viewport_rect().size)
	screen_size /= zoom
	if updated_position.x - screen_size.x / 2 < level_rect.position.x:
		updated_position.x = level_rect.position.x + (screen_size.x / 2)
	elif updated_position.x + screen_size.x / 2 > level_rect.position.x + level_rect.size.x:
		updated_position.x = level_rect.position.x + level_rect.size.x - screen_size.x / 2
	
	if updated_position.y - screen_size.y / 2 < level_rect.position.y:
		updated_position.y = level_rect.position.y + (screen_size.y / 2)
	elif updated_position.y + screen_size.y / 2 > level_rect.position.y + level_rect.size.y:
		updated_position.y = level_rect.position.y + level_rect.size.y - screen_size.y / 2
	position = updated_position


func _process(delta: float) -> void:
	current_delta = delta
	if level_rect.position.x != -1 and lock_camera == false:
		if zoom.x > max_zoom.x:
			zoom = max_zoom
		var screen_size = Vector2(get_viewport_rect().size)
		var mouse_position = get_viewport().get_mouse_position()
		var updated_position = position
		
		if camera_move_keys[KEY_W][0] == true:
			updated_position.y -= camera_speed * delta
		if camera_move_keys[KEY_A][0] == true:
			updated_position.x -= camera_speed * delta
		if camera_move_keys[KEY_S][0] == true:
			updated_position.y += camera_speed * delta
		if camera_move_keys[KEY_D][0] == true:
			updated_position.x += camera_speed * delta
		for it in camera_move_keys.keys():
			if camera_move_keys[it][1] == false:
				camera_move_keys[it][0] = false	
		process_updated_position(updated_position)
