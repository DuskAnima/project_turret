extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	mouse_follow()

func mouse_follow():
	var mouse_pos: Vector2 = get_global_mouse_position()
	look_at(mouse_pos)
	print(mouse_pos)
