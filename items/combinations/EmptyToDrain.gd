extends Combination

var _item_in_hand: GameItem
var _item_in_slot: GameItem

func _init(in_hand: GameItem, in_slot: GameItem):
    _item_in_hand = in_hand
    _item_in_slot = in_slot

func execute():
    if _item_in_hand.type() == "beer_bottle":
        (_item_in_hand as BeerBottle).empty()
    elif _item_in_hand.type() == "beer_glass":
        (_item_in_hand as BeerGlass).empty()
    emit_signal("success", self)

func item_in_hand():
    return _item_in_hand

func item_in_slot():
    return _item_in_slot
