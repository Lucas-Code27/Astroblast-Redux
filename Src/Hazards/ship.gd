extends Area2D

@export var pickup:PackedScene
@export var explosion:PackedScene

const SPEED = 5

func _physics_process(_delta: float) -> void:
	global_position.x -= SPEED

func _on_area_entered(area: Area2D) -> void:
	if area.has_method("Die"):
		area.Die()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func shoot() -> void:
	AudioManager.play_sound("Shoot",randf_range(0.8,1.2))
	$ShootingComp.Shoot()

func _on_timer_timeout() -> void:
	shoot()
	$Timer.start(randf_range(1.2,1.6))

func Pickup() -> void:
	var pickinst:Area2D = pickup.instantiate()
	pickinst.global_position = global_position
	pickinst.process_mode = Node.PROCESS_MODE_PAUSABLE
	get_parent().call_deferred("add_child",pickinst)

func spawn_explosion() -> void:
	var explosioninst:CPUParticles2D = explosion.instantiate()
	explosioninst.global_position = global_position
	get_parent().add_child(explosioninst)
