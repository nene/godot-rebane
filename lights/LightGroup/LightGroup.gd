extends Node2D

func toggle(active: bool):
    for light in get_children():
        if light.has_method("toggle"):
            light.toggle(active)
        else:
            print("ERROR: All LightGroup children must have toggle() method.")
