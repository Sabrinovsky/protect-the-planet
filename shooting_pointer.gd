extends Node2D

@export var projectile_scene: PackedScene
@export var projectile_speed = 1000
var cd = false

func _process(delta: float) -> void:
	if cd == true: return
	if Input.is_action_pressed("fire"):
		var forward = Vector2.RIGHT.rotated(rotation)
		var projectile = projectile_scene.instantiate() 
		get_tree().current_scene.add_child(projectile)
		projectile.global_position = global_position
		projectile.global_rotation = global_rotation+PI/2
		projectile.velocity = Vector2.RIGHT.rotated(global_rotation) * projectile_speed
		cd = true
		$ShootingCD.start()


func _on_shooting_cd_timeout() -> void:
	print_debug("can shoot")
	cd = false
	pass # Replace with function body.
