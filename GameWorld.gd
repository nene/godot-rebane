extends Node

onready var _locations = {
    Global.Location.CFE_CELLAR: $CfeCellar,
    Global.Location.CFE_HALL: $CfeHall,
}

var _current_location_name = Global.Location.CFE_CELLAR
onready var _current_location: Location = _locations[_current_location_name]

func _ready():
    GameEvents.connect("change_location", self, "_change_location")

func _change_location(location_name: int):
    var old_location_name = _current_location_name
    var player = _current_location.remove_player()

    _current_location_name = location_name
    _current_location = _locations[location_name]

    var spawn = _current_location.find_spawn_point(old_location_name)

    player.position = spawn.position
    _current_location.add_player(player)
    CanvasModulate
