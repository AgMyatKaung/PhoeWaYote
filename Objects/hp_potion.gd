extends Area2D

@export var hpPlus = 20

var hpPotion_red = preload("res://Objects/hp_potion.tscn")

var target = null
var speed = -60.0

@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D
@onready var sound = $hpPotion

func _ready():
	if hpPlus < 20:
		return
#	elif hpPlus < 25:
#		sprite.texture = sprite_blue
#	else:
#		sprite.texture = sprite_red

func _physics_process(delta):
	if target != null:
		global_position = global_position.move_toward(target.global_position, delta*speed)
		speed += 2

func grab():
	sound.play()
	collision.call_deferred("set","disabled", true)
	sprite.visible = false
	return hpPlus

func _on_hpPoion_finished():
	queue_free()
	


