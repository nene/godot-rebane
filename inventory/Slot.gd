extends Panel
class_name Slot

var slot_texture = preload("res://inventory/slot.png")
var empty_style: StyleBoxTexture = make_texture_slice(Rect2(0, 0, 16, 16))
var full_style: StyleBoxTexture = make_texture_slice(Rect2(16, 0, 16, 16))
var locked_style: StyleBoxTexture = make_texture_slice(Rect2(32, 0, 16, 16))

var _group: GameItemGroup = null

func _ready():
    refresh_styles()

func refresh_styles():
    if _group == null:
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
        $GameItemView.set_group(group)
        $GameItemView.show()
    else:
        $GameItemView.hide()
    refresh_styles()
