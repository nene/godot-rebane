extends Node

signal mouse_over
signal mouse_out
signal interact

var hovered_objects = 0

func enter_object():
    if hovered_objects == 0:
        emit_signal("mouse_over")
    hovered_objects += 1

func exit_object():
    hovered_objects -= 1
    if hovered_objects == 0:
        emit_signal("mouse_out")

func interact():
    emit_signal("interact")
