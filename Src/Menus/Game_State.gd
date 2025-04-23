extends Node2D

@export var player:Player
@export var deathscreen:Control
@export var hud:Control
@export var starttext:CanvasLayer

@onready var spawncool:Timer = Timer.new()

var newhigh:bool = false

var floor_level:int

func _ready() -> void:
	AudioManager.stop_music()
	add_child(spawncool)
	$Background/BackgroundColor.material.set("shader_parameter/speed",0.1)
	get_tree().paused = false
	spawncool.timeout.connect(_on_cooldown)
	player.start.connect(_on_start)
	player.dead.connect(_on_death)
	ScoreManager.new_high_score.connect(_new_high_score)
	floor_level = 648
	spawncool.one_shot = true
	spawncool.process_mode = Node.PROCESS_MODE_PAUSABLE

func _physics_process(_delta: float) -> void:
	if player.global_position.y <= 0 and player.alive:
		player.Die()
	elif player.global_position.y >= floor_level and player.alive:
		player.Die()

func _on_start() -> void:
	AudioManager.play_music("song",1)
	newhigh = false
	$Spawner.Spawn()
	spawncool.start(randf_range(0.9,1.3))
	starttext.hide()

func _on_death() -> void:
	AudioManager.change_song_pitch(0.8)
	hud.hide()
	deathscreen.scores(newhigh)
	deathscreen.show()
	deathscreen.focus()
	get_tree().paused = true
	$Background/BackgroundColor.material.set("shader_parameter/speed",0.0)

func _on_death_screen_retry() -> void:
	ScoreManager.reset_score()
	get_tree().reload_current_scene()

func _new_high_score() -> void:
	newhigh = true

func _on_cooldown() -> void:
	$Spawner.Spawn()
	spawncool.start(randf_range(0.9,1.3))

func _on_player_shoot(amt:int) -> void:
	hud.bullet_change(amt)
