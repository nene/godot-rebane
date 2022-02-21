extends Node2D

var holding_item: GameItem setget set_holding_item

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
    $HotBar/InventoryGrid.load_items(hotbar_inventory)    

func set_holding_item(item: GameItem):
    holding_item = item
    if holding_item:
        $HoldingItemView.set_item(holding_item)
        $HoldingItemView.show()
    else:
        $HoldingItemView.hide()

func _input(event):
    if event.is_action_pressed("ui_inventory"):
        $PopupInventory.visible = !$PopupInventory.visible

    $HoldingItemView.global_position = get_global_mouse_position()
