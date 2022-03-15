extends Reference
class_name CombinationGroup

# warning-ignore:unused_signal
signal success(combination_group)

var _combination #: Combination | FlippedCombination
var _in_hand_count: int = 1
var _in_slot_count: int = 1

func _init(combination, in_hand_count: int, in_slot_count: int):
    _combination = combination
    _combination.connect("success", self, "_on_success");
    _in_hand_count = in_hand_count
    _in_slot_count = in_slot_count

func _on_success(combination):
    emit_signal("success", self)

func execute():
    _combination.execute()

func group_in_hand(): # -> GameItemGroup:
    var GameItemGroup = load("res://items/GameItemGroup.gd")
    return GameItemGroup.new(_combination.item_in_hand(), _in_hand_count) if _combination.item_in_hand() else null

func group_in_slot(): # -> GameItemGroup:
    var GameItemGroup = load("res://items/GameItemGroup.gd")
    return GameItemGroup.new(_combination.item_in_slot(), _in_slot_count) if _combination.item_in_slot() else null
