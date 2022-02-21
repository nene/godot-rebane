extends Node2D

var popup_inventory = [
    Book.new(),
    BottleOpener.new(),
    Drain.new(),
    Tap.new(),
    Ocean.new(),
    Ocean.new(),
    Ocean.new(),
    Ocean.new(),
]

var hotbar_inventory = [
    BeerGlass.new(Drink.PILSNER, BeerGlass.FULL),
    BeerGlass.new(Drink.ALEXANDER, BeerGlass.EMPTY),
    BeerGlass.new(Drink.PORTER, BeerGlass.HALF_FULL),
]

func _ready():
    $PopupInventory/InventoryGrid.load_items(popup_inventory)
    $PopupInventory/InventoryGrid.mouse_cursor = $MouseCursor
    $HotBar/InventoryGrid.load_items(hotbar_inventory)
    $HotBar/InventoryGrid.mouse_cursor = $MouseCursor

func _input(event):
    if event.is_action_pressed("ui_inventory"):
        $PopupInventory.visible = !$PopupInventory.visible
