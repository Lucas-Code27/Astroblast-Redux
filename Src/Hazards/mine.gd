extends Area2D

const SPEED = 5

@export var explosion:PackedScene

func _physics_process(_delta: float) -> void:
	global_position.x -= SPEED

func _on_area_entered(area: Area2D) -> void:
	if area.has_method("Die"):
		area.Die()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	AudioManager.play_sound("Dodged",randf_range(0.7,1))
	ScoreManager.add_score(10)
	queue_free()

func spawn_explosion() -> void:
	var explosioninst:CPUParticles2D = explosion.instantiate()
	explosioninst.global_position = global_position
	get_parent().add_child(explosioninst)
