extends Node2D

export var owner_path: NodePath
export var tip_resource: PackedScene
export var text: String

onready var _owner_node = get_node(owner_path)
var _tip: Node2D = null
var _offset = Vector2(8, 3)

func _ready():
    _owner_node.connect("mouse_entered", self, "_create_tip_with_delay")
    _owner_node.connect("mouse_exited", self, "_destroy_tip")
    $Timer.connect("timeout", self, "_create_tip")

func _process(delta):
    if _tip:
        var screen_rect = get_viewport_rect()
        var tip_pos = get_global_mouse_position() + _offset
        var tip_rect = Rect2(tip_pos, Vector2(0, 10))
        if screen_rect.encloses(tip_rect):
            _tip.global_position = tip_pos
        else:
            var outside_screen = tip_rect.end - screen_rect.end
            _tip.global_position = tip_pos - Vector2(0, outside_screen.y)

func _create_tip_with_delay():
    $Timer.start()

func _create_tip():
    _tip = tip_resource.instance()
    add_child(_tip)
    _tip.text = text

func _destroy_tip():
    $Timer.stop()
    remove_child(_tip)
    _tip = null
