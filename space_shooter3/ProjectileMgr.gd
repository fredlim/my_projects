
extends Node

const PJTNODE = "/root/Game/Canvas/Projectile/"
const PNO = 5
var projectile_node
var projectile_res
var part = 24

func _ready():
	projectile_res = preload("res://player_projectile_A.res")
	projectile_node = get_node(PJTNODE)


func fire(pos):
	for i in range(PNO):
		var projectile_instance = projectile_res.instance()
		projectile_node.add_child(projectile_instance)
		
		if ( i % 2 == 0):
			projectile_instance.setphi((PI/part)*(i/2))
		else:
			projectile_instance.setphi((-PI/part)*ceil(i/2.0))
		
		projectile_instance.enable(pos)
		