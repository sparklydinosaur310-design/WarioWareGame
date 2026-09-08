extends Node2D

# Connects your screen objects to the code automatically
@onready var rocket = get_node_or_null("Rocket") or get_node_or_null("ColorRect")
@onready var asteroid = get_node_or_null("Asteroid")

var game_over = false
var time_left = 4.0 # WarioWare games last exactly 4 seconds!

func _ready() -> void:
	print("Rocket gameplay scene has started!")
	
	# Place rocket at bottom middle, asteroid near top middle
	if rocket:
		rocket.position = Vector2(500, 500)
	if asteroid:
		asteroid.position = Vector2(500, 100)

func _process(delta: float) -> void:
	if game_over:
		return
		
	# 1. Handle the 4-second countdown clock
	time_left -= delta
	if time_left <= 0:
		win_game()

	# 2. Steer the rocket left and right with arrow keys
	if rocket:
		if Input.is_action_pressed("ui_left"):
			rocket.position.x -= 350 * delta
		if Input.is_action_pressed("ui_right"):
			rocket.position.x += 350 * delta

func win_game() -> void:
	game_over = true
	print("You Survived! Clear!")
	# This sends you back to the start screen after winning
	get_tree().change_scene_to_file("res://steer_the_rocket.tscn")
