extends Node

signal allow_interact
signal forbid_interact

var hovered_areas = {}
var near_player_areas = {}

var _clicked_areas = []

func enter_mouse(area: Dictionary):
    hovered_areas[area["area"]] = area
    _decide_interact_state()

func exit_mouse(area: Dictionary):
    hovered_areas.erase(area["area"])
    _decide_interact_state()

func enter_player(area: Dictionary):
    near_player_areas[area["area"]] = area
    _decide_interact_state()

func exit_player(area: Dictionary):
    near_player_areas.erase(area["area"])
    _decide_interact_state()

func _decide_interact_state():
    if _is_interactable():
        emit_signal("allow_interact")
    else:
        emit_signal("forbid_interact")

func _is_interactable() -> bool:
    for area in hovered_areas.values():
        if _is_area_interactable(area):
            return true
    return false

func _is_area_interactable(area: Dictionary) -> bool:
    return hovered_areas.has(area["area"]) && near_player_areas.has(area["area"])

func add_pending_click(area: Dictionary):
    _clicked_areas.append(area)

func _process(delta: float):
    if _clicked_areas.empty():
        return

    var topmost = _topmost(_clicked_areas)
    _clicked_areas.clear()
    topmost["area"].trigger_interact()

func _topmost(areas: Array) -> Dictionary:
    var topmost: Dictionary = areas.front()
    for area in areas:
        if area["y"] > topmost["y"]:
            topmost = area
    return topmost
