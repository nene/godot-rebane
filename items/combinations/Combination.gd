extends Reference
class_name Combination

# warning-ignore:unused_signal
signal success(combination)

var item_in_hand: GameItem
var item_in_slot: GameItem

func _init(in_hand: GameItem, in_slot: GameItem):
    item_in_hand = in_hand
    item_in_slot = in_slot

func execute():
    pass
