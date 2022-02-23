extends Control

var popup_inventory = [
    [Book.new(), 1],
    [BottleOpener.new(), 1],
    [Drain.new(), 1],
    [Tap.new(), 1],
    [Ocean.new(), 4],
]

var hotbar_inventory = [
    BeerGlass.new(Drink.PILSNER, BeerGlass.FULL),
    BeerGlass.new(Drink.ALEXANDER, BeerGlass.EMPTY),
    BeerGlass.new(Drink.PORTER, BeerGlass.HALF_FULL),
]

func _ready():
    popup_inventory = Fp.map(funcref(self, "set_count"), popup_inventory)
    $InventoryDialog.load_items(popup_inventory)
    $InventoryDialog.mouse_cursor = $MouseCursor
    $HotBar/InventoryGrid.load_items(hotbar_inventory)
    $HotBar/InventoryGrid.mouse_cursor = $MouseCursor
    InteractionState.connect("interact", self, "show_inventory_dialog")

func set_count(pair: Array):
    pair[0].count = pair[1]
    return pair[0]

func show_inventory_dialog():
    $InventoryDialog.show()
    $Overlay.show()
    
func hide_inventory_dialog():
    $InventoryDialog.hide()
    $Overlay.hide()
