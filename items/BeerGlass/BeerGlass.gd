extends GameItem
class_name BeerGlass

const BEER_GLASS_LG_TEXTURE = preload("res://items/BeerGlass/beer-glass-lg.png")
const BEER_GLASS_LG_OUTLINE_TEXTURE = preload("res://items/BeerGlass/beer-glass-lg-outline.png")
const BEER_GLASS_SM_TEXTURE = preload("res://items/BeerGlass/beer-glass-sm.png")

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

func type():
    return "beer_glass"

func name():
    return "Šoppen"

func texture():
    return _get_texture_of_type(BEER_GLASS_LG_TEXTURE, Vector2(18, 18))

func highlighted_texture():
    return _get_texture_of_type(BEER_GLASS_LG_OUTLINE_TEXTURE, Vector2(18, 18))

func get_small_texture():
    return _get_texture_of_type(BEER_GLASS_SM_TEXTURE, Vector2(10, 10))

func _get_texture_of_type(texture: Texture, size: Vector2):
    var color = Drink.get_drink(drink_type)["color"]
    return TextureUtils.from_atlas(texture, Vector2(level, color), size)

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
    var BeerGlassClass = load("res://items/BeerGlass/BeerGlass.gd")
    return item is BeerGlassClass && item.is_empty() && self.is_empty()
