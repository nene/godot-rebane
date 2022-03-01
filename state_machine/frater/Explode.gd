extends State

func enter():
    var Explosion = load("res://Explosion.tscn")
    var expl = Explosion.instance()
    var world = owner.get_tree().current_scene
    world.add_child(expl)
    expl.global_position = owner.global_position
    owner.queue_free()
