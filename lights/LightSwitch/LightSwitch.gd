extends Node2D

func is_interactable(group: GameItemGroup = null):
    return group == null

func _on_interact(event: InteractEvent):
    $Sprite.frame = 1 if $Sprite.frame == 0 else 0
