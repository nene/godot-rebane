extends Node

var _hovered_areas = {}
var _near_player_areas = {}
var _clicked_areas = []

func enter_mouse(area: Area2D):
    _hovered_areas[area] = true
    _decide_interact_state()

func exit_mouse(area: Area2D):
    _hovered_areas.erase(area)
    _decide_interact_state()

func enter_player(area: Area2D):
    _near_player_areas[area] = true
    _decide_interact_state()

func exit_player(area: Area2D):
    _near_player_areas.erase(area)
    _decide_interact_state()

func _decide_interact_state():
    if _is_interactable():
        GameEvents.emit_signal("cursor_allow_interact")
    else:
        GameEvents.emit_signal("cursor_forbid_interact")

func _is_interactable() -> bool:
    if _hovered_areas.empty():
        return false
    var topmost = _topmost(_hovered_areas.keys())
    return _is_area_near_player(topmost) && topmost.is_interactable()

func _is_area_near_player(area: Area2D) -> bool:
    return _near_player_areas.has(area)

# Registers area as having been clicked.
# All overlapping areas get a click event simultaneously.
# We'll sort out the topmost area that was actually clicked
# in _process() function below, which gets called in the next idle frame.
func add_pending_click(area: Area2D):
    _clicked_areas.append(area)

func _process(delta: float):
    if _clicked_areas.empty():
        return

    var topmost = _topmost(_clicked_areas)
    if _is_area_near_player(topmost) && topmost.is_interactable():
        topmost.trigger_interact()

    _clicked_areas.clear()

func _topmost(areas: Array) -> Area2D:
    var topmost: Area2D = areas.front()
    for area in areas:
        if area.y_position() > topmost.y_position():
            topmost = area
    return topmost
