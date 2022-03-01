extends "res://state_machine/StateMachine.gd"

func _ready():
    states_map = {
        "move_random": $MoveRandom,
    }
