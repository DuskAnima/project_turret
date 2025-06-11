extends Node2D

var health : int = 100

func _ready() -> void:
	pass # Replace with function body.
	
func _process(_delta: float) -> void:
	$Health.text = str(health) # Objeto de debug que muestra cuanta vida tiene el enemigo en pantalla

# Función que establece las interacciones cuando algo entra en el area de la entidad.
func _on_area_2d_area_entered(area : Area2D) -> void:
	var damage : int = area.get_parent().damage # Variable que contiene del daño de la bala
	if area.is_in_group("player"): # Si el objeto con el que se interactua está en el grupo player
		on_hit_event(damage) # Pasa el daño de la bala 

# Función que maneja la situación de recibir daño
func on_hit_event(damage : int) -> void:
	health -= damage # Vida todal menos daño de la bala
	if health <= 0: # Si la vida es igual o menor a 0
		queue_free() # Elmina al enemigo



	
	
