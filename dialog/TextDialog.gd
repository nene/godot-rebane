extends "res://dialog/CharacterDialog.gd"

var text = ""

func _ready():
    $Text.text = text
    $AnimationPlayer.play("text")

func press_outside():
    emit_signal("close")
