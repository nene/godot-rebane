extends GameItem
class_name LockedBottleOpener

const TEXTURE = preload("res://items/bottle-opener.png")

func type():
    return "bottle_opener"

func name():
    return "Konvendi avaja"

func texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(0, 1), Vector2(18, 18))

func highlighted_texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(1, 1), Vector2(18, 18))
