extends Reference
class_name GameItem

var itemsTexture = preload("res://items/items.png")

func get_name() -> String:
    return ""

func get_texture() -> Texture:
    return texture_from_atlas(0)

# protected
func texture_from_atlas(n: int) -> Texture:
    var txt = AtlasTexture.new()
    txt.atlas = itemsTexture
    txt.region = Rect2(16 * n, 0, 16, 16)
    return txt
