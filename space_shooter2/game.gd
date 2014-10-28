
extends Node2D

var last_player_pos
var player_pos
var moving = "center"
var move_state

func _ready():
	set_process(true)
	set_process_input(true)
	get_node("Player").set_animation("center")

func _process(delta):
	player_pos = get_node("Player").get_pos()
	#if (last_player_pos == player_pos):
	#	moving = "center"
	print(moving)
	#get_node("Player").set_animation(moving)
	#last_player_pos = player_pos
	
func _input(ev):
	var ev_pos = ev.pos

	if (ev.type==InputEvent.MOUSE_MOTION):
		get_node("Player").set_pos(ev_pos)
		
	if (ev_pos.x < player_pos.x):
		moving = "left"
	elif (ev_pos.x > player_pos.x):
		moving = "right"

	get_node("Player").set_animation(moving)
