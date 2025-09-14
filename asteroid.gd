extends Node2D
#
@export var speed: float = 100.0
@export var rotationSpeed: float = 10  # pixels per second
@onready var earth = get_node("/root/Main/Earth")  # adjust path to your Earth node
var size
var tinyMeteorSprites = [
    "meteorBrown_tiny1",
    "meteorBrown_tiny2",
    "meteorGrey_tiny1",
    "meteorGrey_tiny2"
]

var smallMeteorSprites = [
    "meteorBrown_small1",
    "meteorBrown_small2",
    "meteorGrey_small1",
    "meteorGrey_small2"
]

var mediumMeteorSprites = [
    "meteorBrown_med1",
    "meteorBrown_med2",
    "meteorGrey_med1",
    "meteorGrey_med2"
]

var bigMeteorSprites = [
    "meteorBrown_big1",
    "meteorBrown_big2",
    "meteorBrown_big3",
    "meteorBrown_big4",
    "meteorGrey_big1",
    "meteorGrey_big2",
    "meteorGrey_big3",
    "meteorGrey_big4"
]

var meteorSprites = {
    "tiny": tinyMeteorSprites,
    "small": smallMeteorSprites,
    "medium": mediumMeteorSprites,
    "big": bigMeteorSprites
}

var rotation_dir

func _init() -> void:
    var sprites
    
    rotation_dir = randf_range(-0.6, 0.5)

func _ready() -> void:
    var asteroid_scale = randf_range(0.3, 1)
    size = get_sprite(asteroid_scale)
    var rand_sprite_name = meteorSprites[size].pick_random()
    $Sprite2D.texture = loadTexture(rand_sprite_name)
    

    var tex_size = $Sprite2D.texture.get_size() * $Sprite2D.scale
    var shape = CircleShape2D.new()
    shape.radius = tex_size.length() / 2  # metade da diagonal
    $CollisionShape2D.shape = shape
    
func _process(delta: float) -> void:
    rotation += rotation_dir*rotationSpeed*delta
    if earth:  # make sure Earth exists
        var direction = (earth.position - position).normalized()
        position += direction * randf() * speed * delta

func _on_area_entered(area: Area2D) -> void:
    if area.is_in_group("earth"):
        queue_free()
    pass

func get_sprite(size):
    if size < 0.5:
        return "tiny"
    elif size < 0.6:
        return "small"
    elif size < 0.8:
        return "medium"
    else:
        return "big"
        
func loadTexture(name):
    return load("res://arts/PNG/Meteors/" + name+".png")
