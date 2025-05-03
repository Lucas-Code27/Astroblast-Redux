extends Node2D

@export var preloader:ResourcePreloader
@export var spawnables:Array[String]

func Spawn() -> void:
	var inst:Node2D = preloader.get_resource(spawnables[randi_range(0,len(spawnables)-1)]).instantiate()
	inst.global_position = Vector2(global_position.x,global_position.y + randi_range(-300,270))
	inst.process_mode = Node.PROCESS_MODE_PAUSABLE
	get_parent().add_child(inst)
