extends CPUParticles2D


func explode() -> void:
	await get_tree().create_timer(0.2).timeout
	process_mode = Node.PROCESS_MODE_PAUSABLE
