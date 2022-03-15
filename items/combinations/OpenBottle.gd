extends Combination

const OpeningGame = preload("res://minigames/opening/OpeningGame.tscn")

func _init(in_hand, in_slot).(in_hand, in_slot):
    pass

func _execute(opener: BottleOpener, bottle: BeerBottle):
    var opening_game = OpeningGame.instance()
    opening_game.bottle_opener = opener
    opening_game.drink_type = bottle.drink_type
    opening_game.connect("finished", self, "_finished", [opener, bottle])
    GameEvents.emit_signal("start_minigame", opening_game)

func _finished(opener: BottleOpener, bottle: BeerBottle):
    bottle.open()
    emit_signal("success", self)
