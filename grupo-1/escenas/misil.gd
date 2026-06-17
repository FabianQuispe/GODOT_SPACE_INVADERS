extends Area2D

var speed = 200

func _process(delta):
	position.y += delta * speed
