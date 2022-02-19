extends Reference
class_name GameItemTextures

const textures = [
    preload("res://items/items.png"),
    preload("res://items/beer-glass-lg.png"),
]

enum {
    ITEM,
    BEER_GLASS,
}

static func create(type: int, coord: Vector2) -> Texture:
    return texture_from_atlas(textures[type], coord)

static func texture_from_atlas(atlas: Texture, coord: Vector2) -> Texture:
    var txt = AtlasTexture.new()
    txt.atlas = atlas
    txt.region = Rect2(16 * coord.x, 16 * coord.y, 16, 16)
    return txt
