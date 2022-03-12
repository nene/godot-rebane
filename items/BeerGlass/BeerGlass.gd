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
    return _get_texture_of_type(GameItemTextures.BEER_GLASS_LG, Vector2(16, 16))

func get_small_texture():
    return _get_texture_of_type(GameItemTextures.BEER_GLASS_SM, Vector2(10, 10))

func _get_texture_of_type(texture_type: int, size: Vector2):
    var color = Drink.get_drink(drink_type)["color"]
    return GameItemTextures.create(texture_type, Vector2(level, color), size)

# Reduces the amount of drink in glass
func sip():
    if level > EMPTY:
        level -= 1

func is_empty() -> bool:
    return level == EMPTY

func max_stack_size():
    if level == EMPTY:
        return 9
    else:
        return 1

func is_groupable_with(item: GameItem) -> bool:
    var BeerGlassClass = load("res://items/BeerGlass.gd")
    return item is BeerGlassClass && item.is_empty() && self.is_empty()
