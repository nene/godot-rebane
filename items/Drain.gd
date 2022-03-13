extends GameItem
class_name Drain

const TEXTURE = preload("res://items/drain.png")

func type():
    return "drain"

func name():
    return "Valamu"

func texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(0, 0), Vector2(18, 18))

func highlighted_texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(1, 0), Vector2(18, 18))

func combine(item_in_hand: GameItem):
    if (item_in_hand.type() == "beer_bottle" || item_in_hand.type() == "beer_glass") && !item_in_hand.is_empty():
        var EmptyToDrain = load("res://items/combinations/EmptyToDrain.gd")
        return EmptyToDrain.new(item_in_hand, self)
