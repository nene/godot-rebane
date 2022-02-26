extends GameItem
class_name BeerGlass

enum {
    EMPTY,
    ALMOST_EMPTY,
    HALF_FULL,
    ALMOST_FULL,
    FULL
}

var level: int = EMPTY
var drink_type: int = Drink.WATER

func _init(drink: int, lvl: int = EMPTY):
    drink_type = drink
    level = lvl

func get_name():
    return "Šoppen"

func get_texture():
    var color = Drink.get_drink(drink_type)["color"]
    return GameItemTextures.create(GameItemTextures.BEER_GLASS, Vector2(level, color))

func max_stack_size():
    return 9

