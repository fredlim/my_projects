
extends Node

const ENEMYNODE = "/root/Game/Canvas/Enemy/"
var enemy_node
var enemy_res
var spawnrate = 10
var countdown = 1

func _ready():
	enemy_res = preload("res://enemy1path.scn")
	enemy_node = get_node(ENEMYNODE)
	set_process(true)


func _process(delta):
	if (countdown < 0):
		var enemy_instance = enemy_res.instance()
		enemy_node.add_child(enemy_instance)
		
		var enemy_instance = enemy_res.instance()
		enemy_node.add_child(enemy_instance)
		var epos = enemy_instance.get_pos()
		enemy_instance.set_pos(Vector2(epos.x, epos.y+100))
		
		var enemy_instance = enemy_res.instance()
		enemy_node.add_child(enemy_instance)
		var epos = enemy_instance.get_pos()
		enemy_instance.set_pos(Vector2(epos.x, epos.y+200))
		
		countdown = 1
	countdown -= spawnrate * delta
	