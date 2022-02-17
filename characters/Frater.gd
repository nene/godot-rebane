extends KinematicBody2D

const Direction = preload("res://Direction.gd")

export var speed = 50
var direction = Vector2.ZERO
var rng = RandomNumberGenerator.new()
onready var animationState = $AnimationTree.get("parameters/playback")

func _ready():
    rng.randomize()
    set_animation_direction(Vector2.DOWN)

func change_direction():
    var nr = rng.randf()
    if nr < 0.05:
        direction = Vector2.ZERO
    elif nr < 0.1:
        direction = Vector2.DOWN.rotated(rng.randf() * 2 * PI).normalized()

func _physics_process(delta):
    if Direction.is_moving(direction):
        set_animation_direction(direction)
        animationState.travel("Walk")
    else:
        animationState.travel("Idle")
    
    move_and_slide(speed * direction)

func set_animation_direction(direction: Vector2):
    $AnimationTree.set("parameters/Idle/blend_position", direction)
    $AnimationTree.set("parameters/Walk/blend_position", direction)
