extends StaticBody2D

var _inventory: Inventory

func _ready():
    self._inventory = Inventory.new([
        GameItemGroup.new(BeerGlass.new(Drink.WATER), 9),
        GameItemGroup.new(BeerGlass.new(Drink.WATER), 9),
        GameItemGroup.new(BeerGlass.new(Drink.WATER), 9),
        GameItemGroup.new(BeerGlass.new(Drink.WATER), 9),
        GameItemGroup.new(BeerGlass.new(Drink.WATER), 9),
        GameItemGroup.new(BeerGlass.new(Drink.WATER), 9),
        GameItemGroup.new(BeerGlass.new(Drink.WATER), 9),
        GameItemGroup.new(BeerGlass.new(Drink.WATER), 9),
        GameItemGroup.new(BeerGlass.new(Drink.WATER), 9),
        GameItemGroup.new(BeerGlass.new(Drink.WATER), 9),
        GameItemGroup.new(BeerGlass.new(Drink.WATER), 9),
        GameItemGroup.new(BeerGlass.new(Drink.WATER), 9),
    ], 6*4)

func _on_interact():
    var dialog = load("res://furniture/BeerCabinet/BeerCabinetInventoryDialog.tscn").instance()
    dialog.inventory = self._inventory
    InteractionState.show_dialog(dialog)
