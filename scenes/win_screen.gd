extends Node2D
@onready var label: RichTextLabel = $Label

func _ready() -> void:
	label.text = "You Win!"
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://scenes/level_screen.tscn")
