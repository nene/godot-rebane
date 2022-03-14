tool
extends Node2D

export(Vector2) var from = Vector2.ZERO setget _set_from
export(Vector2) var to = Vector2.ZERO setget _set_to
export(Color) var color = Color.black setget _set_color
export(float) var width = 5
var _curve: Curve2D

func _ready():
    _refresh_curve()

func _set_from(_from):
    from = _from
    _refresh_curve()

func _set_to(_to):
    to = _to
    _refresh_curve()

func _set_color(_color):
    color = _color
    update()

func _refresh_curve():
    _curve = Curve2D.new()
    _curve.bake_interval = 1
    _curve.add_point(from)
    var middle = from + (to - from) / 2
    _curve.add_point(middle, Vector2(-70,-10), Vector2(70,10))
    _curve.add_point(to)
    update()

func _draw():
    var points = _curve.get_baked_points()
    if points:
        draw_polyline(points, color, width, true)
