extends Control

# Triggered when dialog is closed
signal close

# Dependency injection
var inventory: Inventory setget _set_inventory
var mouse_cursor: MouseCursor setget _set_mouse_cursor

onready var grid = $BottomArea/InventoryGrid

func _ready():
    if inventory:
        grid.inventory = inventory
    if mouse_cursor:
        grid.mouse_cursor = mouse_cursor

func _set_mouse_cursor(cursor: MouseCursor):
    mouse_cursor = cursor
    if grid:
        grid.mouse_cursor = cursor

func _set_inventory(inv: Inventory):
    inventory = inv
    if grid:
        grid.inventory = inv

func press_outside():
    emit_signal("close")
