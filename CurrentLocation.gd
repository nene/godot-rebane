extends Node

signal change

func change(location: int):
    emit_signal("change", location)
