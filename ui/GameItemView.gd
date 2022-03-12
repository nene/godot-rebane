extends Node2D
class_name GameItemView

var highlighted = false setget _set_highlighted

var group: GameItemGroup = null setget _set_group

func _set_group(grp: GameItemGroup):
    group = grp
    $TextureRect.texture = _get_item_texture()

    if group.count() == 1:
        $Label.text = ""
    else:
        $Label.text = String(group.count())

func _get_item_texture() -> Texture:
    if !group:
        return null
    elif highlighted:
        return group.item().get_highlighted_texture()
    else:
        return group.item().get_texture()

func _set_highlighted(hl: bool):
    highlighted = hl
    $TextureRect.texture = _get_item_texture()
