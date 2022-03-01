extends Node
# Adopted from official Godot examples:
# https://github.com/godotengine/godot-demo-projects/tree/master/2d/finite_state_machine
#
# Base interface for a generic state machine.
# It handles initializing, setting the machine active or not
# delegating _physics_process, _input calls to the State nodes,
# and changing the current/active state.

signal state_changed(current_state)

# You should set a starting node from the inspector or on the node that inherits
# from this state machine interface. If you don't, the game will default to
# the first state in the state machine's children.
export(NodePath) var start_state

var _states_map = {}
var _states_stack = []
var _current_state: State = null

func _ready():
    if not start_state:
        start_state = get_child(0).get_path()
    for child in get_children():
        _states_map[child.name] = child
        var err = child.connect("finished", self, "transition")
        if err:
            printerr(err)
    _initialize(start_state)


func _initialize(initial_state):
    _states_stack.push_front(get_node(initial_state))
    _current_state = _states_stack[0]
    _current_state.enter()


# Call this from owner._unhandled_input()
# when you want state machine to process input events
func handle_input(event):
    _current_state.handle_input(event)


# Call this from owner._physics_process()
# when you want state machine to process physics
func physics_update(delta):
    _current_state.physics_update(delta)


# Connect this to finishing of various animations
# e.g. to AnimationPlayer.animation_finished signal
func on_animation_finished(anim_name):
    _current_state.on_animation_finished(anim_name)

# Call this to immediately change to another state.
# Also called whenever state finished with "finish" signal.
#
# transition_type can be one of the following:
# - push
# - pop
# - replace
func transition(transition_type: String, state_name: String = ""):
    _current_state.exit()

    match transition_type:
        "push":
            _states_stack.push_front(_states_map[state_name])
        "pop":
            _states_stack.pop_front()
        "replace":
            _states_stack[0] = _states_map[state_name]

    _current_state = _states_stack[0]
    emit_signal("state_changed", _current_state)

    if transition_type != "pop":
        _current_state.enter()
