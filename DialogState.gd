extends Node

signal show_dialog(inventory, cfg)

func show_dialog(dialog: Control, cfg: Dictionary = {}):
    emit_signal("show_dialog", dialog, cfg)
