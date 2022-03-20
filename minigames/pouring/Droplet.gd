extends RigidBody2D

const Splash = preload("res://minigames/pouring/Splash.tscn")
const TableEdge = preload("res://minigames/pouring/TableEdge.gd")

var pouring_game: Node

func _on_timeout():
    queue_free()

func _on_body_entered(body: Node):
    queue_free()
    var splash = Splash.instance()
    splash.position = self.position
    splash.emitting = true
    splash.direction = _splash_direction(body as PhysicsBody2D)
    pouring_game.add_splash(splash)
    
func _splash_direction(body: PhysicsBody2D) -> Vector2:
    if body is TableEdge:
        return Vector2.UP
    var x = self.position.x - body.position.x
    var y = -1
    return Vector2(x, y)
