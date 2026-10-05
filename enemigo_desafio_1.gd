extends WarriorBase
#por si hace falta a futuro
func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Wanderer":
		body.death()
