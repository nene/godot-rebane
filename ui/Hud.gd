extends Control

var popup_items = [
    [Book.new(), 1],
    [BottleOpener.new(), 1],
    [Drain.new(), 1],
    [Tap.new(), 1],
    [Ocean.new(), 4],
]

var hotbar_items = [
    BeerGlass.new(Drink.PILSNER, BeerGlass.FULL),
    BeerGlass.new(Drink.ALEXANDER, BeerGlass.EMPTY),
    BeerGlass.new(Drink.PORTER, BeerGlass.HALF_FULL),
]

func _ready():
    var popup_inventory = Inventory.new(Fp.map(funcref(self, "set_count"), popup_items), 4*4)
    $InventoryDialog.load_inventory(popup_inventory)
    $InventoryDialog.mouse_cursor = $MouseCursor
    var hotbar_inventory = Inventory.new(hotbar_items, 8)
    $HotBar/InventoryGrid.load_inventory(hotbar_inventory)
    $HotBar/InventoryGrid.mouse_cursor = $MouseCursor
    InteractionState.connect("interact", self, "show_inventory_dialog")

func set_count(pair: Array):
    pair[0].count = pair[1]
    return pair[0]

func show_inventory_dialog():
    $InventoryDialog.show()
    $Overlay.show()
    get_tree().paused = true
    
func hide_inventory_dialog():
    $InventoryDialog.hide()
    $Overlay.hide()
    get_tree().paused = false
