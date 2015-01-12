extends Control

func _ready():
	# Initalization here
	get_tree().set_pause(false)
	get_node("buttonPlay").connect("pressed",self,"_on_buttonPlay_pressed")
	get_node("buttonExit").connect("pressed",self,"_on_buttonExit_pressed")

func _on_buttonPlay_pressed():
	get_node("/root/global").goto_scene("res://game.scn")

func _on_buttonExit_pressed():
	get_tree().quit()