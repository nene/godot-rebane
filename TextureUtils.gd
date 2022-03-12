extends Node

func from_atlas(atlas: Texture, coord: Vector2, size: Vector2 = Vector2(16, 16)) -> Texture:
    var txt = AtlasTexture.new()
    txt.atlas = atlas
    txt.region = Rect2(size.x * coord.x, size.y * coord.y, size.x, size.y)
    return txt
