extends "res://EntityBase/EntityBase.gd"

@export var bullet: PackedScene = preload("res://weapon/bullet.tscn")

func flip_sprite_horizontally():
	var scale = $Sprite2D.scale
	scale.x *= -1
	$Sprite2D.scale = scale


func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if input_direction != Vector2.ZERO:
		animPlayer.play("run")
		if input_direction.x < 0 and sprite.scale.x > 0:
			flip_sprite_horizontally()
		elif input_direction.x > 0 and sprite.scale.x < 0:
			flip_sprite_horizontally()
	else:
		velocity = Vector2.ZERO
		animPlayer.play("idel")
		
	if Input.is_action_just_pressed("shoot"):
		print("shoot")

func shoot():
	# instantiate bullet scene
	var bullet_instance = bullet
	
	# set bullet position and rotation to match player
	bullet_instance.transform.origin = global_position
	bullet_instance.transform.rotation = global_transform.get_rotation()
	
	# add bullet to scene
	get_parent().add_child(bullet_instance)

	
func _physics_process(delta):
	get_input()
	move_and_slide()
	# check animate 
	if velocity == Vector2.ZERO:
		animPlayer.play("idel")





