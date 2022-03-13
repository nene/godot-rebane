extends Combination

const OpeningGame = preload("res://minigames/opening/OpeningGame.tscn")

func _init(in_hand, in_slot).(in_hand, in_slot):
    pass

func execute():
    var opening_game = OpeningGame.instance()
    opening_game.connect("finished", self, "_finished")
    GameEvents.emit_signal("start_minigame", opening_game)

func _finished():
    var beer_bottle := (item_in_hand if item_in_hand is BeerBottle else item_in_slot) as BeerBottle
    beer_bottle.open()
    emit_signal("success", self)
