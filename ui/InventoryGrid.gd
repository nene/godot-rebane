extends Node2D

var GameItemViewNode = preload("res://ui/GameItemView.tscn")

var holding_item: GameItem = null

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
    for slot in $GridContainer.get_children():
        slot.connect("gui_input", self, "slot_gui_input", [slot])
    
    for i in range(inventory.size()):
        var slot: Slot = $GridContainer.get_child(i)
        slot.put_item(inventory[i])

func slot_gui_input(event: InputEvent, slot: Slot):
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT && event.pressed:
            if holding_item:
                if slot.has_same_item(holding_item) && !slot_is_full(slot):
                    var counts = sum_counts(slot.get_item(), holding_item)
                    slot.update_count(counts["slot"])
                    if counts["holding"] > 0:
                        holding_item.count = counts["holding"]
                        $HoldingItemView.set_item(holding_item)
                    else:
                        $HoldingItemView.hide()
                        holding_item = null
                elif slot.has_item():
                    var item = slot.pick_item()
                    slot.put_item(holding_item)
                    $HoldingItemView.set_item(item)
                    holding_item = item
                else:
                    $HoldingItemView.hide()
                    slot.put_item(holding_item)
                    holding_item = null
            elif slot.has_item():
                holding_item = slot.pick_item()
                $HoldingItemView.set_item(holding_item)
                $HoldingItemView.show()

func slot_is_full(slot) -> bool:
    return slot.get_item().count == slot.get_item().max_stack_size()

func sum_counts(slot_item: GameItem, item: GameItem) -> Dictionary:
    var max_count = item.max_stack_size()
    var sum = slot_item.count + item.count
    if sum <= max_count:
        return {"slot": sum, "holding": 0}
    else:
        return {"slot": max_count, "holding": sum - max_count}

func _input(event: InputEvent):
    $HoldingItemView.global_position = get_global_mouse_position()
