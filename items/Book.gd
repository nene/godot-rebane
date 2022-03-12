extends GameItem
class_name Book

const ITEMS_TEXTURE = preload("res://items/items.png")

func get_name():
    return "Majaraamat"
    
func get_texture():
    return TextureUtils.from_atlas(ITEMS_TEXTURE, Vector2(0, 0))
