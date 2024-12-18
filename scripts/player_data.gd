class_name PlayerData extends Node


const scene = preload("res://scenes/player.tscn")

var instance: Node
var index: int
var gamepad: int
var skin_id: int


func _init(_index: int, _gamepad: int, _skin_id: int = 0):
	index = _index
	gamepad = _gamepad
	skin_id = _skin_id


func instantiate(parent: Node):
	instance = scene.instantiate()
	instance.name = "Player %s" % index
	instance.set_player_data(index, gamepad)
	instance.translate(Vector2(randf_range(-50, 50), randf_range(-50, 50)))
	parent.add_child(instance)


func destroy():
	instance.queue_free()
