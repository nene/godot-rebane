extends Combination

func _init(in_hand, in_slot).(in_hand, in_slot):
    pass

func execute():
    if item_in_hand.type() == "ocean":
        item_in_hand = null
    emit_signal("success", self)
