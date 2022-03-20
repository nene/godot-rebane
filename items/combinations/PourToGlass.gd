extends Combination

const PouringGame = preload("res://minigames/pouring/PouringGame.tscn")

func _init(in_hand, in_slot).(in_hand, in_slot):
    pass

func _execute(glass: BeerGlass, bottle: BeerBottle):
    var pouring_game = PouringGame.instance()
    pouring_game.drink_type = bottle.drink_type
    pouring_game.connect("finished", self, "_finished", [glass, bottle, pouring_game])
    GameEvents.emit_signal("start_minigame", pouring_game)

func _finished(glass: BeerGlass, bottle: BeerBottle, pouring_game):
    glass.fill(bottle.drink_type, pouring_game.beer_level_in_glass())
    bottle.empty()
    emit_signal("success", self)
