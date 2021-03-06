extends Node

var possible_combinations = {
    ["bottle_opener", "beer_bottle"]: "OpenBottle",
    ["beer_glass", "beer_bottle"]: "PourToGlass",
    ["drain", "beer_bottle"]: "EmptyToDrain",
    ["drain", "beer_glass"]: "EmptyToDrain",
    ["drain", "ocean"]: "DiscardToDrain",
    ["tap", "beer_bottle"]: "FillFromTap",
    ["tap", "beer_glass"]: "FillFromTap",
}

func combine(group_in_hand: GameItemGroup, group_in_slot: GameItemGroup) -> CombinationGroup:
    var combination = _combine_items(group_in_hand.item(), group_in_slot.item())
    if combination:
        return CombinationGroup.new(combination, group_in_hand.count(), group_in_slot.count())
    else:
        return null

func _combine_items(item_in_hand: GameItem, item_in_slot: GameItem):
    var pair = [item_in_hand.type(), item_in_slot.type()]
    if pair in possible_combinations:
        var cls_name = possible_combinations[pair]
        if call("_can_" + cls_name, item_in_hand, item_in_slot):
            return _load_combination_class(cls_name).new(item_in_hand, item_in_slot)

    var reverse_pair = [item_in_slot.type(), item_in_hand.type()]
    if reverse_pair in possible_combinations:
        var cls_name = possible_combinations[reverse_pair]
        if call("_can_" + cls_name, item_in_slot, item_in_hand):
            return FlippedCombination.new(_load_combination_class(cls_name).new(item_in_slot, item_in_hand))

    return null

func _load_combination_class(cls_name: String):
    return load("res://items/combinations/" + cls_name + ".gd")


func _can_OpenBottle(opener: BottleOpener, bottle: BeerBottle) -> bool:
    return !bottle.is_open()

func _can_PourToGlass(glass: BeerGlass, bottle: BeerBottle) -> bool:
    return bottle.is_open() && !bottle.is_empty() && glass.is_empty()

func _can_EmptyToDrain(drain: Drain, glass_or_bottle: GameItem) -> bool:
    return !glass_or_bottle.is_empty()

func _can_DiscardToDrain(drain: Drain, ocean: Ocean) -> bool:
    return true

func _can_FillFromTap(tap: Tap, glass_or_bottle: GameItem) -> bool:
    return glass_or_bottle.is_empty()
