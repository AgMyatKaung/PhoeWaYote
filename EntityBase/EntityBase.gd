extends CharacterBody2D

signal hp_max_updated(new_hp_max)
signal hp_updated(new_hp)
signal died

@export var hp_max: int = 100 :
	set(set_new_hp_max):
		if hp_max != hp_max:
			hp_max = max(0,hp_max)
			emit_signal("hp_max_updated", hp_max)
			self.hp = hp

@export var hp: int = hp_max :
	set(new_hp):
		hp = clamp(new_hp,0,hp_max)
		emit_signal('hp_updated',hp)
		if hp == 0:
			emit_signal("died")

@export var defense: int = 0 

@export var speed: int = 75

@onready var sprite = $Sprite2D
@onready var collshpae = $CollisionShape2D
@onready var animPlayer = $AnimationPlayer
@onready var hurtbox = $Hurtbox
func _physics_process(delta):
	move_and_slide()



func die():
	queue_free()

func receive_damage(base_damage: int):
	var actual_damage = base_damage
	actual_damage -= defense
	
	self.hp -= actual_damage
	print(name + " received " + str(actual_damage) + " damage")

func _on_hurtbox_area_entered(hitbox):
#	var base_damage = hitbox.damage
#	self.hp -= base_damage
#	print(hitbox.get_parent().name + "'s hitbox touched" + name + "'s hurtbox and dealt " + str(base_damage))
	receive_damage(hitbox.damage)


	

# player dead
func _on_died():
	die()
	print("player dead")
