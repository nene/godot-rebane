extends KinematicBody2D
class_name Frater

const Direction = preload("res://Direction.gd")

# warning-ignore:unused_class_variable
export var character_name = ""
# warning-ignore:unused_class_variable
export(Resource) var photo

export(String, "Idle", "Walk", "Callout") var animation = "Idle" setget _set_animation
export(Vector2) var animation_direction = Vector2.DOWN setget _set_animation_direction

# warning-ignore:unused_class_variable
onready var _animation_tree = $AnimationTree
onready var _animation_state = _animation_tree.get("parameters/playback")
var _state: State

func _ready():
    _state = _create_state_machine()
    _state.enter()
    _animation_tree.active = true
    _set_animation_direction(animation_direction)
    _set_animation(animation)

func _create_state_machine() -> State:
    var StateStack = load("res://state_machine/StateStack.gd")
    var Idle = load("res://state_machine/frater/Idle.gd")
    return StateStack.new(Idle.new(self))

func _physics_process(delta):
    _state.physics_update(delta)

func _unhandled_input(event):
    _state.handle_input(event)

func _set_animation_direction(direction: Vector2):
    animation_direction = direction
    if _animation_tree:
        _animation_tree.set("parameters/Idle/blend_position", direction)
        _animation_tree.set("parameters/Walk/blend_position", direction)

func _set_animation(name: String):
    animation = name
    if _animation_state:
        _animation_state.travel(name)

func _on_interact(event: InteractEvent):
    _state.handle_input(event)

func toggle_callout(visible: bool):
    $Callout.visible = visible

func is_interactable(group: GameItemGroup = null):
    return _state.is_interactable(group)
