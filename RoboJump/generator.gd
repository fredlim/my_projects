extends Node2D 

const delay = 1.25
const speed = 200
const lenght = 608
const y_range = 100

var player = null
var score_label = null
var best_score_label = null

var score = 0
var best_score = 0

var elapsed_time = 0
var wall = preload("res://wall.xml")

func reset():
	var children = get_children()
	
	for c in children:
		remove_child(c)
	
	if score > best_score:
		best_score = score
	
	elapsed_time = 0
	score = 0
	
	apply_score()
	apply_best_score()

func apply_score():
	score_label.set_text(str(score))
	
func apply_best_score():
	best_score_label.set_text("Best: " + str(best_score))

func move_wall(child, delta):
	var p = child.get_pos()
	
	var ppos = player.get_pos()
	var far = false
	if p.x > ppos.x:
		far = true
	
	p.x += -speed * delta
	
	if p.x < ppos.x && far:
		score += 1
		apply_score()
	
	if p.x < 0:
		remove_child(child)
	else:
		child.set_pos(p)
	pass

func _process(delta):
	elapsed_time += delta

	var children = get_children()

	for c in children:
		move_wall(c, delta)

	if elapsed_time >= delay:
		generate()
		elapsed_time = 0

func generate():
	var wi = wall.instance()
	var p = Vector2(lenght, rand_range(-y_range, y_range))
	wi.set_pos(p)
	add_child(wi)

func _ready():
	set_process(true)
	player = get_node("/root/World/Player")
	score_label = get_node("/root/World/Score")
	best_score_label = get_node("/root/World/BestScore")
	
	apply_score()
	apply_best_score()
	

