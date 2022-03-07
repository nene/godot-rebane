extends Control

# Triggered when dialog is closed
signal close

# Dependency injection
var inventory: Inventory setget _set_inventory

onready var grid = $BottomArea/InventoryGrid

func _ready():
    if inventory:
        grid.inventory = inventory

func _set_inventory(inv: Inventory):
    inventory = inv
    if grid:
        grid.inventory = inv

func press_outside():
    emit_signal("close")
