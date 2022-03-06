extends Node

signal allow_interact
signal forbid_interact

var hovered_areas = {}
var near_player_areas = {}
var interactable_areas = {}

var _clicked_areas = []

func enter_mouse(area: Dictionary):
    hovered_areas[area["area"]] = area
    _decide_interact_state(area)

func exit_mouse(area: Dictionary):
    hovered_areas.erase(area["area"])
    _decide_interact_state(area)

func enter_player(area: Dictionary):
    near_player_areas[area["area"]] = area
    _decide_interact_state(area)

func exit_player(area: Dictionary):
    near_player_areas.erase(area["area"])
    _decide_interact_state(area)

func _decide_interact_state(area: Dictionary):
    var was_interactable = !interactable_areas.empty()
    if hovered_areas.has(area["area"]) && near_player_areas.has(area["area"]):
        interactable_areas[area["area"]] = area
    else:
        interactable_areas.erase(area["area"])
    
    var is_interactable = !interactable_areas.empty()
    if was_interactable && !is_interactable:
        emit_signal("forbid_interact")
    elif !was_interactable && is_interactable:
        emit_signal("allow_interact")

func add_pending_click(area: Dictionary):
    _clicked_areas.append(area)

func _process(delta: float):
    if _clicked_areas.empty():
        return

    var topmost: Dictionary = _clicked_areas.front()
    for area in _clicked_areas:
        if area["y"] > topmost["y"]:
            topmost = area
    _clicked_areas.clear()
    topmost["area"].trigger_interact()
