extends State

var _owner: Frater

func _init(owner: Frater):
    _owner = owner

func handle_input(event):
    if event is InputEvent && event.is_action_pressed("ui_greet"):
        var AskQuestion = load("res://state_machine/frater/AskQuestion.gd")
        emit_signal("finished", AskQuestion.new(_owner))
