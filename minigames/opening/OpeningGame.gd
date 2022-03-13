extends MiniGame

const PhysicalBottleCap = preload("res://minigames/opening/PhysicalBottleCap.tscn")

const BOTTLE_START_POSITION = Vector2(100, 100)
const BOTTLE_MAX_MOVEMENT = Vector2(150, 150)

onready var _bottle = $Bottle
onready var _bottle_cap = $BottleCap
onready var _opener = $Opener
var _ready_to_open = false
var _noise = OpenSimplexNoise.new()
var _time = 0

enum {
    CAP_ON_BOTTLE,
    CAP_IN_OPENER,
    CAP_FREE,
}

var _cap_state = CAP_ON_BOTTLE

func _ready():
    _noise.seed = randi()
    _noise.period = 4

func _process(delta):
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
    _opener.position = get_global_mouse_position()
    if _cap_state == CAP_IN_OPENER:
        _bottle_cap.position = _opener.position

func _on_bottlecap_ready_to_open_change(ready: bool):
    _ready_to_open = ready

func _try_to_open():
    if _ready_to_open:
        _cap_state = CAP_IN_OPENER

func _release_cap():
    if _cap_state == CAP_IN_OPENER:
        _cap_state = CAP_FREE
        _bottle_cap.queue_free()
        _bottle_cap = PhysicalBottleCap.instance()
        _bottle_cap.position = get_global_mouse_position()
        _bottle_cap.connect("body_entered", self, "_bottle_cap_dropped", [], CONNECT_ONESHOT)
        _bottle_cap.apply_impulse(Vector2.ZERO, Vector2(1,-1) * 200)
        add_child(_bottle_cap)
        $OpenBeerSound.play()

func _on_background_input(event):
    if event is InputEventMouseButton && event.button_index == BUTTON_LEFT:
        if event.pressed:
            _try_to_open()
        else:
            _release_cap()

func _bottle_cap_dropped(_body):
    $DropCapSound.play()

func _on_drop_cap_sound_finished():
    yield(get_tree().create_timer(1), "timeout")
    emit_signal("finished")
