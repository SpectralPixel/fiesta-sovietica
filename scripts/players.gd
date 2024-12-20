extends Node2D

func _ready() -> void:
	PlayerManager.connect("player_added", on_player_added)
	instantiate_queued_players()

# Instantiate players whose data has been generated before the scene was loaded
func instantiate_queued_players():
	for player in PlayerManager.players:
		player.instantiate($".")


func on_player_added(player: PlayerData):
	player.instantiate($".")
