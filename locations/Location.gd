extends Node2D
class_name Location

func has_player() -> bool:
    return has_node("YSort/Player")

func add_player(player):
    get_node("YSort").add_child(player)

func remove_player() -> Player:
    var player = get_node("YSort/Player")
    get_node("YSort").remove_child(player)
    return player

func _find(Class):
    for obj in get_node("YSort").get_children():
        if obj is Class:
            return obj
    return null

func find_spawn_point(from_location: int) -> SpawnPoint:
    for obj in get_node("YSort").get_children():
        if obj is SpawnPoint && obj.from_location == from_location:
            return obj
    return null
