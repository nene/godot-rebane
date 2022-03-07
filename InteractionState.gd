extends Node

var _hovered_areas = {}
var _near_player_areas = {}
var _clicked_areas = []
var _holding_item: GameItem

func _ready():
    pause_mode = PAUSE_MODE_PROCESS
    GameEvents.connect("change_holding_group", self, "_set_holding_item_from_group")

func _set_holding_item_from_group(group: GameItemGroup):
    _holding_item = group.item() if group else null

func enter_mouse(area: Area2D):
    _hovered_areas[area] = true

func exit_mouse(area: Area2D):
    _hovered_areas.erase(area)

func enter_player(area: Area2D):
    _near_player_areas[area] = true

func exit_player(area: Area2D):
    _near_player_areas.erase(area)

func _is_interactable(item: GameItem = null) -> bool:
    if _hovered_areas.empty():
        return false
    var topmost = _topmost(_hovered_areas.keys())
    return _is_area_near_player(topmost) && topmost.is_interactable(item)

func _is_area_near_player(area: Area2D) -> bool:
    return _near_player_areas.has(area)

# Registers area as having been clicked.
# All overlapping areas get a click event simultaneously.
# We'll sort out the topmost area that was actually clicked
# in _process() function below, which gets called in the next idle frame.
func add_pending_click(area: Area2D):
    _clicked_areas.append(area)

func _process(_delta: float):
    if _is_interactable(_holding_item):
        GameEvents.emit_signal("allow_interact")
        if !_clicked_areas.empty():
            _topmost(_clicked_areas).trigger_interact()
    else:
        GameEvents.emit_signal("forbid_interact")

    _clicked_areas.clear()

func _topmost(areas: Array) -> Area2D:
    var topmost: Area2D = areas.front()
    for area in areas:
        if area.y_position() > topmost.y_position():
            topmost = area
    return topmost
