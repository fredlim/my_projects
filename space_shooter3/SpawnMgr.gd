
extends Node

const ENEMYNODE = "/root/Game/Canvas/Enemy/"
var enemy_node
var enemy_res
var spawnrate = 5
var countdown = 1

func _ready():
	enemy_res = preload("res://enemy1path.scn")
	enemy_node = get_node(ENEMYNODE)
	set_process(true)


func _process(delta):
	if (countdown < 0):
		var enemy_instance = enemy_res.instance()
		enemy_node.add_child(enemy_instance)
		countdown = 1
	countdown -= spawnrate * delta