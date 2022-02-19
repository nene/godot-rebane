extends GameItem
class_name BeerGlass

var beerGlassTexture = preload("res://items/beer-glass-lg.png")

func get_name():
    return "Šoppen"
    
func get_texture():
    return texture_from_beer_atlas(4)

func texture_from_beer_atlas(n: int) -> Texture:
    var txt = AtlasTexture.new()
    txt.atlas = beerGlassTexture
    txt.region = Rect2(16 * n, 16 * 2, 16, 16)
    return txt
