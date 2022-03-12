extends Reference
class_name GameItem

func get_name() -> String:
    return ""

func get_texture() -> Texture:
    return Texture.new()

func get_highlighted_texture() -> Texture:
    return get_texture()

func max_stack_size() -> int:
    return 1

func is_groupable_with(_item: GameItem) -> bool:
    return self.get_name() == _item.get_name()
