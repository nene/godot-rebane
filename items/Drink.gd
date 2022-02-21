extends Reference
class_name Drink

enum DrinkColor {
    WATER,
    LEMONADE,
    LIGHT,
    DARK,
    RED,
}

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

const foamLevel = [
  { "min": 0.00, "max": 0.00 }, # #0
  { "min": 0.00, "max": 0.10 }, # #1
  { "min": 0.05, "max": 0.20 }, # #2
  { "min": 0.10, "max": 0.40 }, # #3
  { "min": 0.15, "max": 0.60 }, # #4
  { "min": 0.20, "max": 0.90 }, # #5
]

const drinks = {
  0: {
    "name": "Vesi",
    "withName": "veega",
    "description": "Seda tuleb kraanist lõputult.",
    "price": 0,
    "bottleSpriteIndex": 11,
    "alcohol": 0,
    "foam": foamLevel[0],
    "capStrength": 0,
    "color": DrinkColor.WATER,
  },
  1: {
    "name": "Limpa limonaad",
    "withName": "limonaadiga",
    "description": "See magus jook kipub šoppeni põhja kleepuma.",
    "price": 1,
    "bottleSpriteIndex": 7,
    "alcohol": 0,
    "foam": foamLevel[0],
    "capStrength": 0,
    "color": DrinkColor.LEMONADE,
  },
  2: {
    "name": "Kriek",
    "withName": "kriekiga",
    "description": "Seda hõrku nestet libistavad ka naiskorporandid.",
    "price": 6,
    "bottleSpriteIndex": 6,
    "alcohol": 0.8, # 3.5,
    "foam": foamLevel[4],
    "capStrength": 5,
    "color": DrinkColor.RED,
  },
  3: {
    "name": "Pilsner",
    "withName": "pilkuga",
    "description": "EÜSnikute lemmiknaps.",
    "price": 1,
    "bottleSpriteIndex": 4,
    "alcohol": 1, # 4.2,
    "foam": foamLevel[1],
    "capStrength": 1,
    "color": DrinkColor.LIGHT,
  },
  4: {
    "name": "Heineken",
    "withName": "heinekeniga",
    "description": "Väljamaine rüübe rohelises pudelis.",
    "price": 3,
    "bottleSpriteIndex": 2,
    "alcohol": 1.6, # 5,
    "foam": foamLevel[1],
    "capStrength": 3,
    "color": DrinkColor.LIGHT,
  },
  5: {
    "name": "Tõmmu hiid",
    "withName": "tõmmu hiiuga",
    "description": "Vana vilistlase rammujook.",
    "price": 4,
    "bottleSpriteIndex": 5,
    "alcohol": 1.87, # 4.7,
    "foam": foamLevel[4],
    "capStrength": 2,
    "color": DrinkColor.DARK,
  },
  6: {
    "name": "Alexander",
    "withName": "sassiga",
    "description": "Sassi läheb kui loed mitu pudelit sai joodud.",
    "price": 2,
    "bottleSpriteIndex": 1,
    "alcohol": 2, # 5.2,
    "foam": foamLevel[2],
    "capStrength": 2,
    "color": DrinkColor.LIGHT,
  },
  7: {
    "name": "Special",
    "withName": "specialiga",
    "description": "Eriline jook puhuks kui paremat pole võtta.",
    "price": 3,
    "bottleSpriteIndex": 3,
    "alcohol": 2, # 5.2,
    "foam": foamLevel[1],
    "capStrength": 3,
    "color": DrinkColor.LIGHT,
  },
  8: {
    "name": "Hefeweisen",
    "withName": "nisukaga",
    "description": "Saksamaine nisumärjuke (bratwursti kõrvale).",
    "price": 5,
    "bottleSpriteIndex": 8,
    "alcohol": 2.5, # 5.5,
    "foam": foamLevel[4],
    "capStrength": 4,
    "color": DrinkColor.LIGHT,
  },
  9: {
    "name": "Šokolaadi porter",
    "withName": "porteriga",
    "description": "Väidetavalt muudab suure mehe päkapikuks.",
    "price": 4,
    "bottleSpriteIndex": 10,
    "alcohol": 3.6, # 6.9,
    "foam": foamLevel[5],
    "capStrength": 2,
    "color": DrinkColor.DARK,
  },
  10: {
    "name": "Double Bock",
    "withName": "bockiga",
    "description": "Revelia kvarteriturniiri erikülaline.",
    "price": 3,
    "bottleSpriteIndex": 9,
    "alcohol": 4, # 7,
    "foam": foamLevel[3],
    "capStrength": 3,
    "color": DrinkColor.LIGHT,
  },
}

static func get_drink(type: int) -> Dictionary:
    return drinks[type]
