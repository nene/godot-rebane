extends Reference

var _foam_in_glass := 0.0
var _liquid_in_glass := 0.0
var _liquid_in_bottle := 1.0
# Must be > 1 (1 means the glass can contain 1 bottle of beer, but no foam)
var _glass_size = 1.2 # 90% of beer + 30% of foam
var _foam: Dictionary

func _init(foam: Dictionary):
    _foam = foam

# Pours some amount of beer to glass
func pour_to_glass(flow_rate: float, amount: float):
    if _is_glass_full():
        return

    match _split_beer_and_foam(flow_rate, amount):
        [var beer, var foam]:
            _liquid_in_glass = min(_glass_size - _foam_in_glass, _liquid_in_glass + beer)
            _foam_in_glass = min(_glass_size - _liquid_in_glass, _foam_in_glass + foam)

# Extracts some amount of beer from bottle at certain flow-rate
func take_from_bottle(flow_rate: float) -> float:
    if _is_bottle_empty():
        return 0.0

    var amount = _flow_to_amount(flow_rate)
    if amount > _liquid_in_bottle:
        var old_liquid_in_bottle = _liquid_in_bottle
        _liquid_in_bottle = 0.0
        return old_liquid_in_bottle
    else:
        _liquid_in_bottle -= amount
        return amount

# How much beer flows out of bottle at certain rate
# - Fastest rate: 3 sec ->  30 ticks (amount 1/30)
# - Slowest rate: 60sec -> 600 ticks (amount 1/600)
func _flow_to_amount(flow_rate: float) -> float:
    return 1.0 / _scale_to_range(flow_rate, 600, 30)

# Foam will take 3x the same volume as beer it was generated from
func _split_beer_and_foam(flow_rate: float, amount: float) -> Array:
    var foam_ratio = _scale_to_range(flow_rate, _foam["min"], _foam["max"])
    var foam_part = amount * foam_ratio
    var liquid_part = amount - foam_part
    return [liquid_part, foam_part * 3]

# The following is a result of solving linear equation:
# f(x) = ax + b
# where f(0.01) = min
# where f(1) = max
func _scale_to_range(x: float, _min: float, _max: float) -> float:
    var a = (_min - _max) * 100 / -99
    var b = _max - a
    return (a * x + b)

func get_foam_in_glass() -> float:
    return _foam_in_glass

func get_liquid_in_glass() -> float:
    return _liquid_in_glass

func get_liquid_in_bottle() -> float:
    return _liquid_in_bottle

# The total of liquid beer + foamed beer
func get_total_in_glass() -> float:
    return _liquid_in_glass + _foam_in_glass / 3

func is_finished() -> bool:
    return _is_glass_full() || _is_bottle_empty()

func _is_bottle_empty() -> bool:
    return _liquid_in_bottle <= 0.0001

func _is_glass_full() -> bool:
    return _liquid_in_glass + _foam_in_glass >= _glass_size - 0.0001

# How full is the glass: 0..1
func get_fill_level() -> float:
    return (_liquid_in_glass + _foam_in_glass) / _glass_size
