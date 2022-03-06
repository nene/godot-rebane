extends Area2D

signal interact

onready var _owner: Node2D = self.get_parent()
var _player_is_close = false

func _on_mouse_entered():
    InteractionState.enter_mouse(_area_with_y())

func _on_mouse_exited():
    InteractionState.exit_mouse(_area_with_y())

func _on_input(viewport, event, shape_idx):
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT && event.pressed:
            if _player_is_close:
                InteractionState.add_pending_click(_area_with_y())

func trigger_interact():
    emit_signal("interact")

func _on_area_entered(area):
    InteractionState.enter_player(_area_with_y())
    _player_is_close = true

func _on_area_exited(area):
    InteractionState.exit_player(_area_with_y())
    _player_is_close = false

func _area_with_y() -> Dictionary:
    return {"area": self, "y": _owner.position.y}
