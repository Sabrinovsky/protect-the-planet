extends Node2D
signal die
@export var hp = 100

func take_damage(amount):
	hp -= amount
	flash_damage()
	if hp <= 0:
		die.emit()
	
func flash_damage():
	var tween = create_tween()
	tween.tween_property($"../Sprite2D", "modulate", Color(1, 0, 0), 0.1)
	tween.tween_property($"../Sprite2D", "modulate", Color(1, 1, 1), 0.1)
