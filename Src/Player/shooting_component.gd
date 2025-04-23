extends Node2D

@export var bullet:PackedScene
@export var parent:Node

func Shoot() -> void:
	var bullet_inst:Area2D = bullet.instantiate()
	bullet_inst.global_position = global_position
	bullet_inst.process_mode = Node.PROCESS_MODE_PAUSABLE
	parent.get_parent().add_child(bullet_inst)
