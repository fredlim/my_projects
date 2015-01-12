
extends Spatial

var pause = false

func _ready():
	# Initalization here
	set_process(true)
	set_process_input(true)

func _process(delta):
	if (Input.is_action_pressed("quit")):
		get_node("/root/global").goto_scene("res://menu.scn")

func _input(event):
	var dt = get_process_delta_time()
	
	if (Input.is_action_pressed("pause")):
		pause = !pause
		get_tree().set_pause(pause)
