class_name WarriorBase extends CharacterBody2D
const SPEED = 75.0
#var vida =50
var direction = 1
@onready var _ray_cast_2d:RayCast2D = $RayCast2D
@onready var _animatedSprite = $Warrior_animations
func _physics_process(delta: float) -> void:
	super.set_physics_process(delta)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if not _ray_cast_2d.is_colliding() or is_on_wall():
		girar()

	velocity.x = direction * SPEED
	if velocity.x != 0:
		_animatedSprite.play("walk")
	move_and_slide()
func girar() -> void:
	direction *= -1
	_animatedSprite.flip_h = (direction == -1)
	_ray_cast_2d.position.x *= -1
	if _ray_cast_2d.position.x >0:
		_ray_cast_2d.position.x = 8
	elif _ray_cast_2d.position.x <0:
		_ray_cast_2d.position.x = -24
	
