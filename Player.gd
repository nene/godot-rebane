extends KinematicBody2D

export var speed = 75

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
    
    if direction.x != 0 && direction.y != 0:
        direction = direction.normalized()
    
    move_and_slide(speed * direction)
