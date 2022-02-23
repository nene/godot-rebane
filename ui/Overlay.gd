extends ColorRect

signal click

func _on_gui_input(event):
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT && event.pressed:
            emit_signal("click")
