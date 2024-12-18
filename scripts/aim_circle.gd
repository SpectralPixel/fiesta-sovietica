extends Sprite2D


@export var DISTANCE = 25.0
@export var DEADZONE = 0.15

var aim_dir: Vector2
var look_dir: Vector2


func _process(delta: float) -> void:
	var dir_x = Input.get_joy_axis(get_parent().gamepad, JOY_AXIS_RIGHT_X)
	var dir_y = Input.get_joy_axis(get_parent().gamepad, JOY_AXIS_RIGHT_Y)
	
	var dir = Vector2(
		dir_x if abs(dir_x) > DEADZONE else 0,
		dir_y if abs(dir_y) > DEADZONE else 0,
	).normalized()
	
	# Only set if non-zero
	if dir:
		aim_dir = dir
		look_dir = dir
		visible = true
	else:
		aim_dir = Vector2.ZERO
		look_dir = get_parent().direction
		visible = false
	
	position = aim_dir * 25
