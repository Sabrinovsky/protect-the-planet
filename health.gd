extends Node2D
signal die
@export var hp = 100
@export var healthColorIndicator = false

func take_damage(amount):
	hp -= amount
	flash_damage()
	if healthColorIndicator:
		var i = (hp*1.0)/100
		$"../Sprite2D".modulate = Color(1, i, i)
	if hp <= 0:
		die.emit()
	
func flash_damage():
	var tween = create_tween()
	tween.tween_property($"../Sprite2D", "modulate", Color(1, 0, 0), 0.1)
	tween.tween_property($"../Sprite2D", "modulate", Color(1, (hp*1.0)/100, (hp*1.0)/100), 0.1)
