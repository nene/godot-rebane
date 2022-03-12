extends GameItem
class_name Ocean

const TEXTURE = preload("res://items/ocean.png")

func get_name():
    return "Ooken"

func get_texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(0, 0), Vector2(18, 18))

func get_highlighted_texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(1, 0), Vector2(18, 18))

func max_stack_size():
    return 99
