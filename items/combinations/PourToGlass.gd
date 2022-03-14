extends Combination

func _init(in_hand, in_slot).(in_hand, in_slot):
    pass

func execute():
    var glass = (item_in_hand if item_in_hand.type() == "beer_glass" else item_in_slot) as BeerGlass
    var bottle = (item_in_slot if item_in_slot.type() == "beer_bottle" else item_in_hand) as BeerBottle
    glass.fill(bottle.drink_type, BeerGlass.FULL)
    bottle.empty()
    emit_signal("success", self)
