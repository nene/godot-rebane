extends Node2D
class_name GameItemView

func set_item(item: GameItem):
    $TextureRect.texture = item.get_texture()
