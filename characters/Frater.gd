extends KinematicBody2D

const Direction = preload("res://Direction.gd")

onready var animationState = $AnimationTree.get("parameters/playback")

func _ready():
    set_animation_direction(Vector2.DOWN)

func _physics_process(delta):
    $FraterStateMachine.physics_update(delta)

func _unhandled_input(event):
    $FraterStateMachine.handle_input(event)

func set_animation_direction(direction: Vector2):
    $AnimationTree.set("parameters/Idle/blend_position", direction)
    $AnimationTree.set("parameters/Walk/blend_position", direction)

func _on_interact():
    var dialog = load("res://dialog/QuestionDialog.tscn").instance()
    InteractionState.show_dialog(dialog, {"hide_hotbar": true})

func toggle_callout(visible: bool):
    $Callout.visible = visible
