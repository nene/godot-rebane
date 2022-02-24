tool
extends Control

export var title = "Title" setget _set_title, _get_title
export var description = "Description..." setget _set_description, _get_description

# Dependency injection
var mouse_cursor: MouseCursor setget set_mouse_cursor

func set_mouse_cursor(cursor: MouseCursor):
    $InventoryGrid.mouse_cursor = cursor

func load_inventory(inventory: Inventory):
    $InventoryGrid.load_inventory(inventory)

func _set_title(title: String):
    $TitleText.text = title

func _get_title() -> String:
    return $TitleText.text

func _set_description(description: String):
    $DescriptionText.text = description

func _get_description() -> String:
    return $DescriptionText.text
