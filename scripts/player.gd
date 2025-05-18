extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	mouse_follow()

func _input(_event: InputEvent):
	shoot()
	
func mouse_follow():
	var mouse_pos: Vector2 = get_global_mouse_position()
	look_at(mouse_pos)

func shoot():
	if Input.is_action_just_pressed("shoot"):
		var gun_pos = $Marker2D.get_global_position()
		var bullet = preload("res://scenes/bullet.tscn").instantiate()
		get_tree().current_scene.add_child(bullet)
		bullet.set_global_position(gun_pos)
		# infinite instantiation per frame, need to fix.
		
		
