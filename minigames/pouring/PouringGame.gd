extends MiniGame

onready var _bottle = $Bottle
onready var _particles = $Particles

func _ready():
    pass

func _input(event):
    _bottle.position = get_global_mouse_position()
    _particles.position = get_global_mouse_position()
