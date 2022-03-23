extends Resource
class_name DrinkStats

enum DrinkColor {
    WATER,
    LEMONADE,
    LIGHT,
    DARK,
    RED,
}

enum Foam {
    NONE,
    MIN,
    LOW,
    MEDIUM,
    HIGH,
    MAX,
}

const _foam_ranges = {
  Foam.NONE: { "min": 0.00, "max": 0.00 }, # #0
  Foam.MIN: { "min": 0.00, "max": 0.10 }, # #1
  Foam.LOW: { "min": 0.05, "max": 0.20 }, # #2
  Foam.MEDIUM: { "min": 0.10, "max": 0.40 }, # #3
  Foam.HIGH: { "min": 0.15, "max": 0.60 }, # #4
  Foam.MAX: { "min": 0.20, "max": 0.90 }, # #5
}

# warning-ignore-all:unused_class_variable
export var name: String = ""
export var description: String = ""
export(int, 0, 11) var bottle_sprite_index: int = 0
export(float, 0, 4, 0.1) var alcohol: float = 0.0
export(Foam) var foam: int = 0
export(int, 0, 5) var cap_strength: int = 0
export(DrinkColor) var color: int = DrinkColor.LIGHT

func foam_min() -> float:
    return _foam_ranges[foam]["min"]

func foam_max() -> float:
    return _foam_ranges[foam]["max"]
