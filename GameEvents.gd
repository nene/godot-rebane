extends Node
# warning-ignore-all:unused_signal

# -- (dialog: Control)
signal show_dialog(inventory)

# -- (dialog: Control)
signal show_inventory_dialog(inventory)

# -- (location: Global.Location)
signal change_location(location)

# -- (group: GameItemGroup)
signal change_holding_group(group)

signal allow_interact
signal forbid_interact
