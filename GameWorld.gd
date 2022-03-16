extends Node

onready var _locations = {
    Global.Location.CFE_CELLAR: $CfeCellar,
    Global.Location.CFE_HALL: $CfeHall,
}

var _current_location_name: int
onready var _current_location: Location

func _ready():
    GameEvents.connect("change_location", self, "_change_location")
    
    _current_location_name = _find_location_with_player()
    _current_location = _locations[_current_location_name]

func _find_location_with_player() -> int:
    for name in _locations:
        if _locations[name].has_player():
            return name
    return -1

func _change_location(location_name: int):
    var old_location_name = _current_location_name
    var player = _current_location.remove_player()

    _current_location_name = location_name
    _current_location = _locations[location_name]

    var spawn = _current_location.find_spawn_point(old_location_name)

    player.position = spawn.position
    _current_location.add_player(player)
