extends Node2D

# Connecting nodes based EXACTLY on your image layout
@onready var start_button = get_node_or_null("VBoxContai/Start")
@onready var quit_button = get_node_or_null("VBoxContai/Quit")

func _ready() -> void:
	print("Title screen script is officially running!")
	
	# Manually connect the clicks using your exact node names
	if start_button:
		start_button.pressed.connect(_on_start_pressed)
	if quit_button:
		quit_button.pressed.connect(_on_quit_pressed)

func _process(delta: float) -> void:
	# Backup keyboard trigger
	if Input.is_key_pressed(KEY_SPACE):
		_on_start_pressed()

func _on_start_pressed() -> void:
	print("Start button triggered successfully!")
	# This loads your purple gameplay scene file listed in your FileSystem
	get_tree().change_scene_to_file("res://level_scene.tscn")

func _on_quit_pressed() -> void:
	print("Quit button triggered successfully!")
	get_tree().quit()
