extends "res://state_machine/StateMachine.gd"

func _ready():
    states_map = {
        "move_random": $MoveRandom,
        "explode": $Explode,
    }

func _unhandled_input(event):
    if event.is_action_pressed("ui_greet"):
        _change_state("explode")
        return
    ._unhandled_input(event)
