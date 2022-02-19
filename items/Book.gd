extends GameItem
class_name Book

func get_name():
    return "Majaraamat"
    
func get_texture():
    return GameItemTextures.create(GameItemTextures.ITEM, Vector2(0, 0))
