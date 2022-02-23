extends Node

signal allow_interact
signal forbid_interact
signal interact

var hovered_objects = 0

func enter_object():
    if hovered_objects == 0:
        emit_signal("allow_interact")
    hovered_objects += 1

func exit_object():
    hovered_objects -= 1
    if hovered_objects == 0:
        emit_signal("forbid_interact")

func interact():
    emit_signal("interact")
