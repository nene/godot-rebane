tool
extends Button

export var inner_text = "" setget _set_inner_text

onready var _label = $MarginContainer/RichTextLabel
const VERTICAL_MARGIN = 2

func _set_inner_text(text):
    inner_text = text
    if _label:
        _label.text = text
        yield(get_tree(), "idle_frame")
        rect_min_size.y = _label.get_content_height() + VERTICAL_MARGIN * 2

func _ready():
    _label.set_anchors_and_margins_preset(Control.PRESET_WIDE)
    _set_inner_text(inner_text)

func _on_visibility_changed():
    _set_inner_text(inner_text)
