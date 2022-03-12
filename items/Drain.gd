extends GameItem
class_name Drain

const TEXTURE = preload("res://items/drain.png")

func get_name():
    return "Valamu"

func get_texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(0, 0), Vector2(18, 18))

func get_highlighted_texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(1, 0), Vector2(18, 18))
