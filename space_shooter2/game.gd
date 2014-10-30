
extends Node2D

var main_projectile = preload("res://main_projectile.res")

var nPlayer

func _ready():
	nPlayer = get_node("Player")
	nPlayer.set_animation("center")
	set_process(true)
	set_process_input(true)


func _process(dt):
	pass
	

func _input(ev):
	if (ev.type==InputEvent.MOUSE_MOTION):
		nPlayer.setterPos(ev.pos)
		
	if (ev.type==InputEvent.MOUSE_BUTTON):
		if (Input.is_mouse_button_pressed(1)):
			var main_projectile_instance = main_projectile.instance()
			main_projectile_instance.set_name("projectile")
			add_child(main_projectile_instance)
			
			get_node("projectile").set_pos(ev.pos)
			
