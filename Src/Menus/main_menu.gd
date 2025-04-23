extends Control

@export var gamescene:PackedScene

func _ready() -> void:
	AudioManager.play_music("menu",1)
	$play.grab_focus()

func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(gamescene)
