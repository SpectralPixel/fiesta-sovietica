extends Node


signal player_added(player: PlayerData)

var player_count := 0
var players: Array


func _ready() -> void:
	Input.connect("joy_connection_changed", joy_connection_changed)


func joy_connection_changed(device: int, connected: bool):
	print("Connection of device %s: %s" % [device, connected])
	if connected:
		add_player(device)
	else:
		remove_player(device)


func add_player(gamepad: int):
	# Don't force players into a linear order;
	# controllers would be rebound upon every disconnect (which would be janky af)
	var player_index = players.size()
	
	var player = PlayerData.new(player_index, gamepad)
	# Don't instantiate player, that is done in the container object
	players.append(player)
	
	emit_signal("player_added", player)


func remove_player(gamepad: int):
	var players_to_remove: Array = players.filter(func(player): return player.gamepad == gamepad)
	
	# When a player is removed, it must have been added first.
	# Additionally, there should only be one player being controlled by a single gamepad.
	assert(players_to_remove.size() == 1)
	
	var player_to_remove: PlayerData = players_to_remove.front()
	player_to_remove.destroy()
	
	# filter out player
	var length_before = players.size()
	players = players.filter(func(player: PlayerData): return player.gamepad != gamepad)
	assert(players.size() == length_before - 1)
