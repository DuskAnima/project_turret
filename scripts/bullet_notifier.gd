extends VisibleOnScreenNotifier2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	on_bullet_added()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func on_bullet_added():
	var rect = $".".rect
	var camera = get_tree().root.get_node("Main/Player/Camera2D").get_viewport().get_visible_rect()
	print(rect)
	print(camera)
	pass
