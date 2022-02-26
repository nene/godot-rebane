extends Area2D

export var to_location: String

func _on_door_entered(body):
    print("Entering door to " + to_location)
