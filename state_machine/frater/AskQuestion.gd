extends State

onready var timer = Timer.new()

func _ready():
    add_child(timer)
    timer.connect("timeout", self, "_finish")
    timer.one_shot = true
    timer.wait_time = 1

func enter():
    timer.start()
    owner.toggle_callout(true)
    owner.animationState.travel("callout")

func _finish():
    owner.toggle_callout(false)
    emit_signal("finished", "pop")
