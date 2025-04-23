extends Area2D

const SPEED:int = 50

func _physics_process(_delta: float) -> void:
	global_position.x += SPEED

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("mine"):
		area.spawn_explosion()
		AudioManager.play_sound("Enemydeath",randf_range(0.6,0.8))
		area.queue_free()
		queue_free()
	elif area.is_in_group("enemy"):
		area.spawn_explosion()
		AudioManager.play_sound("Enemydeath",randf_range(0.9,1.1))
		ScoreManager.add_score(20)
		area.Pickup()
		area.queue_free()
		queue_free()
