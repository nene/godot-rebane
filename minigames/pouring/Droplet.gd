extends RigidBody2D

const Splash = preload("res://minigames/pouring/Splash.tscn")

func _on_timeout():
    queue_free()

func _on_body_entered(body: Node):
    queue_free()
    var splash = Splash.instance()
    splash.position = self.position
    splash.emitting = true
    splash.direction = _splash_direction(body as PhysicsBody2D)
    get_parent().add_child(splash)
    
func _splash_direction(body: PhysicsBody2D) -> Vector2:
    var x = self.position.x - body.position.x
    var y = -1
    return Vector2(x, y)
