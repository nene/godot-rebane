extends Node2D

const MIN_LEVEL = Vector2(135, 176)
const MAX_LEVEL = Vector2(135, 105)
const MAX_BEER_HEIGHT = MIN_LEVEL.y - MAX_LEVEL.y

onready var _beer = $Beer
onready var _foam = $Foam

export var beer_level = 0.0 setget _setbeer_level
export var foam_level = 0.0 setget _set_foam_level

func _ready():
    _beer.play("default")
    _update_positions()

func _setbeer_level(level: float):
    beer_level = level
    _update_positions()

func _set_foam_level(level: float):
    foam_level = level
    _update_positions()

func _update_positions():
    var beer_height = floor(beer_level * MAX_BEER_HEIGHT)
    var foam_height = floor(foam_level * MAX_BEER_HEIGHT)
    _beer.position = MIN_LEVEL - Vector2(0, beer_height)
    _foam.position = MIN_LEVEL - Vector2(0, beer_height + foam_height)
