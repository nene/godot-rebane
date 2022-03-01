extends Area2D

export(Global.Location) var to_location = Global.Location.CFE_CELLAR

func _on_door_entered(body):
    # We use physics engine to move characters around,
    # this method gets called in the middle of physics processing,
    # so we can't start adding/removing nodes from the tree before
    # physics has finished
    yield(get_tree(), "physics_frame")
    
    CurrentLocation.change(to_location)
