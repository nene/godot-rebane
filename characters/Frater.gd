extends KinematicBody2D
class_name Frater

const Direction = preload("res://Direction.gd")

# warning-ignore:unused_class_variable
export var character_name = ""
# warning-ignore:unused_class_variable
export(Resource) var photo

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
    var Idle = load("res://state_machine/frater/Idle.gd")
    return StateStack.new(Idle.new(self))

func _physics_process(delta):
    _state.physics_update(delta)

func _unhandled_input(event):
    _state.handle_input(event)

func set_animation_direction(direction: Vector2):
    $AnimationTree.set("parameters/Idle/blend_position", direction)
    $AnimationTree.set("parameters/Walk/blend_position", direction)

func _on_interact(event: InteractEvent):
    _state.handle_input(event)

func toggle_callout(visible: bool):
    $Callout.visible = visible

func is_interactable(group: GameItemGroup = null):
    return _state.is_interactable(group)
