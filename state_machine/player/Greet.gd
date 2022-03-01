extends State

func enter():
    owner.animationState.travel("greet")

func on_animation_finished(anim_name):
    emit_signal("finished", "pop")
