extends Area2D

var velocity
var has_hit

func _process(delta: float) -> void:
	if has_hit == true: return
	position += velocity * delta


func _on_area_entered(area: Area2D) -> void:
	has_hit = true
	var hit_sprite = load("res://arts/PNG/Lasers/laserBlue08.png")
	call_deferred("freeze", true)
	$Sprite2D.texture = hit_sprite
	$Timer.start()
	


func _on_timer_timeout() -> void:
	queue_free()
