extends Node2D

# Varaibles de control
var can_shoot : bool = true # Determina si una pistola se puede disparar

func _ready() -> void:
	pass # Replace with function body.

# Función de Input que detona un disparo con un click
func shoot() -> void:
	if Input.is_action_just_pressed("shoot") and can_shoot == true: # Si input + arma habilitada
		_create_bullet() # Crear bala

# Función que instancia una bala en una posición dada
func _create_bullet() -> void:
	var shooter_owner : String = owner.get_groups()[0] # Accede al array de grupos y accede al string del primer grupo
	var bullet : Node2D = Bullet.BULLET_SCENE.instantiate() #Instanciador de balas
	bullet.add_to_group(shooter_owner) # Agrega el Area2D al grupo "player"
	get_tree().root.get_node("Main/BulletHandler").add_child(bullet) # Agrega la bala a un nodo independiente en la escena
	bullet.global_position = $Marker2D.global_position # Posiciona la bala en función al nodo Marker2D
	bullet.global_rotation_degrees = global_rotation_degrees + 90 # Rota la bala el función a la rotación del arma/personaje
