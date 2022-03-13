extends KinematicBody2D
class_name Player

# warning-ignore:unused_class_variable
onready var animationState = $AnimationTree.get("parameters/playback")
var _state: State

func _ready():
    _state = _create_state_machine()
    _state.enter()
    set_animation_direction(Vector2.DOWN)
    $AnimationTree.active = true

func _create_state_machine() -> State:
    var StateStack = load("res://state_machine/StateStack.gd")
    var Move = load("res://state_machine/player/Move.gd")
    return StateStack.new(Move.new(self))

func _physics_process(delta):
    _state.physics_update(delta)

func _unhandled_input(event):
    _state.handle_input(event)

func set_animation_direction(direction: Vector2):
    $AnimationTree.set("parameters/Idle/blend_position", direction)
    $AnimationTree.set("parameters/Walk/blend_position", direction)

func greet_animation_finished():
    _state.on_animation_finished("greet")

func is_interactable(group: GameItemGroup = null):
    return _state.is_interactable(group)

func _on_interact(event: InteractEvent):
    _state.handle_input(event)

func get_drink_animation():
    return $DrinkAnimation
