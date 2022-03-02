extends State

func enter():
    owner.toggle_callout(true)
    owner.animationState.travel("callout")

func handle_input(event):
    if event is InteractEvent:
        var dialog = load("res://dialog/QuestionDialog.tscn").instance()
        dialog.character_name = owner.character_name
        dialog.question = {
            "text": "Mis on Ugala värvid?",
            "options": ["sini-must-valge", "must-sini-valge", "puna-rohe-must", "valge-must-sinine"]
        }
        dialog.connect("close", self, "_finish");
        InteractionState.show_dialog(dialog, {"hide_hotbar": true})

func _finish():
    owner.toggle_callout(false)
    emit_signal("finished", "pop")
