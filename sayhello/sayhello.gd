
extends Panel

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initalization here
	get_node("Button").connect("pressed",self,"_on_button_pressed")
	
func _on_button_pressed():
	get_node("Label").set_text("HELLO!")
	get_node("Counter").set_process(true)
	