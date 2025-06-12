extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation_degrees = -36

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	


func _on_area_2d_area_entered(_area: Area2D) -> void:
	rotation_degrees = 36
