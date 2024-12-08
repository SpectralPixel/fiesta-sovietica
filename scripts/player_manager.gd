extends Node


var player_count := 0
var players: Array


func add_player(parent: Node):
	# Don't force players into a linear order;
	# controllers would be rebound upon every disconnect (which would be janky af)
	var player_index = player_count
	player_count += 1
	
	var player = PlayerData.instantiate(parent, player_index)
	players.append(player)
