extends Node

func _ready():
    GameEvents.connect("sound_play", self, "_play")

func _play(sound: String):
    var audio = get_node(sound) as AudioStreamPlayer
    audio.connect("finished", GameEvents, "emit_signal", ["sound_finished", sound], CONNECT_ONESHOT)
    audio.play()
