tool
extends Node2D

export var grid_size: Vector2 = Vector2(4, 4) setget set_grid_size

var GameItemViewNode = preload("res://ui/GameItemView.tscn")
var SlotNode = preload("res://ui/Slot.tscn")

var inventory = [
    BeerGlass.new(Drink.PILSNER, BeerGlass.FULL),
    BeerGlass.new(Drink.ALEXANDER, BeerGlass.EMPTY),
    BeerGlass.new(Drink.PORTER, BeerGlass.HALF_FULL),
    Book.new(),
    BottleOpener.new(),
    Drain.new(),
    Tap.new(),
    Ocean.new(),
    Ocean.new(),
]

func _ready():
    set_grid_size(grid_size)
    
    if !Engine.editor_hint:
        for i in range(inventory.size()):
            var slot: Slot = $GridContainer.get_child(i)
            if slot:
                slot.put_item(inventory[i])

func set_grid_size(size: Vector2):
    grid_size = size

    for child in $GridContainer.get_children():
        $GridContainer.remove_child(child)

    $GridContainer.columns = grid_size.x
    for i in range(grid_size.x * grid_size.y):
        var slot = SlotNode.instance()
        $GridContainer.add_child(slot)
        if !Engine.editor_hint:
            slot.connect("gui_input", self, "slot_gui_input", [slot])

func slot_gui_input(event: InputEvent, slot: Slot):
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT && event.pressed:
            if get_holding_item():
                if slot.has_same_item(get_holding_item()) && !slot_is_full(slot):
                    var counts = sum_counts(slot.get_item(), get_holding_item())
                    slot.update_count(counts["slot"])
                    if counts["holding"] > 0:
                        get_holding_item().count = counts["holding"]
                        set_holding_item(get_holding_item())
                    else:
                        set_holding_item(null)
                elif slot.has_item():
                    var item = slot.pick_item()
                    slot.put_item(get_holding_item())
                    set_holding_item(item)
                else:
                    slot.put_item(get_holding_item())
                    set_holding_item(null)
            elif slot.has_item():
                set_holding_item(slot.pick_item())

func slot_is_full(slot) -> bool:
    return slot.get_item().count == slot.get_item().max_stack_size()

func sum_counts(slot_item: GameItem, item: GameItem) -> Dictionary:
    var max_count = item.max_stack_size()
    var sum = slot_item.count + item.count
    if sum <= max_count:
        return {"slot": sum, "holding": 0}
    else:
        return {"slot": max_count, "holding": sum - max_count}

func get_holding_item() -> GameItem:
    return find_parent("Hud").holding_item

func set_holding_item(item: GameItem):
    find_parent("Hud").holding_item = item
