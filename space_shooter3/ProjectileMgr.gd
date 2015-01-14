
extends Node

const PJTNODE = "/root/Game/Canvas/Projectile/"
const PNO = 5
var canvas_node
var projectile


func _ready():
	projectile = preload("res://player_projectile_A.res")
	canvas_node = get_node(PJTNODE)


func fire(pos):
	for i in range(PNO):
		var projectile_instance = projectile.instance()
		canvas_node.add_child(projectile_instance)
		#print("name: ", projectile_instance.get_name())
		
		if ( i % 2 == 0):
			projectile_instance.setphi((PI/32)*(i/2))
		else:
			projectile_instance.setphi((-PI/32)*ceil(i/2.0))
		#if ( i % PNO == 0 ):
		#	projectile_instance.setphi(0)
		#if ( i % PNO == 1 ):
		#	projectile_instance.setphi(-PI/32)
		#if ( i % PNO == 2 ):
		#	projectile_instance.setphi(PI/32)
		#if ( i % PNO == 3 ):
		#	projectile_instance.setphi((-PI/32)*2)
		#if ( i % PNO == 4 ):
		#	projectile_instance.setphi((PI/32)*2)
		
		projectile_instance.enable(pos)
		

func lcount():
	print("node count: ", canvas_node.get_child_count())
