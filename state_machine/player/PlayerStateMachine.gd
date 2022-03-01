extends "res://state_machine/StateMachine.gd"

func _ready():
    states_map = {
        "move": $Move,
        "greet": $Greet,
    }

func handle_input(event):
    if event.is_action_pressed("ui_greet"):
        transition("push", "greet")
        return
    .handle_input(event)
