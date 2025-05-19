extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	bullet_orientation()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	pass

func _input(_event: InputEvent):
	pass
	# agregar funcionalidades especiales a futuro aquí

func bullet_orientation():
	var mouse_pos : Vector2 = get_global_mouse_position() # Captura la posición del mouse
	look_at(mouse_pos) # Orienta el objeto hacia la posición del mouse
	rotation_degrees += 90 # le suma 90° a la posicón en radiants para orientar el objeto hacia adelante

	# Quiero que la bala se mueva hacia el mouse
	# Necesito que detecte la posición y que luego se mueva en esa dirección
