extends Node2D

export var text: String setget _set_text

func _set_text(txt: String):
    text = txt
    $Label.text = txt
    $Label.rect_size = $Label.get_font("font").get_string_size(txt)
    $ColorRect.set_size($Label.rect_size + Vector2(1,1))
