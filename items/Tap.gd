extends GameItem
class_name Tap

const ITEMS_TEXTURE = preload("res://items/items.png")

func get_name():
    return "Kraan"
    
func get_texture():
    return TextureUtils.from_atlas(ITEMS_TEXTURE, Vector2(5, 0))
