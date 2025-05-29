extends Node2D

func _ready():
	pass # Replace with function body.

func _process(_delta: float):
	mouse_follow()
	#delete_bullets()

func _input(_event: InputEvent):
	shoot()
	
func mouse_follow():
	var mouse_pos: Vector2 = get_global_mouse_position()
	look_at(mouse_pos)

func shoot():
	if Input.is_action_just_pressed("shoot"):
		var gun_pos = $Marker2D.get_global_position() #Marcador de spawn de balas
		var bullet = preload("res://scenes/bullet.tscn").instantiate() #Instanciador de balas
		bullet.get_node("Area2D").add_to_group("player") # Agrega el Area2D al grupo "player"
		get_tree().root.get_node("Main/BulletHandler").add_child(bullet)
		bullet.global_position = gun_pos
		bullet.global_rotation_degrees = global_rotation_degrees + 90
		
		
func delete_bullets():
	var camera = get_tree().root.get_node("Main/Player/Camera2D")
	print(camera)
