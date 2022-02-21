extends Panel
class_name Slot

var slot_texture = preload("res://ui/slot.png")
var empty_style: StyleBoxTexture = make_texture_slice(Rect2(0, 0, 16, 16))
var full_style: StyleBoxTexture = make_texture_slice(Rect2(16, 0, 16, 16))
var locked_style: StyleBoxTexture = make_texture_slice(Rect2(32, 0, 16, 16))

var itemClasses = [
    Ocean,
    Tap,
    BottleOpener,
    Book,
]

var item: GameItemView = null

func _ready():
    refresh_styles()

func refresh_styles():
    if item == null:
        set('custom_styles/panel', empty_style)
    else:
        set('custom_styles/panel', full_style)

func make_texture_slice(rect: Rect2) -> StyleBoxTexture:
    var slice = StyleBoxTexture.new()
    slice.texture = slot_texture
    slice.region_rect = rect
    return slice

func has_item() -> bool:
    return !!item

func has_same_item(it: GameItemView) -> bool:
    return has_item() && it.item.get_name() == item.item.get_name()

func get_item() -> GameItemView:
    return item

func pick_item() -> GameItemView:
    remove_child(item)
    var removed_item = item
    item = null
    refresh_styles()
    return removed_item

func put_item(new_item: GameItemView):
    item = new_item
    item.position = Vector2.ZERO
    add_child(item)
    refresh_styles()
