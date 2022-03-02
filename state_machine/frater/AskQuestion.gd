extends State

func enter():
    owner.toggle_callout(true)
    owner.animationState.travel("callout")

func handle_input(event):
    if event is InteractEvent:
        var dialog = load("res://dialog/QuestionDialog.tscn").instance()
        dialog.connect("close", self, "_finish");
        InteractionState.show_dialog(dialog, {"hide_hotbar": true})

func _finish():
    owner.toggle_callout(false)
    emit_signal("finished", "pop")
