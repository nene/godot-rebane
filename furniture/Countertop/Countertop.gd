extends StaticBody2D

var _inventory: Inventory

func _ready():
    self._inventory = LockedInventory.new([
        GameItemGroup.new(LockedBottleOpener.new()),
    ], 1)

func _on_interact():
    var dialog = load("res://furniture/Countertop/CountertopInventoryDialog.tscn").instance()
    dialog.inventory = self._inventory
    GameEvents.emit_signal("show_inventory_dialog", dialog)

func is_interactable(_item):
    return true
