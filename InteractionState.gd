extends Node

signal allow_interact
signal forbid_interact
signal show_inventory_dialog(inventory)

var hovered_objects = 0

func enter_object():
    if hovered_objects == 0:
        emit_signal("allow_interact")
    hovered_objects += 1

func exit_object():
    hovered_objects -= 1
    if hovered_objects == 0:
        emit_signal("forbid_interact")

# Takes inventory dialog config:
# - title: String
# - description: String
# - inventory: Inventory
# - grid_size: Vector2
func show_inventory_dialog(dialog_cfg: Dictionary):
    emit_signal("show_inventory_dialog", dialog_cfg)
