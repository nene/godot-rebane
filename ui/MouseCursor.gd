extends Node2D
class_name MouseCursor

var cursor_invisible = load("res://ui/cursor-invisible.png")
var cursor_arrow = load("res://ui/cursor-arrow.png")
var cursor_hand = load("res://ui/cursor-hand.png")

var holding_group: GameItemGroup setget _set_holding_group

func _ready():
    Input.set_custom_mouse_cursor(cursor_invisible, Input.CURSOR_ARROW, Vector2.ZERO)
    Input.set_custom_mouse_cursor(cursor_invisible, Input.CURSOR_POINTING_HAND, Vector2.ZERO)

func _set_holding_group(group: GameItemGroup):
    holding_group = group
    if holding_group:
        $HoldingItemView.set_group(holding_group)
        $HoldingItemView.show()
    else:
        $HoldingItemView.hide()

func _get_holding_item() -> GameItem:
    return holding_group.item() if holding_group else null

func _input(event):
    self.global_position = get_global_mouse_position()

func _process(_delta):
    InteractionState.process_pending_clicks(_get_holding_item())
    if InteractionState.is_interactable(_get_holding_item()):
        set_cursor(Input.CURSOR_POINTING_HAND)
    else:
        set_cursor(Input.CURSOR_ARROW)

func set_cursor(cursor):
    match cursor:
        Input.CURSOR_ARROW:
            $Cursor.texture = cursor_arrow
            $Cursor.position = Vector2(4,6)
        Input.CURSOR_POINTING_HAND:
            $Cursor.texture = cursor_hand
            $Cursor.position = Vector2(2,6)
