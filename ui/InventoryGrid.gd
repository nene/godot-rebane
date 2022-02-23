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
        if event.button_index == BUTTON_RIGHT && event.pressed:
            _slot_right_clicked(slot_index)

func _slot_clicked(slot_index: int):
    var slot_group = _inventory.at(slot_index)
    var holding_group = get_holding_group()
    if holding_group:
        if slot_group && slot_group.is_same_type(holding_group) && !slot_group.is_full():
            var sum = slot_group.add(holding_group)
            if sum is GameItemGroup:
                _inventory.put_at(slot_index, sum)
                set_holding_group(null)
            else:
                _inventory.put_at(slot_index, sum[0])
                set_holding_group(sum[1])
        elif slot_group:
            var group = _inventory.pick_at(slot_index)
            _inventory.put_at(slot_index, holding_group)
            set_holding_group(group)
        else:
            _inventory.put_at(slot_index, holding_group)
            set_holding_group(null)
    elif slot_group:
        set_holding_group(_inventory.pick_at(slot_index))
    _refresh_slots()

func _slot_right_clicked(slot_index: int):
    var slot_group = _inventory.at(slot_index)
    var holding_group = get_holding_group()
    if holding_group:
        if slot_group:
            if slot_group.count() > 1 && !holding_group.is_full():
                var groups = slot_group.subtract(1)
                _inventory.put_at(slot_index, groups[0])
                set_holding_group(holding_group.add(groups[1]))
            elif !holding_group.is_full():
                _inventory.put_at(slot_index, null)
                set_holding_group(holding_group.add(slot_group))
    elif slot_group:
        if slot_group.count() > 1:
            var groups = slot_group.subtract(1)
            _inventory.put_at(slot_index, groups[0])
            set_holding_group(groups[1])
        else:
            _slot_clicked(slot_index)

    _refresh_slots()

func get_holding_group() -> GameItemGroup:
    return mouse_cursor.holding_group

func set_holding_group(group: GameItemGroup):
    mouse_cursor.holding_group = group
