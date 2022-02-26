extends Area2D

signal interact
var _player_is_close = false

func _on_mouse_entered():
    InteractionState.enter_mouse(self)

func _on_mouse_exited():
    InteractionState.exit_mouse(self)

func _on_input(viewport, event, shape_idx):
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT && event.pressed:
            if _player_is_close:
                emit_signal("interact")

func _on_area_entered(area):
    InteractionState.enter_player(self)
    _player_is_close = true

func _on_area_exited(area):
    InteractionState.exit_player(self)
    _player_is_close = false
