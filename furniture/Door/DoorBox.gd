extends Area2D

export(Global.Location) var to_location = Global.Location.CFE_CELLAR

func _on_door_entered(body):
    # BUG: Area2D resends the body_entered signal
    # when node is removed and readded to scene:
    # https://github.com/godotengine/godot/issues/14578
    #
    # WORKAROUND: disable signals until location change has been completed.
    self.set_block_signals(true)
    
    # We use physics engine to move characters around,
    # this method gets called in the middle of physics processing,
    # so we can't start adding/removing nodes from the tree before
    # physics has finished
    yield(get_tree(), "physics_frame")
    
    GameEvents.emit_signal("change_location", to_location)
    self.set_block_signals(false)
