extends Control

# Triggered when dialog is closed (emitted by subclasses)
signal close # warning-ignore: unused_signal

export(Resource) var photo

func _ready():
    $Photo.texture = photo

func press_outside():
    pass
