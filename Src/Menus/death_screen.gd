extends Control

signal retry

func focus() -> void:
	$Button.grab_focus()

func _on_button_pressed() -> void:
	retry.emit()

func scores(newhigh:bool) -> void:
	$score.text = "SCORE: [tornado radius=5 freq=4]" + str(ScoreManager.get_score()) + "[/tornado]"
	$highscore.text = "HIGH SCORE: [tornado radius=5 freq=4]" + str(ScoreManager.get_high_score()) + "[/tornado]"
	
	if newhigh:
		$highscorenotifier.show()
	else:
		$highscorenotifier.hide()
