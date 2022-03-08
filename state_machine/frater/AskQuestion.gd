extends State

var QuestionDialog = preload("res://dialog/QuestionDialog.tscn")
var TextDialog = preload("res://dialog/TextDialog.tscn")
var _owner: Frater

func _init(owner: Frater):
    _owner = owner

func enter():
    _owner.toggle_callout(true)
    _owner.animationState.travel("callout")

func is_interactable(group: GameItemGroup = null):
    return group == null

func handle_input(event):
    if event is InteractEvent:
        _ask_question()

func _ask_question():
    var dialog = QuestionDialog.instance()
    dialog.photo = _owner.photo
    var question = TerminologyQuestion.randomQuestion()
    dialog.question = question
    dialog.connect("answer_press", self, "_check_answer", [question["correct_answer"]], CONNECT_DEFERRED);
    GameEvents.emit_signal("show_dialog", dialog)

func _check_answer(answer: String, correct_answer: String):
    if answer == correct_answer:
        _reply("Õige vastus, oled hästi tudeerinud!")
    else:
        _reply("Vale puha!\nÕige vastus on: " + correct_answer + "\nToo endale shoppen vett.")

func _reply(text: String):
    var dialog = TextDialog.instance()
    dialog.photo = _owner.photo
    dialog.text = text
    dialog.connect("close", self, "_finish");
    GameEvents.emit_signal("show_dialog", dialog)

func _finish():
    _owner.toggle_callout(false)
    emit_signal("finished")
