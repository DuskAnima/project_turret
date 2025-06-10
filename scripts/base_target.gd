extends Node2D

var health : int = 100

func _ready() -> void:
	pass # Replace with function body.
	
func _process(_delta: float) -> void:
	$Health.text = str(health)


# Función que establece que si el area interactuada está en el grupo "player", queue_free()
func _on_area_2d_area_entered(area) -> void:
	var damage : int = area.get_parent().damage
	if area.is_in_group("player"):
		get_hit(damage)
		print("hit")
		if health == 0:
			queue_free() #deletes the enemy
			print("dead")
			
func get_hit(damage : int) -> void:
	health -= damage
	print(health)
	
# BUG A REPARAR: cuando le hago daño rapidamente, el daño no se aplica con consistencia.
