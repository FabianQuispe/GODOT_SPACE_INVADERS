extends CharacterBody2D

const SPEED = 200.0
var laser = preload("res://escenas/laser.tscn")

func _physics_process(delta):
	velocity.x = Input.get_axis("ui_left", "ui_right") * SPEED
	
	if Input.is_action_just_pressed("disparar") :
		var l = laser.instantiate()
		l.global_position = self.global_position
		l.position = position + Vector2(0, -40)
		get_parent().add_child(l)

	move_and_slide()
