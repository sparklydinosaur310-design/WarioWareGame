extends Node2D

func _ready() -> void:
	print("Title screen script is running with zero errors!")

func _process(_delta: float) -> void:
	# Keep the spacebar shortcut active as a backup layout test!
	if Input.is_key_pressed(KEY_SPACE):
		_on_start_pressed()

# This triggers when your visual Start Button is clicked
func _on_start_pressed() -> void:
	print("Start button clicked! Attempting to load level...")
	
	# Safety check: prints an error message instead of crashing if the path is wrong
	var path = "res://level_scene.tscn"
	if ResourceLoader.exists(path):
		get_tree().change_scene_to_file(path)
	else:
		print("CRITICAL ERROR: Godot cannot find a file named level_scene.tscn in your project folder!")
# This triggers when your visual Quit Button is clicked
func _on_quit_pressed() -> void:
	print("Quit button clicked!")
	get_tree().quit()
