class_name Player extends Area2D

signal dead
signal start
signal shoot

const JUMP_POWER = -25 # make sure this is negative
const SPEED_LIMIT = 30 # This is for falling

var vely:float = 0
var alive:bool = true
var started:bool = false
var canshoot:bool = true

@onready var sprite:Sprite2D = $Sprite2D
@onready var thruster:CPUParticles2D = $CPUParticles2D

var bullets:int = 5

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("jump") and alive:
		Jump()
		
		if !started:
			started = true
			start.emit()
	
	if Input.is_action_just_pressed("shoot") and alive and started and canshoot and bullets > 0:
		Shoot()
		bullets -= 1
		shoot.emit(bullets)
		
		if bullets == 0:
			$reload.start()

func _physics_process(_delta: float) -> void:
	if !alive or !started:
		return
	
	Gravity(2.6)
	
	global_position.y += vely

func Jump() -> void:
	AudioManager.play_sound("Jump",randf_range(0.8,1.1))
	vely = JUMP_POWER

func Gravity(force:float) -> void:
	vely += force
	
	if vely > SPEED_LIMIT:
		vely = SPEED_LIMIT

func Die() -> void:
	sprite.hide()
	thruster.hide()
	
	$Explosion.emitting = true
	$Explosion.explode()
	
	AudioManager.play_sound("Playerdeath",1)
	alive = false
	dead.emit()

func Shoot() -> void:
	AudioManager.play_sound("Shoot",randf_range(0.8,1.2))
	$ShootingComp.Shoot()
	canshoot = false
	$Cooldown.start()

func _on_cooldown_timeout() -> void:
	canshoot = true

func _on_reload_timeout() -> void:
	bullets += 1
	shoot.emit(bullets)

func ammo_grab(amt:int):
	bullets += amt
	shoot.emit(bullets)
