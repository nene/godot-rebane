extends StaticBody2D

var _inventory: Inventory

func _ready():
    self._inventory = LockedInventory.new([
        GameItemGroup.new(LockedBottleOpener.new()),
    ], 1)

func _on_interact():
    var dialog = load("res://inventory/CountertopInventoryDialog.tscn").instance()
    dialog.inventory = self._inventory
    InteractionState.show_inventory_dialog(dialog)
