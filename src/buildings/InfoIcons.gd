extends Node2D
class_name InfoIcons

static var WARNING_ICON = "warning"
static var INFO_ICON = "info"
static var NO_ENERGY_ICON = "no_energy"
static var RED_CROSS_ICON = "red_cross"
static var BUILD_ICON = "build"
static var ENERGY_ICON = "energy"


static var INFO_ICON_MAP: Dictionary = {
	WARNING_ICON : Vector2(0,0),
	INFO_ICON : Vector2(1,0),
	NO_ENERGY_ICON : Vector2(2,0),
	RED_CROSS_ICON : Vector2(0,1),
	BUILD_ICON : Vector2(1,1),
	ENERGY_ICON : Vector2(2,1)
}


static func get_info_icon_combi(first_icon_name: String, second_icon_name: String) -> ImageTexture:
	var icon_combi_to_return: Image = Image.create_empty(128, 64, false, Image.FORMAT_RGBA8)
	var rect: Rect2 = Rect2(0,0,64,64)
	var icon_position = INFO_ICON_MAP[first_icon_name] * Vector2(64, 64)
	rect.position = icon_position
	icon_combi_to_return.blend_rect(preload("res://assets/Ui/icons/info_icons.png").get_image(), rect, Vector2(0, 0))
	
	icon_position = INFO_ICON_MAP[second_icon_name] * Vector2(64, 64)
	rect.position = icon_position
	icon_combi_to_return.blit_rect(preload("res://assets/Ui/icons/info_icons.png").get_image(), rect, Vector2(64, 0))	
	return ImageTexture.create_from_image(icon_combi_to_return)


func _ready() -> void:
	visible = false
	

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$AnimationPlayer.play("blink")


func set_info_icons_active(first_icon_name: String, second_icon_name: String):
	$Sprite2D.texture = get_info_icon_combi(first_icon_name, second_icon_name)
	visible = true
	$AnimationPlayer.play("blink")

func set_inactive():
	visible = false
