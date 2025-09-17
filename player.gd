extends Node2D
@export var speed = 100
@export var steeringSpeed = 5
signal game_over
var screen_size
var dead = false

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	if dead :
		position += Vector2.RIGHT.rotated(rotation) * speed * delta
		rotation += 1 * delta
	$MainBooster.hide()
	$LeftBooster.hide()
	$RightBooster.hide()
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_down"):
		pass
	if Input.is_action_pressed("move_up"):
		$MainBooster.show()
		var forward = Vector2.RIGHT.rotated(rotation)
		position += forward * speed * delta
	if Input.is_action_pressed("move_left"):
		$RightBooster.show()
		rotation += delta*steeringSpeed*-1
	if Input.is_action_pressed("move_right"):
		$LeftBooster.show()
		rotation += delta*steeringSpeed


func _on_area_entered(area: Area2D) -> void:
	$Health.take_damage(100)

func _on_health_die() -> void:
	dead = true
	$Explosion.play()
	$AfterDeath.start()

func _on_after_death_timeout() -> void:
	game_over.emit()
