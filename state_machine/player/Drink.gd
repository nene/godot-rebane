extends State

var _owner: Player

func _init(owner: Player):
    _owner = owner

func enter():
    var drink_animation = _owner.get_drink_animation()
    drink_animation.play(BeerGlass.new(Drink.ALEXANDER, BeerGlass.FULL))
    yield(drink_animation, "finished")
    emit_signal("finished")
