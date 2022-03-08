extends Reference
class_name Inventory

signal change

var _items: Array # GameItemGroup[]
var _size: int

func _init(items: Array, size: int):
    self._items = items
    self._size = size
    while self._items.size() < self._size:
        self._items.push_back(null)

# Returns array of GameItemGroups, no empty slots
func items() -> Array:
    return Fp.filter(funcref(self, "_is_not_null"), self._items)

func _is_not_null(x) -> bool:
    return x != null

func size() -> int:
    return self._size

func at(index: int) -> GameItemGroup:
    return self._items[index]

func put_at(index: int, item: GameItemGroup):
    self._items[index] = item
    emit_signal("change")

func pick_at(index: int) -> GameItemGroup:
    var item = self._items[index]
    self._items[index] = null
    emit_signal("change")
    return item

func add(item: GameItemGroup):
    var i = _find_empty_slot()
    if i >= 0:
        _items[i] = item
        emit_signal("change")
    else:
        print("ERROR: No free slots available")

func _find_empty_slot() -> int:
    for i in _items.size():
        if _items[i] == null:
            return i
    return -1

func is_locked():
    return false
