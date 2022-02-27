extends Area2D

export(Location.Location) var to_location = Location.Location.CFE_CELLAR

func _on_door_entered(body):
    $Timer.start(0.00000001)

func _on_timer():
    CurrentLocation.change(to_location)
