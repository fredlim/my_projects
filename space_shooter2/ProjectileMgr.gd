
extends Node

const PJTNODE = "/root/Game/Canvas/Projectile/"

var projectile

func _ready():
	projectile = preload("res://player_projectile_A.res")
	init_pool("PA") # PA means "Player" Type "A"
	#init other projectile pool here
	# e.g. init_pool("EA")


func init_pool(ptype):
	var canvas_node = get_node(PJTNODE+ptype)
	
	for i in range(21):
		var projectile_instance = projectile.instance()
		projectile_instance.set_name(str(i))
		projectile_instance.hide()
		canvas_node.add_child(projectile_instance)


func fire(ptype, pos):
	var canvas_node = get_node(PJTNODE+ptype)
	
	for i in range(0, canvas_node.get_child_count()):
		var n = canvas_node.get_node(str(i))
		
		if ( ! n.is_visible() ):
			print("Projectile: ", str(i), n.is_visible() ) #debug
			n.enable(pos)
			break