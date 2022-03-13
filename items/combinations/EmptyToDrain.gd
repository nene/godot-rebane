extends Combination

func _init(in_hand, in_slot).(in_hand, in_slot):
    pass

func execute():
    if item_in_hand.type() == "beer_bottle":
        (item_in_hand as BeerBottle).empty()
    elif item_in_hand.type() == "beer_glass":
        (item_in_hand as BeerGlass).empty()
    emit_signal("success", self)
