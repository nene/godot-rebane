extends Node

signal allow_interact
signal forbid_interact
signal show_dialog(inventory, cfg)

var hovered_areas = {}
var near_player_areas = {}
var interactable_areas = {}

var _clicked_areas = []

func enter_mouse(area: Area2D):
    hovered_areas[area] = true
    _decide_interact_state(area)

func exit_mouse(area: Area2D):
    hovered_areas.erase(area)
    _decide_interact_state(area)

func enter_player(area: Area2D):
    near_player_areas[area] = true
    _decide_interact_state(area)

func exit_player(area: Area2D):
    near_player_areas.erase(area)
    _decide_interact_state(area)

func _decide_interact_state(area: Area2D):
    var was_interactable = !interactable_areas.empty()
    if hovered_areas.has(area) && near_player_areas.has(area):
        interactable_areas[area] = true
    else:
        interactable_areas.erase(area)
    
    var is_interactable = !interactable_areas.empty()
    if was_interactable && !is_interactable:
        emit_signal("forbid_interact")
    elif !was_interactable && is_interactable:
        emit_signal("allow_interact")

func show_dialog(dialog: Control, cfg: Dictionary = {}):
    emit_signal("show_dialog", dialog, cfg)

func add_pending_click(area: Area2D, z_index: int):
    _clicked_areas.append({"area": area, "z": z_index})

func _process(delta: float):
    if _clicked_areas.empty():
        return

    var topmost: Dictionary = _clicked_areas.front()
    for area in _clicked_areas:
        if area["z"] > topmost["z"]:
            topmost = area
    _clicked_areas.clear()
    topmost["area"].trigger_interact()
