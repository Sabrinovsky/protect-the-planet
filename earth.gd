extends Node2D


func _ready():
	var screen_size = get_viewport_rect().size
	position = (screen_size) / 2

func _process(delta: float) -> void:
	rotation += 0.03*delta

func _on_area_entered(area: Area2D) -> void:
	flash_damage()

func flash_damage():
	var tween = create_tween()
	tween.tween_property($Sprite2D, "modulate", Color(1, 0, 0), 0.1)
	tween.tween_property($Sprite2D, "modulate", Color(1, 1, 1), 0.1)
