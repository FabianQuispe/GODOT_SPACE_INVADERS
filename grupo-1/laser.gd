extends Area2D

var velocidad = 600
# Called when the node enters the scene tree for the first time.
func _process(delta: float) -> void:
	position.y -= velocidad * delta
	


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("explotar"):
		body.explotar()
	monitoring = false
	call_deferred("queue_free")
