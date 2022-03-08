extends State

var _owner: Player
var _beer_glass: BeerGlass

func _init(owner: Player, beer_glass):
    _owner = owner
    _beer_glass = beer_glass

func enter():
    var drink_animation = _owner.get_drink_animation()
    drink_animation.play(_beer_glass)
    yield(drink_animation, "finished")
    emit_signal("finished")
