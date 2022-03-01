extends Node

onready var _locations = {
    Global.Location.CFE_CELLAR: $CfeCellar,
    Global.Location.CFE_HALL: load("res://locations/CfeHall.tscn").instance(),
}

var _current_location_name = Global.Location.CFE_CELLAR
onready var _current_location: Location = _locations[_current_location_name]

func _ready():
    CurrentLocation.connect("change", self, "_change_location")

func _change_location(location_name: int):
    var old_location_name = _current_location_name
    var player = _current_location.remove_player()

    remove_child(_current_location)
    _current_location_name = location_name
    _current_location = _locations[location_name]
    add_child(_current_location)

    var spawn = _current_location.find_spawn_point(old_location_name)
    player.global_position = spawn.global_position

    _current_location.add_player(player)
