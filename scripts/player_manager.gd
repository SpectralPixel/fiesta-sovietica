extends Node


signal new_player_added(player: PlayerData)

var player_count := 0
var players: Array


func _ready() -> void:
	Input.connect("joy_connection_changed", joy_connection_changed)


func joy_connection_changed(device: int, connected: bool):
	print("Connection of device %s: %s" % [device, connected])
	if connected:
		add_player(device)
	else:
		pass # remove_player(device)


func add_player(gamepad: int):
	# Don't force players into a linear order;
	# controllers would be rebound upon every disconnect (which would be janky af)
	var player_index = player_count
	player_count += 1
	
	var player = PlayerData.new(player_index, gamepad)
	# Don't instantiate player, that is done in the container object
	players.append(player)
	
	emit_signal("new_player_added", player)
