class_name PlayerData extends Node


const scene = preload("res://scenes/player.tscn")

var instance: Node
var index: int
var skin_id: int
var is_gamepad: bool


func _init(_index: int, _skin_id: int = 0):
	index = _index
	skin_id = _skin_id


static func instantiate(parent: Node, _index: int, _skin_id: int = 0) -> PlayerData:
	var player_data = PlayerData.new(_index, _skin_id)
	player_data.instance = scene.instantiate()
	player_data.instance.name = "Player_%s" % _index
	player_data.instance.set_player_index(_index)
	parent.add_child(player_data.instance)
	return player_data
