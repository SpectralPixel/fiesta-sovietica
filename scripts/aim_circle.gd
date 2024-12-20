extends Sprite2D


@export var DISTANCE = 25.0
@export var DEADZONE = 0.15

## The direction that the player is aiming in with the right joystick; it is used for firing bullets and calculating the slowdown factor.
var aim_dir: Vector2

## The direction the player is looking in, usually set to the aim direction. If the right joystick is released, and the aim direction is consequently not set, this will be set to the movement direction.
var look_dir: Vector2


func _process(_delta: float) -> void:
	var dir = Vector2(
		Input.get_joy_axis(get_parent().gamepad, JOY_AXIS_RIGHT_X),
		Input.get_joy_axis(get_parent().gamepad, JOY_AXIS_RIGHT_Y),
	)
	dir = dir.normalized() if dir.length() > DEADZONE else Vector2.ZERO
	
	# Only set if non-zero
	if dir:
		aim_dir = dir
		look_dir = dir
		visible = true
	else:
		aim_dir = Vector2.ZERO
		look_dir = get_parent().direction
		visible = false
	
	position = aim_dir * DISTANCE
