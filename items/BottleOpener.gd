extends GameItem
class_name BottleOpener

func get_name():
    return "Pudeliavaja"
    
func get_texture():
    return GameItemTextures.create(GameItemTextures.ITEM, Vector2(1, 0))
