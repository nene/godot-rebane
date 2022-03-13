extends Panel
class_name Slot

var slot_texture = preload("res://inventory/slot.png")
var empty_style: StyleBoxTexture = make_texture_slice(Rect2(0, 0, 16, 16))
var full_style: StyleBoxTexture = make_texture_slice(Rect2(16, 0, 16, 16))
var locked_style: StyleBoxTexture = make_texture_slice(Rect2(32, 0, 16, 16))

var _group: GameItemGroup = null
export var locked = false

func _ready():
    refresh_styles()

func refresh_styles():
    if locked:
        set('custom_styles/panel', locked_style)
    elif _group == null:
        set('custom_styles/panel', empty_style)
    else:
        set('custom_styles/panel', full_style)

func make_texture_slice(rect: Rect2) -> StyleBoxTexture:
    var slice = StyleBoxTexture.new()
    slice.texture = slot_texture
    slice.region_rect = rect
    return slice

func set_group(group: GameItemGroup):
    _group = group
    if group:
        $GameItemView.group = group
        $GameItemView.show()
        $Tooltip.show()
        $Tooltip.text = group.item().name()
    else:
        $Tooltip.hide()
        $GameItemView.hide()
    refresh_styles()
