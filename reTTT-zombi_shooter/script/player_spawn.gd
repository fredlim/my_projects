extends Node

var world
var player_inst = preload("res://prefab/player.scn")

func select_point():
	if get_child_count() == 0:
		return Vector3(0, 0, 0)
	
	var points = get_node("points")

	var idx = randi() % points.get_children().size()
	
	return points.get_child(idx).get_translation()


func spawn():
	var obj = player_inst.instance()
	var pos = select_point()
	obj.set_translation(pos)
	
	world.add_child(obj)
	

func _process(dt):
	if world.player == null:
	
		spawn()
	
	elif world.player.is_ded():
	
		world.player.get_parent().remove_child(world.player)
		world.player = null
		spawn()


func _ready():
	world = get_node("/root/game/world")
	set_process(true)