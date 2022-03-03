extends State

var QuestionDialog = preload("res://dialog/QuestionDialog.tscn")
var TextDialog = preload("res://dialog/TextDialog.tscn")

func enter():
    owner.toggle_callout(true)
    owner.animationState.travel("callout")

func handle_input(event):
    if event is InteractEvent:
        _ask_question()

func _ask_question():
    var dialog = QuestionDialog.instance()
    dialog.character_name = owner.character_name
    dialog.question = {
        "text": "Mis on Ugala värvid?",
        "options": ["sini-must-valge", "must-sini-valge", "puna-rohe-must", "valge-must-sinine"]
    }
    dialog.connect("answer_press", self, "_check_answer", [], CONNECT_DEFERRED);
    InteractionState.show_dialog(dialog, {"hide_hotbar": true})

func _check_answer(answer: String):
    if answer == "must-sini-valge":
        _reply("Õige vastus, oled hästi tudeerinud!")
    else:
        _reply("Vale puha!\nSinusugused rebasenärud tuleks panna konvendi põrandat küürima!")

func _reply(text: String):
    var dialog = TextDialog.instance()
    dialog.character_name = owner.character_name
    dialog.text = text
    dialog.connect("close", self, "_finish");
    InteractionState.show_dialog(dialog, {"hide_hotbar": true})

func _finish():
    owner.toggle_callout(false)
    emit_signal("finished", "pop")
