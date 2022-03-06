extends KinematicBody2D
class_name Player

onready var animationState = $AnimationTree.get("parameters/playback")

func _ready():
    set_animation_direction(Vector2.DOWN)

func _physics_process(delta):
    $PlayerStateMachine.physics_update(delta)

func _unhandled_input(event):
    $PlayerStateMachine.handle_input(event)

func set_animation_direction(direction: Vector2):
    $AnimationTree.set("parameters/Idle/blend_position", direction)
    $AnimationTree.set("parameters/Walk/blend_position", direction)

func greet_animation_finished():
    $PlayerStateMachine.on_animation_finished("greet")

func is_interactable():
    return $PlayerStateMachine.is_interactable()
