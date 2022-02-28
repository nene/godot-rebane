extends Node

signal allow_interact
signal forbid_interact
signal show_dialog(inventory, cfg)

var hovered_objects = {}
var near_player_objects = {}
var interactable_objects = {}

var _clicked_areas = []

func enter_mouse(obj):
    hovered_objects[obj] = true
    _decide_interact_state(obj)

func exit_mouse(obj):
    hovered_objects.erase(obj)
    _decide_interact_state(obj)

func enter_player(obj):
    near_player_objects[obj] = true
    _decide_interact_state(obj)

func exit_player(obj):
    near_player_objects.erase(obj)
    _decide_interact_state(obj)

func _decide_interact_state(obj):
    var was_interactable = !interactable_objects.empty()
    if hovered_objects.has(obj) && near_player_objects.has(obj):
        interactable_objects[obj] = true
    else:
        interactable_objects.erase(obj)
    
    var is_interactable = !interactable_objects.empty()
    if was_interactable && !is_interactable:
        emit_signal("forbid_interact")
    elif !was_interactable && is_interactable:
        emit_signal("allow_interact")

func show_dialog(dialog, cfg: Dictionary = {}):
    emit_signal("show_dialog", dialog, cfg)

func add_pending_click(area):
    _clicked_areas.append(area)

func _process(delta):
    if _clicked_areas.empty():
        return

    var topmost: Node2D = _clicked_areas.front()
    for area in _clicked_areas:
        if area.get_index() > topmost.get_index():
            topmost = area
    _clicked_areas.clear()
    topmost.trigger_interact()
