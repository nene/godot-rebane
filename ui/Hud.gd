extends CanvasLayer

func _input(event):
    if event.is_action_pressed("ui_inventory"):
        $InventoryGrid.visible = !$InventoryGrid.visible
