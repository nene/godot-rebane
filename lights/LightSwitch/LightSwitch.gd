extends Node2D

const LightGroup = preload("res://lights/LightGroup/LightGroup.gd")

export(NodePath) onready var light_group = get_node(light_group) as LightGroup

func is_interactable(group: GameItemGroup = null):
    return group == null

func _on_interact(event: InteractEvent):
    var active = !_is_active()
    _toggle_switch(active)
    light_group.toggle(active)

func _is_active() -> bool:
    return $Sprite.frame == 1

func _toggle_switch(active: bool):
    if active:
        $Sprite.frame = 1
    else:
        $Sprite.frame = 0
