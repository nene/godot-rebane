extends State

var speed = 75

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
        owner.set_animation_direction(direction)
        owner.animationState.travel("Walk")
    else:
        owner.animationState.travel("Idle")
    
    owner.move_and_slide(direction * speed)

func is_interactable(item: GameItem = null):
    return item is BeerGlass

func handle_input(event):
    if event is InteractEvent:
        emit_signal("finished", "push", "Drink")
