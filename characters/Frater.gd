extends KinematicBody2D

const Direction = preload("res://Direction.gd")

export var speed = 50
var direction = Vector2.ZERO
var rng = RandomNumberGenerator.new()
onready var animationState = $AnimationTree.get("parameters/playback")

func _ready():
    set_animation_direction(Vector2.DOWN)

func _physics_process(delta):
    if Direction.is_moving(direction):
        set_animation_direction(direction)
        animationState.travel("Walk")
    else:
        animationState.travel("Idle")
    
    move_and_slide(speed * direction)

    if Input.is_action_pressed("ui_greet"):
        explode()

func set_animation_direction(direction: Vector2):
    $AnimationTree.set("parameters/Idle/blend_position", direction)
    $AnimationTree.set("parameters/Walk/blend_position", direction)

func explode():
    var Explosion = load("res://Explosion.tscn")
    var expl = Explosion.instance()
    var world = get_tree().current_scene
    world.add_child(expl)
    expl.global_position = global_position
    queue_free()

func _on_interact():
    var dialog = load("res://dialog/QuestionDialog.tscn").instance()
    InteractionState.show_dialog(dialog, {"hide_hotbar": true})
