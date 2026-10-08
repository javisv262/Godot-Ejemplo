extends Area2D
const VELOCIDAD = 200

func _physics_process(delta):
	position.x -= VELOCIDAD * delta


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Wanderer":
		body.death()


func _on_timer_timeout() -> void:
	queue_free()
