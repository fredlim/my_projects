extends Node

var enemies = []
var kill_enemies = []
var player = null


func add_enemy(enemy):
	enemies.push_back(enemy)


func remove_enemy(enemy):
	enemies.erase(enemy)


func _process(dt):
	pass

func find_target(max_len):
	var target = null
	var dist = -1
	
	for e in enemies:
		var d = (player.get_translation() - e.get_translation()).length_squared()
		if (dist == -1 || d < dist) && d < max_len*max_len:
			target = e
			dist = d
			
	return target


func _ready():
	set_process(true)
