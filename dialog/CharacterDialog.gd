extends Control

# Triggered when dialog is closed
signal close

# dependency injection
var mouse_cursor: MouseCursor

func close():
    emit_signal("close")
