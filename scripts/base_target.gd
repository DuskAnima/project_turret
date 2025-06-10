extends Node2D

var health : int = 100

func _ready() -> void:
	pass # Replace with function body.
	_enabler_box_area_setter()
	
func _process(_delta: float) -> void:
	pass

# Función que establece que si el area interactuada está en el grupo "player", queue_free()
func _on_area_2d_area_entered(area) -> void:
	var bullet = area.get_parent()
	if area.is_in_group("player"):
		bullet.on_hit.connect(get_hit)
		if health <= 0:
			queue_free() #deletes the enemy

# Función que establece el area del Enabler2D. ### Solo funciona si es un cuadrado! probar en otras formas
func _enabler_box_area_setter() -> void:
	var collision_area : Rect2 = $Area2D/CollisionShape2D.shape.get_rect()
	var enabler_area : VisibleOnScreenEnabler2D = $VisibleOnScreenEnabler2D
	enabler_area.rect = collision_area
	#print(collision_area)
	#print(enabler_area.rect)
	
func get_hit(damage : int) -> void:
	health -= damage
	print(health)
	
# BUG A REPARAR: cuando le hago daño rapidamente, el daño no se aplica con consistencia.
