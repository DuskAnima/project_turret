extends PathFollow2D

# Variables
@export var speed : int = 50
var gun : PackedScene = preload('res://scenes/gun.tscn')
var right_hand_active : bool = false
var left_hand_active : bool = false

# Hands Stuff

func _ready():
	_add_gun_rigth()
	pass # Replace with function body.

func _process(delta: float):
	mouse_follow()
	movement(delta)

func _input(_event: InputEvent):
	shoot()

# Función que define el movimiento
func movement(delta):
	progress += speed * delta

# Función que determina la dirección del Player en base a la posición del mouse
func mouse_follow():
	var mouse_pos: Vector2 = get_global_mouse_position()
	look_at(mouse_pos)

# Función de Input que detona un disparo con un click
func shoot():
	if Input.is_action_just_pressed("shoot"):
		if right_hand_active == true:
			var gun_pos = $RigthHand.get_node("Gun/Marker2D").get_global_position() #Marcador de spawn de balas
			var bullet = preload("res://scenes/bullet.tscn").instantiate() #Instanciador de balas
			bullet.get_node("Area2D").add_to_group("player") # Agrega el Area2D al grupo "player"
			get_tree().root.get_node("Main/BulletHandler").add_child(bullet)
			bullet.global_position = gun_pos
			bullet.global_rotation_degrees = global_rotation_degrees + 90

# Función creada para agregar armas a las respectivas manos
func _add_gun_rigth():
	var gun_instance = gun.instantiate()
	if true:
		$RigthHand.add_child(gun_instance)
		right_hand_active = true
func _add_gun_left():
	var gun_instance = gun.instantiate()
	if true:
		$LeftHand.add_child(gun_instance)
