extends Node
# warning-ignore-all:unused_signal

# -- (dialog: Control)
signal show_dialog(inventory)

# -- (dialog: Control)
signal show_inventory_dialog(inventory)

# -- (location: Global.Location)
signal change_location(location)

# -- (group: GameItemGroup)
signal change_holding_group(group)

# -- (group: GameItemGroup)
signal add_to_player_inventory(group)

signal allow_interact
signal forbid_interact

signal allow_combine
signal forbid_combine

# -- (game: MiniGame)
signal start_minigame(game)

# -- (sound: String)
signal sound_play(sound)
signal sound_finished(sound)
