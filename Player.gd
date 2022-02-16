extends KinematicBody2D

const Direction = preload("res://Direction.gd")

export var speed = 75
onready var animationState = $AnimationTree.get("parameters/playback")

func _ready():
    set_animation_direction(Vector2.DOWN)

func _physics_process(delta):
    var direction = Vector2.ZERO
    if Input.is_action_pressed("ui_left"):
        direction.x = -1
    if Input.is_action_pressed("ui_right"):
        direction.x = +1
    if Input.is_action_pressed("ui_up"):
        direction.y = -1
    if Input.is_action_pressed("ui_down"):
        direction.y = +1

    direction = direction.normalized()
    
    if Direction.is_moving(direction):
        set_animation_direction(direction)
        animationState.travel("Walk")
    else:
        animationState.travel("Idle")
    
    move_and_slide(speed * direction)

func set_animation_direction(direction: Vector2):
    $AnimationTree.set("parameters/Idle/blend_position", direction)
    $AnimationTree.set("parameters/Walk/blend_position", direction)
