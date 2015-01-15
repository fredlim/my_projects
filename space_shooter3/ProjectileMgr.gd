
extends Node

const PJTNODE = "/root/Game/Canvas/Projectile/"
const PNO = 13
var projectile_node
var projectile_res


func _ready():
	projectile_res = preload("res://player_projectile_A.res")
	projectile_node = get_node(PJTNODE)


func fire(pos):
	for i in range(PNO):
		var projectile_instance = projectile_res.instance()
		projectile_node.add_child(projectile_instance)
		#print("name: ", projectile_instance.get_name())
		
		if ( i % 2 == 0):
			projectile_instance.setphi((PI/16)*(i/2))
		else:
			projectile_instance.setphi((-PI/16)*ceil(i/2.0))
		
		projectile_instance.enable(pos)
		

func lcount():
	print("node count: ", projectile_node.get_child_count())
