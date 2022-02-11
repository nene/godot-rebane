extends KinematicBody2D

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
    
    if is_moving(direction):
        facing = direction_to_facing(direction)

    $AnimatedSprite.play(choose_animation(is_moving(direction), facing))

    if direction.x != 0 && direction.y != 0:
        direction = direction.normalized()
    
    move_and_slide(speed * direction)

func is_moving(direction: Vector2) -> bool:
    return direction != Vector2.ZERO

func direction_to_facing(direction: Vector2) -> String:
    if direction.x > 0:
        return "right"
    elif direction.x < 0:
        return "left"
    elif direction.y < 0:
        return "up"
    else:
        return "down"

func choose_animation(moving: bool, facing: String) -> String:
    if moving:
        return "walk-" + facing
    else:
        return "stand-" + facing
