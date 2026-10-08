extends SpearmanBase

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.name == "Wanderer":
		body.death()
