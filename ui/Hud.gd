extends Control

var hotbar_items = [
    GameItemGroup.new(BeerGlass.new(Drink.PILSNER, BeerGlass.FULL)),
    GameItemGroup.new(BeerGlass.new(Drink.ALEXANDER, BeerGlass.EMPTY)),
    GameItemGroup.new(BeerGlass.new(Drink.PORTER, BeerGlass.HALF_FULL)),
]

var _dialog = null

func _ready():
    var hotbar_inventory = Inventory.new(hotbar_items, 8)
    $HotBar/InventoryGrid.inventory = hotbar_inventory
    $HotBar/InventoryGrid.mouse_cursor = $MouseCursor
    DialogState.connect("show_dialog", self, "_show_dialog")

func _hide_dialog():
    $Dialogs.remove_child(_dialog)
    _dialog = null
    $Overlay.hide()
    get_tree().paused = false
    $HotBar.show()

func _show_dialog(dialog, cfg: Dictionary):
    _dialog = dialog
    _dialog.mouse_cursor = $MouseCursor
    _dialog.connect("close", self, "_hide_dialog")
    $Dialogs.add_child(_dialog)
    $Overlay.show()
    get_tree().paused = true
    if cfg.has("hide_hotbar"):
        $HotBar.hide()

func _on_overlay_press():
    if _dialog:
        _dialog.press_outside()
