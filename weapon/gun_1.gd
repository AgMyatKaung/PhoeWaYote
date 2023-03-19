extends Node2D



@export var bullet_speed = 500
@export var fire_rate = 0.1
@export var can_fire = true
@export var bullet_scene = preload("res://weapon/bullet1.tscn")

func _ready():
	pass

func _process(delta):
	# Handle firing cooldown
	if not can_fire:
		fire_rate -= delta
		if fire_rate <= 0:
			can_fire = true
			fire_rate = 0.1

func fire_bullet():
	# Check if the weapon can fire
	if not can_fire:
		return

	# Spawn a new bullet instance
	var bullet = bullet_scene.instance()

	# Set the bullet's position and rotation
	bullet.global_position = global_position
	bullet.global_rotation = global_rotation

	# Add the bullet as a child of the current scene
	get_tree().current_scene.add_child(bullet)

	# Apply impulse to the bullet
	var velocity = Vector2(bullet_speed, 0).rotated(global_rotation)
	bullet.apply_impulse(Vector2.ZERO, velocity)

	# Disable firing until cooldown expires
	can_fire = false
	fire_rate = 0.1

