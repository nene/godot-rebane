extends Combination

func _init(in_hand, in_slot).(in_hand, in_slot):
    pass

func _execute(drain: Drain, ocean: Ocean):
    _set_second_item(null)
    emit_signal("success", self)
