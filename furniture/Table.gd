extends StaticBody2D

var _inventory: Inventory

func _ready():
    var items = [
        [Book.new(), 1],
        [BottleOpener.new(), 1],
        [Drain.new(), 1],
        [Tap.new(), 1],
        [Ocean.new(), randi() % 4],
    ]
    self._inventory = Inventory.new(Fp.map(funcref(self, "_set_count"), items), 4*4)
    
    self._inventory.connect("change", self, "_update_table_ocean_display")
    self._update_table_ocean_display()

func _set_count(pair: Array):
    pair[0].count = pair[1]
    return pair[0]

func _on_interact():
    InteractionState.show_inventory_dialog(self._inventory)

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

func _is_ocean(item: GameItem) -> bool:
    return item is Ocean

func _item_count(item: GameItem) -> int:
    return item.count
