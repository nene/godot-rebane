extends GameItem
class_name BeerBottle

const BEER_BOTTLE_TEXTURE = preload("res://items/BeerBottle/bottle.png")

enum CapState {
    CLOSED = 1,
    OPEN = 2,
}

var drink_type = Drink.WATER
var cap_state = CapState.CLOSED

func _init(drink_type = null, cap_state: int = CapState.CLOSED):
    self.drink_type = drink_type
    self.cap_state = cap_state

func get_name():
    if is_empty():
        return "Tühi pudel"
    else:
        return Drink.get_drink(drink_type)["name"]

func get_texture():
    if is_empty():
        return TextureUtils.from_atlas(BEER_BOTTLE_TEXTURE, Vector2(cap_state, 0))
    else:
        var drink = Drink.get_drink(drink_type)
        return TextureUtils.from_atlas(BEER_BOTTLE_TEXTURE, Vector2(cap_state, drink["bottleSpriteIndex"]))

func is_empty():
    return drink_type == null

func empty():
    drink_type = null

func max_stack_size():
    return 9 if is_empty() else 1
