extends GameItem
class_name BeerGlass

var beerGlassTexture = preload("res://items/beer-glass-lg.png")

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
    return texture_from_beer_atlas(level)

func texture_from_beer_atlas(n: int) -> Texture:
    var txt = AtlasTexture.new()
    txt.atlas = beerGlassTexture
    txt.region = Rect2(16 * n, 16 * 2, 16, 16)
    return txt
