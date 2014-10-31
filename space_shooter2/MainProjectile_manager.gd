
extends Node

var main_projectile
var canvas_node

func _ready():
	projectile = preload("res://main_projectile.res")
	canvas_node = get_node("/root/Game/Canvas")
	
	for i in range(20):
		var main_projectile_instance = main_projectile.instance()
		main_projectile_instance.set_name("main_projectile"+str(i))
		main_projectile_instance.hide()
		print("Node name: ", main_projectile_instance.get_name())
		canvas_node.add_child(main_projectile_instance)
	
	print("No. of child: ", canvas_node.get_child_count())