extends Node

var alien = preload("res://escenas/alien.tscn")
var lista_aliens = []

func _ready():

	for j in range(4):

		lista_aliens.append([])

		for i in range(6):

			var grupoAlien = alien.instantiate()

			grupoAlien.position = Vector2(
				100 + i * 60,
				150 + j * 60
			)

			add_child(grupoAlien)

			lista_aliens[j].append(grupoAlien)


func _on_timer_descender_timeout():

	for fila in lista_aliens:
		for a in fila:

			if is_instance_valid(a):
				a.position.y += 40


func _on_timer_disparar_timeout():
	var lista_aliens_vivos = []
	for fila in lista_aliens:
		for a in fila:
			if is_instance_valid(a) and !a.is_queued_for_deletion():
				lista_aliens_vivos.append(a)
	
	if lista_aliens_vivos:
		var indice = int(floor(randf_range(0,len(lista_aliens_vivos)-1)))
		lista_aliens_vivos[indice].disparar()
	
