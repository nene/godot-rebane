extends State

func enter():
    var drink_animation = owner.get_drink_animation()
    drink_animation.play()
    yield(drink_animation, "finished")
    emit_signal("finished", "pop")
