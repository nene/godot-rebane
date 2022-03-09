extends Node2D
class_name GameItemView

var _group: GameItemGroup

func set_group(group: GameItemGroup):
    _group = group
    $TextureRect.texture = _group.item().get_texture()

    if _group.count() == 1:
        $Label.text = ""
    else:
        $Label.text = String(_group.count())

