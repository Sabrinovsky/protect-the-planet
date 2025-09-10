extends Node2D
@export var enemy_scene: PackedScene

func _on_spawn_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate() 
	
	var enemy_spawn_location = $EnemiesPath/EnemiesSpawn
	enemy_spawn_location.progress_ratio = randf()
	enemy.position = enemy_spawn_location.position
	add_child(enemy)
