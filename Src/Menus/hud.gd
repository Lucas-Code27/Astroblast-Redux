extends Control

@onready var counter:RichTextLabel = $Scorecounter
@onready var bullcounter:RichTextLabel = $Bulletcounter

func _ready() -> void:
	ScoreManager.score_changed.connect(_on_score_change)
	counter.text = "[wave amp=10 freq=5]" + str(0) + "[/wave]"
	bullcounter.text = "[wave amp=10 freq=5]" + str(5) + "[/wave]"

func _on_score_change() -> void:
	var score:int = ScoreManager.get_score()
	
	counter.text = "[wave amp=10 freq=5]" + str(score) + "[/wave]"

func bullet_change(amt:int) -> void:
	bullcounter.text = "[wave amp=10 freq=5]" + str(amt) + "[/wave]"
	
	if amt == 0:
		$RichTextLabel.show()
	else:
		$RichTextLabel.hide()
