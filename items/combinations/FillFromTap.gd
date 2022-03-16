extends Combination

func _init(in_hand, in_slot).(in_hand, in_slot):
    pass

func _execute(tap: Tap, item: GameItem):
    if item.type() == "beer_bottle":
        (item as BeerBottle).fill(Drink.WATER)
    elif item.type() == "beer_glass":
        (item as BeerGlass).fill(Drink.WATER, BeerGlass.FULL)
    GameEvents.emit_signal("sound_play", "PouringWater")
    emit_signal("success", self)
