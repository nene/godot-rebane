extends StaticBody2D
var _inventory: Inventory

func _ready():
    self._inventory = LockedInventory.new([
        GameItemGroup.new(Tap.new()),
        GameItemGroup.new(Drain.new()),
    ], 2)

func is_interactable(_group):
    return true

func _on_interact(event: InteractEvent):
    var dialog = load("res://furniture/KitchenSink/KitchenSinkInventoryDialog.tscn").instance()
    dialog.inventory = self._inventory
    GameEvents.emit_signal("show_inventory_dialog", dialog)
