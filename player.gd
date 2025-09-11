extends Node2D
@export var speed = 100
@export var steeringSpeed = 5

var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
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
