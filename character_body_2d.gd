extends CharacterBody2D
var flecha = preload("res://flecha.tscn")
var triggered = false
@onready var _AnimationPlayer = $AnimationPlayer
@onready var _origen_flecha = $"origen flecha"
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()
	if is_on_floor() and triggered == true:
		_AnimationPlayer.play("Shoot")
	else:
		_AnimationPlayer.play("idle")
func disparar():
	var nueva_flecha = flecha.instantiate()
	add_child(nueva_flecha)
	nueva_flecha.global_position = _origen_flecha.global_position

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Wanderer" :
		triggered = true


func _on_triger_esqueleto_body_exited(body: Node2D) -> void:
	if body.name == "Wanderer":
		triggered = false
	
