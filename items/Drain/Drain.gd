extends GameItem
class_name Drain

const TEXTURE = preload("res://items/Drain/drain.png")

func type():
    return "drain"

func name():
    return "Valamu"

func texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(0, 0), Vector2(18, 18))

func highlighted_texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(1, 0), Vector2(18, 18))
