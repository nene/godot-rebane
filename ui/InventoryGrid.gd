tool
extends Node2D

export var grid_size: Vector2 = Vector2(4, 4) setget set_grid_size

# Must be injected by the scene that instanciates the grid
var mouse_cursor: MouseCursor

var GameItemViewNode = preload("res://ui/GameItemView.tscn")
var SlotNode = preload("res://ui/Slot.tscn")

var _inventory: Inventory

func _ready():
    set_grid_size(grid_size)

func set_grid_size(size: Vector2):
    grid_size = size

    for child in $GridContainer.get_children():
        $GridContainer.remove_child(child)

    $GridContainer.columns = grid_size.x
    for i in range(grid_size.x * grid_size.y):
        var slot = SlotNode.instance()
        $GridContainer.add_child(slot)
        if !Engine.editor_hint:
            slot.connect("gui_input", self, "slot_gui_input", [slot, i])

func load_inventory(inventory: Inventory):
    _clear_slots()
    self._inventory = inventory
    for i in range(inventory.size()):
        var slot: Slot = $GridContainer.get_child(i)
        var item: GameItem = inventory.at(i)
        if slot && item:
            slot.put_item(item)

func _clear_slots():
    for slot in $GridContainer.get_children():
        slot.pick_item()

func slot_gui_input(event: InputEvent, slot: Slot, slot_index: int):
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
                    _inventory.put_at(slot_index, get_holding_item())
                    var item = slot.pick_item()
                    slot.put_item(get_holding_item())
                    set_holding_item(item)
                else:
                    _inventory.put_at(slot_index, get_holding_item())
                    slot.put_item(get_holding_item())
                    set_holding_item(null)
            elif slot.has_item():
                _inventory.pick_at(slot_index)
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
    return mouse_cursor.holding_item

func set_holding_item(item: GameItem):
    mouse_cursor.holding_item = item
