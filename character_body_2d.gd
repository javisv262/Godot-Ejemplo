extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var triggered = false
@onready var _animatedSprite = $Animacion_esqueleto

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	if is_on_floor() and not triggered:
		_animatedSprite.play("Idle")
	if triggered == true:
		_animatedSprite.play("Shoot")


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if body.name == "Wanderer" :
		triggered = true


func _on_triger_esqueleto_body_exited(body: CharacterBody2D) -> void:
	if body.name == "Wanderer":
		triggered = false
	
