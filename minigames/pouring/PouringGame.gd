extends MiniGame

const Droplet = preload("res://minigames/pouring/Droplet.tscn")

onready var _bottle = $Bottle
onready var _droplets = $Droplets
var _is_pouring = false

func _ready():
    pass

func _input(event):
    _bottle.position = get_global_mouse_position()

    if event is InputEventMouseButton && event.button_index == BUTTON_LEFT:
        if event.pressed:
            _is_pouring = true
        else:
            _is_pouring = false

func _physics_process(delta):
    if _is_pouring:
        for i in 5:
            _add_droplet()

func _add_droplet():
    var droplet = Droplet.instance()
    droplet.position = get_global_mouse_position() + _random_offset()
    _droplets.add_child(droplet)

func _random_offset() -> Vector2:
    return Vector2(randf(), randf())
