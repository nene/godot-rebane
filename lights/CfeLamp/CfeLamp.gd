extends Sprite

func toggle(active: bool):
    if active:
        self.frame = 1
    else:
        self.frame = 0
