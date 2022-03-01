extends State

var rng = RandomNumberGenerator.new()
onready var timer = Timer.new()

func _ready():
    rng.randomize()
    add_child(timer)
    timer.connect("timeout", self, "change_direction")
    timer.wait_time = 0.25
    timer.start()

func change_direction():
    var nr = rng.randf()
    if nr < 0.05:
        owner.direction = Vector2.ZERO
    elif nr < 0.1:
        owner.direction = Vector2.DOWN.rotated(rng.randf() * 2 * PI).normalized()
