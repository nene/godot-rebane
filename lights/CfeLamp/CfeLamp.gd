extends Sprite

func _ready():
    toggle(false)

func toggle(active: bool):
    if active:
        self.frame = 1
        $Light2D.show()
    else:
        self.frame = 0
        $Light2D.hide()
