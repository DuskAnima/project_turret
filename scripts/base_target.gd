extends Node2D

func _ready() -> void:
	pass # Replace with function body.
	_enabler_box_area_setter()
func _process(_delta: float) -> void:
	pass

# Función que establece que si el area interactuada está en el grupo "player", queue_free()
func _on_area_2d_area_shape_entered(_area_rid: RID, area: Area2D, _area_shape_index: int, _local_shape_index: int) -> void:
	if area.is_in_group("player"):
		queue_free() #deletes the enemy

# Función que establece el area del Enabler2D. ### Solo funciona si es un cuadrado! probar en otras formas
func _enabler_box_area_setter():
	var collision_area = $Area2D/CollisionShape2D.shape.get_rect()
	var enabler_area = $VisibleOnScreenEnabler2D
	enabler_area.rect = collision_area
	#print(collision_area)
	#print(enabler_area.rect)
