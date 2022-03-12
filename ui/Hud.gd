extends Control

var hotbar_items = [
    GameItemGroup.new(BeerGlass.new(Drink.PILSNER, BeerGlass.FULL)),
    GameItemGroup.new(BeerGlass.new(Drink.ALEXANDER, BeerGlass.EMPTY)),
    GameItemGroup.new(BeerGlass.new(Drink.PORTER, BeerGlass.HALF_FULL)),
    GameItemGroup.new(BeerBottle.new(Drink.BOCK)),
    GameItemGroup.new(BeerBottle.new(Drink.HEINEKEN, BeerBottle.CapState.OPEN)),
    GameItemGroup.new(BeerBottle.new(), 4),
]

var _dialog = null
var _player_inventory: Inventory

func _ready():
    _player_inventory = Inventory.new(hotbar_items, 8)
    $HotBar/InventoryGrid.inventory = _player_inventory
    GameEvents.connect("show_dialog", self, "_show_dialog", [{"hide_hotbar": true}])
    GameEvents.connect("show_inventory_dialog", self, "_show_dialog")
    GameEvents.connect("add_to_player_inventory", self, "_add_to_player_inventory")

func _hide_dialog():
    $Dialogs.remove_child(_dialog)
    _dialog = null
    $Overlay.hide()
    get_tree().paused = false
    $HotBar.show()

func _show_dialog(dialog, cfg: Dictionary = {}):
    _dialog = dialog
    _dialog.connect("close", self, "_hide_dialog")
    $Dialogs.add_child(_dialog)
    $Overlay.show()
    get_tree().paused = true
    if cfg.has("hide_hotbar"):
        $HotBar.hide()

func _on_overlay_press():
    if _dialog:
        _dialog.press_outside()

func _add_to_player_inventory(group: GameItemGroup):
    _player_inventory.add(group)
