extends GameItem
class_name BeerBottle

const BEER_BOTTLE_TEXTURE = preload("res://items/BeerBottle/bottle.png")

enum CapState {
    CLOSED,
    OPEN,
}

var drink_type = Drink.WATER
var cap_state = CapState.CLOSED

func _init(drink_type: int, cap_state: int = CapState.CLOSED):
    self.drink_type = drink_type
    self.cap_state = cap_state

func get_name():
    return Drink.get_drink(drink_type)["name"]

func get_texture():
    var drink = Drink.get_drink(drink_type)
    return TextureUtils.from_atlas(BEER_BOTTLE_TEXTURE, Vector2(cap_state + 1, drink["bottleSpriteIndex"]))
