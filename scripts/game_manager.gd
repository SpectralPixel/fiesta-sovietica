extends Node2D


@onready var player_parent = $"Players"


func _on_ready() -> void:
	PlayerManager.add_player(player_parent)
