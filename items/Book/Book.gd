extends GameItem
class_name Book

const TEXTURE = preload("res://items/Book/book.png")

func type():
    return "book"

func name():
    return "Majaraamat"
    
func texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(0, 0), Vector2(18, 18))

func highlighted_texture():
    return TextureUtils.from_atlas(TEXTURE, Vector2(1, 0), Vector2(18, 18))
