
extends Node

#var main_projectile = preload("res://main_projectile.res")

var canvas_node
var mpmanager
var nPlayer


func _ready():
	canvas_node = get_node("/root/Game/Canvas")
	mpmanager = get_node("MainProjectile_manager")
	nPlayer = get_node("Canvas/Player")
	nPlayer.set_animation("center")
	#set_process(true)
	set_process_input(true)


func _process(dt):
	pass
	

func _input(ev):
	if (ev.type==InputEvent.MOUSE_MOTION):
		nPlayer.setterPos(ev.pos)
		
	if (ev.type==InputEvent.MOUSE_BUTTON):
		pass
		#if (Input.is_mouse_button_pressed(1)):
			# check projectile manager for available projectile node
			#var mp = mpmanager.available()
			
			# get player position and pass position to projectile
			#mp.set_pos(nPlayer.get_pos())
			
			# call projectile to show and run
			#mp.show()