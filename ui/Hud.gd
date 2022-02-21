extends CanvasLayer

var holding_item: GameItem setget set_holding_item

func set_holding_item(item: GameItem):
    holding_item = item
    if holding_item:
        $HoldingItemView.set_item(holding_item)
        $HoldingItemView.show()
    else:
        $HoldingItemView.hide()

func _input(event):
    if event.is_action_pressed("ui_inventory"):
        $InventoryGrid.visible = !$InventoryGrid.visible

    $HoldingItemView.global_position = $HoldingItemView.get_global_mouse_position()
