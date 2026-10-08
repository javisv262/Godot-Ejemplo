extends Area2D

@export var objetivo : Node2D 
@export var velocidad: float = 2.0
@export var distancia: float = 50.0
var angulo: float = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if objetivo:
		angulo += velocidad * delta
		# Calcular nueva posición usando seno y coseno
		global_position = objetivo.global_position + Vector2(cos(angulo), sin(angulo)) * distancia
