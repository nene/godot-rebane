extends Reference
class_name GameItemTextures

const textures = [
    preload("res://items/items.png"),
    preload("res://items/BeerGlass/beer-glass-lg.png"),
    preload("res://items/BeerGlass/beer-glass-sm.png"),
]

enum {
    ITEM,
    BEER_GLASS_LG,
    BEER_GLASS_SM,
}

static func create(type: int, coord: Vector2, size: Vector2 = Vector2(16, 16)) -> Texture:
    return texture_from_atlas(textures[type], coord, size)

static func texture_from_atlas(atlas: Texture, coord: Vector2, size: Vector2) -> Texture:
    var txt = AtlasTexture.new()
    txt.atlas = atlas
    txt.region = Rect2(size.x * coord.x, size.y * coord.y, size.x, size.y)
    return txt
