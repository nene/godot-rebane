extends Reference
class_name GameItemGroup

var _item: GameItem
var _count: int

func _init(item: GameItem, count: int = 1):
    _item = item
    _count = count

func item() -> GameItem:
    return _item

func count() -> int:
    return _count

# Combines two groups together
# This might result:
# - in GameItemGroup, when max_stack_size is not exceeded
# - in GameItemGroup[], when more items than max_stack_size (array of two items)
func add(group: GameItemGroup):
    var GameItemGroupClass = load("res://items/GameItemGroup.gd")
    var sum = _count + group.count()
    var max_count = _item.max_stack_size()
    if sum <= max_count:
        return GameItemGroupClass.new(_item, sum)
    else:
        return [
            GameItemGroupClass.new(_item, max_count),
            GameItemGroupClass.new(_item, sum - max_count),
        ]

# Breaks the group into two:
# - the old group (with reduced count)
# - the new group (with extracted count)
func subtract(nr: int) -> Array:
    var GameItemGroupClass = load("res://items/GameItemGroup.gd")
    return [
        GameItemGroupClass.new(_item, _count - nr),
        GameItemGroupClass.new(_item, nr),
    ]

func is_same_type(group: GameItemGroup) -> bool:
    return _item.get_name() == group.item().get_name()

func is_full() -> bool:
    return _count == _item.max_stack_size()