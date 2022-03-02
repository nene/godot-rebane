extends State

var rng = RandomNumberGenerator.new()
onready var timer = Timer.new()
var direction = Vector2.ZERO
var speed = 50

func _ready():
    rng.randomize()
    add_child(timer)
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
        owner.set_animation_direction(direction)
        owner.animationState.travel("Walk")
    else:
        owner.animationState.travel("Idle")
    
    owner.move_and_slide(speed * direction)

func exit():
    timer.stop()
