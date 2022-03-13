extends Combination

func _init(in_hand, in_slot).(in_hand, in_slot):
    pass

func execute():
    var beer_bottle := (item_in_hand if item_in_hand is BeerBottle else item_in_slot) as BeerBottle
    beer_bottle.open()
    emit_signal("success", self)
