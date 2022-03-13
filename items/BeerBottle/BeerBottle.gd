extends GameItem
class_name BeerBottle

const BEER_BOTTLE_LG_TEXTURE = preload("res://items/BeerBottle/bottle-lg.png")
const BEER_BOTTLE_LG_OUTLINE_TEXTURE = preload("res://items/BeerBottle/bottle-lg-outline.png")

enum CapState {
    CLOSED,
    OPEN,
}

var drink_type = Drink.WATER
var cap_state = CapState.CLOSED

func _init(drink_type = null, cap_state: int = CapState.CLOSED):
    self.drink_type = drink_type

    if drink_type:
        self.cap_state = cap_state
    else:
        # empty bottles (drink_type=null) cannot be closed
        self.cap_state = CapState.OPEN

func type():
    return "beer_bottle"

func name():
    if is_empty():
        return "Tühi pudel"
    else:
        return Drink.get_drink(drink_type)["name"] + _cap_state_suffix()

func _cap_state_suffix():
    return " (avatud)" if is_open() else ""

func texture():
    return _get_from_atlas_texture(BEER_BOTTLE_LG_TEXTURE)

func highlighted_texture():
    return _get_from_atlas_texture(BEER_BOTTLE_LG_OUTLINE_TEXTURE)

func _get_from_atlas_texture(atlas: Texture):
    if is_empty():
        return TextureUtils.from_atlas(atlas, Vector2(cap_state, 0), Vector2(18, 18))
    else:
        var drink = Drink.get_drink(drink_type)
        return TextureUtils.from_atlas(atlas, Vector2(cap_state, drink["bottleSpriteIndex"]), Vector2(18, 18))

func is_open():
    return cap_state == CapState.OPEN

func is_empty():
    return drink_type == null

func empty():
    drink_type = null
    cap_state = CapState.OPEN

func max_stack_size():
    return 9 if is_empty() else 1

func combine(item: GameItem) -> Combination:
    if item.type() == "bottle_opener" && !is_open():
        var OpenBottle = load("res://items/combinations/OpenBottle.gd")
        return OpenBottle.new(item, self)
    else:
        return null
