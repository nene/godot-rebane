extends Reference
class_name GameItem

# Number of items in stack
var count: int = 1

func get_name() -> String:
    return ""

func get_texture() -> Texture:
    return Texture.new()

func max_stack_size() -> int:
    return 10
