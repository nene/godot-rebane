extends RigidBody2D

signal hit_target(flow_rate, amount)
signal splash(position, diraction)

const TableEdge = preload("res://minigames/pouring/TableEdge.gd")
const GlassBottom = preload("res://minigames/pouring/GlassBottom.gd")

# The rate of beer flow
var flow_rate: float = 0.0
# The amount of beer
var amount: float = 0.0

func _on_timeout():
    queue_free()

func _on_body_entered(body: Node):
    if body is GlassBottom:
        emit_signal("hit_target", flow_rate, amount)
    else:
        emit_signal("splash", self.position, _splash_direction(body as PhysicsBody2D))
    queue_free()

func _splash_direction(body: PhysicsBody2D) -> Vector2:
    if body is TableEdge:
        return Vector2.UP
    var x = self.position.x - body.position.x
    var y = -1
    return Vector2(x, y)
