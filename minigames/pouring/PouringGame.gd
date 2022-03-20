extends MiniGame

const Droplet = preload("res://minigames/pouring/Droplet.tscn")
const Splash = preload("res://minigames/pouring/Splash.tscn")
const PouringLogic = preload("res://minigames/pouring/PouringLogic.gd")

const GLASS_TOP_POSITION = Vector2(131, 90)

onready var _bottle = $Bottle
onready var _glass = $BeerGlass
onready var _droplets = $Droplets
onready var _splashes = $Splashes
var _is_mouse_down = false
var _droplet_frequency = 1.0/40.0  # droplets/second
var _poured_time = 0
var _pouring_logic: PouringLogic

func _ready():
    _pouring_logic = PouringLogic.new({ "min": 0.05, "max": 0.20 })

func _input(event):
    _bottle.position = get_global_mouse_position()

    if event is InputEventMouseButton && event.button_index == BUTTON_LEFT:
        if event.pressed:
            _is_mouse_down = true
        else:
            _is_mouse_down = false

func _physics_process(delta):
    if _is_pouring():
        _poured_time += delta
        var droplet_count = floor(_poured_time / _droplet_frequency)
        _poured_time -= droplet_count * _droplet_frequency
        for i in droplet_count:
            _add_droplet()

func _is_pouring():
    return _is_mouse_down && !_pouring_logic.is_finished()

func _add_droplet():
    var droplet = Droplet.instance()
    droplet.position = get_global_mouse_position() + _random_offset()
    droplet.connect("hit_target", self, "_pour_to_glass")
    droplet.connect("splash", self, "_add_splash")
    _droplets.add_child(droplet)

func _random_offset() -> Vector2:
    return Vector2(randf(), randf())

func _add_splash(position: Vector2, direction: Vector2):
    var splash = Splash.instance()
    splash.position = position
    splash.emitting = true
    splash.direction = direction
    _splashes.add_child(splash)

func _pour_to_glass():
    _pouring_logic.pour_to_glass(_flow_rate())
    _glass.beer_level = _pouring_logic.get_liquid_in_glass()
    _glass.foam_level = _pouring_logic.get_foam_in_glass()

func _flow_rate() -> float:
    var glass_top = GLASS_TOP_POSITION.y
    var bottle_y = _bottle.position.y
    var ceiling_y = 32.0
    if bottle_y >= glass_top:
        return 0.01
    if bottle_y <= ceiling_y:
        return 1.0

    var range_y = glass_top - ceiling_y
    var bottle_pos = bottle_y - ceiling_y
    return max(0.01, 1 - bottle_pos / range_y)
