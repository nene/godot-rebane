extends RigidBody2D

func _on_timeout():
    queue_free()
