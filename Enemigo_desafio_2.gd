extends "res://FSpiritBase.gd"

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if  is_on_wall():
		_AnimationPlayer.play("TP")
func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.name == "Wanderer":
		body.death()
