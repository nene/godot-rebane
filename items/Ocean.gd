extends GameItem
class_name Ocean

func get_name():
    return "Ooken"
    
func get_texture():
    return GameItemTextures.create(GameItemTextures.ITEM, Vector2(4, 0))

func max_stack_size():
    return 99
