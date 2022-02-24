extends Node2D

export var owner_path: NodePath
export var tip_resource: PackedScene
export var text: String

onready var _owner_node = get_node(owner_path)
var _tip: Node2D = null
var _offset = Vector2(8, 3)

func _ready():
    _owner_node.connect("mouse_entered", self, "_create_tip")
    _owner_node.connect("mouse_exited", self, "_destroy_tip")

func _process(delta):
    if _tip:
        _tip.global_position = get_global_mouse_position() + _offset

func _create_tip():
    _tip = tip_resource.instance()
    add_child(_tip)
    _tip.text = text

func _destroy_tip():
    remove_child(_tip)
    _tip = null
