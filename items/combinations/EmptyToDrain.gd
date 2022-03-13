extends Combination

func _init(in_hand, in_slot).(in_hand, in_slot):
    pass

func execute():
    if _item_in_hand.type() == "beer_bottle":
        (_item_in_hand as BeerBottle).empty()
    elif _item_in_hand.type() == "beer_glass":
        (_item_in_hand as BeerGlass).empty()
    emit_signal("success", self)
