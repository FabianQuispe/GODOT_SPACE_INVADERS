extends CharacterBody2D

var misil = preload("res://escenas/misil.tscn")
@onready var timerMoviemientoAlien = $TimerMovimientoAlien
@onready var animationPlayer = $AnimationPlayer
@onready var spawn_point =$SpawnPoint  
var origen = 0
var rango = 100
var paso = 50
var direccion = 1

func _ready() -> void:
	timerMoviemientoAlien.start()
		
	origen = position.x + 100
	
func _on_timer_movimiento_alien_timeout() -> void:

	if position.x >= origen + rango:
		position.x = origen + rango
		direccion = -1

	elif position.x <= origen - rango:
		position.x = origen - rango
		direccion = 1
		
	position.x += paso * direccion
	
	
func explotar():
	animationPlayer.play("Destruido")
	
func eliminar():
	get_parent().remove_child(self)
	call_deferred("queue_free")
	
func disparar():
	var misilescena = misil.instantiate()
	misilescena.global_position = spawn_point.global_position
	get_tree().current_scene.add_child(misilescena)	
	print("para ver cambios de git")
	
