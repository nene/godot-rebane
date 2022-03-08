extends State

var _states = []
var _current_state: State

# Runs through list of states
#
# When a substate finishes with new state:
# - the new state replaces the previous one
# When a substate finishes without new state:
# - next one in list is activated
func _init(states: Array):
    _states = states

func enter():
    _next_state()

func _next_state():
    if _states.empty():
        emit_signal("finished")
        return

    _current_state = _states.pop_front()
    _current_state.connect("finished", self, "_transition")
    _current_state.enter()

# Called whenever state finished with "finish" signal.
func _transition(new_state: State = null):
    _current_state.exit()

    if new_state:
        _states.push_front(new_state)

    _next_state()

func handle_input(event):
    _current_state.handle_input(event)

func physics_update(delta):
    _current_state.physics_update(delta)

func on_animation_finished(anim_name):
    _current_state.on_animation_finished(anim_name)

func is_interactable(group: GameItemGroup = null) -> bool:
    return _current_state.is_interactable(group)
