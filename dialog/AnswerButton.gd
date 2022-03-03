tool
extends Button

export var inner_text = "" setget _set_inner_text, _get_inner_text

onready var _label = $MarginContainer/RichTextLabel

func _set_inner_text(text):
    inner_text = text
    if _label:
        _label.text = text

func _get_inner_text():
    return inner_text

func _ready():
    _label.text = inner_text
