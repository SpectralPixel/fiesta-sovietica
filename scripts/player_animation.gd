extends AnimatedSprite2D


var animation_state: String
var animation_direction: String
var is_flipped: bool


func _process(_delta: float) -> void:
	var direction = get_local_mouse_position()
	var velocity = get_parent().velocity
	player_animation(direction, velocity)


func player_animation(direction: Vector2, velocity: Vector2):
	if direction.y > abs(direction.x):
		animation_direction = "down"
	elif direction.y < -abs(direction.x):
		animation_direction = "up"
	elif abs(direction.x) > 0:
		animation_direction = "side"
		is_flipped = clamp(direction.x, -1, 0)
	
	if velocity:
		animation_state = "run"
	else:
		animation_state = "idle"
		
	
	flip_h = is_flipped
	play("%s_%s" % [animation_state, animation_direction])