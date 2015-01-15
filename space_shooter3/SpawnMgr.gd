
extends Node

const ENEMYNODE = "/root/Game/Canvas/Projectile/"
var enemy_node
var enemy_res

func _ready():
	enemy_res = preload("res://player_projectile_A.res")
	enemy_node = get_node(ENEMYNODE)



