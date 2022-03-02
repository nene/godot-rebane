extends Control

# Triggered when dialog is closed
signal close
signal answer_press(text)

var AnswerButton = preload("res://dialog/AnswerButton.tscn")

var character_name = ""
var question = {
    "text": "",
    "options": [],
}

# dependency injection
var mouse_cursor: MouseCursor

func _ready():
    $CharacterName.text = character_name
    $Question.text = question["text"]
    for op in question["options"]:
        $Answers.add_child(_create_answer_button(op))

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
