extends Control

var hotbar_items = [
    GameItemGroup.new(BeerGlass.new(Drink.PILSNER, BeerGlass.FULL)),
    GameItemGroup.new(BeerGlass.new(Drink.ALEXANDER, BeerGlass.EMPTY)),
    GameItemGroup.new(BeerGlass.new(Drink.PORTER, BeerGlass.HALF_FULL)),
]

func _ready():
    $InventoryDialog.mouse_cursor = $MouseCursor
    var hotbar_inventory = Inventory.new(hotbar_items, 8)
    $HotBar/InventoryGrid.load_inventory(hotbar_inventory)
    $HotBar/InventoryGrid.mouse_cursor = $MouseCursor
    InteractionState.connect("show_inventory_dialog", self, "_show_inventory_dialog")

func _show_inventory_dialog(cfg: Dictionary):
    $InventoryDialog.load_inventory(cfg["inventory"])
    $InventoryDialog.title = cfg["title"]
    $InventoryDialog.description = cfg["description"]
    $InventoryDialog.show()
    $Overlay.show()
    get_tree().paused = true
    
func _hide_inventory_dialog():
    $InventoryDialog.hide()
    $Overlay.hide()
    get_tree().paused = false
