extends Node2D

const MIN_LEVEL = Vector2(135, 176)
const MAX_LEVEL = Vector2(135, 105)
const MAX_BEER_HEIGHT = MIN_LEVEL.y - MAX_LEVEL.y

onready var _beer = $Beer
onready var _foam = $Foam

var _beer_height = 0.0
var _foam_height = 0.0

func _ready():
    _beer.play("default")
    _update_beer_positions()

func _update_beer_positions():
    _foam.position = MIN_LEVEL - Vector2(0, (_beer_height + _foam_height) * MAX_BEER_HEIGHT)
    _beer.position = MIN_LEVEL - Vector2(0, _beer_height * MAX_BEER_HEIGHT)

func _on_glass_bottom_droplet_hit():
    if _beer_height + _foam_height < 1.3:
        _beer_height += 0.01
        _foam_height += 0.01
        _update_beer_positions()

