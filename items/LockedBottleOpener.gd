extends GameItem
class_name LockedBottleOpener

const ITEMS_TEXTURE = preload("res://items/items.png")

func get_name():
    return "Konvendi avaja"

func get_texture():
    return GameItemTextures.texture_from_atlas(ITEMS_TEXTURE, Vector2(2, 0))
