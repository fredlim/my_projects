
extends Node2D

var laser = preload("res://laser.xml")
var laserCount = 0
var laserArray = []

var rock = preload("res://rock.xml")
var rockCount = 0
var rockArray = []

var isSpacePressed = false

var score = 0
var timeSinceLastRock = 0
var gameRunning = true

func _ready():
	set_process(true)
	get_node("score").set_text(str(score))
	
	
func _process(delta):
	if gameRunning == true:
		game(delta)
	else:
		if Input.is_action_pressed("ui_accept"):
			restart()
		
		
func game(delta):
	if Input.is_action_pressed("Space"):
		if isSpacePressed == false:
			fire()
			isSpacePressed = true
	else:
		isSpacePressed = false
		
	var shipPos = get_node("ship").get_pos()
	
	if Input.is_action_pressed("ui_left"):
		shipPos.x -= 200 * delta
	
	if Input.is_action_pressed("ui_right"):
		shipPos.x += 200 * delta
		
	get_node("ship").set_pos(shipPos)
	
	var laserid = 0
	for laser in laserArray:
		var laserPos = get_node(laser).get_pos()
		laserPos.y -= 400 * delta
		get_node(laser).set_pos(laserPos)
		if laserPos.y < 0:
			remove_and_delete_child(get_node(laser))
			laserArray.remove(laserid)
		laserid += 1
	
	var rockid = 0
	for rock in rockArray:
		var rockPos = get_node(rock).get_pos()
		rockPos.y += 250 * delta
		get_node(rock).set_pos(rockPos)
		if rockPos.y > 568:
			remove_and_delete_child(get_node(rock))
			rockArray.remove(rockid)
		rockid += 1
	
	
	var laserid = 0
	for laser in laserArray:
		var rockid = 0
		for rock in rockArray:
			var laserPos = get_node(laser).get_pos()
			var rockPos = get_node(rock).get_pos()
			if laserPos.y < rockPos.y:
				if laserPos.x > (rockPos.x - 15):
					if laserPos.x < (rockPos.x + 15):
						remove_and_delete_child(get_node(rock))
						rockArray.remove(rockid)
						remove_and_delete_child(get_node(laser))
						laserArray.remove(laserid)
						score += 1
						get_node("score").set_text(str(score))
			rockid += 1
		laserid += 1
	
	
	var rockid = 0
	for rock in rockArray:
		var rockPos = get_node(rock).get_pos()
		var shipPos = get_node("ship").get_pos()
		if rockPos.y > 500:
			if (rockPos.x - 15) < (shipPos.x + 25):
				if (rockPos.x + 15) > (shipPos.x -25):
					get_node("score").set_text("Crash")
					gameRunning = false

		
	timeSinceLastRock += delta
	if timeSinceLastRock > 1:
		newRock()
		timeSinceLastRock = 0
	
	
func fire():
	laserCount += 1
	var laser_instance  = laser.instance()
	laser_instance.set_name("laser"+str(laserCount))
	add_child(laser_instance)
	var laserPos = get_node("laser"+str(laserCount)).get_pos()
	var shipPos = get_node("ship").get_pos()
	laserPos.y = 500
	laserPos.x = shipPos.x
	get_node("laser"+str(laserCount)).set_pos(laserPos)
	laserArray.push_back("laser"+str(laserCount))
	print(laserArray)
	
	
func newRock():
	rockCount += 1
	var rock_instance  = rock.instance()
	rock_instance.set_name("rock"+str(rockCount))
	add_child(rock_instance)
	var rockPos = get_node("rock"+str(rockCount)).get_pos()
	rockPos.y = -5
	rockPos.x = rand_range(0,320)
	get_node("rock"+str(rockCount)).set_pos(rockPos)
	rockArray.push_back("rock"+str(rockCount))
	print(rockArray)
	
	
func restart():
	for rock in rockArray:
		remove_and_delete_child(get_node(rock))
	rockArray.clear()
	for laser in laserArray:
		remove_and_delete_child(get_node(laser))
	laserArray.clear()
	var shipPos = get_node("ship").get_pos()
	shipPos.x = 160
	get_node("ship").set_pos(shipPos)
	score = 0
	get_node("score").set_text(str(score))
	gameRunning = true
	