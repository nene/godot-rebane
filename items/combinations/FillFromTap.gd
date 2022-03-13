extends Combination

func _init(in_hand, in_slot).(in_hand, in_slot):
    pass

func execute():
    if item_in_hand.type() == "beer_bottle":
        item_in_hand = BeerBottle.new(Drink.WATER, BeerBottle.CapState.OPEN)
    elif item_in_hand.type() == "beer_glass":
        item_in_hand = BeerGlass.new(Drink.WATER, BeerGlass.FULL)
    emit_signal("success", self)
