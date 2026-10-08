extends "res://Magic_warrior_base.gd"
	
func death() -> void:
	ocupado = true
	
	_AnimationPlayer.play("Death")
func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.name == "Wanderer":
		death()


func _on_esfera_body_entered(body: Node2D) -> void:
	if body.name == "Wanderer":
		body.death()
