extends Reference
class_name GameItem

func get_name() -> String:
    return ""

func get_texture() -> Texture:
    return Texture.new()

func max_stack_size() -> int:
    return 1
