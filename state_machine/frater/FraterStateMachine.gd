extends "res://state_machine/StateMachine.gd"

func _ready():
    states_map = {
        "move_random": $MoveRandom,
        "explode": $Explode,
    }

func handle_input(event):
    if event.is_action_pressed("ui_greet"):
        transition("replace", "explode")
        return
    .handle_input(event)
