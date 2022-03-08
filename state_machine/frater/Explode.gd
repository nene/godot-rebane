extends State

var _owner: Frater

func _init(owner: Frater):
    _owner = owner

func enter():
    var Explosion = load("res://characters/explosion/Explosion.tscn")
    var expl = Explosion.instance()
    var world = _owner.get_tree().current_scene
    world.add_child(expl)
    expl.global_position = _owner.global_position
    _owner.queue_free()
