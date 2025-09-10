extends Node2D

@export var speed: float = 100.0  # pixels per second
@onready var earth = get_node("/root/Main/Earth")  # adjust path to your Earth node


func _process(delta: float) -> void:
    if earth:  # make sure Earth exists
        var direction = (earth.position - position).normalized()
        position += direction * speed * delta


func _on_area_entered(area: Area2D) -> void:
    queue_free()
    pass
