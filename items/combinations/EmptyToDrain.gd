extends Combination

func _init(in_hand, in_slot).(in_hand, in_slot):
    pass

func _execute(drain: Drain, item: GameItem):
    if item.type() == "beer_bottle":
        (item as BeerBottle).empty()
    elif item.type() == "beer_glass":
        (item as BeerGlass).empty()
    GameEvents.emit_signal("sound_play", "PouringWater")
    emit_signal("success", self)
