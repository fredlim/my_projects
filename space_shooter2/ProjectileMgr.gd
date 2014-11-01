
extends Node

const PTNODE = "/root/Game/Canvas/Projectile/"

var projectile

func _ready():
	projectile = preload("res://player_projectile_A.res")
	init_pool("PA")


func init_pool(ptype):
	var canvas_node = get_node(PTNODE+ptype)
	
	for i in range(60):
		var projectile_instance = projectile.instance()
		projectile_instance.set_name(str(i))
		projectile_instance.hide()
		canvas_node.add_child(projectile_instance)
		#print("Node name: ", projectile_instance.get_name())
	
	#print("No. of child: ", canvas_node.get_child_count())


func fire(ptype, pos):
	#print("Fire")
	var canvas_node = get_node(PTNODE+ptype)
	
	for i in range(0, canvas_node.get_child_count()):
		var n = canvas_node.get_node(str(i))
		
		if ( ! n.is_visible() ):
			n.show()
			n.set_pos(pos)
			print("Projectile: ", str(i), n.is_visible() )
			n.fmove()
			break

