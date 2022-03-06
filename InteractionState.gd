extends Node

var _hovered_areas = {}
var _near_player_areas = {}
var _clicked_areas = []

func enter_mouse(area: Dictionary):
    _hovered_areas[area["area"]] = area
    _decide_interact_state()

func exit_mouse(area: Dictionary):
    _hovered_areas.erase(area["area"])
    _decide_interact_state()

func enter_player(area: Dictionary):
    _near_player_areas[area["area"]] = area
    _decide_interact_state()

func exit_player(area: Dictionary):
    _near_player_areas.erase(area["area"])
    _decide_interact_state()

func _decide_interact_state():
    if _is_interactable():
        GameEvents.emit_signal("cursor_allow_interact")
    else:
        GameEvents.emit_signal("cursor_forbid_interact")

func _is_interactable() -> bool:
    if _hovered_areas.empty():
        return false
    return _is_area_near_player(_topmost(_hovered_areas.values()))

func _is_area_near_player(area: Dictionary) -> bool:
    return _near_player_areas.has(area["area"])

# Registers area as having been clicked.
# All overlapping areas get a click event simultaneously.
# We'll sort out the topmost area that was actually clicked
# in _process() function below, which gets called in the next idle frame.
func add_pending_click(area: Dictionary):
    _clicked_areas.append(area)

func _process(delta: float):
    if _clicked_areas.empty():
        return

    var topmost = _topmost(_clicked_areas)
    if _is_area_near_player(topmost):
        topmost["area"].trigger_interact()

    _clicked_areas.clear()

func _topmost(areas: Array) -> Dictionary:
    var topmost: Dictionary = areas.front()
    for area in areas:
        if area["y"] > topmost["y"]:
            topmost = area
    return topmost
