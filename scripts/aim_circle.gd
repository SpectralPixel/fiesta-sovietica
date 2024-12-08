extends Sprite2D

@export var DISTANCE = 25.0

func _process(delta: float) -> void:
	var pos = get_parent().get_local_mouse_position()
	position = pos.normalized() * DISTANCE
