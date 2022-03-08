extends State

var _owner: Player

func _init(owner: Player):
    _owner = owner

func enter():
    _owner.animationState.travel("greet")

func on_animation_finished(anim_name):
    emit_signal("finished")
