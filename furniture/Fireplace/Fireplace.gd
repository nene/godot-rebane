extends StaticBody2D

func _ready():
    $AnimatedSprite.play()
    $AnimationPlayer.play("light")
