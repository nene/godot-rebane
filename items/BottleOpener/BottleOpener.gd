extends GameItem
class_name BottleOpener

const TEXTURE = preload("res://items/BottleOpener/bottle-opener.png")

func type():
    return "bottle_opener"

func _opener_sprite_row() -> int:
    return 0

func texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(0, _opener_sprite_row()), Vector2(18, 18))

func highlighted_texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(1, _opener_sprite_row()), Vector2(18, 18))

func has_ribbon():
    return false
