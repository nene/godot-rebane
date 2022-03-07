extends Node2D

signal finished

export(NodePath) onready var animation_tree = get_node(animation_tree) as AnimationTree

func _ready():
    hide()

func play(glass: BeerGlass):
    show()

    while !glass.is_empty():
        _hand_down(glass)
        yield(_delay(1), "timeout")
        _hand_up(glass)
        yield(_delay(1), "timeout")
        glass.sip()

    _hand_down(glass)
    yield(_delay(1), "timeout")
    hide()
    emit_signal("finished")

func _delay(time: float) -> SceneTreeTimer:
    return get_tree().create_timer(time)

func _hand_down(glass: BeerGlass):
    $BeerGlass.texture = glass.get_small_texture()
    animation_tree.get("parameters/playback").travel("hand_down")
    self.position.y = 0

func _hand_up(glass: BeerGlass):
    $BeerGlass.texture = glass.get_small_texture()
    animation_tree.get("parameters/playback").travel("hand_up")
    self.position.y = -2
