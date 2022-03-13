extends State

var _speed = 75
var _owner: Player

func _init(owner: Player):
    _owner = owner

func physics_update(delta):
    var direction = Vector2.ZERO
    if Input.is_action_pressed("ui_left"):
        direction.x = -1
    if Input.is_action_pressed("ui_right"):
        direction.x = +1
    if Input.is_action_pressed("ui_up"):
        direction.y = -1
    if Input.is_action_pressed("ui_down"):
        direction.y = +1

    direction = direction.normalized()
    
    if direction != Vector2.ZERO:
        _owner.set_animation_direction(direction)
        _owner.animationState.travel("Walk")
    else:
        _owner.animationState.travel("Idle")
    
    _owner.move_and_slide(direction * _speed)

func is_interactable(group: GameItemGroup = null):
    return group != null && group.item().type() == "beer_glass"

func handle_input(event):
    if event is InteractEvent:
        var Drink = load("res://state_machine/player/Drink.gd")
        var beer_glass = event.holding_group.item()
        GameEvents.emit_signal("change_holding_group", null)
        emit_signal("finished", Drink.new(_owner, beer_glass))
    if event is InputEvent && event.is_action_pressed("ui_greet"):
        var Greet = load("res://state_machine/player/Greet.gd")
        emit_signal("finished", Greet.new(_owner))
