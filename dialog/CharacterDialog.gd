extends Control

# Triggered when dialog is closed
signal close

var character_name = ""

# dependency injection
var mouse_cursor: MouseCursor

func _ready():
    $CharacterName.text = character_name

func press_outside():
    pass
