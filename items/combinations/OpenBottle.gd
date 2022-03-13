extends Combination

func _init(in_hand, in_slot).(in_hand, in_slot):
    pass

func execute():
    var beer_bottle := (_item_in_hand if _item_in_hand is BeerBottle else _item_in_slot) as BeerBottle
    beer_bottle.open()
    emit_signal("success", self)
