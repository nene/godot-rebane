tool
extends Node2D

enum CalloutType {
  GLASS,
  BEER,
  WATER,
  QUESTION,
  OPENER,
  BOTTLE,
  EMPTY_BOTTLE,
}

export(CalloutType) var callout_type = CalloutType.QUESTION setget _set_callout_type

func _set_callout_type(type: int):
    callout_type = type
    $AnimatedSprite.frame = type
