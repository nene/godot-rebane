extends Reference
class_name Inventory

signal change

var _items: Array
var _size: int

func _init(items: Array, size: int):
    self._items = items
    self._size = size
    while self._items.size() < self._size:
        self._items.push_back(null)

# Returns array of GameItems, no empty slots
func items() -> Array:
    return Fp.filter(funcref(self, "_is_not_null"), self._items)

func _is_not_null(x) -> bool:
    return x != null

func size() -> int:
    return self._size

func at(index: int) -> GameItem:
    return self._items[index]

func put_at(index: int, item: GameItem):
    self._items[index] = item
    emit_signal("change")

func pick_at(index: int) -> GameItem:
    var item = self._items[index]
    self._items[index] = null
    emit_signal("change")
    return item
