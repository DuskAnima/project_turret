extends PathFollow2D

# Variables de control
var right_hand_active : bool = false # Notifica que la mano derecha tiene arma
var left_hand_active : bool = false # Notifica  que la mano izquierda tiene arma

# Escenas importadas
var gun : PackedScene = preload('res://scenes/gun.tscn') # Escena del arma

# Propiedades del player
var speed : int = 50 # Velocidad de movimiento
var right_hand_gun : Node2D # Variable que almacena el arma que tendrá el player en la derecha
var left_hand_gun : Node2D # Variable que almacena el aram que tendrá el player en la izquierda

func _ready():
	right_hand_gun = _add_gun_rigth() # Asignación de la primera arma

func _process(delta: float):
	_mouse_follow()
	_movement(delta)

func _input(_event: InputEvent):
	right_hand_gun.shoot()

# Función que define el movimiento
func _movement(delta):
	progress += speed * delta

# Función que determina la dirección del Player en base a la posición del mouse
func _mouse_follow():
	var mouse_pos: Vector2 = get_global_mouse_position()
	look_at(mouse_pos)

# Función para crear y manipular los nodos de armas en las manos del player
func _add_gun_rigth() -> Node2D: # Nodo Gun asignado a la mano derecha
	var right_gun_instance : Node2D = gun.instantiate()
	$RigthHand.add_child(right_gun_instance)
	right_hand_active = true
	right_gun_instance.owner = self
	return right_gun_instance
func _add_gun_left() -> Node2D: # Nodo Gun asignado a la mano izquierda
	var left_gun_instance = gun.instantiate()
	$LeftHand.add_child(left_gun_instance)
	left_hand_active = true
	left_gun_instance.owner = self
	return left_gun_instance
