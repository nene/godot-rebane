extends StaticBody2D

func _on_mouse_entered():
    HoverState.enter_object()

func _on_mouse_exited():
    HoverState.exit_object()
