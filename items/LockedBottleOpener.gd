extends GameItem
class_name LockedBottleOpener

func get_name():
    return "Konvendi avaja"

func get_texture():
    return GameItemTextures.create(GameItemTextures.ITEM, Vector2(2, 0))
