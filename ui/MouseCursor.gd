extends Node2D
class_name MouseCursor

var cursor_invisible = load("res://ui/cursor-invisible.png")
var cursor_arrow = load("res://ui/cursor-arrow.png")
var cursor_hand = load("res://ui/cursor-hand.png")

var holding_item: GameItem setget set_holding_item

func _ready():
    Input.set_custom_mouse_cursor(cursor_invisible, Input.CURSOR_ARROW, Vector2.ZERO)
    Input.set_custom_mouse_cursor(cursor_invisible, Input.CURSOR_POINTING_HAND, Vector2.ZERO)
    HoverState.connect("mouse_over", self, "set_cursor", [Input.CURSOR_POINTING_HAND])
    HoverState.connect("mouse_out", self, "set_cursor", [Input.CURSOR_ARROW])

func set_holding_item(item: GameItem):
    holding_item = item
    if holding_item:
        $HoldingItemView.set_item(holding_item)
        $HoldingItemView.show()
    else:
        $HoldingItemView.hide()

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
