@tool class_name Weapon extends Resource

@export_category("Render Properties")
@export var tex: CompressedTexture2D = null
@export var tex_scale := 1.0
@export var tex_distance := 10.0

@export_category("Weapon Properties")
@export var melee := false
@export_range(0, 1, .05) var damage := .15
@export var fire_rate := 2.0 # fire rate per second
@export var semi_auto := false # click and hold to fire multiple times?
