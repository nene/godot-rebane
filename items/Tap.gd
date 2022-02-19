extends GameItem
class_name Tap

func get_name():
    return "Kraan"
    
func get_texture():
    return GameItemTextures.create(GameItemTextures.ITEM, Vector2(5, 0))
