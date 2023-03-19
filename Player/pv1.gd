extends CharacterBody2D

@export var speed = 100
@onready var _animation_player = $AnimationPlayer
@onready var player = $Player
@onready var gun1 = $gun1

var Bullet = preload("res://weapon/bullet1.tscn")
##################### Player Movement ########################################
func flip_sprite_horizontally():
	var scale = $Player.scale
	scale.x *= -1
	$Player.scale = scale
	# flip the gun sprite as well
	scale = self.gun1.scale
	scale.x *= -1
	self.gun1.scale = scale

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if input_direction != Vector2.ZERO:
		_animation_player.play("run")
		if input_direction.x < 0 and player.scale.x > 0:
			flip_sprite_horizontally()
		elif input_direction.x > 0 and player.scale.x < 0:
			flip_sprite_horizontally()
	else:
		_animation_player.play("idle")
	
	if Input.is_action_just_pressed("shoot"):
		fire()
	
	# fire
	

func _physics_process(delta):
	get_input()
	move_and_slide()
	
	#################### End player movement ################################

######################## Firing System ######################################

func fire():
#	var bullet = Bullet.instance()
#	bullet.position = gun1.global_position
#	bullet.velocity = Vector2(1, 0).rotated(gun1.global_rotation) * bullet.speed
#	get_parent().add_child(bullet)
	var bullet_instance = Bullet.instantiate()
	get_parent().add_child(bullet_instance)




