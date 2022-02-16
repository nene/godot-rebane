extends KinematicBody2D

const Direction = preload("res://Direction.gd")

export var speed = 75
var facing = "down"

func _physics_process(delta):
    var direction = Vector2(0,0)
    if Input.is_action_pressed("ui_left"):
        direction.x = -1
    if Input.is_action_pressed("ui_right"):
        direction.x = +1
    if Input.is_action_pressed("ui_up"):
        direction.y = -1
    if Input.is_action_pressed("ui_down"):
        direction.y = +1
    
    if Direction.is_moving(direction):
        facing = Direction.to_facing(direction)

    $AnimationPlayer.play(Direction.animation_name(Direction.is_moving(direction), facing))

    if direction.x != 0 && direction.y != 0:
        direction = direction.normalized()
    
    move_and_slide(speed * direction)
