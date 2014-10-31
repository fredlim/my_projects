
extends Node

var projectile
var canvas_node

func _ready():
	projectile = preload("res://player_projectile1.res")
	canvas_node = get_node("/root/Game/Canvas/PlayerProjectile1")
	
	for i in range(20):
		var projectile_instance = projectile.instance()
		projectile_instance.set_name("projectile"+str(i))
		projectile_instance.hide()
		print("Node name: ", projectile_instance.get_name())
		canvas_node.add_child(projectile_instance)
	
	print("No. of child: ", canvas_node.get_child_count())
	fire(Vector2(0,0)) # for testing use

func fire(pos):
	for i in range(0, canvas_node.get_child_count()):
		var s = "projectile"+str(i)
		var n = canvas_node.get_node(s)
		
		if ( ! n.is_visible() ):
			print( s, n.is_visible() )
			
			