tool
extends GridContainer

export var grid_size: Vector2 = Vector2(4, 4) setget set_grid_size

# Must be injected by the scene that instanciates the grid
var mouse_cursor: MouseCursor
var inventory: Inventory setget _set_inventory

var GameItemViewNode = preload("res://ui/GameItemView.tscn")
var SlotNode = preload("res://inventory/Slot.tscn")

var _inventory: Inventory

func _ready():
    set_grid_size(grid_size)

func set_grid_size(size: Vector2):
    grid_size = size

    for child in self.get_children():
        self.remove_child(child)

    self.columns = grid_size.x
    for i in range(grid_size.x * grid_size.y):
        var slot = SlotNode.instance()
        self.add_child(slot)
        if !Engine.editor_hint:
            slot.connect("gui_input", self, "_slot_gui_input", [i])

func _set_inventory(inv: Inventory):
    if inv.size() != grid_size.x * grid_size.y:
        print("ERROR: Inventory size doesn't match grid size!")
        return
    inventory = inv
    _refresh_slots()

func _refresh_slots():
    for i in range(inventory.size()):
        var slot: Slot = self.get_child(i)
        slot.locked = inventory.is_locked()
        slot.set_group(inventory.at(i))

func _slot_gui_input(event: InputEvent, slot_index: int):
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT && event.pressed:
            _slot_clicked(slot_index)
        if event.button_index == BUTTON_RIGHT && event.pressed:
            _slot_right_clicked(slot_index)

func _slot_clicked(slot_index: int):
    if inventory.is_locked():
        return
    var slot_group = inventory.at(slot_index)
    var holding_group = get_holding_group()
    if holding_group:
        if slot_group && slot_group.is_same_type(holding_group) && !slot_group.is_full():
            var sum = slot_group.add(holding_group)
            if sum is GameItemGroup:
                inventory.put_at(slot_index, sum)
                set_holding_group(null)
            else:
                inventory.put_at(slot_index, sum[0])
                set_holding_group(sum[1])
        elif slot_group:
            var group = inventory.pick_at(slot_index)
            inventory.put_at(slot_index, holding_group)
            set_holding_group(group)
        else:
            inventory.put_at(slot_index, holding_group)
            set_holding_group(null)
    elif slot_group:
        set_holding_group(inventory.pick_at(slot_index))
    _refresh_slots()

func _slot_right_clicked(slot_index: int):
    if inventory.is_locked():
        return
    var slot_group = inventory.at(slot_index)
    var holding_group = get_holding_group()
    if holding_group:
        if slot_group:
            if slot_group.count() > 1 && !holding_group.is_full():
                var groups = slot_group.subtract(1)
                inventory.put_at(slot_index, groups[0])
                set_holding_group(holding_group.add(groups[1]))
            elif !holding_group.is_full():
                inventory.put_at(slot_index, null)
                set_holding_group(holding_group.add(slot_group))
    elif slot_group:
        if slot_group.count() > 1:
            var groups = slot_group.subtract(1)
            inventory.put_at(slot_index, groups[0])
            set_holding_group(groups[1])
        else:
            _slot_clicked(slot_index)

    _refresh_slots()

func get_holding_group() -> GameItemGroup:
    return mouse_cursor.holding_group

func set_holding_group(group: GameItemGroup):
    mouse_cursor.holding_group = group
