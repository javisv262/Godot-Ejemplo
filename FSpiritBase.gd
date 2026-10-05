class_name FSpiritBase extends CharacterBody2D
const SPEED = -100
@onready var _animatedSprite = $FSpirit_animations
@onready var _AnimationPlayer =$AnimationPlayer
func _physics_process(delta: float) -> void:
	super.set_physics_process(delta)
	if not is_on_wall():
		velocity.x = SPEED
		_AnimationPlayer.play("run")
	move_and_slide()
