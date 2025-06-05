extends PathFollow2D

# Variables de control
var right_hand_active : bool = false # Notifica que la mano derecha tiene arma
var left_hand_active : bool = false # Notifica  que la mano izquierda tiene arma

# Escenas importadas
var gun : PackedScene = preload('res://scenes/gun.tscn') # Escena del arma

# Propiedades del player
var speed : int = 50 # Velocidad de movimiento
var right_hand_gun : Node2D # Variable que almacena instancia del arma que tendrá el player en la derecha
var left_hand_gun : Node2D # Variable que almacena instancia del aram que tendrá el player en la izquierda



func _ready():
	right_hand_gun = _add_gun_rigth() # Asignación de la primera arma

func _process(delta: float):
	_mouse_follow()
	_movement(delta)

func _input(_event: InputEvent):
	right_hand_gun.shoot() # Llama al nodo de la mano izquierda con su función "disparar"

# Función privada que define la velocidad del movimiento
func _movement(delta):
	progress += speed * delta # Determina la velocidad en base al nodo principal PathFollow2D

# Función privada que determina la dirección del Player en base a la posición del mouse
func _mouse_follow():
	var mouse_pos: Vector2 = get_global_mouse_position() # Obtiene las coordenadas del mouse
	look_at(mouse_pos) # Función in-built que orienta al nodo a mirar a la dirección dada

# Funciones privadas para crear y manipular los nodos de armas en las manos del player
func _add_gun_rigth() -> Node2D: # Nodo Gun asignado a la mano derecha
	var right_gun_instance : Node2D = gun.instantiate() # Instanciador del arma
	$RigthHand.add_child(right_gun_instance) # Agrega el nodo del arma a la mano derecha
	right_hand_active = true # Habilita el uso de inputs de la mano
	right_gun_instance.owner = self # Asigna a self la propiedad del arma (para poder asignar las balas el grupo)
	return right_gun_instance # Retorna la instancia del arma derecha para manipularla
func _add_gun_left() -> Node2D: # Nodo Gun asignado a la mano izquierda
	var left_gun_instance = gun.instantiate() # Instanciador del arma
	$LeftHand.add_child(left_gun_instance) # Agrega el nodo del arma a la mano izquierda
	left_hand_active = true # Habilita el uso de inputs de la mano
	left_gun_instance.owner = self # Asigna a self la propiedad del arma (para poder asignar las balas el grupo)
	return left_gun_instance # Retorna la instancia del arma izquierda para manipularla


func _on_shoot_cooldown_timeout() -> void:
	pass # Replace with function body.
