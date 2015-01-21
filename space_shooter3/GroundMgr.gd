
extends Node

const BGNODE = "/root/Game/Ground/"
const SCREEN_H = 1280
var map_node
var map1_res
var map2_res
var scroll = 0
var scrollspeed = 50
var bgheight = 2560

func _ready():
	map1_res = preload("res://map1.res")
	map2_res = preload("res://map2.res")
	map_node = get_node(BGNODE)
	
	# setup initial 2 tile map
	
	var map_instance = map1_res.instance()
	map_node.add_child(map_instance)
	map_instance.setpos(0)
		
	var map_instance = map2_res.instance()
	map_node.add_child(map_instance)
	map_instance.setpos(-SCREEN_H)
	
	set_process(true)


func _process(delta):
	#print("tilemap count: ", get_child_count())
	pass


func add_map(d):
	var map_instance
	if (randi() % 2 == 1):
		map_instance = map1_res.instance()
	else:
		map_instance = map2_res.instance()
	map_node.add_child(map_instance)
	map_instance.setpos(-SCREEN_H - d)
	