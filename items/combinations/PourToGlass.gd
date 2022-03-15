extends Combination

func _init(in_hand, in_slot).(in_hand, in_slot):
    pass

func _execute(glass: BeerGlass, bottle: BeerBottle):
    glass.fill(bottle.drink_type, BeerGlass.FULL)
    bottle.empty()
    emit_signal("success", self)
