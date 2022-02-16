extends Reference

static func is_moving(direction: Vector2) -> bool:
    return direction != Vector2.ZERO

static func to_facing(direction: Vector2) -> String:
    if direction.x > 0:
        return "right"
    elif direction.x < 0:
        return "left"
    elif direction.y < 0:
        return "up"
    else:
        return "down"

static func animation_name(moving: bool, facing: String) -> String:
    if moving:
        return "w-" + facing
    else:
        return facing.substr(0, 1).to_upper()
