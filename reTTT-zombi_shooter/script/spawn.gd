extends Node

var prefab = preload("res://prefab/enemy.scn")
var cur_inst = 4
var count = 0
var delay = 0
var dead_count = 0

var statistic

func select_point():
	if get_child_count() == 0:
		return Vector3(0, 0, 0)
	
	var points = get_node("points")

	var idx = randi() % points.get_children().size()
	
	return points.get_child(idx).get_translation()

func spawn():
	var obj = prefab.instance()
	var pos = select_point()
	obj.set_translation(pos)
	obj.spawner = self
	add_child(obj)
	
func dead_enemy(enemy):
	dead_count += 1
	
	if dead_count >= cur_inst:
		dead_count = 0
		next_wave()


func next_wave():
	cur_inst *= 2
	count = cur_inst
	
	if statistic:
		statistic.set_wave(statistic.wave + 1)


func _process(dt):
	
	delay -= dt
	
	if count > 0 && delay < 0:
		spawn()
		count -= 1
		delay = 2



func _ready():
	statistic = get_node("/root/game/statistic")
	count = cur_inst
	set_process(true)
	pass

