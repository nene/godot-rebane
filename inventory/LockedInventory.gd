extends Inventory
class_name LockedInventory

func _init(items: Array, size: int).(items, size):
    pass

func put_at(index: int, item: GameItemGroup):
    print("ERROR: Can't put to locked inventory")

func pick_at(index: int):
    print("ERROR: Can't pick from locked inventory")

func is_locked():
    return true
