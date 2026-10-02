extends CharacterBody2D


const SPEED = 100.0
const SPRINT_SPEED= 150
const JUMP_VELOCITY = -350.0
const CLIMB_SPEED = -75
const VIDA_MAX = 100
var vida_actual = 100
const MANA_MAX = 100
var mana_actual = 100
const ESTAMINA_MAX = 100 
var ocupado = false
@onready var _animatedSprite = $Animacion_wanderer
@onready var animation_player = $AnimationPlayer
 
var was_on_floor := true;
var	landing := false;
func _ready() -> void:
	_animatedSprite.animation_finished.connect(_on_animation_finished)
func _physics_process(delta: float) -> void:
	#gestiono cuando el pj esta ocupado
	if ocupado:
		velocity = Vector2.ZERO
		move_and_slide()
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and not is_on_wall() and not landing:
		velocity.y = JUMP_VELOCITY
		_animatedSprite.play("jump")
		animation_player.play("jump")
	#Handle climb
	if Input.is_action_pressed("ui_accept") and is_on_wall():
		velocity.y = CLIMB_SPEED
		_animatedSprite.play("Escalar")
		animation_player.play("Escalar")
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
	move_and_slide()	
	#animaciones
	if not was_on_floor and is_on_floor():
		landing = true
		_animatedSprite.play("Landing")
		animation_player.play("Landing")
	elif not is_on_floor() and not landing :
		if _animatedSprite.animation != "jump":
			if _animatedSprite.animation != "Escalar":
				_animatedSprite.play("Fall")
				animation_player.play("Fall")
	elif is_on_floor() and not landing:
		if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
			if Input.is_action_pressed("Sprint"):
				_animatedSprite.play("Correr")
				animation_player.play("Correr")
			else:
				_animatedSprite.play("walk")
				animation_player.play("walk")
		else:
			_animatedSprite.play("Idle")
			animation_player.play("Idle")
	
	was_on_floor = is_on_floor()
#funcion para la muerte
func death() -> void:
	ocupado = true
	_animatedSprite.play("death")
	#falta añadir una pantalla de muerte
	await _animatedSprite.animation_finished
	get_tree().quit()
#funcion para gestionar los finales y transiciones de animaciones	
func _on_animation_finished() -> void:
	if _animatedSprite.animation == "Landing":
		landing = false
		
	#al terminar de saltar cae si no estas en el suelo
	elif _animatedSprite.animation == "jump":
		if not is_on_floor() and not is_on_wall():
			_animatedSprite.play("Fall")
			animation_player.play("Fall")
	
			
	
