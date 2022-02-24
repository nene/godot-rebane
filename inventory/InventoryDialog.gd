tool
extends Control

export var title = "Title" setget _set_title, _get_title
export var description = "Description..." setget _set_description, _get_description
export var grid_size = Vector2(4, 4) setget _set_grid_size, _get_grid_size

# Dependency injection
var inventory: Inventory setget _set_inventory, _get_inventory
var mouse_cursor: MouseCursor setget _set_mouse_cursor

onready var grid = $BottomArea/InventoryGrid

func _set_mouse_cursor(cursor: MouseCursor):
    grid.mouse_cursor = cursor

func _set_inventory(inventory: Inventory):
    grid.inventory = inventory

func _get_inventory() -> Inventory:
    return grid.inventory

func _set_title(title: String):
    $TitleText.text = title

func _get_title() -> String:
    return $TitleText.text

func _set_description(description: String):
    $DescriptionText.text = description

func _get_description() -> String:
    return $DescriptionText.text

func _set_grid_size(size: Vector2):
    grid.grid_size = size

func _get_grid_size() -> Vector2:
    return grid.grid_size
