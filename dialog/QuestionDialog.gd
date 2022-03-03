extends "res://dialog/CharacterDialog.gd"

signal answer_press(text)

var AnswerButton = preload("res://dialog/AnswerButton.tscn")

var question = {
    "question": "",
    "answers": [],
}

func _ready():
    $Content/Question.text = question["question"]
    for answer in question["answers"]:
        $Content/Answers.add_child(_create_answer_button(answer))
    $AnimationPlayer.play("text")

func _create_answer_button(text):
    var btn = AnswerButton.instance()
    btn.text = text
    btn.connect("pressed", self, "_answer_press", [text])
    return btn

func _answer_press(answer: String):
    emit_signal("answer_press", answer)
    emit_signal("close")

# Don't close question dialog by outside click
func press_outside():
    pass
