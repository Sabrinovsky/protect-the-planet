extends Node2D
signal earth_die

func _ready():
	var screen_size = get_viewport_rect().size
	position = (screen_size) / 2

func _process(delta: float) -> void:
	rotation += 0.03*delta

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("asteroids"):
		$Health.take_damage(area.dmg)

func _on_health_die() -> void:
	earth_die.emit()
