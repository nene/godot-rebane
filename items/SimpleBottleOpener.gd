extends GameItem
class_name SimpleBottleOpener

const TEXTURE = preload("res://items/bottle-opener.png")

func type():
    return "bottle_opener"

func name():
    return "Pudeliavaja"

func texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(0, 0), Vector2(18, 18))

func highlighted_texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(1, 0), Vector2(18, 18))
