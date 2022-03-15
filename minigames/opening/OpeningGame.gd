extends MiniGame

const PhysicalBottleCap = preload("res://minigames/opening/PhysicalBottleCap.tscn")

const BOTTLE_START_POSITION = Vector2(100, 100)
const BOTTLE_MAX_MOVEMENT = Vector2(150, 150)
const OPENER_SIZE = Vector2(18,18)
const OPENER_TILTED_SIZE = OPENER_SIZE + Vector2(-5,2)

var bottle_opener = SimpleBottleOpener.new()
export var drink_type = Drink.PILSNER

onready var _bottle = $Bottle
onready var _bottle_cap = $BottleCap
onready var _opener_node = $Opener
onready var _ribbon = $Ribbon
var _ready_to_open = false
var _noise = OpenSimplexNoise.new()
var _time = 0

enum {
    CAP_ON_BOTTLE,
    CAP_FREE,
}

var _cap_state = CAP_ON_BOTTLE

func _ready():
    _noise.seed = randi()
    _noise.period = _noise_period()
    _ribbon.visible = bottle_opener.has_ribbon()

func _noise_period() -> float:
    var cap_strength = Drink.get_drink(drink_type)["capStrength"]
    if cap_strength > 0:
        return 4 / float(cap_strength)
    else:
        return 1000.0

func _process(delta):
    if _cap_state == CAP_FREE:
        return
    _time += delta
    _set_bottle_position(BOTTLE_START_POSITION + _bottle_offset())

func _bottle_offset() -> Vector2:
    var x = _noise.get_noise_2d(_time, 1)
    var y = _noise.get_noise_2d(1, _time)
    return Vector2(x, y) * BOTTLE_MAX_MOVEMENT

func _set_bottle_position(position: Vector2):
    _bottle.position = position
    if _cap_state == CAP_ON_BOTTLE:
        _bottle_cap.position = position

func _input(event):
    _opener_node.position = get_global_mouse_position()
    _update_ribbon_position()

func _update_ribbon_position():
    if _opener_node.rotation_degrees > 0:
        _ribbon.from = get_global_mouse_position() + OPENER_TILTED_SIZE
    else:
        _ribbon.from = get_global_mouse_position() + OPENER_SIZE

func _on_bottlecap_ready_to_open_change(ready: bool):
    _ready_to_open = ready

func _try_to_open():
    if _ready_to_open:
        _cap_state = CAP_FREE
        _release_cap()

func _release_cap():
    _bottle_cap.queue_free()
    _bottle_cap = PhysicalBottleCap.instance()
    _bottle_cap.position = get_global_mouse_position()
    _bottle_cap.connect("body_entered", self, "_bottle_cap_dropped", [], CONNECT_ONESHOT)
    _bottle_cap.apply_impulse(Vector2.ZERO, Vector2(1,-1) * 200)
    add_child(_bottle_cap)
    $OpenBeerSound.play()
    _bottle.rotation_degrees = -15
    $OpeningParticles.position = _bottle.position
    $OpeningParticles.emitting = true

func _on_background_input(event):
    if event is InputEventMouseButton && event.button_index == BUTTON_LEFT:
        if event.pressed:
            _opener_node.rotation_degrees = 15
            _try_to_open()
        else:
            _opener_node.rotation_degrees = 0
        _update_ribbon_position()

func _bottle_cap_dropped(_body):
    $DropCapSound.play()

func _on_drop_cap_sound_finished():
    yield(get_tree().create_timer(1), "timeout")
    emit_signal("finished")
