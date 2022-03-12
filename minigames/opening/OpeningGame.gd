extends Node2D

onready var _opener = $Opener
onready var _bottle_cap = $BottleCap
var _ready_to_open = false


func _input(event):
    _opener.position = get_global_mouse_position()

func _on_bottlecap_ready_to_open_change(ready: bool):
    _ready_to_open = ready

func _try_to_open():
    if _ready_to_open:
        _bottle_cap.hide()

func _on_background_input(event):
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT && event.pressed:
            _try_to_open()

