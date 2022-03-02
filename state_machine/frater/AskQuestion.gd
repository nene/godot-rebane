extends State

func enter():
    owner.toggle_callout(true)
    owner.animationState.travel("callout")
