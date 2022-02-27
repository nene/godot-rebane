extends Node

onready var _locations = {
    Location.Location.CFE_CELLAR: $CfeCellar,
    Location.Location.CFE_HALL: load("res://locations/CfeHall.tscn").instance(),
}

onready var _current_location: Location = $CfeCellar

func _ready():
    CurrentLocation.connect("change", self, "_change_location")

func _change_location(location: int):
    var player = _current_location.remove_player()

    remove_child(_current_location)
    _current_location = _locations[location]
    add_child(_current_location)

    var spawn = _current_location.find_spawn_point()
    player.global_position = spawn.global_position

    _current_location.add_player(player)
