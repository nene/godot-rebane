extends Node2D

var GameItemViewNode = preload("res://items/GameItemView.tscn")

var holding_item: GameItemView = null

var inventory = [
    BeerGlass.new(BeerGlass.FULL),
    BeerGlass.new(BeerGlass.EMPTY),
    BeerGlass.new(BeerGlass.HALF_FULL),
    Book.new(),
    BottleOpener.new(),
    Drain.new(),
    Tap.new(),
    Ocean.new(),
    Ocean.new(),
]

func _ready():
    for slot in $GridContainer.get_children():
        slot.connect("gui_input", self, "slot_gui_input", [slot])
    
    for i in range(inventory.size()):
        var slot: Slot = $GridContainer.get_child(i)
        var item_view = GameItemViewNode.instance()
        item_view.set_item(inventory[i])
        slot.put_item(item_view)

func slot_gui_input(event: InputEvent, slot: Slot):
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT && event.pressed:
            if holding_item:
                if slot.has_item():
                    var item = slot.pick_item()
                    add_child(item)
                    item.global_position = event.global_position
                    remove_child(holding_item)
                    slot.put_item(holding_item)
                    holding_item = item
                else:
                    remove_child(holding_item)
                    slot.put_item(holding_item)
                    holding_item = null
            elif slot.has_item():
                holding_item = slot.pick_item()
                add_child(holding_item)
                holding_item.global_position = get_global_mouse_position()

func _input(event: InputEvent):
    if holding_item:
        holding_item.global_position = get_global_mouse_position()
