extends Control

signal pause(val:bool)

var paused:bool = false
var canpause:bool = true

func _ready() -> void:
	hide()

func game_over() -> void:
	canpause = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		if paused:
			hide()
			AudioManager.current_music_player.stream_paused = false
			if canpause:
				get_tree().paused = false
			paused = false
			pause.emit(false)
		else:
			if canpause:
				AudioManager.current_music_player.stream_paused = true
				show()
				get_tree().paused = true
				paused = true
				pause.emit(true)
