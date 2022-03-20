extends MiniGame

const Droplet = preload("res://minigames/pouring/Droplet.tscn")
const PouringLogic = preload("res://minigames/pouring/PouringLogic.gd")

onready var _bottle = $Bottle
onready var _glass = $BeerGlass
onready var _droplets = $Droplets
onready var _splashes = $Splashes
var _is_pouring = false
var _droplet_frequency = 1.0/40.0  # droplets/second
var _poured_time = 0
var _pouring_logic: PouringLogic

func _ready():
    _pouring_logic = PouringLogic.new({ "min": 0.05, "max": 0.20 })

func _input(event):
    _bottle.position = get_global_mouse_position()

    if event is InputEventMouseButton && event.button_index == BUTTON_LEFT:
        if event.pressed:
            _is_pouring = true
        else:
            _is_pouring = false

func _physics_process(delta):
    if _is_pouring:
        _poured_time += delta
        var droplet_count = floor(_poured_time / _droplet_frequency)
        _poured_time -= droplet_count * _droplet_frequency
        for i in droplet_count:
            _add_droplet()

func _add_droplet():
    var droplet = Droplet.instance()
    droplet.pouring_game = self
    droplet.position = get_global_mouse_position() + _random_offset()
    _droplets.add_child(droplet)

func _random_offset() -> Vector2:
    return Vector2(randf(), randf())

func add_splash(node: Node):
    _splashes.add_child(node)

func _pour_to_glass():
    _pouring_logic.pour_to_glass(0.5)
    _glass.beer_level = _pouring_logic.get_liquid_in_glass()
    _glass.foam_level = _pouring_logic.get_foam_in_glass()
