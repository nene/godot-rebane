extends KinematicBody2D

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
    if is_moving(direction):
        facing = direction_to_facing(direction)

    $AnimationPlayer.play(choose_animation(is_moving(direction), facing))

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
        return "w-" + facing
    else:
        return facing.substr(0, 1).to_upper()
