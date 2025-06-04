extends Node2D

# Varaibles de control
var gun_enabler : bool = true # Determina si una pistola se puede disparar

func _ready() -> void:
	pass # Replace with function body.

# Función de Input que detona un disparo con un click
func shoot():
	if Input.is_action_just_pressed("shoot"):
		_create_bullet()

# Función que instancia una bala en una posición dada
func _create_bullet():
	var shooter_owner = owner.get_groups()[0]
	var bullet = preload("res://scenes/bullet.tscn").instantiate() #Instanciador de balas
	bullet.get_node("Area2D").add_to_group(shooter_owner) # Agrega el Area2D al grupo "player"
	get_tree().root.get_node("Main/BulletHandler").add_child(bullet)
	bullet.global_position = global_position
	bullet.global_rotation_degrees = global_rotation_degrees + 90
