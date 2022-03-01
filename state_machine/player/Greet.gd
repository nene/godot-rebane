extends State

func enter():
    owner.animationState.travel("greet")

func _on_animation_finished(anim_name):
    emit_signal("finished", "previous")
