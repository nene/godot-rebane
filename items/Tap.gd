extends GameItem
class_name Tap

const TEXTURE = preload("res://items/tap.png")

func get_type():
    return "tap"

func get_name():
    return "Kraan"

func get_texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(0, 0), Vector2(18, 18))

func get_highlighted_texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(1, 0), Vector2(18, 18))
