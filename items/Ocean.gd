extends GameItem
class_name Ocean

const ITEMS_TEXTURE = preload("res://items/items.png")

func get_name():
    return "Ooken"
    
func get_texture():
    return GameItemTextures.texture_from_atlas(ITEMS_TEXTURE, Vector2(4, 0))

func max_stack_size():
    return 99
