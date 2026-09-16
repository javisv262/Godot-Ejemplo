extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var _animatedSprite = $Animacion_esqueleto

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		velocity.x = move_toward(velocity.x, 0, SPEED)
	_animatedSprite.flip_h=true;
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
