extends State

var _owner: Frater
var rng = RandomNumberGenerator.new()
onready var timer = Timer.new()
var direction = Vector2.ZERO
var speed = 50

func _init(owner: Frater):
    _owner = owner
    rng.randomize()
    timer.connect("timeout", self, "_change_direction")
    timer.wait_time = 0.25

func enter():
    timer.start()

func _change_direction():
    var nr = rng.randf()
    if nr < 0.05:
        direction = Vector2.ZERO
    elif nr < 0.1:
        direction = Vector2.DOWN.rotated(rng.randf() * 2 * PI).normalized()

func physics_update(delta):
    if direction != Vector2.ZERO:
        _owner.set_animation_direction(direction)
        _owner.animationState.travel("Walk")
    else:
        _owner.animationState.travel("Idle")
    
    _owner.move_and_slide(speed * direction)

func exit():
    timer.stop()
