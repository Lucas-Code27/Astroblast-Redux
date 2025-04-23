extends Area2D

const SPEED:int = 5

func _physics_process(_delta: float) -> void:
	global_position.x -= SPEED

func _on_area_entered(area: Area2D) -> void: 
	if area.name == "Player":
		AudioManager.play_sound("Pickup",randf_range(0.7,1))
		area.ammo_grab(randi_range(2,4))
		queue_free()
