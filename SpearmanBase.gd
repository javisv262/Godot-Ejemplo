class_name SpearmanBase extends CharacterBody2D
@onready var _ray_castIzq:RayCast2D = $RayCast2D
@onready var _ray_castDer:RayCast2D = $RayCast2D2
@onready var _AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	super.set_physics_process(delta)
	if not is_on_floor():
		velocity += get_gravity() * delta

	if _ray_castIzq.is_colliding():
		scale.x = 0.5
		_AnimationPlayer.play("atacar")
	elif _ray_castDer.is_colliding():
		scale.x = -0.5
		_AnimationPlayer.play("atacar")
	else :
		_AnimationPlayer.play("idle")
	# Add the gravity.

	move_and_slide()
