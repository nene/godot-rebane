extends Node2D
class_name MouseCursor

var cursor_arrow = load("res://ui/cursor-arrow.png")

var holding_item: GameItem setget set_holding_item

func _ready():
    Input.set_custom_mouse_cursor(cursor_arrow, Input.CURSOR_ARROW, Vector2.ZERO)

func set_holding_item(item: GameItem):
    holding_item = item
    if holding_item:
        $HoldingItemView.set_item(holding_item)
        $HoldingItemView.show()
    else:
        $HoldingItemView.hide()

func _input(event):
    $HoldingItemView.global_position = get_global_mouse_position()
