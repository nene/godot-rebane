tool
extends GridContainer

export var grid_size: Vector2 = Vector2(4, 4) setget set_grid_size

# Dependency injection
var inventory: Inventory setget _set_inventory

var SlotNode = preload("res://inventory/Slot.tscn")

var _holding_group: GameItemGroup

func _ready():
    GameEvents.connect("change_holding_group", self, "_set_holding_group", [false])
    set_grid_size(grid_size)

func set_grid_size(size: Vector2):
    grid_size = size

    for child in self.get_children():
        self.remove_child(child)

    self.columns = int(grid_size.x)
    for i in range(grid_size.x * grid_size.y):
        var slot = SlotNode.instance()
        self.add_child(slot)
        if !Engine.editor_hint:
            slot.connect("gui_input", self, "_slot_gui_input", [i])
            slot.connect("mouse_entered", self, "_check_slot_combinability", [i])
            slot.connect("mouse_exited", self, "_notify_slot_not_combinable", [i])

func _set_inventory(inv: Inventory):
    if inv.size() != grid_size.x * grid_size.y:
        print("ERROR: Inventory size doesn't match grid size!")
        return
    inventory = inv
    inventory.connect("change", self, "_refresh_slots")
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
    if _holding_group:
        if slot_group && slot_group.item().combine(_holding_group.item()):
            var combination = slot_group.item().combine(_holding_group.item())
            combination.connect("success", self, "_combination_success", [slot_index])
            combination.execute()
        elif slot_group && slot_group.item().is_groupable_with(_holding_group.item()) && !slot_group.is_full():
            match slot_group.merge(_holding_group):
                [var sum]:
                    inventory.put_at(slot_index, sum)
                    _set_holding_group(null)
                [var in_slot, var in_hand]:
                    inventory.put_at(slot_index, in_slot)
                    _set_holding_group(in_hand)
        elif slot_group:
            var group = inventory.pick_at(slot_index)
            inventory.put_at(slot_index, _holding_group)
            _set_holding_group(group)
        else:
            inventory.put_at(slot_index, _holding_group)
            _set_holding_group(null)
    elif slot_group:
        _set_holding_group(inventory.pick_at(slot_index))
    _refresh_slots()

func _slot_right_clicked(slot_index: int):
    if inventory.is_locked():
        return
    var slot_group = inventory.at(slot_index)
    if _holding_group:
        # Place single item into slot
        if slot_group && slot_group.item().is_groupable_with(_holding_group.item()) && !slot_group.is_full() && _holding_group.count() > 1:
            var groups = _holding_group.split(1)
            match slot_group.merge(groups[0]):
                [var sum]:
                    inventory.put_at(slot_index, sum)
                    _set_holding_group(groups[1])
                _:
                    print("ERROR: Unable to merge one additional item to group of items")
        elif !slot_group && _holding_group.count() > 1:
            var groups = _holding_group.split(1)
            inventory.put_at(slot_index, groups[0])
            _set_holding_group(groups[1])
        else:
            _slot_clicked(slot_index)
    elif slot_group:
        # Take half of the items from slot
        if slot_group.count() > 1:
            var half_size = int(slot_group.count() / 2)
            var groups = slot_group.split(half_size)
            inventory.put_at(slot_index, groups[0])
            _set_holding_group(groups[1])
        else:
            _slot_clicked(slot_index)

    _refresh_slots()

func _check_slot_combinability(slot_index: int):
    var slot_group := inventory.at(slot_index)
    if slot_group && _holding_group:
        if slot_group.item().combine(_holding_group.item()):
            GameEvents.emit_signal("allow_combine")
            return
    GameEvents.emit_signal("forbid_combine")

func _notify_slot_not_combinable(slot_index: int):
    GameEvents.emit_signal("forbid_combine")

func _combination_success(combination: Combination, slot_index: int):
    if combination.item_in_hand():
        _set_holding_group(GameItemGroup.new(combination.item_in_hand()))
    if combination.item_in_slot():
        inventory.put_at(slot_index, GameItemGroup.new(combination.item_in_slot()))

    # Refresh UI (e.g. removing highlighting after combining completed)
    _check_slot_combinability(slot_index)

func _set_holding_group(group: GameItemGroup, emit = true):
    _holding_group = group
    if emit:
        GameEvents.emit_signal("change_holding_group", group)
