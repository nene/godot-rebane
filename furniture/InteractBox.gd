extends Area2D

func _on_mouse_entered():
    InteractionState.enter_object()

func _on_mouse_exited():
    InteractionState.exit_object()

func _on_input(viewport, event, shape_idx):
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT && event.pressed:
            InteractionState.interact()
