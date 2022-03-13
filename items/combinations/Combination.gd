extends Reference
class_name Combination

# warning-ignore:unused_signal
signal success(combination)

var _item_in_hand: GameItem
var _item_in_slot: GameItem

func _init(in_hand: GameItem, in_slot: GameItem):
    _item_in_hand = in_hand
    _item_in_slot = in_slot

func execute():
    pass

func item_in_hand() -> GameItem:
    return _item_in_hand

func item_in_slot() -> GameItem:
    return _item_in_slot
