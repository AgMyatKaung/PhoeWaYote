extends CharacterBody2D

@export var speed = 500
@export var lifetime = 2.0

@onready var _velocity = Vector2.ZERO
#@onready var _spawn_time = OS.get_ticks_msec() / 1000.0

func _ready():
	_velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	var motion = _velocity * delta
	var collision = move_and_collide(motion)
	
	if collision:
		queue_free()
	
func _process(delta):
	look_at(get_global_mouse_position())
