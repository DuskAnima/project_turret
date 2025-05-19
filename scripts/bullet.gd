extends Node2D

@export var speed : int = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	bullet_orientation()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	bullet_movement(delta)

func _input(_event: InputEvent):
	pass
	# agregar funcionalidades especiales a futuro aquí

func bullet_orientation():
	var mouse_pos : Vector2 = get_global_mouse_position() # Captura la posición del mouse
	look_at(mouse_pos) # Orienta el objeto hacia la posición del mouse
	rotation_degrees += 90 # le suma 90° a la posicón en radiants para orientar el objeto hacia adelante

func bullet_movement(delta):
	var direction : Vector2 = Vector2.UP.rotated(rotation)
	# avanza hacia la izquierda (UP = Y) porque el objeto se instancia rotado a la izquierda.
	# Luego según se aplica esta dirección en función a la rotación que tiene el objeto tras ser instanciado
	position += direction * speed * delta # Finalmente se opera con la velocidad y delta time
