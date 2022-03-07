extends State

func enter():
    var drink_animation = owner.get_drink_animation()
    drink_animation.play(BeerGlass.new(Drink.ALEXANDER, BeerGlass.FULL))
    yield(drink_animation, "finished")
    emit_signal("finished", "pop")
