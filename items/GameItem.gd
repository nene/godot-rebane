extends Reference
class_name GameItem

func type() -> String:
    return "unknown"

func name() -> String:
    return ""

func texture() -> Texture:
    return Texture.new()

func highlighted_texture() -> Texture:
    return texture()

func max_stack_size() -> int:
    return 1

func is_groupable_with(_item: GameItem) -> bool:
    return self.name() == _item.name()
