extends CanvasLayer

var _minigame: MiniGame

func _ready():
    GameEvents.connect("start_minigame", self, "_start_minigame")

func _start_minigame(game: MiniGame):
    _minigame = game
    _minigame.connect("finished", self, "_end_minigame")
    add_child(_minigame)

func _end_minigame():
    _minigame.queue_free()
    _minigame = null
