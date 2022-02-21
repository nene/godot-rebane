extends Node2D
class_name MouseCursor

var holding_item: GameItem setget set_holding_item

func set_holding_item(item: GameItem):
    holding_item = item
    if holding_item:
        $HoldingItemView.set_item(holding_item)
        $HoldingItemView.show()
    else:
        $HoldingItemView.hide()

func _input(event):
    $HoldingItemView.global_position = get_global_mouse_position()
