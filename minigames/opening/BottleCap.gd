extends Node2D

# True when opener is ready top open this bottle cap
signal ready_to_open_change(ready)

func _set_ready_for_opening(ready: bool):
    emit_signal("ready_to_open_change", ready)
    $Sprite.frame = 1 if ready else 0

func _on_opener_entered(area):
    _set_ready_for_opening(true)

func _on_opener_exited(area):
    _set_ready_for_opening(false)
