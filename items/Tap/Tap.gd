extends GameItem
class_name Tap

const TEXTURE = preload("res://items/Tap/tap.png")

func type():
    return "tap"

func name():
    return "Kraan"

func texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(0, 0), Vector2(18, 18))

func highlighted_texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(1, 0), Vector2(18, 18))

func combine(item_in_hand: GameItem):
    if (item_in_hand.type() == "beer_bottle" || item_in_hand.type() == "beer_glass") && item_in_hand.is_empty():
        var FillFromTap = load("res://items/combinations/FillFromTap.gd")
        return FillFromTap.new(item_in_hand, self)
