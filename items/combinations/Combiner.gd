extends Node

func combine(item_in_hand: GameItem, item_in_slot: GameItem) -> Combination:
    if item_in_hand.type() == "bottle_opener" && item_in_slot.type() == "beer_bottle"  && !item_in_slot.is_open():
        var OpenBottle = load("res://items/combinations/OpenBottle.gd")
        return OpenBottle.new(item_in_hand, item_in_slot)
    if item_in_hand.type() == "beer_bottle" && !item_in_hand.is_open() && item_in_slot.type() == "bottle_opener":
        var OpenBottle = load("res://items/combinations/OpenBottle.gd")
        return OpenBottle.new(item_in_hand, item_in_slot)
    elif item_in_hand.type() == "beer_glass" && item_in_hand.is_empty() && item_in_slot.type() == "beer_bottle" && item_in_slot.is_open() && !item_in_slot.is_empty():
        var PourToGlass = load("res://items/combinations/PourToGlass.gd")
        return PourToGlass.new(item_in_hand, item_in_slot)
    elif item_in_hand.type() == "beer_bottle" && !item_in_hand.is_empty() && item_in_hand.is_open() && item_in_slot.type() == "beer_glass" && item_in_slot.is_empty():
        var PourToGlass = load("res://items/combinations/PourToGlass.gd")
        return PourToGlass.new(item_in_hand, item_in_slot)
    elif (item_in_hand.type() == "beer_bottle" || item_in_hand.type() == "beer_glass") && !item_in_hand.is_empty() && item_in_slot.type() == "drain":
        var EmptyToDrain = load("res://items/combinations/EmptyToDrain.gd")
        return EmptyToDrain.new(item_in_hand, item_in_slot)
    elif item_in_hand.type() == "ocean" && item_in_slot.type() == "drain":
        var DiscardToDrain = load("res://items/combinations/DiscardToDrain.gd")
        return DiscardToDrain.new(item_in_hand, item_in_slot)
    elif (item_in_hand.type() == "beer_bottle" || item_in_hand.type() == "beer_glass") && item_in_hand.is_empty() && item_in_slot.type() == "tap":
        var FillFromTap = load("res://items/combinations/FillFromTap.gd")
        return FillFromTap.new(item_in_hand, item_in_slot)
    else:
        return null
