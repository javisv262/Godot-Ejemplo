class_name Magic_warrior_base extends CharacterBody2D
var ocupado = false
@onready var _AnimationPlayer = $AnimationPlayer
func _physics_process(delta: float) -> void:
	super.set_physics_process(delta)
	if not ocupado:
		_AnimationPlayer.play("idle")
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

	move_and_slide()

	
