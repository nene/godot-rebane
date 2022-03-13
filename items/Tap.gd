extends GameItem
class_name Tap

const TEXTURE = preload("res://items/tap.png")

func type():
    return "tap"

func name():
    return "Kraan"

func texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(0, 0), Vector2(18, 18))

func highlighted_texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(1, 0), Vector2(18, 18))
