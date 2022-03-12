extends GameItem
class_name Drain

const ITEMS_TEXTURE = preload("res://items/items.png")

func get_name():
    return "Valamu"
    
func get_texture():
    return GameItemTextures.texture_from_atlas(ITEMS_TEXTURE, Vector2(3, 0))
