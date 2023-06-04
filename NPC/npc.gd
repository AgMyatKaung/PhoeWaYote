extends Area2D

var dialogue = "Hello, welcome to the game!"

signal interact

func _input(event):
	if event.is_action_pressed("interact"):
		emit_signal("interact")

func show_dialogue(text):
	$TextEdit.text = text
	show()
