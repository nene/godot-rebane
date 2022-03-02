extends State

func enter():
    owner.toggle_callout(true)
    owner.animationState.travel("callout")

func handle_input(event):
    if event is InteractEvent:
        var dialog = load("res://dialog/QuestionDialog.tscn").instance()
        InteractionState.show_dialog(dialog, {"hide_hotbar": true})
