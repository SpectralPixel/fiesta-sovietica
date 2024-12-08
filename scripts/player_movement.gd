extends CharacterBody2D


@export var SPEED = 4000
@export var FRICTION = 500
@export var SLOWDOWN = 0.4

var index: int
var move_binds: Dictionary
var direction: Vector2


func _ready() -> void:
	move_binds = {
		"left":  "move_left_p%s"  % index,
		"right": "move_right_p%s" % index,
		"up":    "move_up_p%s"    % index,
		"down":  "move_down_p%s"  % index,
	}


func _process(_delta: float) -> void:
	direction = Input.get_vector(
		move_binds["left"],
		move_binds["right"],
		move_binds["up"],
		move_binds["down"],
	).normalized()


func _physics_process(delta: float) -> void:
	if direction:
		velocity = SPEED * delta * slowdown_factor() * direction
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		velocity.y = move_toward(velocity.y, 0, FRICTION * delta)
	move_and_slide()


## The slowdown factor is equal to one when looking in the same direction as you're walking
## After all, a person walking backwards will be slower than a person walking forwards.
## This factor exists for game design reasons, to prevent people from retreating and gunning backwards simultaneously.
func slowdown_factor() -> float:
	var mouse_pos = get_local_mouse_position().normalized()
	var dot = direction.dot(mouse_pos)
	var slowdown_factor = (dot + 1) * (SLOWDOWN / 2) + (1 - SLOWDOWN)
	return slowdown_factor


func get_player_index() -> int:
	return index


func set_player_index(_index: int):
	self.index = _index
