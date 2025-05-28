extends Node2D

@export var speed : int = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("bullets") # Grupo identificador de balas
	bullet_orientation()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	bullet_movement(delta)
func _input(_event: InputEvent):
	pass
	# agregar funcionalidades especiales a futuro aquí

func bullet_orientation():
	rotation_degrees += 180 # le suma 90° a la posicón en radiants para orientar el objeto hacia adelante

func bullet_movement(delta):
	var direction : Vector2 = Vector2.UP.rotated(rotation)
	# avanza hacia la izquierda (UP = Y) porque el objeto se instancia rotado a la izquierda.
	# Luego según se aplica esta dirección en función a la rotación que tiene el objeto tras ser instanciado
	position += direction * speed * delta # Finalmente se opera con la velocidad y delta time

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	



func _on_area_2d_area_entered(_area: Area2D) -> void:
	# Cabe la posibilidad de pasar a eliminar la bala con el propio cuerpo, ojo cuidao
	queue_free()
