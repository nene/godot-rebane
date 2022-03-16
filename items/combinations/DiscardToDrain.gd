extends Combination

func _init(in_hand, in_slot).(in_hand, in_slot):
    pass

func _execute(drain: Drain, ocean: Ocean):
    _set_second_item(null)
    GameEvents.emit_signal("sound_play", "PouringWater")
    emit_signal("success", self)
