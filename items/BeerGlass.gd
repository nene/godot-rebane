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

func _init(lvl: int = EMPTY):
    level = lvl

func get_name():
    return "Šoppen"
    
func get_texture():
    return GameItemTextures.create(GameItemTextures.BEER_GLASS, Vector2(level, 2))
