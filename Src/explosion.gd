extends CPUParticles2D

const SPEED = -5

func _ready() -> void:
	emitting = true
	await finished
	queue_free()

func _physics_process(_delta: float) -> void:
	global_position.x += SPEED
