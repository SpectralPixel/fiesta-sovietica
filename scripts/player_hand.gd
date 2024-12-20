extends Sprite2D


enum SelectedItem { MELEE = 0, RANGED = 1, }

var selected_item := SelectedItem.MELEE
var melee_weapon: Resource = preload("res://assets/weapons/knife.tres")
var ranged_weapon: Resource = preload("res://assets/weapons/handgun.tres")

# Uninitialized weapon data
var distance = null
var melee = null
var damage = null
var fire_rate = null
var semi_auto = null

func _ready() -> void:
	select_item(SelectedItem.RANGED)


func select_item(item: SelectedItem) -> void:
	if item == 0 and melee_weapon: set_weapon_values(melee_weapon);
	elif item == 1 and ranged_weapon: set_weapon_values(ranged_weapon);
	else:
		push_error("Weapon in slot %s not loaded at time of selection!" % item)


func set_weapon_values(weapon: Resource) -> void:
	texture = weapon.tex
	scale = Vector2(weapon.tex_scale, weapon.tex_scale)
	distance = weapon.tex_distance
	melee = weapon.melee
	damage = weapon.damage
	fire_rate = weapon.fire_rate
	semi_auto = weapon.semi_auto


func _process(_delta: float) -> void:
	position = get_parent().aim_circle.aim_dir * distance
