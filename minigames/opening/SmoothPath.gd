tool
extends Path2D
class_name SmoothPath

export(Color) var _color = Color.black
export(float) var _width = 5

func _draw():
    var points = curve.get_baked_points()
    if points:
        draw_polyline(points, _color, _width, true)
