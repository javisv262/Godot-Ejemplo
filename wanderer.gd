extends CharacterBody2D


const SPEED = 100.0
const SPRINT_SPEED= 150
const JUMP_VELOCITY = -350.0
const CLIMB_SPEED = -75
@onready var _animatedSprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	#animacion idle
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and not is_on_wall():
		velocity.y = JUMP_VELOCITY
	#Handle climb
	if Input.is_action_pressed("ui_accept") and is_on_wall():
		velocity.y = CLIMB_SPEED
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		if Input.is_action_pressed("Sprint"):
			velocity.x = direction * SPRINT_SPEED
			if direction != 0:
				_animatedSprite.flip_h = direction < 0
		else:
			velocity.x = direction * SPEED
			if direction != 0:
				_animatedSprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	#animaciones
	if Input.is_action_pressed("ui_accept"):
		_animatedSprite.play("jump")
	elif Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left") and is_on_floor():
		if Input.is_action_pressed("Sprint"):
			_animatedSprite.play("Correr")
		else:
			_animatedSprite.play("walk")
	else:
		if is_on_floor():
			_animatedSprite.play("Idle")

	move_and_slide()
