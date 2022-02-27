extends Node2D
class_name Location

enum Location {
    CFE_CELLAR,
    CFE_HALL, 
}

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

func find_spawn_point() -> SpawnPoint:
    return _find(SpawnPoint)
