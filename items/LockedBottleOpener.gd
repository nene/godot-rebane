extends GameItem
class_name LockedBottleOpener

const TEXTURE = preload("res://items/bottle-opener.png")

func get_type():
    return "bottle_opener"

func get_name():
    return "Konvendi avaja"

func get_texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(0, 1), Vector2(18, 18))

func get_highlighted_texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(1, 1), Vector2(18, 18))
