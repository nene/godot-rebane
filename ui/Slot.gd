extends Panel

var slot_texture = preload("res://ui/slot.png")
var empty_style: StyleBoxTexture = make_texture_slice(Rect2(0, 0, 16, 16))
var full_style: StyleBoxTexture = make_texture_slice(Rect2(16, 0, 16, 16))

var itemClasses = [
    preload("res://items/Book.tscn"),
    preload("res://items/BottleOpener.tscn"),
]

var item = null

func _ready():
    if randi() % 2 == 0:
        item = random_item()
        add_child(item)
    refresh_styles()

func random_item():
    var randomIndex = randi() % itemClasses.size()
    return itemClasses[randomIndex].instance()

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
