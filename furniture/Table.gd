extends StaticBody2D

var _inventory: Inventory

func _ready():
    var items = [
        [Book.new(), 1],
        [BottleOpener.new(), 1],
        [Drain.new(), 1],
        [Tap.new(), 1],
        [Ocean.new(), 4],
    ]
    self._inventory = Inventory.new(Fp.map(funcref(self, "_set_count"), items), 4*4)

func _set_count(pair: Array):
    pair[0].count = pair[1]
    return pair[0]

func _on_interact():
    InteractionState.show_inventory_dialog(self._inventory)
