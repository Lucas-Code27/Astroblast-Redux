extends Control

var paused:bool = false

func _ready() -> void:
	hide()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		if paused:
			hide()
			get_tree().paused = false
			paused = false
		else:
			show()
			get_tree().paused = true
			paused = true
