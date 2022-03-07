extends Node2D

signal finished

export(NodePath) onready var animation_tree = get_node(animation_tree) as AnimationTree

func _ready():
    hide()

func play():
    show()
    _hand_down()
    yield(_delay(1), "timeout")
    _hand_up()
    yield(_delay(1), "timeout")
    _hand_down()
    yield(_delay(1), "timeout")
    hide()
    emit_signal("finished")

func _delay(time: float) -> SceneTreeTimer:
    return get_tree().create_timer(time)

func _hand_down():
    animation_tree.get("parameters/playback").travel("hand_down")
    self.position.y = 0

func _hand_up():
    animation_tree.get("parameters/playback").travel("hand_up")
    self.position.y = -2
