extends Node2D


func _ready():
	var screen_size = get_viewport_rect().size
	position = (screen_size) / 2

func _process(delta: float) -> void:
	rotation += 0.03*delta

func _on_area_entered(area: Area2D) -> void:
	$Health.take_damage(100)


func _on_health_die() -> void:
	queue_free()
