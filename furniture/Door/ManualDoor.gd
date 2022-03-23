extends "res://furniture/InteractBox.gd"

export(Global.Location) var to_location = Global.Location.CFE_CELLAR

func _on_interact(event: InteractEvent):
    GameEvents.emit_signal("change_location", to_location)

func is_interactable(group: GameItemGroup = null) -> bool:
    return group == null
