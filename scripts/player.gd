extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	mouse_follow()
	shoot()

func mouse_follow():
	var mouse_pos: Vector2 = get_global_mouse_position()
	look_at(mouse_pos)

func shoot():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var bullet = preload("res://scenes/bullet.tscn").instantiate()
		get_tree().current_scene.add_child(bullet)
		# infinite instantiation per frame, need to fix.
		
		
