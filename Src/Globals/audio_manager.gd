extends Node

@export var music:Node
@export var sound:Node

var current_music_player:AudioStreamPlayer
var current_sound_player:AudioStreamPlayer

func play_sound(soundname:String,pitch:float) -> void:
	current_sound_player = null
	current_sound_player = sound.get_node(soundname)
	
	if current_sound_player:
		current_sound_player.pitch_scale = pitch
		current_sound_player.play()

func play_music(songname:String,pitch:float) -> void:
	if current_music_player:
		current_music_player.stop()
	
	current_music_player = null
	current_music_player = music.get_node(songname)
	
	if current_music_player:
		current_music_player.pitch_scale = pitch
		current_music_player.play()

func stop_music() -> void:
	current_music_player.stop()

func change_song_pitch(pitch:float) -> void:
	if current_music_player:
		current_music_player.pitch_scale = pitch
