extends Node2D

var holding_item: GameItem = null

func _ready():
    for slot in $GridContainer.get_children():
        slot.connect("gui_input", self, "slot_gui_input", [slot])

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
