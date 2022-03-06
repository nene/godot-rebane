extends StaticBody2D

var _inventory: Inventory

func _ready():
    var items = [
        GameItemGroup.new(Book.new()),
        GameItemGroup.new(SimpleBottleOpener.new()),
        GameItemGroup.new(Drain.new()),
        GameItemGroup.new(Tap.new()),
        GameItemGroup.new(Ocean.new(), randi() % 4),
    ]
    self._inventory = Inventory.new(items, 4*4)
    
    self._inventory.connect("change", self, "_update_table_ocean_display")
    self._update_table_ocean_display()

func _on_interact():
    var dialog = load("res://furniture/Table/TableInventoryDialog.tscn").instance()
    dialog.inventory = self._inventory
    DialogState.show_dialog(dialog)

func _update_table_ocean_display():
    var count = _ocean_count()
    if count < _frame_count():
        $AnimatedSprite.frame = count
    else:
        $AnimatedSprite.frame = _frame_count() - 1

func _frame_count() -> int:
    return $AnimatedSprite.frames.get_frame_count("default")

func _ocean_count() -> int:
    var items = self._inventory.items()
    var oceans = Fp.filter(funcref(self, "_is_ocean"), items)
    return Fp.sum(Fp.map(funcref(self, "_item_count"), oceans))

func _is_ocean(group: GameItemGroup) -> bool:
    return group.item() is Ocean

func _item_count(group: GameItemGroup) -> int:
    return group.count()
