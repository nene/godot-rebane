extends GameItem
class_name Ocean

const TEXTURE = preload("res://items/ocean.png")

func type():
    return "ocean"

func name():
    return "Ooken"

func texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(0, 0), Vector2(18, 18))

func highlighted_texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(1, 0), Vector2(18, 18))

func max_stack_size():
    return 99
