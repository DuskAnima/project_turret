extends Node2D
class_name  Bullet

const BULLET_SCENE : PackedScene = preload("uid://deyjfwsu286uu")

var speed : int = 1300 # Velocidad de la bala
var damage : int = 10 # Daño de la bala
@export var sprite : Sprite2D
@export var collision: Area2D

func _ready() -> void:
	_bullet_orientation() # La bala mira en la dirección en la que es disparada
	_group_assignment() # Se le asigna el grupo de la entidad que lo dispara

func _process(delta: float) -> void:
	_bullet_movement(delta) # La bala es disparada en la dirección correspondiente

####### SEÑALES #######

# Señal que maneja comportamiento de balas al tocar en areas
func _on_area_2d_area_entered(area: Area2D) -> void:
	_hit_or_miss(area) # Basado en el grupo asignado, la bala decide si debe matar o no

# Señal que detecta TileMapLayer con Physics Layer para eliminar la bala al chocar con paredes
func _on_area_2d_body_entered(_body: Node2D) -> void:
	queue_free()

# Señal que elimina balas al salir del nivel 
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

####### Funcionamiento Interno #######

# Determina la orientación correcta del sprite/colisión de la bala
func _bullet_orientation() -> void:
	rotation_degrees += 180 # le suma 90° a la posicón en radiants para orientar el objeto hacia adelante

# Determina el movimiento normal de la bala
func _bullet_movement(delta: float) -> void:
	var direction : Vector2 = Vector2.UP.rotated(rotation)
	# avanza hacia la izquierda (UP = Y) porque el objeto se instancia rotado a la izquierda.
	# Luego según se aplica esta dirección en función a la rotación que tiene el objeto tras ser instanciado
	position += direction * speed * delta # Finalmente se opera con la velocidad y delta time

# Determina si una bala mata o no mata a un enemigo
func _hit_or_miss(area: Area2D) -> void:
	var shooter_group : String = collision.get_groups()[0] # Grupo de la bala
	if !area.is_in_group(shooter_group): 
		queue_free()

# Asigna a la bala el mismo grupo que el ente que lo dispara
func _group_assignment() -> void:
	var shooter_group : String = get_groups()[0] # Obtiene el grupo de la bala
	collision.add_to_group(shooter_group) # Asigna el grupo de la bala a la colisión.
