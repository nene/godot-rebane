extends Area2D

export(Location.Location) var to_location = Location.Location.CFE_CELLAR

func _on_door_entered(body):
    CurrentLocation.change(to_location)
