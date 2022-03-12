extends Node2D
class_name GameItemView

var highlighted = false setget _set_highlighted

var _group: GameItemGroup

func set_group(group: GameItemGroup):
    _group = group
    $TextureRect.texture = _get_item_texture()

    if _group.count() == 1:
        $Label.text = ""
    else:
        $Label.text = String(_group.count())

func _get_item_texture() -> Texture:
    if highlighted:
        return _group.item().get_highlighted_texture()
    else:
        return _group.item().get_texture()

func _set_highlighted(hl: bool):
    highlighted = hl
    $TextureRect.texture = _get_item_texture()
