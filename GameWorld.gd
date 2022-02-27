extends Node

onready var _locations = {
    Location.Location.CFE_CELLAR: $CfeCellar,
    Location.Location.CFE_HALL: load("res://locations/CfeHall.tscn").instance(),
}

onready var _current_location = $CfeCellar

func _ready():
    CurrentLocation.connect("change", self, "_change_location")

func _change_location(location: int):
    remove_child(_current_location)
    _current_location = _locations[location]
    add_child(_current_location)
