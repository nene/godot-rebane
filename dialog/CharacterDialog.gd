extends Control

# Triggered when dialog is closed
signal close

export(Resource) var photo

# dependency injection
var mouse_cursor: MouseCursor

func _ready():
    $Photo.texture = photo

func press_outside():
    pass
