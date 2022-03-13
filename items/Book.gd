extends GameItem
class_name Book

const TEXTURE = preload("res://items/book.png")

func get_type():
    return "book"

func get_name():
    return "Majaraamat"
    
func get_texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(0, 0), Vector2(18, 18))

func get_highlighted_texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(1, 0), Vector2(18, 18))
