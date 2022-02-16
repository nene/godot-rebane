extends KinematicBody2D

const Direction = preload("res://Direction.gd")

export var speed = 50
var direction = Vector2.ZERO
var facing = "down"
var rng = RandomNumberGenerator.new()

func _ready():
    rng.randomize()

func change_direction():
    var nr = rng.randf()
    if nr < 0.05:
        direction = Vector2.ZERO
    elif nr < 0.1:
        direction = Vector2.DOWN.rotated(rng.randf() * 2 * PI)

func _physics_process(delta):
    if Direction.is_moving(direction):
        facing = Direction.to_facing(direction)

    $AnimationPlayer.play(Direction.animation_name(Direction.is_moving(direction), facing))

    if direction.x != 0 && direction.y != 0:
        direction = direction.normalized()
    
    move_and_slide(speed * direction)
