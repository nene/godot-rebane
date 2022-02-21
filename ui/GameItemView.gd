extends Node2D
class_name GameItemView

var item: GameItem

func set_item(_item: GameItem):
    item = _item
    $TextureRect.texture = item.get_texture()

    if item.max_stack_size() == 1:
        $Label.text = ""
    else:
        $Label.text = String(item.count)

