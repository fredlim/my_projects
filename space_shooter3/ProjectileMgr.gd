
extends Node

const PJTNODE = "/root/Game/Canvas/Projectile/"

var projectile

func _ready():
	set_meta("type", "proj")
	projectile = preload("res://player_projectile_A.res")
	init_pool("PA") # PA means "Player" Type "A"


func init_pool(ptype):
	var canvas_node = get_node(PJTNODE+ptype)
	
	for i in range(60):
		var projectile_instance = projectile.instance()
		projectile_instance.set_name(str(i))
		projectile_instance.hide()
		canvas_node.add_child(projectile_instance)
		if ( i % 3 == 0 ):
			projectile_instance.setphi(PI*2)
		if ( i % 3 == 1 ):
			projectile_instance.setphi(-PI/8)
		if ( i % 3 == 2 ):
			projectile_instance.setphi(PI/8)



func fire(ptype, pos):
	var canvas_node = get_node(PJTNODE+ptype)
	
	for i in range(0, canvas_node.get_child_count(), 3):
		print("ite: ", i)
		var n = canvas_node.get_node(str(i))
		var n2 = canvas_node.get_node(str(i+1))
		var n3 = canvas_node.get_node(str(i+2))
		
		if ( ! n.is_visible() and ! n2.is_visible() and ! n3.is_visible() ):
			#print("Projectile: ", str(i), n.is_visible() ) #debug
			n.enable(pos)
			n2.enable(pos)
			n3.enable(pos)
			break
