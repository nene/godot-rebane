extends Reference
class_name Drink

enum {
    WATER,
    LEMONADE,
    KRIEK,
    PILSNER,
    HEINEKEN,
    TOMMU_HIID,
    ALEXANDER,
    SPECIAL,
    PAULANER,
    PORTER,
    BOCK,
}

const drinks = {
  WATER: preload("res://items/drinks/Water.tres"),
  LEMONADE: preload("res://items/drinks/Lemonade.tres"),
  KRIEK: preload("res://items/drinks/Kriek.tres"),
  PILSNER: preload("res://items/drinks/Pilsner.tres"),
  HEINEKEN: preload("res://items/drinks/Heineken.tres"),
  TOMMU_HIID: preload("res://items/drinks/TommuHiid.tres"),
  ALEXANDER: preload("res://items/drinks/Alexander.tres"),
  SPECIAL: preload("res://items/drinks/Special.tres"),
  PAULANER: preload("res://items/drinks/Paulaner.tres"),
  PORTER: preload("res://items/drinks/Porter.tres"),
  BOCK: preload("res://items/drinks/Bock.tres"),
}

static func get_drink(type: int) -> DrinkStats:
    return drinks[type]
