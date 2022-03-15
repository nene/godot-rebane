extends Reference
class_name FlippedCombination
# Flips item_in_hand with item_in_slot

signal success(flipped_combination)

var _combination: Combination

func _init(combination: Combination):
    _combination = combination
    _combination.connect("success", self, "_success")

func execute():
    _combination.execute()

func _success(comb: Combination):
    emit_signal("success", self)

func item_in_hand() -> GameItem:
    return _combination.item_in_slot()

func item_in_slot() -> GameItem:
    return _combination.item_in_hand()
