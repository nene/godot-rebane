extends Node2D
class_name MouseCursor

var cursor_invisible = load("res://ui/cursor-invisible.png")
var cursor_arrow = load("res://ui/cursor-arrow.png")
var cursor_hand = load("res://ui/cursor-hand.png")

var _holding_group: GameItemGroup
var _interact_allowed := false
var _combining_allowed := false

func _ready():
    GameEvents.connect("change_holding_group", self, "_set_holding_group")
    GameEvents.connect("allow_interact", self, "_allow_interact")
    GameEvents.connect("forbid_interact", self, "_forbid_interact")
    GameEvents.connect("allow_combine", self, "_allow_combine")
    GameEvents.connect("forbid_combine", self, "_forbid_combine")
    Input.set_custom_mouse_cursor(cursor_invisible, Input.CURSOR_ARROW, Vector2.ZERO)
    Input.set_custom_mouse_cursor(cursor_invisible, Input.CURSOR_POINTING_HAND, Vector2.ZERO)

func _set_holding_group(group: GameItemGroup):
    _holding_group = group
    if _holding_group:
        $HoldingItemView.group = _holding_group
        $HoldingItemView.show()
    else:
        $HoldingItemView.hide()

func _input(event):
    self.global_position = get_global_mouse_position()

func _allow_interact():
    _interact_allowed = true
    _update_cursor()

func _forbid_interact():
    _interact_allowed = false
    _update_cursor()

func _allow_combine():
    _combining_allowed = true
    _update_cursor()

func _forbid_combine():
    _combining_allowed = false
    _update_cursor()

func _update_cursor():
    if _interact_allowed || _combining_allowed:
        if _holding_group:
            $HoldingItemView.highlighted = true
        else:
            $Cursor.texture = cursor_hand
            $Cursor.position = Vector2(2,6)
    else:
        $HoldingItemView.highlighted = false
        $Cursor.texture = cursor_arrow
        $Cursor.position = Vector2(4,6)
