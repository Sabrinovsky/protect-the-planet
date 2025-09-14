extends Node2D

func take_damage():
	flash_damage()
	
func flash_damage():
	var tween = create_tween()
	tween.tween_property($"../Sprite2D", "modulate", Color(1, 0, 0), 0.1)
	tween.tween_property($"../Sprite2D", "modulate", Color(1, 1, 1), 0.1)
