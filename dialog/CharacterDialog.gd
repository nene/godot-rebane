extends Control

# Triggered when dialog is closed
signal close

export(Resource) var photo

func _ready():
    $Photo.texture = photo

func press_outside():
    pass
