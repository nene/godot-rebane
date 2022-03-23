extends Node

onready var _locations = {
    Global.Location.CFE_CELLAR: $CfeCellar,
    Global.Location.CFE_HALL: $CfeHall,
    Global.Location.OUTDOORS: $Outdoors,
}

var _current_location_name: int
var _current_location: Location

func _ready():
    GameEvents.connect("change_location", self, "_change_location")
    
    _current_location_name = _find_location_with_player()
    _current_location = _locations[_current_location_name]

    _hide_all_locations()
    _current_location.show()

func _find_location_with_player() -> int:
    for name in _locations:
        if _locations[name].has_player():
            return name
    return -1

func _hide_all_locations():
    for name in _locations:
        _locations[name].hide()

func _change_location(location_name: int):
    if location_name == _current_location_name:
        print("ERROR: Can't change location to current location")
        return

    var old_location_name = _current_location_name
    var player = _current_location.remove_player()
    _current_location.hide()

    _current_location_name = location_name
    _current_location = _locations[location_name]
    _current_location.show()

    var spawn = _current_location.find_spawn_point(old_location_name)

    player.position = spawn.position
    _current_location.add_player(player)
