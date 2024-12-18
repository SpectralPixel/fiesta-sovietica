extends CharacterBody2D


@onready var aim_circle: Sprite2D = $"Aim Circle"

@export var SPEED = 4000
@export var FRICTION = 500
@export var SLOWDOWN = 0.4
@export var DEADZONE = 0.07

var index: int
var gamepad: int
var direction: Vector2


func _process(_delta: float) -> void:
	var dir_x = Input.get_joy_axis(gamepad, JOY_AXIS_LEFT_X)
	var dir_y = Input.get_joy_axis(gamepad, JOY_AXIS_LEFT_Y)
	
	direction = Vector2(
		dir_x if abs(dir_x) > DEADZONE else 0.,
		dir_y if abs(dir_y) > DEADZONE else 0.,
	)
	
	if direction.length() > 1:
		direction = direction.normalized()


func _physics_process(delta: float) -> void:
	if direction.length():
		velocity = SPEED * delta * slowdown_factor() * direction
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		velocity.y = move_toward(velocity.y, 0, FRICTION * delta)
	move_and_slide()


## The slowdown factor is equal to one when looking in the same direction as you're walking
## After all, a person walking backwards will be slower than a person walking forwards.
## This factor exists for game design reasons, to prevent people from retreating and gunning backwards simultaneously.
func slowdown_factor() -> float:
	var dot = direction.dot(aim_circle.aim_dir)
	return (dot + 1) * (SLOWDOWN / 2) + (1 - SLOWDOWN)


func get_player_index() -> int:
	return index


func set_player_data(_index: int, _gamepad: int):
	self.index = _index
	self.gamepad = _gamepad
