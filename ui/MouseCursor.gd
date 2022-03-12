extends Node2D
class_name MouseCursor

var cursor_invisible = load("res://ui/cursor-invisible.png")
var cursor_arrow = load("res://ui/cursor-arrow.png")
var cursor_hand = load("res://ui/cursor-hand.png")

var _holding_group: GameItemGroup

func _ready():
    GameEvents.connect("change_holding_group", self, "_set_holding_group")
    GameEvents.connect("allow_interact", self, "set_cursor", [Input.CURSOR_POINTING_HAND])
    GameEvents.connect("forbid_interact", self, "set_cursor", [Input.CURSOR_ARROW])
    Input.set_custom_mouse_cursor(cursor_invisible, Input.CURSOR_ARROW, Vector2.ZERO)
    Input.set_custom_mouse_cursor(cursor_invisible, Input.CURSOR_POINTING_HAND, Vector2.ZERO)

func _set_holding_group(group: GameItemGroup):
    _holding_group = group
    if _holding_group:
        $HoldingItemView.group = _holding_group
        $HoldingItemView.show()
    else:
        $HoldingItemView.hide()

func _get_holding_item() -> GameItem:
    return _holding_group.item() if _holding_group else null

func _input(event):
    self.global_position = get_global_mouse_position()

func set_cursor(cursor):
    match cursor:
        Input.CURSOR_ARROW:
            $Cursor.texture = cursor_arrow
            $Cursor.position = Vector2(4,6)
        Input.CURSOR_POINTING_HAND:
            $Cursor.texture = cursor_hand
            $Cursor.position = Vector2(2,6)
