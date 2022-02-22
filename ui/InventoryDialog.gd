extends Control

# Dependency injection
var mouse_cursor: MouseCursor setget set_mouse_cursor

func set_mouse_cursor(cursor: MouseCursor):
    $InventoryGrid.mouse_cursor = cursor

func load_items(items: Array):
    $InventoryGrid.load_items(items)
