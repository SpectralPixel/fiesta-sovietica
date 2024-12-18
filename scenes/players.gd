extends Node2D

func _ready() -> void:
	PlayerManager.connect("new_player_added", on_new_player_added)
	for player in PlayerManager.players:
		player.instantiate($".")

func on_new_player_added(player: PlayerData):
	player.instantiate($".")
	print(player.gamepad)
