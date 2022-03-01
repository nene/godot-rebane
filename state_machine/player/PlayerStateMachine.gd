extends "res://state_machine/StateMachine.gd"

func _ready():
    states_map = {
        "move": $Move,
        "greet": $Greet,
    }

func handle_input(event):
    if event.is_action_pressed("ui_greet"):
        push_state("greet")
        return
    .handle_input(event)
