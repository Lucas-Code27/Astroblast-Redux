extends Node

signal score_changed
signal new_high_score

const SAVEFILE = "user://save.save"

var score:int = 0
var high_score:int = 0

func _ready() -> void:
	load_high_score()

func add_score(amt:int) -> void:
	score += amt
	
	if score > high_score:
		high_score = score
		save_high_score()
		new_high_score.emit()
	
	score_changed.emit()

func get_score() -> int:
	return score

func get_high_score() -> int:
	return high_score

func reset_score() -> void:
	score = 0

func save_high_score():
	var file = FileAccess.open(SAVEFILE, FileAccess.WRITE_READ)
	file.store_32(high_score)
	file = null
 
func load_high_score():
	var file = FileAccess.open(SAVEFILE, FileAccess.READ)
	if FileAccess.file_exists(SAVEFILE):
		high_score = file.get_32()
	file = null
