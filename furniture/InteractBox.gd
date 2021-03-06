extends Area2D

signal interact(event)

onready var _owner: Node2D = self.get_parent()

func _on_mouse_entered():
    InteractionState.enter_mouse(self)

func _on_mouse_exited():
    InteractionState.exit_mouse(self)

func _on_input(viewport, event, shape_idx):
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT && event.pressed:
            InteractionState.add_pending_click(self)

func trigger_interact(group: GameItemGroup = null):
    emit_signal("interact", InteractEvent.new(group))

func _on_area_entered(area):
    InteractionState.enter_player(self)

func _on_area_exited(area):
    InteractionState.exit_player(self)

func is_interactable(group: GameItemGroup = null) -> bool:
    return _owner.has_method("is_interactable") && _owner.is_interactable(group)

func y_position() -> float:
    return _owner.position.y
