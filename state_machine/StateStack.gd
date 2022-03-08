extends State

var _states_stack = []
var _current_state: State

# Runs the topmost state in stack
#
# When a substate finishes with new state:
# - the new state is added on top of the stack,
# When a substate finishes without new state:
# - it gets removed from the stack
func _init(state: State):
    _states_stack = [state]
    state.connect("finished", self, "_transition")

func enter():
    _next_state()

func _next_state():
    if _states_stack.empty():
        emit_signal("finished")
        return

    _current_state = _states_stack.pop_front()
    _current_state.enter()

# Called whenever state finished with "finish" signal.
func _transition(new_state: State = null):
    _current_state.exit()

    if new_state:
        _states_stack.push_front(_current_state)
        _states_stack.push_front(new_state)
        new_state.connect("finished", self, "_transition")

    _next_state()

func handle_input(event):
    _current_state.handle_input(event)

func physics_update(delta):
    _current_state.physics_update(delta)

func on_animation_finished(anim_name):
    _current_state.on_animation_finished(anim_name)

func is_interactable(group: GameItemGroup = null) -> bool:
    return _current_state.is_interactable(group)
