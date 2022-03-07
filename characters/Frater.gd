extends KinematicBody2D

const Direction = preload("res://Direction.gd")

export var character_name = ""
export(Resource) var photo

onready var animationState = $AnimationTree.get("parameters/playback")

func _ready():
    set_animation_direction(Vector2.DOWN)
    $AnimationTree.active = true

func _physics_process(delta):
    $FraterStateMachine.physics_update(delta)

func _unhandled_input(event):
    $FraterStateMachine.handle_input(event)

func set_animation_direction(direction: Vector2):
    $AnimationTree.set("parameters/Idle/blend_position", direction)
    $AnimationTree.set("parameters/Walk/blend_position", direction)

func _on_interact(event: InteractEvent):
    $FraterStateMachine.handle_input(event)

func toggle_callout(visible: bool):
    $Callout.visible = visible

func is_interactable(group: GameItemGroup = null):
    return $FraterStateMachine.is_interactable(group)
