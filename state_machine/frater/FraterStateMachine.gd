extends "res://state_machine/StateMachine.gd"

func handle_input(event):
    if event.is_action_pressed("ui_greet"):
        transition("push", "AskQuestion")
        return
    .handle_input(event)
