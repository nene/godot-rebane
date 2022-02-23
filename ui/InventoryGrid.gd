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
            slot.connect("gui_input", self, "_slot_gui_input", [i])

func load_inventory(inventory: Inventory):
    if inventory.size() != grid_size.x * grid_size.y:
        print("Inventory size doesn't match grid size!")
        return
    _inventory = inventory
    _refresh_slots()

func _refresh_slots():
    for i in range(_inventory.size()):
        var slot: Slot = $GridContainer.get_child(i)
        slot.set_group(_inventory.at(i))

func _slot_gui_input(event: InputEvent, slot_index: int):
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT && event.pressed:
            _slot_clicked(slot_index)

func _slot_clicked(slot_index: int):
    var slot_group = _inventory.at(slot_index)
    if get_holding_item():
        if slot_group && slot_group.is_same_type(get_holding_item()) && !slot_group.is_full():
            var sum = slot_group.add(get_holding_item())
            if sum is GameItemGroup:
                _inventory.put_at(slot_index, sum)
                set_holding_item(null)
            else:
                _inventory.put_at(slot_index, sum[0])
                set_holding_item(sum[1])
        elif slot_group:
            var group = _inventory.pick_at(slot_index)
            _inventory.put_at(slot_index, get_holding_item())
            set_holding_item(group)
        else:
            _inventory.put_at(slot_index, get_holding_item())
            set_holding_item(null)
    elif slot_group:
        set_holding_item(_inventory.pick_at(slot_index))
    _refresh_slots()

func get_holding_item() -> GameItemGroup:
    return mouse_cursor.holding_item

func set_holding_item(group: GameItemGroup):
    mouse_cursor.holding_item = group
