extends GameItem
class_name SimpleBottleOpener

const ITEMS_TEXTURE = preload("res://items/items.png")

func get_name():
    return "Pudeliavaja"

func get_texture():
    return GameItemTextures.texture_from_atlas(ITEMS_TEXTURE, Vector2(1, 0))
