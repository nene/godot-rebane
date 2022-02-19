extends Panel
class_name Slot

var slot_texture = preload("res://ui/slot.png")
var GameItemViewNode = preload("res://items/GameItemView.tscn")
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
    if randi() % 2 == 0:
        item = random_item()
        add_child(item)
    refresh_styles()

func random_item() -> GameItemView:
    var randomIndex = randi() % itemClasses.size()
    var item = itemClasses[randomIndex].new()
    var item_view = GameItemViewNode.instance()
    item_view.set_item(item)
    return item_view

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
