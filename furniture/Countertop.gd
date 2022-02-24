extends StaticBody2D

var _inventory: Inventory

func _ready():
    self._inventory = LockedInventory.new([
        GameItemGroup.new(LockedBottleOpener.new()),
    ], 1)

func _on_interact():
    InteractionState.show_inventory_dialog({
        "title": "Konvendi avaja",
        "description": "Vaid koha peal kasutamiseks.",
        "inventory": self._inventory,
        "grid_size": Vector2(1, 1),
    })
