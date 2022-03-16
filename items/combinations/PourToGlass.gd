extends Combination

func _init(in_hand, in_slot).(in_hand, in_slot):
    pass

func _execute(glass: BeerGlass, bottle: BeerBottle):
    glass.fill(bottle.drink_type, BeerGlass.FULL)
    bottle.empty()
    GameEvents.emit_signal("sound_play", "PouringBeer")
    emit_signal("success", self)
