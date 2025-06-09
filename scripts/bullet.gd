extends Node2D

@export var speed : int = 1300 # Velocidad de la bala

func _ready() -> void:
	_bullet_orientation()

func _process(delta: float) -> void:
	_bullet_movement(delta)

# Señal de Area2D que maneja comportamiento de balas al tocar en areas
func _on_area_2d_area_shape_entered(_area_rid: RID, area: Area2D, _area_shape_index: int, _local_shape_index: int) -> void:
	_kill_or_spare(area) # Recibe el area con la que interactua la bala

# Señal de ScreenNotifier que elimina balas al salir del nivel 
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

# Función privada que determina la orientación correcta del sprite/colisión de la bala
func _bullet_orientation() -> void:
	rotation_degrees += 180 # le suma 90° a la posicón en radiants para orientar el objeto hacia adelante

# Función privada que determina el movimiento normal de la bala
func _bullet_movement(delta: float) -> void:
	var direction : Vector2 = Vector2.UP.rotated(rotation)
	# avanza hacia la izquierda (UP = Y) porque el objeto se instancia rotado a la izquierda.
	# Luego según se aplica esta dirección en función a la rotación que tiene el objeto tras ser instanciado
	position += direction * speed * delta # Finalmente se opera con la velocidad y delta time

# Función privada que determina si una bala mata o no mata a un enemigo
func _kill_or_spare(area: Area2D) -> void:
	var bullet_group : Array = $Area2D.get_groups() # Grupo de la bala
	var target_group : Array =  area.get_groups() # Grupo del objetivo
	if bullet_group != target_group: 
		queue_free()
		print("muere ctm")
	else:
		print("te salvaste machucao")
